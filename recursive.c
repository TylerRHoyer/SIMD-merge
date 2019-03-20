#include <stdio.h>
#include <x86intrin.h>
#include <gmodule.h>
#include <omp.h>

#define SIZE 1024 * 1024
#define THREADS 12

#define USE_TASKS

void prnt(float *data, unsigned size) {
	for (unsigned i = 0; i < size; i++)
		printf("%.0f ", data[i]);
	printf("\n");
}

void insertSort(float *a, unsigned size) {
	for (unsigned i = 0; i < size; i++) {
		float minValue = a[i];
		unsigned minIndex = i;
		for (unsigned j = i + 1; j < size; j++)
			if (a[j] < minValue) {
				minValue = a[j];
				minIndex = j;
			}
		float tmp = a[i];
		a[i] = minValue;
		a[minIndex] = tmp;
	}
}

void bitonic(__m128 *a, __m128 *b) {
	__m128 low = _mm_min_ps(*a, *b);
	__m128 high = _mm_max_ps(*a, *b);
	*a = low;
	*b = high;
}

void shuffle(__m128 *a, __m128 *b) {
	__m128 low = _mm_min_ps(*a, *b);
	__m128 high = _mm_max_ps(*a, *b);
	*a = _mm_unpacklo_ps(low, high);
	*b = _mm_unpacklo_ps(low, high);
}

void split(void (*func)(__m128 *, unsigned), __m128 *in, unsigned half) {
	if (half > 1) {
#ifdef USE_TASKS
		if (SIZE / half > THREADS) {
			func(in, half);
			func(in + half, half);
		} else {
			#pragma omp task
			func(in, half);
			#pragma omp task
			func(in + half, half);
			#pragma omp taskwait
		}
#else
		func(in, half);
		func(in + half, half);
#endif
	}
}

void sort(__m128 *in, unsigned size) {
	if (size == 1)
		return;
	else if (size == 2) {
		shuffle(in, in + 1);
		shuffle(in, in + 1);
		shuffle(in, in + 1);
	} else {
		unsigned half = size / 2;
		__m128 *a = in + half - 1;
		__m128 *b = a + half;

		while (a >= in)
			bitonic(a--, b--);

		split(sort, in, half);
	}
}

void merge(__m128 *in, unsigned size) {
	unsigned half = size / 2;

	split(merge, in, half);

	__m128 *a = in;
	__m128 *b = in + size - 1;
	while (a < b) {
		*b = _mm_permute_ps(*b, 0x1B);
		bitonic(a++, b--);
	}

	split(sort, in, half);
}

void bitonicSort(float *in, unsigned size) {
	__m128 *vectors = aligned_alloc(1024, size * sizeof *vectors);

#pragma omp parallel for
	for (unsigned i = 0; i < size; i++)
		vectors[i] = _mm_load_ps(in + 4 * i);

	merge(vectors, size);

#pragma omp parallel for
	for (unsigned i = 0; i < size; i++)
		_mm_store_ps(in + 4 * i, vectors[i]);
}

int main(int cin, char** in){
	float *data = malloc(SIZE * sizeof *data);

#pragma omp parallel
{
	GRand *rnd = g_rand_new();
#pragma omp for
	for (unsigned i = 0; i < SIZE; i++)
		data[i] = (float)g_rand_double(rnd);
}

#ifdef DEBUG
	prnt(data, SIZE);
	printf("\n");
#endif

	bitonicSort(data, SIZE / 4);

#ifdef DEBUG
	prnt(data, SIZE);
#endif

	printf("Results:\n");
	int success = 1;
	float last = data[0];
	for (unsigned i = 0; i < SIZE - 1; i++) {
		if (data[i] < last) {
			success = 0;
			printf("%f\n%f\n\n", last, data[i]);
		}
		last = data[i];
	}

	if (success)
		printf("Success!\n");
	else
		printf("Failure!\n");
			
	return 0;
}