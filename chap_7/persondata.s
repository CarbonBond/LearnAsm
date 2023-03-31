.section .data

.globl people, numpeople
numpeople:
  .quad (endpeople - people)/PERSON_RECORD_SIZE

people:
  .quad 100, 3, 54, 44
  .quad 120, 1, 61, 32
  .quad 140, 4, 76, 18
  .quad 160, 2, 68, 32
  .quad 180, 1, 81, 23
  .quad 200, 5, 76, 20
  .quad 220, 1, 80, 33
  .quad 240, 4, 74, 21
  .quad 260, 1, 71, 27
  .quad 280, 3, 87, 62
  .quad 300, 4, 72, 37
endpeople:

.globl WEIGHT_OFFSET, HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ WEIGHT_OFFSET, 0
.equ HAIR_OFFSET, 8
.equ HEIGHT_OFFSET, 16
.equ AGE_OFFSET, 24

.globl PERSON_RECORD_SIZE
.equ PERSON_RECORD_SIZE, 32
