        .globl main
main:   
        jal Add4

Add4:   move $v1, $ra     # save return address
        li $a0, 3         # load 4 random numbers to add together
        li $a1, 5
        li $a2, 7
        li $a3, 10
        jal Sumn          # jump and link to given procedure
        add $s1, $v0, $a3 # add fourth value since the procedure only adds three
        jr $v1


Sumn:   addi    $sp, $sp, -4    # moving by a word on the stack (alloc): SP <- SP - 4 
        sw      $t0, 0($sp)     # store value in $t0 at the stack pointer: Mem[0 + SP] <- T0
        add     $t0, $a0, $a1   # add $a0 and $a1 and put result in $t0: T0 <- A0 + A1
        add     $v0, $t0, $a2   # add $t0 and $a2 and put result in $v0: V0 <- T0 + A2
        lw      $t0, 0($sp)     # retrieve old $t0 from stack: T0 <- Mem[0 + SP]
        addi    $sp, $sp, 4     # de-allocate word on stack: SP <- SP + 4
        jr      $ra             # return to caller: (no RTN?)
        
