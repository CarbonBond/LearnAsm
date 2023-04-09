.section .data
person_one:
  .quad 0b111
person_two:
  .quad 0b101
person_three:
  .quad 0b011

.equ KNOWS_ALGE, 0b1
.equ KNOWS_CALC, 0b10
.equ KNOWS_DISC, 0b100

.globl _start
.section .text
_start:
#Number in common
  movq $0b111, %rdi

  andq person_one, %rdi 
  andq person_two, %rdi 
  andq person_three, %rdi 

finish:
  movq $60, %rax
  syscall
