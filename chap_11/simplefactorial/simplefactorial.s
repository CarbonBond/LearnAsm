.globl _start

.section .data
value:
  .quad 5

.section .text
_start:
#sentinel value
  pushq $0

  movq value, %rax

pushvalues:
#Push all values from the current number to 1
  pushq %rax
  dec %rax
  jnz pushvalues

#Multiply Preperation
  movq $1, %rax

multiply:
#Get value from stack
  popq %rcx

#If it matches sentinel, finish
  cmpq $0, %rcx
  je complete

#Multiply what we have so far
  mulq %rcx

#Continue until we hit 0
  jmp multiply

complete:
  movq %rax, %rdi
  movq $60, %rax
  syscall

