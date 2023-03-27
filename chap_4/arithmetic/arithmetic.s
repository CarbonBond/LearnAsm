.global _start
.section .text
_start:
  movq $3, %r9
  movq %r9, %rax
  addq %r9, %rax
  mulq %r9
  movq $2, %r9
  addq %r9, %rax
  movq $4, %r9
  mulq %r9
  movq %rax, %r9
  movq %r9, %rdi

  movq $60, %rax

  syscall
