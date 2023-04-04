.globl _start
.section .data
mytext:
  .ascii "This is a string of characters. Here Are Some More UPPERCASE ChaRaCters\0"
# 17 uppercase characters

.section .text
_stringstart:
    #Initialize
#Point to string
  movq $mytext, %rbx

# Set count to 0
  movq $0, %rdi

mainloop:
  movb (%rbx), %al
#if byte is 
  # Null
  cmpb $0, %al
  je finish
#else
  incq %rdi

loopcontrol:
  incq %rbx
  jmp mainloop

finish:
  movq $60, %rax
  syscall
