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
    .globl	msum_i4
msum_i4:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$144, %rsp
    movq	%rdi, -120(%rbp)
    movq	%rsi, -128(%rbp)
    movq	%rdx, -136(%rbp)
    movq	$40, %rax
    movq	%rax, -8(%rbp)
    xorl	%eax, %eax
    movq	-136(%rbp), %rax
    movl	(%rax), %eax
    subl	$1, %eax
    movl	%eax, -104(%rbp)
    movq	-128(%rbp), %rcx
    movl	-104(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$2, %rax
    addq	%rcx, %rax
    addq	$20, %rax
    movl	(%rax), %eax
    leal	1(%rax), %esi
    movq	-128(%rbp), %rcx
    movl	-104(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$2, %rax
    addq	%rcx, %rax
    addq	$16, %rax
    movl	(%rax), %eax
    subl	%eax, %esi
    movl	%esi, %eax
    movl	%eax, -100(%rbp)
    movl	$0, -112(%rbp)
    jmp	L40
L41:
    movq	-128(%rbp), %rcx
    movl	-112(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$2, %rax
    addq	%rcx, %rax
    addq	$20, %rax
    movl	(%rax), %eax
    leal	1(%rax), %esi
    movq	-128(%rbp), %rcx
    movl	-112(%rbp), %eax
    movslq	%eax, %rdx
    movq	%rdx, %rax
    addq	%rax, %rax
    addq	%rdx, %rax
    salq	$2, %rax
    addq	%rcx, %rax
    addq	$16, %rax
    movl	(%rax), %eax
    subl	%eax, %esi
    movl	%esi, %edx
    movl	-112(%rbp), %eax
    cltq
    movl	%edx, -48(%rbp,%rax,4)
    movl	-112(%rbp), %eax
    cltq
    movl	$0, -80(%rbp,%rax,4)
    addl	$1, -112(%rbp)
L40:
    movl	-112(%rbp), %eax
    cmpl	-104(%rbp), %eax
    jl	L41
    movq	-120(%rbp), %rax
    movq	(%rax), %rax
    movq	%rax, -96(%rbp)
    movq	-128(%rbp), %rax
    movq	(%rax), %rax
    movq	%rax, -88(%rbp)
L44:
    movl	$0, -108(%rbp)
    movl	$0, -112(%rbp)
    jmp	L42
L43:
    movq	-88(%rbp), %rax
    movl	(%rax), %eax
    addl	%eax, -108(%rbp)
    addl	$1, -112(%rbp)
    addq	$4, -88(%rbp)
L42:
    movl	-112(%rbp), %eax
    cmpl	-100(%rbp), %eax
    jl	L43
    movq	-96(%rbp), %rax
    movl	-108(%rbp), %edx
    movl	%edx, (%rax)
    movl	-80(%rbp), %eax
    addl	$1, %eax
    movl	%eax, -80(%rbp)
    addq	$4, -96(%rbp)
    movl	-80(%rbp), %edx
    movl	-48(%rbp), %eax
    cmpl	%eax, %edx
    jne	L44
    nop
    movq	-8(%rbp), %rax
    xorq	$40, %rax
    je	L45
    call	__stack_chk_fail
L45:
    leave
    ret
    .globl	main
.globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$288, %rsp
    movq	$40, %rax
    movq	%rax, -8(%rbp)
    xorl	%eax, %eax
    leaq	-208(%rbp), %rdx
    movl	$0, %eax
    movl	$12, %ecx
    movq	%rdx, %rdi
    rep stosq
    leaq	-272(%rbp), %rax
    movq	%rax, -208(%rbp)
    movl	$265, -200(%rbp)
    movl	$1, -196(%rbp)
    movl	$1, -192(%rbp)
    movl	$3, -188(%rbp)
    leaq	-112(%rbp), %rdx
    movl	$0, %eax
    movl	$12, %ecx
    movq	%rdx, %rdi
    rep stosq
    leaq	-256(%rbp), %rax
    movq	%rax, -112(%rbp)
    movl	$266, -104(%rbp)
    movl	$1, -100(%rbp)
    movl	$1, -96(%rbp)
    movl	$3, -92(%rbp)
    movl	$3, -88(%rbp)
    movl	$1, -84(%rbp)
    movl	$3, -80(%rbp)
    movl	$2, -276(%rbp)
    leaq	-276(%rbp), %rdx
    leaq	-112(%rbp), %rcx
    leaq	-208(%rbp), %rax
    movq	%rcx, %rsi
    movq	%rax, %rdi
    call	msum_i4
    movl	$0, %eax
    movq	-8(%rbp), %rsi
    xorq	$40, %rsi
    je	L48
    call	__stack_chk_fail
L48:
    leave
    ret
