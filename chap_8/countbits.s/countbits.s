.globl _start
.section .text
_start:
#rdi: bit count
  movq $0, %rdi

#$rdx holds number 
  movq $0b1010110101101011110111001, %rdx

mainloop:
  movq $1, %rax
  and %rdx, %rax

  cmpq $1, %rax
  jne loopcontrol
  inc %rdi

loopcontrol:
  shr $1, %rdx
  cmpq $0, %rdx
  je finish
  jmp mainloop

finish:
  movq $60, %rax
  syscall
