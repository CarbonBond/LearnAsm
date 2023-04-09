.globl _start

.section .data
curtime:
  .quad 0
waittime:
  .quad 5
.section .text
_start:
#Get Current time 
  movq $0xc9, %rax
  movq $curtime, %rdi
  syscall

#Stored in rdx
  movq curtime, %rdx

#Wait waittime seconds
  addq waittime, %rdx

timeloop:
#Get current time
  movq $0xc9, %rax
  movq $curtime, %rdi
  syscall

#cmp
  cmp %rdx, curtime
  jb timeloop

finish:
  movq $0x3c, %rax
  movq $0, %rdi
  syscall

  
