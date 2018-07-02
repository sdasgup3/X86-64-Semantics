strchr:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	nop
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movl	-12(%rbp), %eax
	cmpb	%al, %dl
	je	L6
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	L3
	movl	$0, %eax
	jmp	L1
L3:
	movq	-8(%rbp), %rax
	jmp	L1
L6:
L1:
	popq	%rbp
	ret
strlen:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	jmp	L8
L9:
	addq	$1, -8(%rbp)
L8:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	L9
	movq	-8(%rbp), %rax
	popq	%rbp
	ret
strcpy:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	nop
L12:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-32(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	%rcx, -32(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	L12
	movq	-8(%rbp), %rax
	popq	%rbp
	ret
memcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	L15
L18:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	L16
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	jmp	L17
L16:
	addq	$1, -8(%rbp)
	addq	$1, -16(%rbp)
L15:
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	testq	%rax, %rax
	jne	L18
	movl	$0, %eax
L17:
	popq	%rbp
	ret
exit:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movq $-1, %rax
	jmp %rax
	
	popq	%rbp
	ret
abort:
	pushq	%rbp
	movq	%rsp, %rbp
	movq $-1, %rax
	jmp %rax
	
	popq	%rbp
	ret
memset:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	L22
L23:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movl	-28(%rbp), %edx
	movb	%dl, (%rax)
L22:
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	testq	%rax, %rax
	jne	L23
	movq	-24(%rbp), %rax
	popq	%rbp
	ret
memcpy:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	L26
L27:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	%rcx, -16(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
L26:
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	testq	%rax, %rax
	jne	L27
	movq	-24(%rbp), %rax
	popq	%rbp
	ret
malloc:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movl	$1000, %eax
	popq	%rbp
	ret
calloc:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$1000, %eax
	popq	%rbp
	ret
free:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	popq	%rbp
	ret
isprint:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	cmpl	$96, -4(%rbp)
	jle	L35
	cmpl	$122, -4(%rbp)
	jg	L35
	movl	$1, %eax
	jmp	L36
L35:
	cmpl	$64, -4(%rbp)
	jle	L37
	cmpl	$90, -4(%rbp)
	jg	L37
	movl	$1, %eax
	jmp	L36
L37:
	cmpl	$47, -4(%rbp)
	jle	L38
	cmpl	$57, -4(%rbp)
	jg	L38
	movl	$1, %eax
	jmp	L36
L38:
	movl	$0, %eax
L36:
	popq	%rbp
	ret
	.comm	array0,64,64
	.comm	array1,64,64
	.comm	array2,64,64
	.comm	array3,64,64
	.comm	array4,64,64
	.comm	array5,64,64
	.bss
counter0:
	.zero	4
counter1:
	.zero	4
counter2:
	.zero	4
counter3:
	.zero	4
counter4:
	.zero	4
counter5:
	.zero	4
stop:
	.long	1
	.comm	vol,4,4
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -84(%rbp)
	movl	-84(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$array0, %rax
	movq	%rax, -8(%rbp)
	movl	-84(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$array1, %rax
	movq	%rax, -16(%rbp)
	movl	-84(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$array2, %rax
	movq	%rax, -24(%rbp)
	movl	-84(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$array3, %rax
	movq	%rax, -32(%rbp)
	movl	-84(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$array4, %rax
	movq	%rax, -40(%rbp)
	movl	-84(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$array5, %rax
	movq	%rax, -48(%rbp)
L42:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movl	counter0(%rip), %eax
	vmovd	%edx, %xmm1
	vmovd	%eax, %xmm2
	vaddss	%xmm2, %xmm1, %xmm0
	vmovd	%xmm0, %eax
	movl	%eax, counter0(%rip)
	addq	$12, -8(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movl	counter1(%rip), %eax
	vmovd	%edx, %xmm4
	vmovd	%eax, %xmm5
	vaddss	%xmm5, %xmm4, %xmm3
	vmovd	%xmm3, %eax
	movl	%eax, counter1(%rip)
	addq	$12, -16(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movl	counter2(%rip), %eax
	vmovd	%edx, %xmm7
	vmovd	%eax, %xmm0
	vaddss	%xmm0, %xmm7, %xmm6
	vmovd	%xmm6, %eax
	movl	%eax, counter2(%rip)
	addq	$12, -24(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movl	counter3(%rip), %eax
	vmovd	%edx, %xmm2
	vmovd	%eax, %xmm3
	vaddss	%xmm3, %xmm2, %xmm1
	vmovd	%xmm1, %eax
	movl	%eax, counter3(%rip)
	addq	$12, -32(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movl	counter4(%rip), %eax
	vmovd	%edx, %xmm5
	vmovd	%eax, %xmm6
	vaddss	%xmm6, %xmm5, %xmm4
	vmovd	%xmm4, %eax
	movl	%eax, counter4(%rip)
	addq	$12, -40(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %edx
	movl	counter5(%rip), %eax
	vmovd	%edx, %xmm0
	vmovd	%eax, %xmm1
	vaddss	%xmm1, %xmm0, %xmm7
	vmovd	%xmm7, %eax
	movl	%eax, counter5(%rip)
	addq	$12, -48(%rbp)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	counter0(%rip), %eax
	vmovd	%edx, %xmm3
	vmovd	%eax, %xmm4
	vaddss	%xmm4, %xmm3, %xmm2
	vmovd	%xmm2, %eax
	movl	%eax, counter0(%rip)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	counter1(%rip), %eax
	vmovd	%edx, %xmm6
	vmovd	%eax, %xmm7
	vaddss	%xmm7, %xmm6, %xmm5
	vmovd	%xmm5, %eax
	movl	%eax, counter1(%rip)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	counter2(%rip), %eax
	vmovd	%edx, %xmm1
	vmovd	%eax, %xmm2
	vaddss	%xmm2, %xmm1, %xmm0
	vmovd	%xmm0, %eax
	movl	%eax, counter2(%rip)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	counter3(%rip), %eax
	vmovd	%edx, %xmm4
	vmovd	%eax, %xmm5
	vaddss	%xmm5, %xmm4, %xmm3
	vmovd	%xmm3, %eax
	movl	%eax, counter3(%rip)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	counter4(%rip), %eax
	vmovd	%edx, %xmm7
	vmovd	%eax, %xmm0
	vaddss	%xmm0, %xmm7, %xmm6
	vmovd	%xmm6, %eax
	movl	%eax, counter4(%rip)
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	counter5(%rip), %eax
	vmovd	%edx, %xmm2
	vmovd	%eax, %xmm3
	vaddss	%xmm3, %xmm2, %xmm1
	vmovd	%xmm1, %eax
	movl	%eax, counter5(%rip)
	movl	vol(%rip), %eax
	movl	%eax, -56(%rbp)
	movl	vol(%rip), %eax
	movl	%eax, -60(%rbp)
	movl	vol(%rip), %eax
	movl	%eax, -64(%rbp)
	movl	vol(%rip), %eax
	movl	%eax, -68(%rbp)
	movl	vol(%rip), %eax
	movl	%eax, -72(%rbp)
	movl	$0, -52(%rbp)
	jmp	L40
L41:
	movl	vol(%rip), %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, vol(%rip)
	movl	vol(%rip), %edx
	movl	-60(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, vol(%rip)
	movl	vol(%rip), %edx
	movl	-64(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, vol(%rip)
	movl	vol(%rip), %edx
	movl	-68(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, vol(%rip)
	movl	vol(%rip), %edx
	movl	-72(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, vol(%rip)
	addl	$1, -52(%rbp)
L40:
	cmpl	$9, -52(%rbp)
	jle	L41
	movl	stop(%rip), %eax
	testl	%eax, %eax
	je	L42
	popq	%rbp
	ret
.globl _start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	LC0(%rip), %eax
	movl	%eax, array0+4(%rip)
	movl	LC1(%rip), %eax
	movl	%eax, array0+20(%rip)
	movl	LC0(%rip), %eax
	movl	%eax, array1+4(%rip)
	movl	LC1(%rip), %eax
	movl	%eax, array1+20(%rip)
	movl	LC0(%rip), %eax
	movl	%eax, array2+4(%rip)
	movl	LC1(%rip), %eax
	movl	%eax, array2+20(%rip)
	movl	LC0(%rip), %eax
	movl	%eax, array3+4(%rip)
	movl	LC1(%rip), %eax
	movl	%eax, array3+20(%rip)
	movl	LC0(%rip), %eax
	movl	%eax, array4+4(%rip)
	movl	LC1(%rip), %eax
	movl	%eax, array4+20(%rip)
	movl	LC0(%rip), %eax
	movl	%eax, array5+4(%rip)
	movl	LC1(%rip), %eax
	movl	%eax, array5+20(%rip)
	movl	$1, %edi
	call	foo
	movl	counter0(%rip), %eax
	vmovd	%eax, %xmm0
	vucomiss	LC2(%rip), %xmm0
	setp	%cl
	movl	$1, %edx
	vmovd	%eax, %xmm1
	vucomiss	LC2(%rip), %xmm1
	movl	%edx, %eax
	cmove	%ecx, %eax
	movzbl	%al, %eax
	orl	%eax, -4(%rbp)
	movl	counter1(%rip), %eax
	vmovd	%eax, %xmm2
	vucomiss	LC2(%rip), %xmm2
	setp	%cl
	movl	$1, %edx
	vmovd	%eax, %xmm3
	vucomiss	LC2(%rip), %xmm3
	movl	%edx, %eax
	cmove	%ecx, %eax
	movzbl	%al, %eax
	orl	%eax, -4(%rbp)
	movl	counter2(%rip), %eax
	vmovd	%eax, %xmm4
	vucomiss	LC2(%rip), %xmm4
	setp	%cl
	movl	$1, %edx
	vmovd	%eax, %xmm5
	vucomiss	LC2(%rip), %xmm5
	movl	%edx, %eax
	cmove	%ecx, %eax
	movzbl	%al, %eax
	orl	%eax, -4(%rbp)
	movl	counter3(%rip), %eax
	vmovd	%eax, %xmm6
	vucomiss	LC2(%rip), %xmm6
	setp	%cl
	movl	$1, %edx
	vmovd	%eax, %xmm7
	vucomiss	LC2(%rip), %xmm7
	movl	%edx, %eax
	cmove	%ecx, %eax
	movzbl	%al, %eax
	orl	%eax, -4(%rbp)
	movl	counter4(%rip), %eax
	vmovd	%eax, %xmm0
	vucomiss	LC2(%rip), %xmm0
	setp	%cl
	movl	$1, %edx
	vmovd	%eax, %xmm1
	vucomiss	LC2(%rip), %xmm1
	movl	%edx, %eax
	cmove	%ecx, %eax
	movzbl	%al, %eax
	orl	%eax, -4(%rbp)
	movl	counter5(%rip), %eax
	vmovd	%eax, %xmm2
	vucomiss	LC2(%rip), %xmm2
	setp	%cl
	movl	$1, %edx
	vmovd	%eax, %xmm3
	vucomiss	LC2(%rip), %xmm3
	movl	%edx, %eax
	cmove	%ecx, %eax
	movzbl	%al, %eax
	orl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	leave
	ret
LC0:
	.long	1065353216
LC1:
	.long	1073741824
LC2:
	.long	1077936128
