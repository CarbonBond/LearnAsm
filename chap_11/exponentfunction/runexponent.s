.globl _start

.section .text
_start:
#Call function with 3^2
  movq $3, %rdi
  movq $2, %rsi
  call exponent
#Returned in rax
  movq %rax, %rdi
  movq $60, %rax
  syscall
