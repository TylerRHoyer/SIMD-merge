	.file	"test.c"
	.intel_syntax noprefix
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	jmp	rand@PLT
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (Debian 8.2.0-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
