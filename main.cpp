#include <memory>
#include <x86intrin.h>

__m512 merge(__m512 a, __m512 b) {
	unsigned ai = 0;
	unsigned bi = 0;
	unsigned i = 0;
	__m512 c = (__m512)aligned_alloc(1024, 512);

	_mm512_mask_min_ps();

start:
	if (ai < 16)
		if (bi < 16) {
			if (a[ai] < b[bi])
				c[i++] = a[ai++];
			else
				c[i++] = b[bi++];
		}
		else
			c[i++] = a[ai++];
	else if (bi < 16)
		c[i++] = b[bi++];
	else
		return c;
	goto start;
}

int main(int cin, char** in){
	float *a;
	float *b;
	__m512 am = _mm512_load_ps(a);
	__m512 bm = _mm512_load_ps(b);
	merge(am, bm);
}