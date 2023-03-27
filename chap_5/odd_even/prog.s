.globl _start
.section .text

_start:
# Number to be tested
  movq $6, %rax

  movq $0, %rdx
  movq $2, %rbx

  divq %rbx

  xor $1, %rdx
  mov %rdx, %rdi
  mov $60, %rax

  syscall

