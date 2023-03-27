.global _start
.section .text

_start:
  #rcx how many loops 
  movq $1250000000, %rcx
mainloop:

  loopq mainloop

complete:
  mov $60, %rax
  syscall
  
