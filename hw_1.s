.global _start
_start:
    MOV r2, #0              @ initialize sum to the value of zero

    ADD r2, r2, r0          @ add current counter to sum
    ADD r0, r0, #1          @ increment counter
    CMP r0, r1              @ compare counter against the current endpoint
    MOV r3, #1
    LSL r3, r3, #2          @ compute bytes per word (1 << 2 = 4) it used to be 0001 it becomes 0100
    MVNLE r4, #35           @ if r0 <= r1, offset = NOT(35) = -36, jump back, and it turns into -36 because of 2's complement 
    MOVGT r4, #0            @ if r0 > r1, offset = 0, fall through to exit
    ADD r5, pc, r4          @ compute jump target (pc + 8 due to pipeline + offset)
    MOV pc, r5              @ perform jump by writing address into PC

    SVC 2                   @ exit program