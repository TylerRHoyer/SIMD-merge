	.file	"main.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	_Z5mergePjS_j
	.type	_Z5mergePjS_j, @function
_Z5mergePjS_j:
.LFB7375:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rdi
	mov	edi, 1024
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rsi
	mov	esi, edx
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rsi
	sal	rsi, 2
	call	aligned_alloc
	xor	r8d, r8d
	xor	ecx, ecx
	xor	edx, edx
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	cmp	ecx, ebx
	jnb	.L8
	mov	r10d, ecx
	mov	r10d, DWORD PTR [rbp+0+r10*4]
	mov	r9d, r8d
	mov	DWORD PTR [rax+r9*4], r10d
	inc	ecx
.L6:
	inc	r8d
.L2:
	cmp	edx, ebx
	jnb	.L3
	mov	esi, edx
	lea	rdi, [r12+rsi*4]
	mov	esi, r8d
	lea	rsi, [rax+rsi*4]
	cmp	ecx, ebx
	jnb	.L4
	mov	r9d, DWORD PTR [rdi]
	mov	edi, ecx
	mov	edi, DWORD PTR [rbp+0+rdi*4]
	cmp	r9d, edi
	jnb	.L5
	mov	DWORD PTR [rsi], r9d
	inc	edx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	mov	edi, DWORD PTR [rdi]
	inc	edx
	mov	DWORD PTR [rsi], edi
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L5:
	mov	DWORD PTR [rsi], edi
	inc	ecx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L8:
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7375:
	.size	_Z5mergePjS_j, .-_Z5mergePjS_j
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7376:
	.cfi_startproc
	sub	rsp, 40
	.cfi_def_cfa_offset 48
	movabs	rax, 8589934593
	mov	QWORD PTR [rsp], rax
	movabs	rax, 25769803779
	mov	QWORD PTR [rsp+8], rax
	movabs	rax, 17179869186
	mov	QWORD PTR [rsp+16], rax
	lea	rsi, [rsp+16]
	movabs	rax, 34359738375
	mov	rdi, rsp
	mov	edx, 4
	mov	QWORD PTR [rsp+24], rax
	call	_Z5mergePjS_j
	xor	eax, eax
	add	rsp, 40
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7376:
	.size	main, .-main
	.ident	"GCC: (GNU) 9.0.1 20190213 (experimental)"
	.section	.note.GNU-stack,"",@progbits
