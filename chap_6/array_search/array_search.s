.globl _start

.section .data
searchnum:
  .quad 7
numofnums:
  .quad 7
mynumbers: 
  .quad 5, 20, 33, 80, 52, 10, 1 

.section .text
_start:
  movq numofnums, %rcx
#Set return to false in general
  movq $0, %rdi

#Less memory searchs by loading number into regsiter
  movq searchnum, %rdx

#Make sure the amount of numbers in array isn't 0
  cmp $0, %rcx
  je endloop

myloop:
#Load rax with current number
  movq mynumbers-8(,%rcx,8), %rax

#Is rdx equal to rax?
  cmp %rdx, %rax
  je equals 

loopcontrol:
#Loop until no numbers remain
  loopq myloop
  jmp endloop

equals:  
  movq $1, %rdi
  jmp endloop

endloop:
  movq $60, %rax
  syscall

