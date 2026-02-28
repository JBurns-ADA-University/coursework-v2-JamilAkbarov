.global _start

_start:

    MOV r2, #0              @ initialize sum to zero before loop begins

    @ --- loop start (here the so called loop which we are utilizing in this program without actually using typical branching starts)--- 
    ADD r2, r2, r0          @ add current counter value into running sum

    ADD r0, r0, #1          @ increment counter by 1 to move to the next integer

    CMP r0, r1              @ subtract r1 from r0 and update NZCV condition flags which are connected with commands downwards such as MVNLE and MOVGT

    @ --- compute bytes per word using shift ---

    MOV r3, #1              @ load 1 into r3 (binary: 0001)

    LSL r3, r3, #2          @ shift left 2 positions: 0001 becomes 0100 which equals 4

    @I could have made it just MOV r3, #4 but decided to use some tricky technique

    @ --- compute offset based on condition flags ---

    MVNLE r4, #35           @ if r0 <= r1: r4 = NOT(35) = -36 in twos complement, jump back and -36 is  - 0x0000024 in hexadecimal

    MOVGT r4, #0            @ if r0 > r1:  r4 = 0, no backwards jump, fall through to exit

    @ --- compute target address and jump ---
    ADD r5, pc, r4          @ r5 = pc + r4, pc reads as current address + 8 due to pipeline so in base case we are summing 0x0000028 + (- 0x0000024) which equal 0x000004 and hence jumps back to the start 
                            @ however when r4 is 0 r5 if 0x00000028 hence jumping to the SVC 2 and ending program 


    MOV pc, r5              @ write target address into PC, redirecting execution


    @ --- exit ---
    SVC 2                   @ supervisor call, terminates the program on ARM Linux