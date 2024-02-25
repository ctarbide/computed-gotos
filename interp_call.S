	.file	"interp_call.c"
	.text
	.p2align 4
	.globl	do_inc
	.type	do_inc, @function
do_inc:
.LFB0:
	.cfi_startproc
	leal	1(%rdi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	do_inc, .-do_inc
	.p2align 4
	.globl	do_dec
	.type	do_dec, @function
do_dec:
.LFB1:
	.cfi_startproc
	leal	-1(%rdi), %eax
	ret
	.cfi_endproc
.LFE1:
	.size	do_dec, .-do_dec
	.p2align 4
	.globl	do_mul2
	.type	do_mul2, @function
do_mul2:
.LFB2:
	.cfi_startproc
	leal	(%rdi,%rdi), %eax
	ret
	.cfi_endproc
.LFE2:
	.size	do_mul2, .-do_mul2
	.p2align 4
	.globl	do_div2
	.type	do_div2, @function
do_div2:
.LFB3:
	.cfi_startproc
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	ret
	.cfi_endproc
.LFE3:
	.size	do_div2, .-do_div2
	.p2align 4
	.globl	do_add7
	.type	do_add7, @function
do_add7:
.LFB4:
	.cfi_startproc
	leal	7(%rdi), %eax
	ret
	.cfi_endproc
.LFE4:
	.size	do_add7, .-do_add7
	.p2align 4
	.globl	do_neg
	.type	do_neg, @function
do_neg:
.LFB5:
	.cfi_startproc
	movl	%edi, %eax
	negl	%eax
	ret
	.cfi_endproc
.LFE5:
	.size	do_neg, .-do_neg
	.p2align 4
	.globl	do_pad
	.type	do_pad, @function
do_pad:
.LFB6:
	.cfi_startproc
	movl	%edi, %eax
	ret
	.cfi_endproc
.LFE6:
	.size	do_pad, .-do_pad
	.p2align 4
	.globl	do_halt
	.type	do_halt, @function
do_halt:
.LFB7:
	.cfi_startproc
	movl	$0, running(%rip)
	movl	%edi, %eax
	ret
	.cfi_endproc
.LFE7:
	.size	do_halt, .-do_halt
	.p2align 4
	.globl	interp_call
	.type	interp_call, @function
interp_call:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	dispatch_table.0(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	%esi, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$1, running(%rip)
	.p2align 4,,10
	.p2align 3
.L11:
	movzbl	(%rbx), %eax
	addq	$1, %rbx
	andl	$7, %eax
	call	*0(%rbp,%rax,8)
	movl	%eax, %edi
	movl	running(%rip), %eax
	testl	%eax, %eax
	jne	.L11
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	%edi, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8:
	.size	interp_call, .-interp_call
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	dispatch_table.0, @object
	.size	dispatch_table.0, 64
dispatch_table.0:
	.quad	do_halt
	.quad	do_inc
	.quad	do_dec
	.quad	do_mul2
	.quad	do_div2
	.quad	do_add7
	.quad	do_neg
	.quad	do_pad
	.local	running
	.comm	running,4,4
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
