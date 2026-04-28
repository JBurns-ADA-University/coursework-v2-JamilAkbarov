This is the link of the first part of the video where I explain code thoroughly 
https://youtu.be/ZwOt0J5lIHE

This is the second part I just forgot to mention how one technique works hence decided to dedicated additional 5 minutes to its explanation

https://youtu.be/gF4OY2mY8Xs





.global _start
_start:
    MOV r2, #0       //First of all we assign value 0 to sum  

    ADD r2, r2, r0    //then we start a loop where we add first value in range (r0,r1) to r2 which is sum variable      
    ADD r0, r0, #1    //then we iterate a value r0 by 1 to move further in the range until r1, including r1 to the sum, since instructios require so      
    CMP r0, r1        //Furthermore, we compare values r0 and r1 which would help us to set NZCV flags that are used in further instructions        
    MOV r3, #1        //we assign r3 value 1 which would be needed futher      
    LSL r3, r3, #2   //we move bit to the left 2 times, hence we get 0100 value which is converted to 4 which is technically bytes-per-word value, which is requested in the exercise      
    MOV r4, #-32      //we assign value of -32 since it equals to the value of negative -32, -32 bytes = 8 instructions back (Each instruction is 4 bytes, in our case it goes backwards due to negative sign)

    ADDLE r5, pc, r4       
    MOVGT r5, pc            
    MOV pc, r5             

    SVC 2          

 //In the last subsection of 3 commands we add pc and r4 in case of r0 being less or equal to r1
    //What is interesting here is current address(pc) being 2 commands ahead so in (MOV pc, r5)
    //That works out because of specific pipeline architecture in ARM 
    //This is a legacy behavior carried over from the original ARM design and remains consistent across ARM architecture to maintain backwards compatibility.
    //So when you read pc inside an instruction, you always get current_address + 8, not the address of the instruction itself.
    //Therefore to iterate backwards to the command (ADD r2,r2,r0) we need to add pc to -32 which would throw it 8 command back straighly to ADD r2, r2, r0, therefore we hardcode the value of -32 to r4 
    //the iteration moves on until r0 is less or equal to r1, the moment it is more, the ADDLE r5, pc, r4  doesn't execute and we move it the next command which doesn't do anything with pc value hence the instruction proceeds and exits SVC 2
