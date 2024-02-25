	.file	"interp_switchc.c"
	.text
	.p2align 4
	.globl	interp_switchc
	.type	interp_switchc, @function
interp_switchc:
.LFB0:
	.cfi_startproc
	movl	%esi, %eax
	leaq	.L5(%rip), %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	movzbl	(%rdi), %edx
	andl	$7, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L12-.L5
	.long	.L11-.L5
	.long	.L10-.L5
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L7-.L5
	.long	.L6-.L5
	.long	.L3-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L11:
	addl	$1, %eax
.L3:
	addq	$1, %rdi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L6:
	negl	%eax
	addq	$1, %rdi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L7:
	addl	$7, %eax
	addq	$1, %rdi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%eax, %edx
	addq	$1, %rdi
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L9:
	addl	%eax, %eax
	addq	$1, %rdi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L10:
	subl	$1, %eax
	addq	$1, %rdi
	jmp	.L2
.L12:
	ret
	.cfi_endproc
.LFE0:
	.size	interp_switchc, .-interp_switchc
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
