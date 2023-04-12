.globl factorial
.type factorial, @function


#Local stack constant
.equ LOCAL_NUM, -8

.section .text
factorial:
#rdi: current number

#Store one local vaiable -8(%rbp)
  enter $16, $0
  movq %rdi, LOCAL_NUM(%rbp)
  movq $1, %rax

continue:
  cmp $1, %rdi
  je multiply

  dec %rdi
  call factorial

multiply:
  mulq LOCAL_NUM(%rbp)
  leave 
  ret
  
