func:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	vmovsd	%xmm0, -8(%rbp)
	movl	%edi, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	L2
	movq	-8(%rbp), %rax
	jmp	L3
L2:
	movl	-12(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %edi
	vmovq	%rax, %xmm0
	call	func
	vmovq	%xmm0, %rax
	vmovq	%rax, %xmm2
	vaddsd	-8(%rbp), %xmm2, %xmm1
	vmovq	%xmm1, %rax
L3:
	vmovq	%rax, %xmm0
	leave
	ret
.globl _start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$10, %edi
	vmovsd	LC0(%rip), %xmm0
	call	func
	vmovq	%xmm0, %rax
	vmovsd	LC1(%rip), %xmm0
	vmovsd	LC2(%rip), %xmm1
	vmovq	%rax, %xmm2
	vandpd	%xmm1, %xmm2, %xmm2
	vorpd	%xmm0, %xmm2, %xmm2
	vmovq	%xmm2, %rax
	movabsq	$-4616189618054758400, %rdx
	vmovq	%rax, %xmm3
	vmovq	%rdx, %xmm4
	vucomisd	%xmm4, %xmm3
	jp	L7
	movabsq	$-4616189618054758400, %rdx
	vmovq	%rax, %xmm5
	vmovq	%rdx, %xmm6
	vucomisd	%xmm6, %xmm5
	je	L8
L7:
	call	abort
L8:
	movl	$0, %edi
	call	exit
LC0:
	.long	0
	.long	-2147483648
LC1:
	.long	0
	.long	1072693248
	.long	0
	.long	0
LC2:
	.long	0
	.long	-2147483648
	.long	0
	.long	0