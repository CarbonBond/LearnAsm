.globl _start
.section .text
_start:
#320 bit numbers are five 64 bits numbers
#first number is stored in rax, rbx, rcx, rdx, r8. Least significant being r8
  movq $0x00FFFFFFFFFFFFF, %rax
  movq $0xF, %rbx
  movq $0xF, %rcx
  movq $0xF, %rdx
  movq $0xF, %r8
#Full first Number is:
#00FFFFFFFFFFFFF 000000000000000F 000000000000000F 000000000000000F 000000000000000F

#second number is stored in r11 ~ r15
  movq $0xF, %r11
  movq $0xF, %r12
  movq $0xF0, %r13
  movq $0xF00, %r14
  movq $0xF000, %r15
#Full second Number is:
#00000000000000F 000000000000000F 00000000000000F0 0000000000000F00 000000000000F000

AddFiveQWords:
  add %r15, %r8
  adc %r14, %rdx
  adc %r13, %rcx
  adc %r12, %rbx
  adc %r11, %rax

finish:
  movq $60, %rax
  syscall
