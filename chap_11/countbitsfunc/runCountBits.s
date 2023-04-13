.globl _start
.section .text
_start:
  movq $0b110110101101011, %rdi
  call count_bits
  movq %rax, %rdi
  movq $60, %rax
  syscall
