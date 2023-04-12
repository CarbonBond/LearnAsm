.globl factorial
.type factorial, @function

.section .text
factorial:
#rdi: current number

#Store one local vaiable -8(%rbp)
  enter $16, $0
  movq %rdi, -8(%rbp)
  movq $1, %rax

continue:
  cmp $1, %rdi
  je multiply

  dec %rdi
  call factorial

multiply:
  mulq -8(%rbp)
  leave 
  ret
  
