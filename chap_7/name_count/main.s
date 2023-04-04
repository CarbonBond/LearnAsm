.globl _start
.section .text
_start:
#Load ptr of people into rbx
  leaq people, %rbx
#load number of people into rcx
  movq numpeople, %rcx

#Empty rdi for longest name's length 
  movq $0, %rdi

#finish if there are no people
  cmp $0, %rcx
  je finish

mainloop:
#Move name string ptr into r11
  movq NAME_OFFSET(%rbx), %r11
#call string loop
  jmp _stringstart
#returns count in r10
  
.globl compare
compare:
 cmp %rdi, %r10
 jbe endloop 

 movq %r10, %rdi

endloop:
 addq $PERSON_RECORD_SIZE, %rbx
 loopq mainloop

finish:
 movq $60, %rax
 syscall
