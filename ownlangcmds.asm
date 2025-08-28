section .data ; variables
    msg: db ". ", 0
    done: db "Done!", 10, 0
    newline: db 10
    counter: db 0 ; like 'int i = 0' in C/C++
section .text
    global _start

printnl: ; function
    mov rax, 1
    mov rdi, 1
    lea rsi, newline
    mov rdx, 1
    syscall
    ret

_start: ; where program starts
    jmp while_loop

while_loop: 
    cmp BYTE [counter], 5
    je new_line
    inc BYTE [counter]
    mov rax, 1
    mov rdi, 1
    lea rsi, msg 
    mov rdx, 2
    syscall
    jmp while_loop

new_line:
    call printnl
    jmp for_loop

adder: 
    add BYTE [counter], 1 
    mov rax, 1
    mov rdi, 1
    lea rsi, msg 
    mov rdx, 2
    syscall

    jmp for_loop

for_loop:
    cmp BYTE [counter], 10
    jl adder
    jmp if

if:
    call printnl
    mov rax, 1
    mov rdi, 1
    lea rsi, done 
    mov rdx, 6
    syscall

    cmp BYTE [counter], 0 ; just example
    je exit
    jmp else

else:
    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

; This code written in C++ and describes all assembly above
; #include <iostream>
; int main() {
;     int i = 0;
;     while (i != 5) {
;	  ++i;
;         printf(". ");
;     }
;     printf("\n");
;     for (; i < 10; ++i) {
;         printf(". ");
;     }
;     printf("\n");
;     printf("Done!\n");
;     if (i == 0) {
;         return 0;
;     }
;     else {
;         return 0;
;     }
;
; }
