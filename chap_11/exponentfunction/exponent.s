.globl exponent
.type exponent, @function

.section .text
exponent:
#rdi: Base, rsi: exponent

# one 8 byte local variable -8(%rbp) 
  enter $16, $0

  movq $1, %rax

  movq %rsi, -8(%rbp)

mainloop:
  mulq %rdi
  decq -8(%rbp)
  jnz mainloop

complete:
  leave
  ret
