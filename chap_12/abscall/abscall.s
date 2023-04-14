.globl main
.section .text
main:
#Rdi holds first param
  movq $-5, %rdi
  call abs
  ret
