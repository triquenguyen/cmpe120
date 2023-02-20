.data 
  enter_input: .asciiz "Enter a number\n"

.text
.globl main

main: 

  # Print "Enter a string"
  la $a0, enter_input
  li $v0, 4
  syscall

  # Read value
  li $v0, 5
  syscall

  # Store value in $t0
  move $s0, $v0

  addi $a0, $0, 3
  addi $a1, $0, 5
  jal poly
  add $s1, $s1, $v0 # f(x) = 3x^5

  addi $a0, $0, 3
  addi $a1, $0, 4
  jal poly
  add $s1, $s1, $v0 # f(x) = 3x^5 + 2x^4

  addi $a0, $0, 3
  addi $a1, $0, 4
  jal poly
  add $s1, $s1, $v0 # f(x) = 3x^5 + 2x^4

  addi $a0, $0, -5
  addi $a1, $0, 3
  jal poly
  add $s1, $s1, $v0 # f(x) = 3x^5 + 2x^4 + (-5x^3)

  addi $a0, $0, -1
  addi $a1, $0, 2
  jal poly
  add $s1, $s1, $v0 # f(x) = 3x^5 + 2x^4 + (-5x^3) + (-x^2)

  addi $a0, $0, 7
  addi $a1, $0, 1
  jal poly
  add $s1, $s1, $v0 # f(x) = 3x^5 + 2x^4 + (-5x^3) + (-x^2) + 7x

  addi $s1, $s1, -6 # f(x) = 3x^5 + 2x^4 + (-5x^3) + (-x^2) + 7x + 6

  la $a0, s1
  li $v0, 1
  syscall

  li $v0, 10
  syscall # Exit

poly:
  addi $s2, $0, 1
  addi $sp, $sp, -4
  sw $ra, 0($sp)

  jal pow
  mul $v0, $a0, $v0
  lw $ra, 0($sp)
  addi $sp, $sp , 4
  jr $ra

pow:
  beq $a1, $0, end_pow
  mul $s2, $s2, $s0
  addi $a1, $a1, -1
  j pow

end_pow:
  add $v0, $s2, $0
  jr $ra
  


