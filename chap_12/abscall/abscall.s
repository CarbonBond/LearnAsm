.globl _start
.section .text
_start:
#Rdi holds first param
  movq $-5, %rdi
  call abs

#Returns in rax
  movq %rax, %rdi
  movq $60, %rax
  syscall
