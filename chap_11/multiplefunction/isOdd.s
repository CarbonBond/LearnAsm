.globl isOdd
.type isOdd, @function

.section .text
isOdd:
  movq $0b1, %rax
  and %rdi, %rax
  ret
