.section .data

.globl people, numpeople
numpeople:
  .quad (endpeople - people)/PERSON_RECORD_SIZE

jcname:
  .ascii "Jon Conrad\0"
hdname:
  .ascii "Hera Dono\0"
kdname:
  .ascii "Ken Dono\0"
rcname:
  .ascii "Ren Chester\0"
inname:
  .ascii "Isaac Newton\0"
clname:
  .ascii "Clint Lewis\0"

people:
#       Name    LB   SH EC SC Sx HC HGT  Age
  .quad jcname, 101, 11, 3, 3, 1, 1, 54, 44
  .quad hdname, 120, 11, 1, 1, 1, 2, 61, 32
  .quad kdname, 140, 12, 4, 2, 0, 3, 76, 18
  .quad rcname, 160,  8, 3, 4, 0, 1, 68, 32
  .quad inname, 180,  8, 1, 1, 1, 2, 81, 23
  .quad clname, 200, 10, 5, 5, 0, 3, 76, 20
endpeople:


.globl NAME_OFFSET, WEIGHT_OFFSET, SHOE_OFFSET
.globl EYEC_OFFSET, SKINC_OFFSET, SEX_OFFSET
.globl HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ NAME_OFFSET, 0
.equ WEIGHT_OFFSET, 8 
.equ SHOE_OFFSET, 16
.equ EYEC_OFFSET, 24
.equ SKINC_OFFSET, 32
.equ SEX_OFFSET, 40
.equ HAIR_OFFSET,48 
.equ HEIGHT_OFFSET, 56 
.equ AGE_OFFSET, 64 

.globl PERSON_RECORD_SIZE
.equ PERSON_RECORD_SIZE, 72 
