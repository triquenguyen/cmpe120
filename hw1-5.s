.data
  even_msg: .asciiz "The number is even"
  odd_msg: .asciiz "The number is odd"

.text
.globl main
main:
  li $s1, $0, 5   # initialize the a number to be evaluated and store in s1
  li $t0, $0, 2   # initialize the divisor and store in t0

  div $s1, $t0      # divide the number to 2 
  mfhi $s2          # store the remainder in s2

  bne $s2, $0, odd  # branch to odd if the remainder is not 0

  # print even message
  li $v0, 4
  la $a0, even_msg  
  
  syscall

odd:
  # print odd message
  li $v0, 4
  la $a0, odd_msg

  li $v0, 10
  syscall
