.global lab1
.syntax unified

@(a + b)/c, (a − b)≥ 0, (a − b)/c, (a − b) < 0

#define a #10
#define b #15
#define c #5
lab1:

    mov r0, a   
    mov r1, b   
    mov r2, c   
    mov r3, #0
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0

    bl calculate 
    bx lr

calculate:
    push {lr}
    
    @Calculate (a+b)/c

    adds r7, r0, r1
    sdiv r3, r7, r2
    
    @Calculate (a-b)/c

    subs r7, r0, r1
    sdiv r4, r7, r2

    @Calculate (a-b)>=0
    
    subs r7, r0, r1
    cmp     r7, #0
    bpl greater


    @Calculate (a-b)<0
    
    cmp r7, #0
    blt less

    b end

greater:
    mov r5, r7

less:
    mov r6, r7
    pop {pc}

end:
    pop {pc}
    	
             
    
