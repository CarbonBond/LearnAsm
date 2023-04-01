.section .data

.globl people, numpeople
numpeople:
  .quad (endpeople - people)/PERSON_RECORD_SIZE

people:
  .quad 100, 11, 3, 54, 44
  .quad 120, 11, 1, 61, 32
  .quad 140, 12, 4, 76, 18
  .quad 160, 8, 3, 68, 32
  .quad 180, 8, 1, 81, 23
  .quad 200, 10, 5, 76, 20
  .quad 220, 8, 1, 80, 33
  .quad 240, 8, 4, 74, 21
  .quad 260, 7, 1, 71, 27
  .quad 280, 6, 3, 87, 62
  .quad 300, 9, 4, 72, 37
endpeople:

.globl WEIGHT_OFFSET, HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ WEIGHT_OFFSET, 0
.equ SHOW_OFFSET, 8
.equ HAIR_OFFSET, 16
.equ HEIGHT_OFFSET, 24 
.equ AGE_OFFSET, 32

.globl PERSON_RECORD_SIZE
.equ PERSON_RECORD_SIZE, 40
