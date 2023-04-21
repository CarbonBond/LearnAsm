.globl main
.type sallyage, @object
.type joshfavoritefirst, @object
.type josotfavoritesecond, @object

.section .data
filename:
  .ascii "myfile.txt\0"
openmode:
  .ascii "w\0"
formatstring1:
  .ascii "The age of %s is %d.\n\0"
sallyname:
  .ascii "Sally\0"
sallyage:
  .quad 53
formatstring2:
  .ascii "%d and %d are %s's favorite numbers.\n\0"
joshname:
  .ascii "Josh\0"
joshfavoritefirst:
  .quad 7
josotfavoritesecond:
  .quad 13

.section .text
main:
  enter $16, $0

#Open file for writing
  movq $filename, %rdi
  movq $openmode, %rsi
  call fopen

#Save the file pointer to local variable
  movq %rax, -8(%rbp)

#Write the first string
  movq -8(%rbp), %rdi
  movq $formatstring1, %rsi
  movq $sallyname, %rdx
  movq sallyage, %rcx
  movq $0, %rax
  call fprintf

#Write the second string
  movq -8(%rbp), %rdi
  movq $formatstring2, %rsi
  movq joshfavoritefirst, %rdx
  movq josotfavoritesecond, %rcx
  movq $joshname, %r8
  movq $0, %rax
  call fprintf

#close file
  movq -8(%rbp), %rdi
  call fclose

  movq $0, %rax
  leave
  ret
