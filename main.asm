	.file	"recursive.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	split._omp_fn.0, @function
split._omp_fn.0:
.LFB5631:
	.cfi_startproc
	mov	esi, DWORD PTR [rdi+16]
	mov	rax, rdi
	mov	rdi, QWORD PTR [rdi+8]
	jmp	[QWORD PTR [rax]]
	.cfi_endproc
.LFE5631:
	.size	split._omp_fn.0, .-split._omp_fn.0
	.p2align 4
	.type	split._omp_fn.1, @function
split._omp_fn.1:
.LFB5632:
	.cfi_startproc
	mov	eax, DWORD PTR [rdi+16]
	mov	rdx, rdi
	mov	rsi, rax
	sal	rax, 4
	add	rax, QWORD PTR [rdi+8]
	mov	rdi, rax
	jmp	[QWORD PTR [rdx]]
	.cfi_endproc
.LFE5632:
	.size	split._omp_fn.1, .-split._omp_fn.1
	.p2align 4
	.type	bitonicSort._omp_fn.1, @function
bitonicSort._omp_fn.1:
.LFB5634:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	ebx, DWORD PTR [rdi+16]
	test	ebx, ebx
	je	.L11
	mov	rbp, rdi
	call	omp_get_num_threads
	mov	r12d, eax
	call	omp_get_thread_num
	mov	ecx, eax
	xor	edx, edx
	mov	eax, ebx
	div	r12d
	cmp	ecx, edx
	jb	.L6
.L9:
	imul	ecx, eax
	add	edx, ecx
	lea	ecx, [rax+rdx]
	cmp	edx, ecx
	jnb	.L11
	mov	r9d, edx
	dec	eax
	mov	r8, QWORD PTR [rbp+8]
	mov	rsi, r9
	add	rax, r9
	sal	rsi, 4
	sal	rax, 4
	mov	rdi, QWORD PTR [rbp+0]
	lea	ecx, [0+rdx*4]
	add	rsi, r8
	lea	rdx, [r8+16+rax]
	.p2align 4,,10
	.p2align 3
.L8:
	vmovaps	xmm0, XMMWORD PTR [rsi]
	mov	eax, ecx
	add	rsi, 16
	vmovaps	XMMWORD PTR [rdi+rax*4], xmm0
	add	ecx, 4
	cmp	rdx, rsi
	jne	.L8
.L11:
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	inc	eax
	xor	edx, edx
	jmp	.L9
	.cfi_endproc
.LFE5634:
	.size	bitonicSort._omp_fn.1, .-bitonicSort._omp_fn.1
	.p2align 4
	.type	bitonicSort._omp_fn.0, @function
bitonicSort._omp_fn.0:
.LFB5633:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	ebx, DWORD PTR [rdi+16]
	test	ebx, ebx
	je	.L20
	mov	rbp, rdi
	call	omp_get_num_threads
	mov	r12d, eax
	call	omp_get_thread_num
	mov	ecx, eax
	xor	edx, edx
	mov	eax, ebx
	div	r12d
	cmp	ecx, edx
	jb	.L15
.L18:
	imul	ecx, eax
	add	edx, ecx
	lea	ecx, [rax+rdx]
	cmp	edx, ecx
	jnb	.L20
	dec	eax
	mov	r8, QWORD PTR [rbp+8]
	mov	rcx, rdx
	lea	esi, [0+rdx*4]
	add	rdx, rax
	sal	rcx, 4
	sal	rdx, 4
	mov	rdi, QWORD PTR [rbp+0]
	add	rcx, r8
	lea	rdx, [r8+16+rdx]
	.p2align 4,,10
	.p2align 3
.L17:
	mov	eax, esi
	vmovaps	xmm0, XMMWORD PTR [rdi+rax*4]
	add	rcx, 16
	vmovaps	XMMWORD PTR [rcx-16], xmm0
	add	esi, 4
	cmp	rdx, rcx
	jne	.L17
.L20:
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	inc	eax
	xor	edx, edx
	jmp	.L18
	.cfi_endproc
.LFE5633:
	.size	bitonicSort._omp_fn.0, .-bitonicSort._omp_fn.0
	.p2align 4
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB5635:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	r12, QWORD PTR [rdi]
	call	g_rand_new
	mov	rbp, rax
	call	omp_get_num_threads
	mov	ebx, eax
	call	omp_get_thread_num
	mov	ecx, eax
	xor	edx, edx
	mov	eax, 33554432
	div	ebx
	cmp	ecx, edx
	jb	.L23
.L26:
	imul	ecx, eax
	add	edx, ecx
	lea	ecx, [rax+rdx]
	cmp	edx, ecx
	jnb	.L28
	dec	eax
	lea	rbx, [r12+rdx*4]
	add	rdx, rax
	lea	r12, [r12+4+rdx*4]
	.p2align 4,,10
	.p2align 3
.L25:
	mov	rdi, rbp
	call	g_rand_double
	vcvtsd2ss	xmm0, xmm0, xmm0
	add	rbx, 4
	vmovss	DWORD PTR [rbx-4], xmm0
	cmp	rbx, r12
	jne	.L25
.L28:
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
	inc	eax
	xor	edx, edx
	jmp	.L26
	.cfi_endproc
.LFE5635:
	.size	main._omp_fn.0, .-main._omp_fn.0
	.p2align 4
	.globl	sort
	.type	sort, @function
sort:
.LFB5627:
	.cfi_startproc
	cmp	esi, 1
	je	.L41
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	sub	rsp, 32
	.cfi_def_cfa_offset 64
	cmp	esi, 2
	je	.L44
	shr	esi
	mov	r12d, esi
	mov	rbp, r12
	sal	r12, 4
	lea	rax, [rdi-16+r12]
	lea	rdx, [rax+r12]
	cmp	rdi, rax
	ja	.L34
	.p2align 4,,10
	.p2align 3
.L35:
	vmovaps	xmm1, XMMWORD PTR [rdx]
	vmovaps	xmm0, XMMWORD PTR [rax]
	sub	rax, 16
	vminps	xmm2, xmm0, xmm1
	vmaxps	xmm0, xmm0, xmm1
	sub	rdx, 16
	vmovaps	XMMWORD PTR [rax+16], xmm2
	vmovaps	XMMWORD PTR [rdx+16], xmm0
	cmp	rbx, rax
	jbe	.L35
.L34:
	cmp	ebp, 1
	jbe	.L39
	mov	eax, 33554432
	xor	edx, edx
	div	ebp
	cmp	eax, 12
	jbe	.L37
	mov	esi, ebp
	mov	rdi, rbx
	call	sort
	lea	rdi, [rbx+r12]
	mov	esi, ebp
	call	sort
.L39:
	add	rsp, 32
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L44:
	.cfi_restore_state
	vmovaps	xmm2, XMMWORD PTR [rdi+16]
	vmovaps	xmm1, XMMWORD PTR [rdi]
	vminps	xmm0, xmm1, xmm2
	vmaxps	xmm1, xmm1, xmm2
	vunpcklps	xmm0, xmm0, xmm1
	vunpcklps	xmm0, xmm0, xmm0
	vunpcklps	xmm0, xmm0, xmm0
	vmovaps	XMMWORD PTR [rdi], xmm0
	vmovaps	XMMWORD PTR [rdi+16], xmm0
	add	rsp, 32
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	mov	DWORD PTR [rsp+16], ebp
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp], OFFSET FLAT:sort
	sub	rsp, 8
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 88
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.0
	lea	rsi, [rsp+32]
	call	GOMP_task
	mov	DWORD PTR [rsp+48], ebp
	mov	QWORD PTR [rsp+40], rbx
	mov	QWORD PTR [rsp+32], OFFSET FLAT:sort
	add	rsp, 24
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 88
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.1
	lea	rsi, [rsp+32]
	call	GOMP_task
	add	rsp, 32
	.cfi_def_cfa_offset 64
	call	GOMP_taskwait
	add	rsp, 32
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5627:
	.size	sort, .-sort
	.p2align 4
	.globl	merge
	.type	merge, @function
merge:
.LFB5628:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	ebx, esi
	mov	r12d, ebx
	sub	rsp, 32
	.cfi_def_cfa_offset 64
	shr	r12d
	cmp	ebx, 3
	jbe	.L46
	mov	eax, 33554432
	xor	edx, edx
	div	r12d
	cmp	eax, 12
	jbe	.L47
	mov	esi, r12d
	call	merge
	mov	edi, r12d
	sal	rdi, 4
	add	rdi, rbp
	mov	esi, r12d
	call	merge
.L46:
	sal	rbx, 4
	lea	rax, [rbp-16+rbx]
	cmp	rbp, rax
	jnb	.L48
	mov	rdx, rbp
	.p2align 4,,10
	.p2align 3
.L49:
	vpermilps	xmm1, XMMWORD PTR [rax], 27
	add	rdx, 16
	vmovaps	XMMWORD PTR [rax], xmm1
	vmovaps	xmm0, XMMWORD PTR [rdx-16]
	sub	rax, 16
	vminps	xmm2, xmm0, xmm1
	vmaxps	xmm0, xmm0, xmm1
	vmovaps	XMMWORD PTR [rdx-16], xmm2
	vmovaps	XMMWORD PTR [rax+16], xmm0
	cmp	rax, rdx
	ja	.L49
.L48:
	cmp	r12d, 1
	jbe	.L53
	mov	eax, 33554432
	xor	edx, edx
	div	r12d
	cmp	eax, 12
	jbe	.L51
	mov	esi, r12d
	mov	rdi, rbp
	call	sort
	mov	edi, r12d
	sal	rdi, 4
	add	rdi, rbp
	mov	esi, r12d
	call	sort
.L53:
	add	rsp, 32
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	mov	QWORD PTR [rsp+8], rdi
	mov	DWORD PTR [rsp+16], r12d
	mov	QWORD PTR [rsp], OFFSET FLAT:merge
	sub	rsp, 8
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	xor	edx, edx
	mov	r9d, 1
	push	0
	.cfi_def_cfa_offset 88
	mov	r8d, 8
	mov	ecx, 24
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.0
	lea	rsi, [rsp+32]
	call	GOMP_task
	mov	DWORD PTR [rsp+48], r12d
	mov	QWORD PTR [rsp+40], rbp
	mov	QWORD PTR [rsp+32], OFFSET FLAT:merge
	add	rsp, 24
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 88
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.1
	lea	rsi, [rsp+32]
	call	GOMP_task
	add	rsp, 32
	.cfi_def_cfa_offset 64
	call	GOMP_taskwait
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L51:
	mov	DWORD PTR [rsp+16], r12d
	mov	QWORD PTR [rsp+8], rbp
	mov	QWORD PTR [rsp], OFFSET FLAT:sort
	sub	rsp, 8
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 88
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.0
	lea	rsi, [rsp+32]
	call	GOMP_task
	mov	DWORD PTR [rsp+48], r12d
	mov	QWORD PTR [rsp+40], rbp
	mov	QWORD PTR [rsp+32], OFFSET FLAT:sort
	add	rsp, 24
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 88
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.1
	lea	rsi, [rsp+32]
	call	GOMP_task
	add	rsp, 32
	.cfi_def_cfa_offset 64
	call	GOMP_taskwait
	add	rsp, 32
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5628:
	.size	merge, .-merge
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.0f "
	.text
	.p2align 4
	.globl	prnt
	.type	prnt, @function
prnt:
.LFB5622:
	.cfi_startproc
	test	esi, esi
	je	.L63
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	lea	eax, [rsi-1]
	lea	rbp, [rdi+4+rax*4]
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L57:
	vxorpd	xmm0, xmm0, xmm0
	vcvtss2sd	xmm0, xmm0, DWORD PTR [rbx]
	mov	edi, OFFSET FLAT:.LC0
	mov	eax, 1
	add	rbx, 4
	call	printf
	cmp	rbp, rbx
	jne	.L57
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	mov	edi, 10
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	putchar
	.p2align 4,,10
	.p2align 3
.L63:
	mov	edi, 10
	jmp	putchar
	.cfi_endproc
.LFE5622:
	.size	prnt, .-prnt
	.p2align 4
	.globl	insertSort
	.type	insertSort, @function
insertSort:
.LFB5623:
	.cfi_startproc
	test	esi, esi
	je	.L81
	vmovss	xmm2, DWORD PTR [rdi]
	lea	r9d, [rsi-2]
	xor	r8d, r8d
	cmp	esi, 1
	jbe	.L82
	.p2align 4,,10
	.p2align 3
.L73:
	mov	edx, r8d
	lea	eax, [r8+1]
	vmovaps	xmm0, xmm2
	.p2align 4,,10
	.p2align 3
.L72:
	mov	ecx, eax
	vmovss	xmm1, DWORD PTR [rdi+rcx*4]
	vcomiss	xmm0, xmm1
	vminss	xmm0, xmm1, xmm0
	cmova	rdx, rax
	inc	eax
	cmp	esi, eax
	ja	.L72
	vmovss	DWORD PTR [rdi+r8*4], xmm0
	vmovss	DWORD PTR [rdi+rdx*4], xmm2
	vmovss	xmm2, DWORD PTR [rdi+4+r8*4]
	lea	rax, [r8+1]
	cmp	r9, r8
	je	.L81
	mov	r8, rax
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L81:
	ret
.L82:
	ret
	.cfi_endproc
.LFE5623:
	.size	insertSort, .-insertSort
	.p2align 4
	.globl	bitonic
	.type	bitonic, @function
bitonic:
.LFB5624:
	.cfi_startproc
	vmovaps	xmm1, XMMWORD PTR [rsi]
	vmovaps	xmm0, XMMWORD PTR [rdi]
	vminps	xmm2, xmm0, xmm1
	vmaxps	xmm0, xmm0, xmm1
	vmovaps	XMMWORD PTR [rdi], xmm2
	vmovaps	XMMWORD PTR [rsi], xmm0
	ret
	.cfi_endproc
.LFE5624:
	.size	bitonic, .-bitonic
	.p2align 4
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB5625:
	.cfi_startproc
	vmovaps	xmm2, XMMWORD PTR [rsi]
	vmovaps	xmm1, XMMWORD PTR [rdi]
	vminps	xmm0, xmm1, xmm2
	vmaxps	xmm1, xmm1, xmm2
	vunpcklps	xmm0, xmm0, xmm1
	vmovaps	XMMWORD PTR [rdi], xmm0
	vmovaps	XMMWORD PTR [rsi], xmm0
	ret
	.cfi_endproc
.LFE5625:
	.size	shuffle, .-shuffle
	.p2align 4
	.globl	split
	.type	split, @function
split:
.LFB5626:
	.cfi_startproc
	cmp	edx, 1
	jbe	.L90
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	eax, 33554432
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	ebp, edx
	xor	edx, edx
	div	ebp
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	sub	rsp, 32
	.cfi_def_cfa_offset 64
	cmp	eax, 12
	jbe	.L87
	mov	esi, ebp
	mov	rdi, r12
	call	rbx
	mov	eax, ebp
	sal	rax, 4
	lea	rdi, [r12+rax]
	mov	esi, ebp
	call	rbx
	add	rsp, 32
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L90:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	mov	DWORD PTR [rsp+16], ebp
	mov	QWORD PTR [rsp], rdi
	mov	QWORD PTR [rsp+8], rsi
	sub	rsp, 8
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 88
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.0
	lea	rsi, [rsp+32]
	call	GOMP_task
	mov	DWORD PTR [rsp+48], ebp
	mov	QWORD PTR [rsp+40], r12
	mov	QWORD PTR [rsp+32], rbx
	add	rsp, 24
	.cfi_def_cfa_offset 72
	push	0
	.cfi_def_cfa_offset 80
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 88
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 96
	mov	edi, OFFSET FLAT:split._omp_fn.1
	lea	rsi, [rsp+32]
	call	GOMP_task
	add	rsp, 32
	.cfi_def_cfa_offset 64
	call	GOMP_taskwait
	add	rsp, 32
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5626:
	.size	split, .-split
	.p2align 4
	.globl	bitonicSort
	.type	bitonicSort, @function
bitonicSort:
.LFB5629:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	esi, esi
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	edi, 1024
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rsi
	sal	rsi, 4
	sub	rsp, 32
	.cfi_def_cfa_offset 64
	call	aligned_alloc
	mov	rbp, rax
	xor	ecx, ecx
	xor	edx, edx
	mov	rsi, rsp
	mov	edi, OFFSET FLAT:bitonicSort._omp_fn.0
	mov	QWORD PTR [rsp+8], rax
	mov	DWORD PTR [rsp+16], ebx
	mov	QWORD PTR [rsp], r12
	call	GOMP_parallel
	mov	esi, ebx
	mov	rdi, rbp
	call	merge
	mov	rsi, rsp
	xor	ecx, ecx
	xor	edx, edx
	mov	edi, OFFSET FLAT:bitonicSort._omp_fn.1
	mov	QWORD PTR [rsp+8], rbp
	mov	DWORD PTR [rsp+16], ebx
	mov	QWORD PTR [rsp], r12
	call	GOMP_parallel
	add	rsp, 32
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5629:
	.size	bitonicSort, .-bitonicSort
	.section	.rodata.str1.1
.LC1:
	.string	"Results:"
.LC2:
	.string	"%f\n%f\n\n"
.LC3:
	.string	"Success!"
.LC4:
	.string	"Failure!"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5630:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	edi, 134217728
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 24
	.cfi_def_cfa_offset 48
	call	malloc
	mov	rbp, rax
	xor	ecx, ecx
	xor	edx, edx
	lea	rsi, [rsp+8]
	mov	edi, OFFSET FLAT:main._omp_fn.0
	mov	QWORD PTR [rsp+8], rax
	call	GOMP_parallel
	mov	rdi, rbp
	mov	esi, 8388608
	call	bitonicSort
	mov	edi, OFFSET FLAT:.LC1
	call	puts
	lea	rbx, [rbp+4]
	vmovss	xmm0, DWORD PTR [rbp+0]
	mov	eax, 1
	add	rbp, 134217724
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L107:
	add	rbx, 4
	cmp	rbx, rbp
	je	.L109
.L99:
	vmovaps	xmm0, xmm1
.L96:
	vmovss	xmm1, DWORD PTR [rbx]
	vcomiss	xmm0, xmm1
	jbe	.L107
	mov	edi, OFFSET FLAT:.LC2
	mov	eax, 2
	vcvtss2sd	xmm1, xmm1, xmm1
	vcvtss2sd	xmm0, xmm0, xmm0
	add	rbx, 4
	call	printf
	vmovss	xmm1, DWORD PTR [rbx-4]
	cmp	rbx, rbp
	je	.L100
	xor	eax, eax
	jmp	.L99
.L109:
	test	eax, eax
	je	.L100
	mov	edi, OFFSET FLAT:.LC3
	call	puts
.L101:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	xor	eax, eax
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L100:
	.cfi_restore_state
	mov	edi, OFFSET FLAT:.LC4
	call	puts
	jmp	.L101
	.cfi_endproc
.LFE5630:
	.size	main, .-main
	.ident	"GCC: (GNU) 9.0.1 20190213 (experimental)"
	.section	.note.GNU-stack,"",@progbits
