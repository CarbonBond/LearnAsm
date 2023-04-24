.globl squareme
.sectino .text
squareme:
  movq %rdi, %rax
  imulq %rdi
  ret

