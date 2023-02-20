# let A is the array of numbers
.data 
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

main:
  la $s0, A 
  li $s1, 0   # sum
  li $t0, 10  # length of array
  li $t1, 0   # counter

  loop: 
    beq $t1, $t0, end_loop
    add $s1, $s1, ($s0)     # add the current word to sum
    addi $s0, $s0, 4        # move to next word
    addi $t1, $t1, 1        # increase counter by one
    j loop

  end_loop:
    # print sum
    li $v0, 1
    move $a0, $s1           
    syscall

    # exit 
    li $v0, 10
    syscall
