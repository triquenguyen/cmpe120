.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10


main:
  la $s0, A
  li $t0, 10  # length of array
  li $t1, 0   # counter
  li $t2, 0   # max_value

  loop:
    beq $t1, $t0, end_loop    # if $t1 == $t0, then jump to end_loop
    lw $t3, 0($s0)            # load value from memory
    bgt $t3, $t2, max_value   # if $t3 > $t2, then jump to max_value
    addi $t1, $t1, 1          # increment $t1
    addi $s0, $s0, 4          # increment $s0 by 4 bytes
    j loop

  max_value:
    move $t2, $t3

  end_loop:
    # print max_value
    li $v0, 1
    move $a0, $s1          
    syscall 

    # exit
    li $v0, 10
    syscall
