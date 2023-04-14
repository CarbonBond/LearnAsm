.globl main
.section .text
main:
#Rdi holds first param
  movq $-5, %rdi
  call abs
return:

#Returns in rax
  movq %rax, %rdi
  movq $60, %rax
  syscall
