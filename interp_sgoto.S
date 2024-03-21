	.file	"interp_sgoto.c"
	.text
	.p2align 4
	.globl	interp_sgoto
	.type	interp_sgoto, @function
interp_sgoto:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %eax
	movl	%esi, %ecx
	leaq	1(%rdi), %rdx
	leaq	.L5(%rip), %rsi
	andl	$7, %eax
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	(%rsi,%rax,4), %rax
	addq	%rsi, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L13-.L5
	.long	.L11-.L5
	.long	.L10-.L5
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L7-.L5
	.long	.L6-.L5
	.long	.L4-.L5
	.text
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	(%rdx), %eax
	andl	$7, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	addq	$1, %rdx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L6:
	movzbl	(%rdx), %eax
	negl	%ecx
	andl	$7, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L7:
	movzbl	(%rdx), %eax
	addl	$7, %ecx
	andl	$7, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movzbl	(%rdx), %eax
	andl	$7, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L9:
	movzbl	(%rdx), %eax
	addl	%ecx, %ecx
	andl	$7, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	(%rdx), %eax
	subl	$1, %ecx
	andl	$7, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L11:
	movzbl	(%rdx), %eax
	addl	$1, %ecx
	andl	$7, %eax
	jmp	.L12
.L13:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	interp_sgoto, .-interp_sgoto
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
