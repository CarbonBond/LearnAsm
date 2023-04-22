.globl main
.section .data
scanformat:
  .string "%499s"
outformat:
  .string "%s\n"

.section .text
.equ LOCAL_BUFFER, -8
main:
  #allocate on stack
  enter $16, $0

# Get and store memory in the local var
  movq $500, %rdi
  call malloc
  movq %rax, LOCAL_BUFFER(%rbp)

#Read data from stdin
  movq stdin, %rdi
  movq $scanformat, %rsi
  movq LOCAL_BUFFER(%rbp), %rdx
  movq $0, %rax
  call fscanf

#write to console
  movq stdout, %rdi
  movq $outformat, %rsi
  movq LOCAL_BUFFER(%rbp), %rdx
  movq $0, %rax
  call fprintf
#Free the LOCAL_BUFFER
  movq LOCAL_BUFFER(%rbp), %rdi
  call free
#remove pointer from local
  movq $0, LOCAL_BUFFER(%rbp)

#Return
  movq $0, %rax
  leave 
  ret
