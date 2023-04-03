.global _start
.section .text
_start:
##INIT REGISTORS##
#Pointer to first record
  leaq people, %rbx

#Record Count
  movq numpeople, %rcx

#youngest storage
  movq $0xFFFFFFFFFFFFFFFF, %r8

### Precondition check ###
  cmpq $0, %rcx
  je finish

mainloop:
#store age field into rax
  movq AGE_OFFSET(%rbx), %rax

# Skip if r8 is older than current youngest, otherwise set r8 to current
  cmpq %r8, %rax
  jae endloop

  movq %rax, %r8
  movq %rcx, %rdi

endloop:
#Increment RBX to next record
  addq $PERSON_RECORD_SIZE, %rbx
#Continue with rcx dec
  loopq mainloop

finish:
  movq $60, %rax
  syscall

