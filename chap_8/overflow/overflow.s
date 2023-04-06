.globl _start
.section .text
_start:
  movq $9223372036854775807, %rbx
  addq $4, %rbx  
  JO overflow
  jmp finish
overflow:
  movq $1, %rdi
finish:
  movq $60, %rax
  syscall
