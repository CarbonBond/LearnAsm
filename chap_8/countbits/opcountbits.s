.globl _start
.section .text
_start:
#rdi: bit count
  movq $0, %rdi

#$rdx holds number 
  movq $0b1010110101101011110111001, %rdx

#rbx stores augmented rdx
  movq %rdx, %rbx

  shr $1, %rbx
  and $0x55555555, %rbx
  subq %rbx, %rdx

  movq %rdx, %rbx

  and $0x33333333, %rdx
  shr $2, %rbx
  and $0x33333333, %rbx

  add %rbx, %rdx

  movq %rdx, %rbx

  shr $4, %rbx
  add %rbx, %rdx
  and $0x0f0f0f0f, %rdx

  movq %rdx, %rbx

  shr $8, %rbx
  add %rbx, %rdx

  movq %rdx, %rbx

  shr $16, %rbx
  add %rbx, %rdx

  and $0x0000003F, %rdx

  movq %rdx, %rdi

finish:
  movq $60, %rax
  syscall
