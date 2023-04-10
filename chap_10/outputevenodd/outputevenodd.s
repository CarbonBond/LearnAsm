.globl _start

.section .data
number:
  .quad 5

odd_text:
  .ascii "Odd\n"
odd_end:

even_text:
  .ascii "Even\n"
even_end:

.equ odd_size, odd_end - odd_text 
.equ even_size, even_end - even_text 

.section .text
_start:
#Load similar syscall
  movq $1, %rax
  movq $1, %rdi

#Check odd
  movq number, %r8
  andq $0b1, %r8

  cmp  $0b0, %r8
  je   even

odd:
  movq $odd_text, %rsi
  movq $odd_size, %rdx
  jmp print

even:
  movq $even_text, %rsi
  movq $even_size, %rdx

print:
  syscall

finish:
  movq $60, %rax
  movq $0, %rdi
  syscall
