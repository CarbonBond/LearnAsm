.globl multifunc
.type multifunc, @function

.section .text
multifunc:
#Num is in rdi
  call isOdd
# 1 is odd, 0 is even
  cmp $1, %rax
  jmp odd

even:
  call factorial
  ret
odd:
  movq $3, %rsi
  call exponent
  ret
