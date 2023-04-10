.globl _start

.section .data
text:
  .ascii "Loop loopcount times\n"
textend:
.equ text_length, textend - text

loopcount:
  .quad 10

.section .text
_start:
#loop loopcount times
  movq loopcount, %r8
main:
#Syscall 1: Write to output. 
#  rdi: File descripter
#  rsi: Pointer to data, 
#  rdx: Size of data
  movq $1, %rax
  movq $1, %rdi #Std Out
  movq $text, %rsi
  movq $text_length, %rdx
  syscall

  dec %r8
  cmpq $0, %r8
  jne main

finish:
  movq $0x3c, %rax
  movq $0, %rdi
  syscall

