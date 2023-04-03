.globl _start
.section .text
_start:
#load pointer to first record
  leaq people, %rbx

  movq numpeople, %rcx

#rdi stores brown hair count
  movq $0, %rdi

#finish if there are no people
  cmpq $0, %rcx
  je finish

mainloop:
# is hair color brown aka 2
  cmpq $2, HAIR_OFFSET(%rbx)
# If its brown, its equal
  je  equalto

  cmpq $1, HAIR_OFFSET(%rbx)
# If its blond its equal 
  je  equalto

#otherwise skip equalto
  jne endloop

equalto:
  incq %rdi

endloop:
  addq $PERSON_RECORD_SIZE, %rbx
  loopq mainloop

finish:
  movq $60, %rax
  syscall
