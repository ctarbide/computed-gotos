	.file	"interp_cgotow.c"
	.text
	.p2align 4
	.globl	interp_cgotow
	.type	interp_cgotow, @function
interp_cgotow:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %edx
	leaq	dispatch_table.0(%rip), %rcx
	movl	%esi, %eax
	andl	$7, %edx
	jmp	*(%rcx,%rdx,8)
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movzbl	1(%rdi), %edx
	addq	$1, %rdi
	andl	$7, %edx
	jmp	*(%rcx,%rdx,8)
	.p2align 4,,10
	.p2align 3
.L11:
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	negl	%eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L8:
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L7:
	addl	%eax, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	subl	$1, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L9:
	addl	$7, %eax
	jmp	.L5
	.cfi_endproc
.LFE0:
	.size	interp_cgotow, .-interp_cgotow
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
