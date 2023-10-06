# Define temporary registers
t0 = s0
t1 = s1
t2 = s2
t3 = s3
t4 = s4
t5 = s5
t6 = s6
t7 = s7

count_leading_zeros:
    # Save temporary register s0
    push    s0
    # Initialize s0 with t0
    mv      s0, t0
    sd      x1, -24(s0)
    li      t1, 32
    sw      t1, -4(s0)
    li      t2, 16
    sw      t2, -8(s0)

L3:
    lw      s3, -8(s0)
    ld      s4, -24(s0)
    mv      s5, s3
    srl     s4, s4, a0
    mv      s6, s4
    sw      s3, -12(s0)
    beqz    s3, L2
    lw      s3, -8(s0)
    sub     s3, s3, t1
    sw      s3, -4(s0)
    lw      s3, -12(s0)
    sd      s6, -24(s0)
L2:
    sra     t3, t2, 1
    sw      t3, -8(s0)
    bnez    t3, L3

    lw      s3, -4(s0)
    mv      s3, s7
    ld      s6, -24(s0)
    mv      s3, s5
    mv      s7, s3
    sub     s3, s7, s5

    # Restore temporary register s0
    pop     s0
    ret
