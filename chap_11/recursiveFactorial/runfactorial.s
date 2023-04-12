.section .data
value:
  .quad 8

.globl _start
.section .text
_start:
  movq value, %rdi
  call factorial

  movq %rax, %rdi
  movq $60, %rax
  syscall
