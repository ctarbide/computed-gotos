	.file	"interp_cgoto.c"
	.text
	.p2align 4
	.globl	interp_cgoto
	.type	interp_cgoto, @function
interp_cgoto:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %eax
	movl	%esi, %edx
	leaq	dispatch_table.0(%rip), %rsi
	andl	$7, %eax
	movq	(%rsi,%rax,8), %rcx
	leaq	1(%rdi), %rax
	jmp	*%rcx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	movzbl	(%rax), %ecx
	addq	$1, %rax
	andl	$7, %ecx
	movq	(%rsi,%rcx,8), %rcx
	jmp	*%rcx
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	(%rax), %ecx
	negl	%edx
	addq	$1, %rax
	andl	$7, %ecx
	movq	(%rsi,%rcx,8), %rcx
	jmp	*%rcx
	.p2align 4,,10
	.p2align 3
.L9:
	movzbl	(%rax), %ecx
	addl	$7, %edx
	addq	$1, %rax
	andl	$7, %ecx
	movq	(%rsi,%rcx,8), %rcx
	jmp	*%rcx
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%edx, %ecx
	addq	$1, %rax
	shrl	$31, %ecx
	addl	%edx, %ecx
	movl	%ecx, %edx
	movzbl	-1(%rax), %ecx
	sarl	%edx
	andl	$7, %ecx
	movq	(%rsi,%rcx,8), %rcx
	jmp	*%rcx
	.p2align 4,,10
	.p2align 3
.L7:
	movzbl	(%rax), %ecx
	addl	%edx, %edx
	addq	$1, %rax
	andl	$7, %ecx
	movq	(%rsi,%rcx,8), %rcx
	jmp	*%rcx
	.p2align 4,,10
	.p2align 3
.L6:
	movzbl	(%rax), %ecx
	subl	$1, %edx
	addq	$1, %rax
	andl	$7, %ecx
	movq	(%rsi,%rcx,8), %rcx
	jmp	*%rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	(%rax), %ecx
	addl	$1, %edx
	addq	$1, %rax
	andl	$7, %ecx
	movq	(%rsi,%rcx,8), %rcx
	jmp	*%rcx
	.cfi_endproc
.LFE0:
	.size	interp_cgoto, .-interp_cgoto
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	dispatch_table.0, @object
	.size	dispatch_table.0, 64
dispatch_table.0:
	.quad	.L3
	.quad	.L4
	.quad	.L6
	.quad	.L7
	.quad	.L8
	.quad	.L9
	.quad	.L10
	.quad	.L11
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
