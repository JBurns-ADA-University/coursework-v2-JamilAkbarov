
_start:

	mov r1,#0
	// e3a01000 → MOV instruction, immediate value
	// R1 is set to 0 (initialization)

	mov r2,#10
	// e3a0200a → MOV instruction
	// immediate value 10 is stored in R2

	mov r3,#0
	// e3a03000 → MOV instruction
	// R3 is initialized to 0 (used as counter)

	mov r4,#5
	// e3a04005 → MOV instruction
	// R4 is set to 5 (limit value)

	subs r5,r3,r4
	// e0535004 → SUBS instruction
	// R5 = R3 - R4, flags are updated (NZCV)

	addlt r0,r0,r2
	// b0800002 → ADDLT instruction
	// executes only if R3 < R4
	// R0 = R0 + R2

	addlt r3,r3,#1
	// b2833001 → ADDLT instruction
	// executes only if R3 < R4
	// R3 is incremented by 1

	blt -20
	// bafffffb → BLT instruction
	// branch back if condition LT is true (loop)

	bl -4
	// ebffffff → BL instruction
	// branch with link, saves return address in R14

	str r14,[r13,#-4]!
	// e52de004 → STR instruction
	// R13 = R13 - 4, then R14 is stored on stack

	mov r4,#15
	// e3a0400f → MOV instruction
	// R4 is updated to 15

	mov r5,#10
	// e3a0500a → MOV instruction
	// R5 is set to 10

	add r6,r5,r4
	// e0856004 → ADD instruction
	// R6 = R5 + R4 (result is 25)

	subs r5,r3,r4
	// e0535004 → SUBS instruction
	// R5 = R3 - R4, flags updated again

	b -28
	// eafffff9 → B instruction
	// unconditional branch backward (infinite loop)
