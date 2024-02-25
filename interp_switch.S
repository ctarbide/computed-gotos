	.file	"interp_switch.c"
	.text
	.p2align 4
	.globl	interp_switch
	.type	interp_switch, @function
interp_switch:
.LFB0:
	.cfi_startproc
	movl	%esi, %eax
	leaq	.L5(%rip), %rcx
	.p2align 4,,10
	.p2align 3
.L2:
	movzbl	(%rdi), %edx
	andl	$7, %edx
	cmpb	$6, %dl
	ja	.L3
	movzbl	%dl, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L12-.L5
	.long	.L10-.L5
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L7-.L5
	.long	.L6-.L5
	.long	.L4-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$7, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$1, %rdi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L8:
	addl	%eax, %eax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L9:
	subl	$1, %eax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L10:
	addl	$1, %eax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	negl	%eax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L12:
	ret
	.cfi_endproc
.LFE0:
	.size	interp_switch, .-interp_switch
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
