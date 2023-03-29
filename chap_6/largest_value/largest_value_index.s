.globl _start

.section .data
numofnums:
  .quad 7

mynumbers: 
  .quad 5, 20, 33, 80, 52, 10, 1 

.section .text
_start:
  movq numofnums, %rcx
  movq $0, %rdx

#Using rdi to hold high value
  movq $0, %rdi

#Check for no numbers
  cmp $0, %rcx
  je endloop

myloop:
  movq mynumbers-8(,%rbx,8), %rax

#Is rdi bigger than rax?
  cmp %rdi, %rax
  jbe loopcontrol

  movq %rax, %rdi

loopcontrol:
  incq %rbx

  loopq myloop

endloop:
  movq $60, %rax
  syscall



