.section .data
.equ FIFTH_BIT, 0b10000

.globl _start
.section .text
_start:
  xor %rdi, %rdi #Zero out
  
  movq $0b10111, %rax
  andq $FIFTH_BIT, %rax
  shrq $4, %rax
  movq %rax, %rdi

finish:
  movq $60, %rax
  syscall
