_start:
	
	mov r1,#0		
	mov r2,#10		
	mov r3,#0		
	mov r4,#5
first_label:					
	subs r5,r3,r4   
	addlt r0,r0,r2	 
	addlt r3,r3,#1	
	blt first_label
	bl second_label
second_label:			
	str lr,[sp,#-4]!  
	mov r4,#15		
	mov r5,#10		
	add r6,r5,r4	 
	subs r5,r3,r4	
	b second_label