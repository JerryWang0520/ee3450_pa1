.section .data
# There are two global variables:
#  1. list: Store the input numbers.
#  2. size: the number of the list
# You can modify the following two lines to test your program,
# but DO NOT change the line number
array: .dword 15, 20, 6, 35, 70, 7, 14, 36, 1, 21, 13, 3, 24, 5, 22, 2, 4, 10, 8, 12
size: .dword 20

.section .text
.global main
main:

  # save return pointer
  addi sp, sp, -8
  sd ra, 0(sp)

  la a0, array      # assign array address to a0
  ld s0, size       # assign array size to s0

  li s1, 0
  li s2, 1

  #jump to function
  jal swap

  li a0, 0          # assign 0 to a0

  ld ra, 0(sp)
  addi sp, sp, 8

  ret               # return (jump to the addr stored in register ra)
