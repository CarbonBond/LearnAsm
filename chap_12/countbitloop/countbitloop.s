.globl main
.section .data
promptformat:
  .string "Enter a number, then press return.\n"
exitformat:
  .string "Do you want to exit? [y]/n\n"

scanformat:
  .string "%d"
charformat:
  .string "%c"

resultformat:
  .string "The result is %d. \n"

.section .text
.equ LOCAL_NUMBER, -8
.equ EXIT_NUMBER, -16

main:
  #Two local values
  enter $16, $0

mainloop:
#Move default exit into EXIT EXIT_NUMBER
  movq $'y', EXIT_NUMBER(%rbp)
#Prompt
  movq stdout, %rdi
  movq $promptformat, %rsi
  movq $0, %rax
  call fprintf

#Request input from user
  movq stdin, %rdi
  movq $scanformat, %rsi
  leaq LOCAL_NUMBER(%rbp), %rdx
  movq $0, %rax
  call fscanf

  movq LOCAL_NUMBER(%rbp), %rdi
  call count_bits 

  movq stdout, %rdi
  movq $resultformat, %rsi
  movq %rax, %rdx
  movq $0, %rax
  call fprintf

#Prompt Exit
  movq stdout, %rdi
  movq $exitformat, %rsi
  movq $0, %rax
  call fprintf

#Request input from user
  movq stdin, %rdi
  movq $charformat, %rsi
  leaq EXIT_NUMBER(%rbp), %rdx
  movq $0, %rax
  call fscanf
  
  cmpq $'y', EXIT_NUMBER(%rbp)
  jne mainloop

  leave

  movq $0, %rax
  ret
