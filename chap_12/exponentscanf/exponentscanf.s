.globl main
.section .data
promptformat:
  .ascii "Enter two numbers separated by spaces, then press return.\n\0"

scanformat:
  .ascii "%d %d\0"

resultformat:
  .ascii "The result is %d. \n\0"

.section .text
.equ LOCAL_NUMBER, -8
.equ LOCAL_EXPONENT, -16
main:
  #Two local values
  enter $16, $0

#Prompt
  movq stdout, %rdi
  movq $promptformat, %rsi
  movq $0, %rax
  call fprintf

#Request input from user
  movq stdin, %rdi
  movq $scanformat, %rsi
  leaq LOCAL_NUMBER(%rbp), %rdx
  leaq LOCAL_EXPONENT(%rbp), %rcx
  movq $0, %rax
  call fscanf

  movq LOCAL_NUMBER(%rbp), %rdi
  movq LOCAL_EXPONENT(%rbp), %rsi
  call exponent 

  movq stdout, %rdi
  movq $resultformat, %rsi
  movq %rax, %rdx
  movq $0, %rax
  call fprintf
  
  leave

  ret

