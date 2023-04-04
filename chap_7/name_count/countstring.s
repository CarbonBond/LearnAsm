.globl _stringstart
.section .data
.section .text
_stringstart:
#Initialize
 #string ptr should be in r11  at this point
# Set count to 0
  movq $0, %r10
stringcountloop:
  movb (%r11), %al
#if byte is 
  # Null
  cmpb $0, %al
  je stringfinish
# less than 'A' continue
  cmpb $'A', %al
  jb stringloopcontrol
# greator than 'z' continue
  cmpb $'z', %al
  ja stringloopcontrol
#else
  incq %r10

stringloopcontrol:
  incq %r11
  jmp stringcountloop

stringfinish:
  jmp compare
