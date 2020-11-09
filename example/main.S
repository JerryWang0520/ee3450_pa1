.section .data
# There are two global variables:
#  1. list: Store the input numbers.
#  2. size: the number of the list
# You can modify the following two lines to test your program,
# but DO NOT change the line number
array: .dword 1, 2, 0
size: .dword 3

.section .text
.global main
main:

  # save return pointer
  addi sp, sp, -8
  sd ra, 0(sp)

  la a0, array    # assign array address to a0
  ld s0, size     # assign array size to s0

  #jump to function
  jal addition

  li a0, 0        # assign 0 to a0

  ld ra, 0(sp)
  addi sp, sp, 8

  ret             # return (jump to the addr stored in register ra)


##### registers used #####
# a0: array address
# s0: array size
# s1: first element
# s2: second element
# s3: third element
##########################

.global addition
addition:

  # save return pointer
  addi sp, sp, -8
  sd ra, 0(sp)

  # load array[0] and array[1]
  ld s1, 0(a0)
  ld s2, 8(a0)
  
  # s3 = s1 + s2
  add s3, s1, s2

  # store s3 into array[2]
  sd s3, 16(a0)

  # load return pointer
  ld ra, 0(sp)
  addi sp, sp, 8

  ret

