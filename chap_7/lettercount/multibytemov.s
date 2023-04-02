.globl _start
.section .data
mytext:
  .ascii "This is a string of characters.\0"

.section .text
_start:
  #point to text
  movq $mytext, %rbx

  movq $0, %rdi

mainloop:
#load quadword into rax (not a byte)
  movq (%rbx), %rax
# Look at 4 words in RAX, needed to loop
  movq $4, %rcx
byte1:
# if byte is 
  # Null
  cmpb $0, %al
  je finish

# bigger than 97 aka 'a'
  cmpb $'a', %al
  jb byte2 

# Less than 125 aka 'z'
  cmpb $'z', %al
  ja byte2 

# Lowercase!
  incq %rdi

byte2:
#Same as byte1 
  cmpb $0, %al
  je finish
  cmpb $'a', %al
  jb rotword
  cmpb $'z', %al
  ja rotword
  
  incq %rdi

rotword:
#rotate two bytes to get new characters
  rorq $16, %rax
  loopq byte1

loopcontrol:
#Checked all 8 bytes in RAX, add 8 to pointer
  addq $8, %rbx
  jmp mainloop

finish:
  movq $60, %rax
  syscall
