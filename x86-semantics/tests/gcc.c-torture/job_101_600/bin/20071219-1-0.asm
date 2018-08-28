    .text
    .globl	strchr
strchr:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movl	%esi, -12(%rbp)
    nop
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movl	-12(%rbp), %edx
    cmpb	%dl, %al
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
    .globl	strlen
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
    .globl	strcpy
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
    .globl	memcmp
memcmp:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movq	%rsi, -32(%rbp)
    movq	%rdx, -40(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, -16(%rbp)
    movq	-32(%rbp), %rax
    movq	%rax, -8(%rbp)
    jmp	L15
L18:
    movq	-16(%rbp), %rax
    movzbl	(%rax), %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    cmpb	%al, %dl
    je	L16
    movq	-16(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %eax
    subl	%eax, %edx
    movl	%edx, %eax
    jmp	L17
L16:
    addq	$1, -16(%rbp)
    addq	$1, -8(%rbp)
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
    .globl	exit
exit:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movq $-1, %rax
    jmp %rax
    
    nop
    popq	%rbp
    ret
    .globl	abort
abort:
    pushq	%rbp
    movq	%rsp, %rbp
    movq $-1, %rax
    jmp %rax
    
    nop
    popq	%rbp
    ret
    .globl	memset
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
    .globl	memcpy
memcpy:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movq	%rsi, -32(%rbp)
    movq	%rdx, -40(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, -16(%rbp)
    movq	-32(%rbp), %rax
    movq	%rax, -8(%rbp)
    jmp	L26
L27:
    movq	-16(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -16(%rbp)
    movq	-8(%rbp), %rdx
    leaq	1(%rdx), %rcx
    movq	%rcx, -8(%rbp)
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
    .globl	malloc
malloc:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movl	$1000, %eax
    popq	%rbp
    ret
    .globl	calloc
calloc:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movq	%rsi, -16(%rbp)
    movl	$1000, %eax
    popq	%rbp
    ret
    .globl	free
free:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    nop
    popq	%rbp
    ret
    .globl	isprint
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
    .comm	p,8,8
    .globl	foo
foo:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$32, %rsp
    movq	%rdi, -24(%rbp)
    movl	%esi, -28(%rbp)
    movl	$0, -4(%rbp)
    jmp	L40
L43:
    movq	-24(%rbp), %rdx
    movl	-4(%rbp), %eax
    cltq
    movzbl	(%rdx,%rax), %eax
    testb	%al, %al
    je	L41
    call	abort
L41:
    cmpl	$0, -28(%rbp)
    je	L42
    movl	-28(%rbp), %eax
    movl	%eax, %ecx
    movq	-24(%rbp), %rdx
    movl	-4(%rbp), %eax
    cltq
    movb	%cl, (%rdx,%rax)
L42:
    addl	$1, -4(%rbp)
L40:
    movl	-4(%rbp), %eax
    cmpl	$24, %eax
    jbe	L43
    movq	-24(%rbp), %rax
    movq	%rax, $p(%rip)
    nop
    leave
    ret
    .globl	test1
test1:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$80, %rsp
    movq	$40, %rax
    movq	%rax, -8(%rbp)
    xorl	%eax, %eax
    leaq	-80(%rbp), %rax
    movl	$25, %edx
    movl	$0, %esi
    movq	%rax, %rdi
    call	memset
    leaq	-80(%rbp), %rax
    movl	$0, %esi
    movq	%rax, %rdi
    call	foo
    movq	-80(%rbp), %rax
    movq	%rax, -48(%rbp)
    movq	-72(%rbp), %rax
    movq	%rax, -40(%rbp)
    movq	-64(%rbp), %rax
    movq	%rax, -32(%rbp)
    movzbl	-56(%rbp), %eax
    movb	%al, -24(%rbp)
    leaq	-48(%rbp), %rax
    movl	$1, %esi
    movq	%rax, %rdi
    call	foo
    movq	-80(%rbp), %rax
    movq	%rax, -48(%rbp)
    movq	-72(%rbp), %rax
    movq	%rax, -40(%rbp)
    movq	-64(%rbp), %rax
    movq	%rax, -32(%rbp)
    movzbl	-56(%rbp), %eax
    movb	%al, -24(%rbp)
    leaq	-48(%rbp), %rax
    movl	$0, %esi
    movq	%rax, %rdi
    call	foo
    nop
    movq	-8(%rbp), %rax
    xorq	$40, %rax
    je	L45
    call	__stack_chk_fail
L45:
    leave
    ret
    .globl	test2
test2:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$80, %rsp
    movq	$40, %rax
    movq	%rax, -8(%rbp)
    xorl	%eax, %eax
    leaq	-80(%rbp), %rax
    movl	$25, %edx
    movl	$0, %esi
    movq	%rax, %rdi
    call	memset
    leaq	-80(%rbp), %rax
    movl	$0, %esi
    movq	%rax, %rdi
    call	foo
    movq	-80(%rbp), %rax
    movq	%rax, -48(%rbp)
    movq	-72(%rbp), %rax
    movq	%rax, -40(%rbp)
    movq	-64(%rbp), %rax
    movq	%rax, -32(%rbp)
    movzbl	-56(%rbp), %eax
    movb	%al, -24(%rbp)
    leaq	-48(%rbp), %rax
    movl	$1, %esi
    movq	%rax, %rdi
    call	foo
    movq	-80(%rbp), %rax
    movq	%rax, -48(%rbp)
    movq	-72(%rbp), %rax
    movq	%rax, -40(%rbp)
    movq	-64(%rbp), %rax
    movq	%rax, -32(%rbp)
    movzbl	-56(%rbp), %eax
    movb	%al, -24(%rbp)
    movq $p(%rip), %rax
    movq	(%rax), %rdx
    movq	%rdx, -48(%rbp)
    movq	8(%rax), %rdx
    movq	%rdx, -40(%rbp)
    movq	16(%rax), %rdx
    movq	%rdx, -32(%rbp)
    movzbl	24(%rax), %eax
    movb	%al, -24(%rbp)
    leaq	-48(%rbp), %rax
    movl	$0, %esi
    movq	%rax, %rdi
    call	foo
    nop
    movq	-8(%rbp), %rax
    xorq	$40, %rax
    je	L47
    call	__stack_chk_fail
L47:
    leave
    ret
    .globl	test3
test3:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$80, %rsp
    movq	$40, %rax
    movq	%rax, -8(%rbp)
    xorl	%eax, %eax
    leaq	-80(%rbp), %rax
    movl	$25, %edx
    movl	$0, %esi
    movq	%rax, %rdi
    call	memset
    leaq	-80(%rbp), %rax
    movl	$0, %esi
    movq	%rax, %rdi
    call	foo
    movq	-80(%rbp), %rax
    movq	%rax, -48(%rbp)
    movq	-72(%rbp), %rax
    movq	%rax, -40(%rbp)
    movq	-64(%rbp), %rax
    movq	%rax, -32(%rbp)
    movzbl	-56(%rbp), %eax
    movb	%al, -24(%rbp)
    leaq	-48(%rbp), %rax
    movl	$1, %esi
    movq	%rax, %rdi
    call	foo
    movq $p(%rip), %rax
    movq	-80(%rbp), %rdx
    movq	%rdx, (%rax)
    movq	-72(%rbp), %rdx
    movq	%rdx, 8(%rax)
    movq	-64(%rbp), %rdx
    movq	%rdx, 16(%rax)
    movzbl	-56(%rbp), %edx
    movb	%dl, 24(%rax)
    movq $p(%rip), %rax
    movq	-48(%rbp), %rdx
    movq	%rdx, (%rax)
    movq	-40(%rbp), %rdx
    movq	%rdx, 8(%rax)
    movq	-32(%rbp), %rdx
    movq	%rdx, 16(%rax)
    movzbl	-24(%rbp), %edx
    movb	%dl, 24(%rax)
    leaq	-48(%rbp), %rax
    movl	$0, %esi
    movq	%rax, %rdi
    call	foo
    nop
    movq	-8(%rbp), %rax
    xorq	$40, %rax
    je	L49
    call	__stack_chk_fail
L49:
    leave
    ret
    .globl	main
.globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    call	test1
    call	test2
    call	test3
    movl	$0, %eax
    popq	%rbp
    ret
