.global _start
.section .text
_start:
##INIT REGISTORS##
#Pointer to first record
  leaq people, %rbx

#Record Count
  movq numpeople, %rcx

#tallest storage
  movq $0, %rdi

### Precondition check ###
  cmpq $0, %rcx
  je finish

mainloop:
#store height feild into rax
  movq HEIGHT_OFFSET(%rbx), %rax

# Skip if rdi is larger than current tallest, otherwise set rdi to current
  cmpq %rdi, %rax
  jbe endloop

  movq %rax, %rdi

endloop:
#Increment RBX to next record
  addq $PERSON_RECORD_SIZE, %rbx
#Continue with rcx dec
  loopq mainloop

finish:
  movq $60, %rax
  syscall

