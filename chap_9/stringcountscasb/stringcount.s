.section .data
string:
  .ascii "This is a string.\0"
.globl _start
.section .text
_start:
#Set rcx to max for max string size 
  movq $-1, %rcx

#Set pointer to string 
  movq $string, %rdi
  movb $0, %al #Set al to null
  repne scasb # Repeat until null byte

#rdi advaced one past null byte from scasb
#Get difference from string and rdi, then dec
  subq $string, %rdi
  decq %rdi
finish:
  movq $60, %rax
  syscall

