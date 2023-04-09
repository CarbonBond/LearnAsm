.section .data
array:
  .quad 1, 2, 3, 4, 5, 63, 7, 8, 9
arraysize:
  .quad 9
searchnum:
  .quad 63

.globl _start
.section .text
_start:
#Move pointer to array into rdi
  movq $array, %rdi

#Move number to search for in rax
  movq searchnum, %rax

#Make sure we can look through all array
  movq arraysize, %rcx

#Scan array
  repne scasq

#Difference in max and rcx is the index
  movq arraysize, %rdi
  subq %rcx, %rdi
  decq %rdi

finish:
  movq $60, %rax
  syscall
