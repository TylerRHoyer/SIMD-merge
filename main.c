#include <stdio.h>
#include <x86intrin.h>

struct pair {
	__m128 a;
	__m128 b;
};

void bitonic(struct pair *in) {
	__m128 low = _mm_min_ps(in->a, in->b);
	__m128 high = _mm_max_ps(in->a, in->b);
	in->a = _mm_shuffle_ps(low, high, 0x05);
	in->b = _mm_shuffle_ps(low, high, 0xAF);
}

float *rnd() {
	float *list = malloc(32 * sizeof *list);
	for (unsigned i = 0; i < 32; i++)
		list[i] = rand();
	return list;
}

void printList(float *list, unsigned size) {
	printf("[");
	for (unsigned i = 0; i < size; i++)
		printf("%d, ", (int)list[i]);
	printf("]\n");
}

int main(int cin, char** in){
	float *list = rnd();
	printList(list, 16);
	printList(list + 16, 16);
	struct pair vectors = {
		_mm_load_ps(list),
		_mm_load_ps(list + 16)
	};
	bitonic(&vectors);
	_mm_store_ps(list, vectors.a);
	_mm_store_ps(list + 16, vectors.b);
	printList(list, 32);
}