	.file	"recursive.c"
	.intel_syntax noprefix
	.text
	.p2align 4,,15
	.type	split._omp_fn.0, @function
split._omp_fn.0:
.LFB5617:
	.cfi_startproc
	mov	rax, rdi
	mov	esi, DWORD PTR 16[rdi]
	mov	rdi, QWORD PTR 8[rdi]
	jmp	[QWORD PTR [rax]]
	.cfi_endproc
.LFE5617:
	.size	split._omp_fn.0, .-split._omp_fn.0
	.p2align 4,,15
	.type	split._omp_fn.1, @function
split._omp_fn.1:
.LFB5618:
	.cfi_startproc
	mov	eax, DWORD PTR 16[rdi]
	mov	rdx, QWORD PTR [rdi]
	mov	rsi, rax
	sal	rax, 4
	add	rax, QWORD PTR 8[rdi]
	mov	rdi, rax
	jmp	rdx
	.cfi_endproc
.LFE5618:
	.size	split._omp_fn.1, .-split._omp_fn.1
	.p2align 4,,15
	.type	bitonicSort._omp_fn.3, @function
bitonicSort._omp_fn.3:
.LFB5620:
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
	mov	ebx, DWORD PTR 16[rdi]
	test	ebx, ebx
	je	.L11
	mov	rbp, rdi
	call	omp_get_num_threads@PLT
	mov	r12d, eax
	call	omp_get_thread_num@PLT
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
	mov	r8, QWORD PTR 8[rbp]
	mov	rsi, r9
	add	rax, r9
	sal	rsi, 4
	sal	rax, 4
	mov	rdi, QWORD PTR 0[rbp]
	lea	ecx, 0[0+rdx*4]
	add	rsi, r8
	lea	rdx, 16[r8+rax]
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
.LFE5620:
	.size	bitonicSort._omp_fn.3, .-bitonicSort._omp_fn.3
	.p2align 4,,15
	.type	bitonicSort._omp_fn.2, @function
bitonicSort._omp_fn.2:
.LFB5619:
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
	mov	ebx, DWORD PTR 16[rdi]
	test	ebx, ebx
	je	.L20
	mov	rbp, rdi
	call	omp_get_num_threads@PLT
	mov	r12d, eax
	call	omp_get_thread_num@PLT
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
	mov	r8, QWORD PTR 8[rbp]
	mov	rcx, rdx
	lea	esi, 0[0+rdx*4]
	add	rdx, rax
	sal	rcx, 4
	sal	rdx, 4
	mov	rdi, QWORD PTR 0[rbp]
	add	rcx, r8
	lea	rdx, 16[r8+rdx]
	.p2align 4,,10
	.p2align 3
.L17:
	mov	eax, esi
	vmovaps	xmm0, XMMWORD PTR [rdi+rax*4]
	add	rcx, 16
	vmovaps	XMMWORD PTR -16[rcx], xmm0
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
.LFE5619:
	.size	bitonicSort._omp_fn.2, .-bitonicSort._omp_fn.2
	.p2align 4,,15
	.type	main._omp_fn.4, @function
main._omp_fn.4:
.LFB5621:
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
	call	g_rand_new@PLT
	mov	rbp, rax
	call	omp_get_num_threads@PLT
	mov	ebx, eax
	call	omp_get_thread_num@PLT
	mov	ecx, eax
	xor	edx, edx
	mov	eax, 1048576
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
	lea	r12, 4[r12+rdx*4]
	.p2align 4,,10
	.p2align 3
.L25:
	mov	rdi, rbp
	call	g_rand_double@PLT
	vxorps	xmm1, xmm1, xmm1
	vcvtsd2ss	xmm1, xmm1, xmm0
	add	rbx, 4
	vmovss	DWORD PTR -4[rbx], xmm1
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
.LFE5621:
	.size	main._omp_fn.4, .-main._omp_fn.4
	.p2align 4,,15
	.globl	sort
	.type	sort, @function
sort:
.LFB5613:
	.cfi_startproc
	cmp	esi, 1
	je	.L41
	cmp	esi, 2
	je	.L43
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12d, esi
	shr	r12d
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	ebp, r12d
	sal	rbp, 4
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	lea	rax, -16[rdi+rbp]
	lea	rdx, [rax+rbp]
	sub	rsp, 40
	.cfi_def_cfa_offset 80
	cmp	rdi, rax
	ja	.L34
	.p2align 4,,10
	.p2align 3
.L35:
	sub	rdx, 16
	sub	rax, 16
	vmovaps	xmm1, XMMWORD PTR 16[rdx]
	vmovaps	xmm0, XMMWORD PTR 16[rax]
	vminps	xmm2, xmm0, xmm1
	vmaxps	xmm0, xmm0, xmm1
	vmovaps	XMMWORD PTR 16[rax], xmm2
	vmovaps	XMMWORD PTR 16[rdx], xmm0
	cmp	rdi, rax
	jbe	.L35
.L34:
	cmp	esi, 3
	jbe	.L39
	mov	eax, 1048576
	xor	edx, edx
	div	r12d
	mov	rbx, rdi
	cmp	eax, 12
	jbe	.L37
	mov	esi, r12d
	call	sort
	lea	rdi, [rbx+rbp]
	mov	esi, r12d
	call	sort
.L39:
	add	rsp, 40
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	vmovaps	xmm2, XMMWORD PTR 16[rdi]
	vmovaps	xmm1, XMMWORD PTR [rdi]
	vminps	xmm0, xmm1, xmm2
	vmaxps	xmm1, xmm1, xmm2
	vunpcklps	xmm0, xmm0, xmm1
	vunpcklps	xmm0, xmm0, xmm0
	vunpcklps	xmm0, xmm0, xmm0
	vmovaps	XMMWORD PTR [rdi], xmm0
	vmovaps	XMMWORD PTR 16[rdi], xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	lea	r13, sort[rip]
	mov	DWORD PTR 16[rsp], r12d
	mov	QWORD PTR 8[rsp], rdi
	mov	QWORD PTR [rsp], r13
	mov	rbp, rsp
	sub	rsp, 8
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	mov	rsi, rbp
	mov	r9d, 1
	push	0
	.cfi_def_cfa_offset 104
	mov	r8d, 8
	mov	ecx, 24
	push	0
	.cfi_def_cfa_offset 112
	xor	edx, edx
	lea	rdi, split._omp_fn.0[rip]
	call	GOMP_task@PLT
	mov	DWORD PTR 48[rsp], r12d
	mov	QWORD PTR 40[rsp], rbx
	mov	QWORD PTR 32[rsp], r13
	add	rsp, 24
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	mov	rsi, rbp
	mov	r9d, 1
	push	0
	.cfi_def_cfa_offset 104
	mov	r8d, 8
	mov	ecx, 24
	push	0
	.cfi_def_cfa_offset 112
	xor	edx, edx
	lea	rdi, split._omp_fn.1[rip]
	call	GOMP_task@PLT
	add	rsp, 32
	.cfi_def_cfa_offset 80
	call	GOMP_taskwait@PLT
	add	rsp, 40
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5613:
	.size	sort, .-sort
	.p2align 4,,15
	.globl	merge
	.type	merge, @function
merge:
.LFB5614:
	.cfi_startproc
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12d, esi
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	ebx, esi
	shr	ebx
	sub	rsp, 32
	.cfi_def_cfa_offset 80
	cmp	esi, 3
	jbe	.L45
	mov	eax, 1048576
	xor	edx, edx
	div	ebx
	cmp	eax, 12
	jbe	.L46
	mov	esi, ebx
	call	merge
	mov	edi, ebx
	sal	rdi, 4
	add	rdi, rbp
	mov	esi, ebx
	call	merge
.L45:
	mov	eax, r12d
	sal	rax, 4
	lea	rax, -16[rbp+rax]
	cmp	rbp, rax
	jnb	.L47
	mov	rdx, rbp
	.p2align 4,,10
	.p2align 3
.L48:
	vpermilps	xmm1, XMMWORD PTR [rax], 27
	add	rdx, 16
	vmovaps	XMMWORD PTR [rax], xmm1
	vmovaps	xmm0, XMMWORD PTR -16[rdx]
	sub	rax, 16
	vminps	xmm2, xmm0, xmm1
	vmaxps	xmm0, xmm0, xmm1
	vmovaps	XMMWORD PTR -16[rdx], xmm2
	vmovaps	XMMWORD PTR 16[rax], xmm0
	cmp	rax, rdx
	ja	.L48
.L47:
	cmp	r12d, 3
	jbe	.L52
	mov	eax, 1048576
	xor	edx, edx
	div	ebx
	cmp	eax, 12
	jbe	.L50
	mov	esi, ebx
	mov	rdi, rbp
	call	sort
	mov	edi, ebx
	sal	rdi, 4
	add	rdi, rbp
	mov	esi, ebx
	call	sort
.L52:
	add	rsp, 32
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L46:
	.cfi_restore_state
	lea	r14, merge[rip]
	mov	QWORD PTR 8[rsp], rdi
	mov	DWORD PTR 16[rsp], ebx
	mov	QWORD PTR [rsp], r14
	mov	r13, rsp
	sub	rsp, 8
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	xor	edx, edx
	mov	rsi, r13
	push	0
	.cfi_def_cfa_offset 104
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 112
	mov	ecx, 24
	lea	rdi, split._omp_fn.0[rip]
	call	GOMP_task@PLT
	mov	DWORD PTR 48[rsp], ebx
	mov	QWORD PTR 40[rsp], rbp
	mov	QWORD PTR 32[rsp], r14
	add	rsp, 24
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	mov	r9d, 1
	mov	r8d, 8
	push	0
	.cfi_def_cfa_offset 104
	mov	ecx, 24
	xor	edx, edx
	push	0
	.cfi_def_cfa_offset 112
	mov	rsi, r13
	lea	rdi, split._omp_fn.1[rip]
	call	GOMP_task@PLT
	add	rsp, 32
	.cfi_def_cfa_offset 80
	call	GOMP_taskwait@PLT
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L50:
	lea	r13, sort[rip]
	mov	DWORD PTR 16[rsp], ebx
	mov	QWORD PTR 8[rsp], rbp
	mov	QWORD PTR [rsp], r13
	mov	r12, rsp
	sub	rsp, 8
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	mov	rsi, r12
	mov	r9d, 1
	push	0
	.cfi_def_cfa_offset 104
	mov	r8d, 8
	mov	ecx, 24
	push	0
	.cfi_def_cfa_offset 112
	xor	edx, edx
	lea	rdi, split._omp_fn.0[rip]
	call	GOMP_task@PLT
	mov	DWORD PTR 48[rsp], ebx
	mov	QWORD PTR 40[rsp], rbp
	mov	QWORD PTR 32[rsp], r13
	add	rsp, 24
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	mov	rsi, r12
	mov	r9d, 1
	push	0
	.cfi_def_cfa_offset 104
	mov	r8d, 8
	mov	ecx, 24
	push	0
	.cfi_def_cfa_offset 112
	xor	edx, edx
	lea	rdi, split._omp_fn.1[rip]
	call	GOMP_task@PLT
	add	rsp, 32
	.cfi_def_cfa_offset 80
	call	GOMP_taskwait@PLT
	add	rsp, 32
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5614:
	.size	merge, .-merge
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.0f "
	.text
	.p2align 4,,15
	.globl	prnt
	.type	prnt, @function
prnt:
.LFB5608:
	.cfi_startproc
	test	esi, esi
	je	.L62
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	lea	eax, -1[rsi]
	lea	r12, 4[rdi+rax*4]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	lea	rbp, .LC0[rip]
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	.p2align 4,,10
	.p2align 3
.L56:
	vxorpd	xmm0, xmm0, xmm0
	vcvtss2sd	xmm0, xmm0, DWORD PTR [rbx]
	mov	rdi, rbp
	mov	eax, 1
	add	rbx, 4
	call	printf@PLT
	cmp	r12, rbx
	jne	.L56
	pop	rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	mov	edi, 10
	pop	r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT
	.p2align 4,,10
	.p2align 3
.L62:
	mov	edi, 10
	jmp	putchar@PLT
	.cfi_endproc
.LFE5608:
	.size	prnt, .-prnt
	.p2align 4,,15
	.globl	insertSort
	.type	insertSort, @function
insertSort:
.LFB5609:
	.cfi_startproc
	test	esi, esi
	je	.L77
	vmovss	xmm2, DWORD PTR [rdi]
	cmp	esi, 1
	jbe	.L77
	lea	r8, 4[rdi]
	mov	r10, rdi
	xor	edx, edx
	mov	r9d, 1
	.p2align 4,,10
	.p2align 3
.L70:
	mov	eax, r9d
	vmovaps	xmm0, xmm2
	.p2align 4,,10
	.p2align 3
.L69:
	mov	ecx, eax
	vmovss	xmm1, DWORD PTR [rdi+rcx*4]
	vcomiss	xmm0, xmm1
	vminss	xmm0, xmm1, xmm0
	cmova	rdx, rax
	inc	eax
	cmp	esi, eax
	ja	.L69
	vmovss	DWORD PTR [r10], xmm0
	lea	eax, 1[r9]
	vmovss	DWORD PTR [rdi+rdx*4], xmm2
	mov	r10, r8
	vmovss	xmm2, DWORD PTR [r8]
	mov	edx, r9d
	add	r8, 4
	cmp	esi, eax
	je	.L77
	mov	r9d, eax
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L77:
	ret
	.cfi_endproc
.LFE5609:
	.size	insertSort, .-insertSort
	.p2align 4,,15
	.globl	bitonic
	.type	bitonic, @function
bitonic:
.LFB5610:
	.cfi_startproc
	vmovaps	xmm1, XMMWORD PTR [rsi]
	vmovaps	xmm0, XMMWORD PTR [rdi]
	vminps	xmm2, xmm0, xmm1
	vmaxps	xmm0, xmm0, xmm1
	vmovaps	XMMWORD PTR [rdi], xmm2
	vmovaps	XMMWORD PTR [rsi], xmm0
	ret
	.cfi_endproc
.LFE5610:
	.size	bitonic, .-bitonic
	.p2align 4,,15
	.globl	shuffle
	.type	shuffle, @function
shuffle:
.LFB5611:
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
.LFE5611:
	.size	shuffle, .-shuffle
	.p2align 4,,15
	.globl	split
	.type	split, @function
split:
.LFB5612:
	.cfi_startproc
	cmp	edx, 1
	jbe	.L85
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	eax, 1048576
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	ebx, edx
	xor	edx, edx
	div	ebx
	sub	rsp, 40
	.cfi_def_cfa_offset 80
	cmp	eax, 12
	jbe	.L82
	mov	esi, ebx
	mov	rdi, r12
	call	rbp
	mov	edi, ebx
	sal	rdi, 4
	add	rdi, r12
	mov	esi, ebx
	call	rbp
	add	rsp, 40
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.p2align 4,,10
	.p2align 3
.L82:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	mov	DWORD PTR 16[rsp], ebx
	mov	QWORD PTR 8[rsp], rsi
	mov	QWORD PTR [rsp], rdi
	mov	r13, rsp
	sub	rsp, 8
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	mov	rsi, r13
	mov	r9d, 1
	push	0
	.cfi_def_cfa_offset 104
	mov	r8d, 8
	mov	ecx, 24
	push	0
	.cfi_def_cfa_offset 112
	xor	edx, edx
	lea	rdi, split._omp_fn.0[rip]
	call	GOMP_task@PLT
	mov	DWORD PTR 48[rsp], ebx
	mov	QWORD PTR 40[rsp], r12
	mov	QWORD PTR 32[rsp], rbp
	add	rsp, 24
	.cfi_def_cfa_offset 88
	push	0
	.cfi_def_cfa_offset 96
	mov	rsi, r13
	mov	r9d, 1
	push	0
	.cfi_def_cfa_offset 104
	mov	r8d, 8
	mov	ecx, 24
	push	0
	.cfi_def_cfa_offset 112
	xor	edx, edx
	lea	rdi, split._omp_fn.1[rip]
	call	GOMP_task@PLT
	add	rsp, 32
	.cfi_def_cfa_offset 80
	call	GOMP_taskwait@PLT
	add	rsp, 40
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5612:
	.size	split, .-split
	.p2align 4,,15
	.globl	bitonicSort
	.type	bitonicSort, @function
bitonicSort:
.LFB5615:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	esi, esi
	mov	r13, rdi
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	edi, 1024
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rsi
	sal	rsi, 4
	sub	rsp, 40
	.cfi_def_cfa_offset 80
	call	aligned_alloc@PLT
	mov	r12, rsp
	mov	rbp, rax
	xor	ecx, ecx
	xor	edx, edx
	mov	rsi, r12
	lea	rdi, bitonicSort._omp_fn.2[rip]
	mov	QWORD PTR 8[rsp], rax
	mov	DWORD PTR 16[rsp], ebx
	mov	QWORD PTR [rsp], r13
	call	GOMP_parallel@PLT
	mov	esi, ebx
	mov	rdi, rbp
	call	merge
	mov	rsi, r12
	xor	ecx, ecx
	xor	edx, edx
	lea	rdi, bitonicSort._omp_fn.3[rip]
	mov	QWORD PTR 8[rsp], rbp
	mov	DWORD PTR 16[rsp], ebx
	mov	QWORD PTR [rsp], r13
	call	GOMP_parallel@PLT
	add	rsp, 40
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5615:
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
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB5616:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	edi, 4194304
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 24
	.cfi_def_cfa_offset 48
	call	malloc@PLT
	mov	rbp, rax
	xor	ecx, ecx
	xor	edx, edx
	lea	rsi, 8[rsp]
	lea	rdi, main._omp_fn.4[rip]
	mov	QWORD PTR 8[rsp], rax
	call	GOMP_parallel@PLT
	mov	rdi, rbp
	mov	esi, 262144
	call	bitonicSort
	lea	rdi, .LC1[rip]
	call	puts@PLT
	lea	rbx, 4[rbp]
	vmovss	xmm0, DWORD PTR 0[rbp]
	mov	eax, 1
	add	rbp, 4194300
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L102:
	add	rbx, 4
	cmp	rbx, rbp
	je	.L105
.L94:
	vmovaps	xmm0, xmm1
.L91:
	vmovss	xmm1, DWORD PTR [rbx]
	vcomiss	xmm0, xmm1
	jbe	.L102
	lea	rdi, .LC2[rip]
	mov	eax, 2
	vcvtss2sd	xmm1, xmm1, xmm1
	vcvtss2sd	xmm0, xmm0, xmm0
	add	rbx, 4
	call	printf@PLT
	vmovss	xmm1, DWORD PTR -4[rbx]
	cmp	rbx, rbp
	je	.L95
	xor	eax, eax
	jmp	.L94
.L105:
	test	eax, eax
	je	.L95
	lea	rdi, .LC3[rip]
	call	puts@PLT
.L103:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	xor	eax, eax
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L95:
	.cfi_restore_state
	lea	rdi, .LC4[rip]
	call	puts@PLT
	jmp	.L103
	.cfi_endproc
.LFE5616:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-2) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
