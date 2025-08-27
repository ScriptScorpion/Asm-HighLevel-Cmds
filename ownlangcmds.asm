section .data ; constants
    msg: db ". ", 0
    secret: db "Done!", 0
    newline: db 10

section .bss ; values in this section can be changed

section .text
    global _start

printnl: ; function
    mov rax, 1
    mov rdi, 1
    lea rsi, newline
    mov rdx, 1
    syscall
    ret

_start:
    mov r8, 0
    jmp while_loop

while_loop: ; for loop is same but instead of doing je, doing jl
    cmp r8, 5
    je if
    inc r8
    mov rax, 1
    mov rdi, 1
    lea rsi, msg 
    mov rdx, 2
    syscall
    jmp while_loop

if:
    call printnl
    call printnl

    cmp r8, 0
    je exit
    jmp else

else:
    mov rax, 1
    mov rdi, 1
    lea rsi, secret
    mov rdx, 18
    syscall
    jmp exit
exit:
    mov rax, 60
    xor rdi, rdi
    syscall
