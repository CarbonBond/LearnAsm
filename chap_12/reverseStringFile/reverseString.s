.globl main

.section .data
inputfile:
  .ascii "string.txt\0"
outputfile:
  .ascii "r.txt\0"
readmode:
  .ascii "r\0"
writemode:
  .ascii "w\0"
formatstring:
  .ascii "%c"

.equ CHAR_LOCATION, -8
.equ EXIT_LOCATION, -16

.section .text
main:
#Open file for reading
  movq $inputfile, %rdi
  movq $readmode, %rsi
  call fopen

#Save the file pointer to r14
  movq %rax, %r14

#Open file for writing
  movq $outputfile, %rdi
  movq $writemode, %rsi
  call fopen

#Save the file pointer to r15
  movq %rax, %r15

#Local var to check for exit
  enter $16, $0
  movq $-1, EXIT_LOCATION(%rbp)

readloop:
#read the first char
  movq %r14, %rdi
  movq $0, %rax
  call fgetc

# did we reach EOF
  cmpl $-1, %eax
  je writeloop
  
  enter $16, $0
  movq %rax, CHAR_LOCATION(%rbp)

  jmp readloop

writeloop:
#Write the second string
  movq %r15, %rdi
  movq $formatstring, %rsi
  movq CHAR_LOCATION(%rbp), %rdx
  movq $0, %rax
  call fprintf
  leave

  cmpq $-1, EXIT_LOCATION(%rbp)
  je finish
  jmp writeloop

finish:
#close files
  movq %r14, %rdi
  call fclose
  movq %r15, %rdi
  call fclose

  movq $0, %rax
  leave
  ret
