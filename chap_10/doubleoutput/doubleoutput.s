.globl _start

.section .data
text:
  .ascii "Hello User!\n"
textend:
texttwo:
  .ascii "How are you?\n"
texttwoend:

.equ text_length, textend - text
.equ texttwo_length, texttwoend - texttwo

.section .text
_start:
#Syscall 1: Write to output. 
#  rdi: File descripter
#  rsi: Pointer to data, 
#  rdx: Size of data
  movq $1, %rax
  movq $1, %rdi #Std Out
  movq $text, %rsi
  movq $text_length, %rdx
  syscall

  movq $1, %rax
  movq $texttwo, %rsi
  movq $texttwo_length, %rdx
  syscall

finish:
  movq $0x3c, %rax
  movq $0, %rdi
  syscall

