.global _start
.section .text

_start:
  #%rbx holds the base
  movq $5, %rbx

  #rcx holds the exponent count
  movq $5, %rcx

  #rax holds accumulated value
  movq $1, %rax

mainloop:
  addq $0, %rcx

  jz complete

  mulq %rbx

  decq %rcx

  jmp mainloop

complete:
  mov %rax, %rdi
  mov $60, %rax
  syscall
  
