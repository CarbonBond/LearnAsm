.globl _start
.section .data
value:
  .quad 4

.section .text
_start:
  movq value, %rdi
  call multifunc
  movq %rax, %rdi
  movq $60, %rax
  syscall
