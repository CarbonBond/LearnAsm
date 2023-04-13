.globl _start
.section .data
text:
  .ascii "Print me!\n"
textend:

.equ text_length, textend - text

.section .text
_start:
#Call printline rsi: string pointer, rdx: Size of str
  movq $text, %rsi
  movq $text_length, %rdx
  call printline
  movq $60, %rax
  movq $0, %rdi
  syscall


