#include <memory>
#include <x86intrin.h>

void merge(__m512 a, __m512 b) {
	__mmask16 m = _mm512_cmp_ps_mask(a, b);
	_mm512_mask_blend_epi32(m, a, b);
	_mm512_mask_blend_epi32(!m, a, b);
}

unsigned *generate(unsigned n) {
	float *a = (float *)aligned_alloc(1024, n * sizeof *a);
	for (float i = 0; i < n; i++)
		a[i] = (float)rand();
	return a;
}

int main(int cin, char** in){
	float *a = generate(32);
	__m512 am = _mm_load_ps(a);
	__m512 bm = _mm_load_ps(a + 16);
	merge(am, bm);
}