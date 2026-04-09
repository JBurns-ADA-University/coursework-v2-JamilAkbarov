.global _start
_start:
    MOV r2, #0       

    ADD r2, r2, r0    
    ADD r0, r0, #1      
    CMP r0, r1        
    MOV r3, #1             
    LSL r3, r3, #2   
    MOV r4, #-32      

    ADDLE r5, pc, r4       
    MOVGT r5, pc            
    MOV pc, r5             

    SVC 2          


    