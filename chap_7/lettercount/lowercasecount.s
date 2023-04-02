.globl _start
.section .data
mytext:
  .ascii "This is a string of characters.\0"

.section .text
  _start:
    #Initialize
#Point to string
  movq $mytext, %rbx

# Set count to 0
  movq $0, %rdi

mainloop:
  movb (%rbx), %al
# if byte is 
  # Null
  cmpb $0, %al
  je finish

# bigger than 97 aka 'a'
  cmpb $'a', %al
  jb loopcontrol

# Less than 125 aka 'z'
  cmpb $'z', %al
  ja loopcontrol

# Lowercase!
  incq %rdi

loopcontrol:
  incq %rbx
  jmp mainloop

finish:
  movq $60, %rax
  syscall
