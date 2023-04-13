.globl count_bits
.type count_bits, @function

.equ STORE_RDI, -8
.equ STORE_RBX, -16

.section .text
count_bits:
# rdi has number to count in it
  enter $16, $0
  movq %rdi, STORE_RDI(%rbp)
  movq %rdi, STORE_RBX(%rbp)

#rax: bit count
  movq $0, %rax

#local stores augmented rdi
  movq %rdi, %rbx

  shr $1, %rbx
  and $0x55555555, %rbx
  subq %rbx, %rdi

  movq %rdi, %rbx

  and $0x33333333, %rdi
  shr $2, %rbx
  and $0x33333333, %rbx

  add %rbx, %rdi

  movq %rdi, %rbx

  shr $4, %rbx
  add %rbx, %rdi
  and $0x0f0f0f0f, %rdi

  movq %rdi, %rbx

  shr $8, %rbx
  add %rbx, %rdi

  movq %rdi, %rbx

  shr $16, %rbx
  add %rbx, %rdi

  and $0x0000003F, %rdi

  movq %rdi, %rax

  movq STORE_RDI(%rbp), %rdi
  movq STORE_RBX(%rbp), %rbx

  leave
  ret

