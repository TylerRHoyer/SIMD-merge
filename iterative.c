#include <stdio.h>
#include <x86intrin.h>
#include <gmodule.h>
#include <omp.h>

#define SIZE 1024 * 1024 * 32
#define THREADS 16

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

void bitonicSort(float *in, unsigned size) {
	__m128 *vectors = aligned_alloc(1024, size * sizeof *vectors);

#pragma omp parallel for
	for (unsigned i = 0; i < size; i++)
		vectors[i] = _mm_load_ps(in + 4 * i);

#pragma omp parallel for
	for (unsigned merge = 0; merge < size / 2; merge++) {
		__m128 *mergeStart = vectors + merge * 2;
		__m128 *mergeEnd = mergeStart + 1;
		*mergeEnd = _mm_permute_ps(*mergeEnd, 0x1B);
		bitonic(mergeStart++, mergeEnd--);
	}
	for (unsigned mergeSize = 4; mergeSize <= size; mergeSize *= 2) {
#pragma omp parallel for
		for (unsigned merge = 0; merge < size / mergeSize; merge++) {
			__m128 *mergeStart = vectors + merge * mergeSize;
			__m128 *mergeEnd = mergeStart + mergeSize - 1;
			while (mergeStart < mergeEnd) {
				*mergeEnd = _mm_permute_ps(*mergeEnd, 0x1B);
				bitonic(mergeStart++, mergeEnd--);
			}
		}
		for (unsigned sortSize = mergeSize / 2; sortSize > 2; sortSize /= 2) {
#pragma omp parallel for
			for (unsigned sort = 0; sort < size / sortSize; sort++) {
				__m128 *sortStart = vectors + sort * sortSize;
				__m128 *sortMid = sortStart + sortSize / 2 - 1;
				__m128 *sortEnd = sortMid + sortSize / 2;
				while (sortMid >= sortStart)
					bitonic(sortMid--, sortEnd--);
			}
		}

#pragma omp parallel for
		for (unsigned sort = 0; sort < size / 2; sort++) {
			__m128 *sortStart = vectors + sort * 2;
			__m128 *sortEnd = sortStart + 1;
			shuffle(sortStart, sortEnd);
			shuffle(sortStart, sortEnd);
			shuffle(sortStart, sortEnd);
		}
	}

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