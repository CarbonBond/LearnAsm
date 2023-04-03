.global _start
.section .text
_start:
##INIT REGISTORS##
#Pointer to first record
  leaq people, %rbx

#Record Count
  movq numpeople, %rcx

#youngest storage
  movq $0xFFFFFFFFFFFFFFFF, %rdi

### Precondition check ###
  cmpq $0, %rcx
  je finish

mainloop:
#store age field into rax
  movq AGE_OFFSET(%rbx), %rax

# Skip if rdi is larger than current youngest, otherwise set rdi to current
  cmpq %rdi, %rax
  jae endloop

  movq %rax, %rdi

endloop:
#Increment RBX to next record
  addq $PERSON_RECORD_SIZE, %rbx
#Continue with rcx dec
  loopq mainloop

finish:
  movq $60, %rax
  syscall

