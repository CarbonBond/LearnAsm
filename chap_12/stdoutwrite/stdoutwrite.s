.globl main

.section .data
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
  movq stdout, %rdi
  movq $formatstring1, %rsi
  movq $sallyname, %rdx
  movq sallyage, %rcx
  movq $0, %rax
  call fprintf

  movq stdout, %rdi
  movq $formatstring2, %rsi
  movq joshfavoritefirst, %rdx
  movq josotfavoritesecond, %rcx
  movq $joshname, %r8
  movq $0, %rax
  call fprintf

  movq $0, %rax
  ret
