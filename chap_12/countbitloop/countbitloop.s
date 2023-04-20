.globl main
.section .data
promptformat:
  .ascii "Enter a number followed by a 1 to exit, 0 to continue, then press return.\n\0"

scanformat:
  .ascii "%d %d\0"

resultformat:
  .ascii "The result is %d. \n\0"

.section .text
.equ LOCAL_NUMBER, -8
.equ EXIT_NUMBER, -16

main:
  #Two local values
  enter $16, $0

mainloop:
#Prompt
  movq stdout, %rdi
  movq $promptformat, %rsi
  movq $0, %rax
  call fprintf

#Request input from user
  movq stdin, %rdi
  movq $scanformat, %rsi
  leaq LOCAL_NUMBER(%rbp), %rdx
  leaq EXIT_NUMBER(%rbp), %rcx
  movq $0, %rax
  call fscanf

  movq LOCAL_NUMBER(%rbp), %rdi
  call count_bits 

  movq stdout, %rdi
  movq $resultformat, %rsi
  movq %rax, %rdx
  movq $0, %rax
  call fprintf
  
  cmpq $0, EXIT_NUMBER(%rbp)
  je mainloop

  leave

  movq $0, %rax
  ret
