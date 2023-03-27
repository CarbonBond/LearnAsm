.section .text
.globl _start
_start:
  movq $4294967296, %rax
  movl $16777216, %ebx
  movq $0, %rdx
  divq %rbx
  movq $0, %rbx
  movb $2, %bl
  movq $0, %rdx
  divq %rbx
  dec  %rax
  movb $127, %ah
  movq %rax, %rdi
  movq $60, %rax
  syscall
