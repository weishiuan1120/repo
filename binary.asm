count_leading_zeros:
    li      a0, 0           # Clear the result register (a0)
    beqz    a1, zero_result # Check if x (a1) is zero, branch to zero_result
    
    li      t0, 32          # Set up a loop counter (t0) to 32
    
count_loop:
    srl     a1, a1, 1       # Shift the input right by 1 bit (a1)
    bnc     not_carry       # Branch if the carry flag (CF) is not set (there's no direct equivalent in RISC-V)
    addi    a0, a0, 1       # Increment the result if carry is set
not_carry:
    subi    t0, t0, 1       # Decrement the loop counter (t0)
    bnez    t0, count_loop  # Loop until t0 becomes zero
    
zero_result:
    li      a0, 32          # Set the result to 32 if the input was zero
    ret