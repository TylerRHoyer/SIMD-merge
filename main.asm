	.file	"main.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	bitonic
	.type	bitonic, @function
bitonic:
.LFB5470:
	.cfi_startproc
	vmovaps	xmm2, XMMWORD PTR [rdi+16]
	vmovaps	xmm0, XMMWORD PTR [rdi]
	vminps	xmm1, xmm0, xmm2
	vmaxps	xmm0, xmm0, xmm2
	vshufps	xmm2, xmm1, xmm0, 5
	vshufps	xmm0, xmm1, xmm0, 175
	vmovaps	XMMWORD PTR [rdi], xmm2
	vmovaps	XMMWORD PTR [rdi+16], xmm0
	ret
	.cfi_endproc
.LFE5470:
	.size	bitonic, .-bitonic
	.p2align 4
	.globl	rnd
	.type	rnd, @function
rnd:
.LFB5471:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	edi, 128
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	malloc
	mov	r12, rax
	mov	rbx, rax
	lea	rbp, [rax+128]
	.p2align 4,,10
	.p2align 3
.L4:
	call	rand
	vxorps	xmm0, xmm0, xmm0
	vcvtsi2ss	xmm0, xmm0, eax
	add	rbx, 4
	vmovss	DWORD PTR [rbx-4], xmm0
	cmp	rbx, rbp
	jne	.L4
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	mov	rax, r12
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5471:
	.size	rnd, .-rnd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d, "
.LC1:
	.string	"]"
	.text
	.p2align 4
	.globl	printList
	.type	printList, @function
printList:
.LFB5472:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	ebp, esi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	mov	edi, 91
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	putchar
	test	ebp, ebp
	je	.L8
	lea	eax, [rbp-1]
	lea	rbp, [rbx+4+rax*4]
	.p2align 4,,10
	.p2align 3
.L9:
	vcvttss2si	esi, DWORD PTR [rbx]
	mov	edi, OFFSET FLAT:.LC0
	xor	eax, eax
	add	rbx, 4
	call	printf
	cmp	rbp, rbx
	jne	.L9
.L8:
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	mov	edi, OFFSET FLAT:.LC1
	pop	rbp
	.cfi_def_cfa_offset 8
	jmp	puts
	.cfi_endproc
.LFE5472:
	.size	printList, .-printList
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5473:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xor	eax, eax
	call	rnd
	mov	rbp, rax
	mov	rdi, rax
	mov	esi, 16
	call	printList
	lea	rdi, [rbp+64]
	mov	esi, 16
	call	printList
	vmovaps	xmm2, XMMWORD PTR [rbp+64]
	vmovaps	xmm0, XMMWORD PTR [rbp+0]
	mov	rdi, rbp
	vminps	xmm1, xmm0, xmm2
	vmaxps	xmm0, xmm0, xmm2
	mov	esi, 32
	vshufps	xmm2, xmm1, xmm0, 5
	vshufps	xmm0, xmm1, xmm0, 175
	vmovaps	XMMWORD PTR [rbp+0], xmm2
	vmovaps	XMMWORD PTR [rbp+64], xmm0
	call	printList
	xor	eax, eax
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5473:
	.size	main, .-main
	.ident	"GCC: (GNU) 9.0.1 20190213 (experimental)"
	.section	.note.GNU-stack,"",@progbits
