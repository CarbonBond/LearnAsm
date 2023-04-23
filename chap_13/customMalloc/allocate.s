.globl allocate, deallocate

.section .data
memory_start:
  .quad 0
memory_end:
  .quad 0

.section .text
.equ HEADER_SIZE,       16
.equ HDR_IN_USE_OFFSET, 0
.equ HDR_SIZE_OFFSET,   8

.equ BRK_SYSCALL,       12

#register usage:
# - rdx - size requested
# - rsi -- pointer to current memory being examined
# - rcx - copy memory_end

allocate_init:
  #find the program break.
  movq $0, %rdi
  movq $BRK_SYSCALL, %rax
  syscall

#Break will be both the start and end of memory
  movq %rax, memory_start
  movq %rax, memory_end
  jmp allocate_continue

allocate_move_break:
  #Returns oldbreak in r8 to user
  movq %rcx, %r8

  #Calculate where the bre break is (old break + size)
  movq %rcx, %rdi
  addq %rdx, %rdi
# save this value
  movq %rdi, memory_end

#Tell linux where the new break is
  movq $BRK_SYSCALL, %rax
  syscall

#Address is in r8, mark size and availablility
  movq $1, HDR_IN_USE_OFFSET(%r8)
  movq %rdx, HDR_SIZE_OFFSET(%r8)

#Return value is beyond our HEADER
  addq $HEADER_SIZE, %r8
  movq %r8, %rax
  ret

allocate:
#Save amount requested into rdx
  movq %rdi, %rdx
#Needed amount is larger
  addq $HEADER_SIZE, %rdx

#Initialize if we haven't yet
  cmpq $0, memory_start
  je allocate_init

allocate_continue:
  movq memory_start, %rsi
  movq memory_end, %rcx

allocate_loop:
#Have we reached the end of memory? Allocate new memory by moving the block
  cmpq %rsi, %rcx
  je allocate_move_break

#Block Available?
  cmpq $0, HDR_IN_USE_OFFSET(%rsi)
  jne try_next_block

#Block large enough?
  cmpq %rdx, HDR_SIZE_OFFSET(%rsi)
  jb try_next_block

#Block works! Mark as unavailable
  movq $1, HDR_IN_USE_OFFSET(%rsi)
  addq $HEADER_SIZE, %rsi
  movq %rsi, %rax
  ret

try_next_block:
  #Block unuseable, try next.
  addq HDR_SIZE_OFFSET(%rsi), %rsi
  jmp allocate_loop

deallocate:
  #Mark block as Available
  movq $0, HDR_IN_USE_OFFSET - HEADER_SIZE(%rdi)
  ret

