Explanation:

e3a01000

  e	  3		a	0	 1	  0		0	 0
1110 0011 1010 0000 0001 0000 0000 0000 



1110 | 00 1 | 1101 | 0 | 0000 | 0001 | 000000000000 

1. Condition = 1110 -> AL 

2. Type = 00, I=1 -> Data processing + immediate value 

3. Cmd = 1101 -> MOV 

4. Rd = 0001 -> R1  

5. Src2 = 0 (immediate) -> #0

Assembly: MOV r1, #0 

----------------------------------------------------------------------

 e     3    a   0	 2	   0	0	a 
1110 0011 1010 0000 0010 0000 0000 1010 

11100011101000000010000000001010 

1110 | 00 1 | 1101 | 0 | 0000 | 0010 | 000000001010 

1. Condition = 1110 -> AL 

2. Type = 00, I=1 -> Data processing + immediate value 

3. Cmd = 1101 -> MOV 

4. Rd = 0010 -> R2  

5. Src2 = 1010 (immediate) -> #10

Assembly: MOV r2,#10 

----------------------------------------------------------------------

e	  3	   a	0	 3	  0	    0   0
1110 0011 1010 0000 0011 0000 0000 0000 


11100011101000000011000000000000 

1110| 00 1 |1101 |0 |0000 |0011| 000000000000 

1. Condition = 1110 -> AL 

2. Type = 00, I=1 -> Data processing + immediate value 

3. Cmd = 1101 -> MOV 

4. Rd = 0011 -> R3  

5. Src2 = 0000 (immediate) -> #0

Assembly: MOV r3,#0 

----------------------------------------------------------------------

  e	  3	   a	0	  4	  0	   0	5
1110 0011 1010 0000 0100 0000 0000 0101

11100011101000000100000000000101

1110 | 00 1| 1101| 0 |0000 | 0100 | 000000000101

1. Condition = 1110 -> AL 

2. Type = 00, I=1 -> Data processing + immediate value 

3. Cmd = 1101 -> MOV 

4. Rd = 0100 -> R4  

5. Src2 = 0101 (immediate) -> #5

Assembly: MOV r4,#5 

----------------------------------------------------------------------

e	  0		5	3	 5	  0		0	4
1110 0000 0101 0011 0101 0000 0000 0100 

11100000010100110101000000000100 

1110 | 00 0 |0010 | 1 |0011| 0101| 000000000100 

1. Condition = 1110 -> AL 

2. Type = 00, I=0 -> Data processing, no immediate value 

3. Cmd = 0010 -> SUB

4. S = 1 -> SUBS  (Update NZCV flag)

5. Rn = 0011 -> R3 

6. Rd = 0101 -> R5  

7. Src2 = 0100 -> R4          

Assembly: SUBS r5,r3,r4 

----------------------------------------------------------------------

b	   0	8	0	0	  0		0	2
1011 0000 1000 0000 0000 0000 0000 0010  

10110000100000000000000000000010 

1011 | 00 0 |0100 |0 |0000 |0000 |000000000010 

1. Condition = 1011 -> LT 

2. Type = 00, I=0 -> Data processing, no immediate value 

3. Cmd = 0100 -> ADD

4. S = 0 ->no Update for NZCV flag

5. Rn = 0000 -> R0 

6. Rd = 0000 -> R0  

7. Src2 = 0010 -> R2    

Assembly: ADDLT r0,r0,r2 

----------------------------------------------------------------------

b	  2		8	3	3	  0		0	1 
1011 0010 1000 0011 0011 0000 0000 0001 

10110010100000110011000000000001 

1011| 00 1| 0100| 0 |0011 |0011 |000000000001 

1. Condition = 1011 -> LT 

2. Type = 00, I=1 -> Data processing, immediate value 

3. Cmd = 0100 -> ADD

4. S = 0 ->no Update for NZCV flag

5. Rn = 0011 -> R3

6. Rd = 0011 -> R3  

7. Src2 = 0001 -> #1  

Assembly: ADDLT r3,r3,#1 

----------------------------------------------------------------------

b	  a		f	f	f	  f		f	b 
1011 1010 1111 1111 1111 1111 1111 1011 

10111010111111111111111111111011 

1011| 10 1 0 |111111111111111111111011 

1. Cond = LT 

2. Type = 101  - Branch instruction 

3. L=0, hence just branch B (no link) 

4. 111111111111111111111011 it start with 1 hence signed negative
4.1 000000000000000000000100 = -5
4.2 -5*4 = -20 for assembly

Assembly: BLT -20

----------------------------------------------------------------------

e 		b	f	f	f	  f		f	f
1110 1011 1111 1111 1111 1111 1111 1111 

1110 10 11 111111111111111111111111 

1110 |10 1 1 |111111111111111111111111 

1. Cond = 1110 -> AL 
2. Type = 101 -> Branch

3. L -> 1 -> BL 

4. Offset -> 111111111111111111111111 (negative signed)
4.1 000000000000000000000000+1 = -1
4.2 -1*4 = -4

Assembly: BL -4

----------------------------------------------------------------------

e	  5		2	d	 e	   0	0	4
1110 0101 0010 1101 1110 0000 0000 0100  

11100101001011011110000000000100 

1110 | 01 0 1 0 0 1 0 | 1101 1110 000000000100 

1. Cond = 1110 -> AL

2. Type = 01 -> Memory instruction  

3. I = 0  -> immediate offset 

4. P=1 -> pre indexing 

5. U = 0 subtract from base 

6. W = 1 writeback  

7. L =0 - STR 

8. Rn = 1101 -> R13 (sp) 

9. Rd = 1110  -> R14 (lr)
10. 0100 -> #4 

Assembly: Str R14 ,[r13,#-4]! 

----------------------------------------------------------------------

e	  3	 	a	 0	  4	   0	0	f 
1110 0011 1010 0000 0100 0000 0000 1111

11100011101000000100000000001111 

1110 | 00 1| 1101 | 0 |0000 |0100| 000000001111 

1. 1110 = AL

2. Type 00, I=1Data -> processing, immediate

3. Cmd = 1101 -> MOV

4. Rd = 0100 ->R4

5. Src2 = 1111 -> #15 

Assembly: Mov r4,#15 

----------------------------------------------------------------------

e	   3	a	0	 5	  0	    0	a 
1110 0011 1010 0000 0101 0000 0000 1010

11100011101000000101000000001010

1110| 0 01 	|1101 |0 |0000 |0101 | 000000001010

1. Cond = 1110 -> AL 

2. Type 00, I=1Data -> processing, immediate

3.  Cmd = 1101 = MOV 

4. Rd = 0101 ->R5

5. Src2 = 1010 -> #10  

Assembly: Mov r5, #10 

----------------------------------------------------------------------

e	  0		8	5	  6	  0		0	4 
1110 0000 1000 0101 0110 0000 0000 0100

11100000100001010110000000000100 

1110 |00 0 |0100| 0 |0101| 0110 |000000000100 

1. Cond = 1110 -> AL 

2. Type 00, I=0 Data -> processing, no immediate 

3.  Cmd = 0100 = ADD 

4. S=0 ->No flag update

5. Rn = 0101 ->R5

6. Rd = 0110 ->R6

7. Src2 = 0100 -> #4 

Assembly: ADD r6,r5,r4 

----------------------------------------------------------------------

e	  0		5	3	 5	  0		0	4
1110 0000 0101 0011 0101 0000 0000 0100 

11100000010100110101000000000100 

1110 | 00 0 |0010 | 1 |0011| 0101| 000000000100 

1. Condition = 1110 -> AL 

2. Type = 00, I=0 -> Data processing, no immediate value 

3. Cmd = 0010 -> SUB

4. S = 1 -> SUBS  (Update NZCV flag)

5. Rn = 0011 -> R3 

6. Rd = 0101 -> R5  

7. Src2 = 0100 -> R4       

subs r5,r3,r4
----------------------------------------------------------------------

e	   a	f	f	 f	  f		f	9
1110 1010 1111 1111 1111 1111 1111 1001

11101010111111111111111111111001 

1110| 10 1 0 | 111111111111111111111001 

1. Cond = 1110 -> AL 

2. Type = 101 -> Branch

3. L= 0 -> Just B

4. 111111111111111111111001 (negative)
4.1 000000000000000000000110+1=111=-7
4.2 -7*4 = -28
Assembly: B -28

----------------------------------------------------------------------

Reconstruction of the code:
(no branch names)

_start:
	
	mov r1,#0		
	mov r2,#10		
	mov r3,#0		
	mov r4,#5					
	subs r5,r3,r4 
	addlt r0,r0,r2	 
	addlt r3,r3,#1	
	blt -20	
	bl -4		
	str r14,[r13,#-4]!
	mov r4,#15		
	mov r5,#10		
	add r6,r5,r4	 
	subs r5,r3,r4	
	b -28	


Final version:

_start:

			mov r1,#0		#adds 0 to r1
			mov r2,#10		
			mov r3,#0		
			mov r4,#5

		first_label:	

			subs r5,r3,r4   # updating NZCV by storing the result of r3-r4
			addlt r0,r0,r2	 
			addlt r3,r3,#1	
			blt first_label
			bl second_label

		second_label:			
			str r14,[r13,#-4]!  
			mov r4,#15		
			mov r5,#10		
			add r6,r5,r4	 
			subs r5,r3,r4	
			b second_label


----------------------------------------------------------------------

Explanation:

In this code last line always ensures an infitie loop because of b second_label ( which is B -28 command actually), hence it will always get back to str r14,[r13,#-4]! until the stack overflow and crash 

----------------------------------------------------------------------


Here is the youtube link for the video widely describing everything happening here 

https://youtu.be/DNjPUK6iYEQ

