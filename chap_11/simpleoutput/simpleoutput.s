.globl printline
.type printline, @function

.section .text
printline:
#Syscall 1: Write to output. 
#  rdi: File descripter
#  rsi: Pointer to data, 
#  rdx: Size of data
  movq $1, %rax
  movq $1, %rdi #Std Out
  syscall
  ret

