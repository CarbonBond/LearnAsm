.globl _start

.section .data
str_one:
  .ascii "One\n"
str_one_end:
str_two:
  .ascii "two\n"
str_two_end:

.equ one_size, str_one_end - str_one
.equ two_size, str_two_end - str_two

.section .text
_start:
  movq $10, %r8

print_one:
  movq $1, %rax 
  movq $1, %rdi 
  movq $one_size, %rdx
  movq $str_one, %rsi
  syscall
  dec %r8
  cmp $0, %r8
  je finish

print_two:
  movq $1, %rax 
  movq $1, %rdi 
  movq $two_size, %rdx
  movq $str_two, %rsi
  syscall
  dec %r8
  cmp $0, %r8
  jne  print_one

finish:
  movq $60, %rax
  movq $1, %rdi
  syscall
