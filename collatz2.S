// CES30 assignment template
// 
// cse30sp23id: 
//
// Describe target Hardware to the assembler
.arch   armv6
.cpu    cortex-a53
.syntax unified
/////////////////////////////////////////////////////////

.text                       // start of the text segment
/////////////////////////////////////////////////////////
// function hashFun 
/////////////////////////////////////////////////////////
.type   collatz2, %function  // define as a function
.global collatz2             // export function name
.equ    FP_OFFSET, 28       // (regs - 1) * 4
/////////////////////////////////////////////////////////

// put any .equ for hashFun here - delete this line

/////////////////////////////////////////////////////////

collatz2:
    push    {r4-r9, fp, lr}     // use r4-r9 protected regs
    add     fp, sp, FP_OFFSET   // locate our frame pointer
    // DO NOT EDIT PROLOGUE ABOVE
    // You can use temporary r0-r3 and preserved r4-r9
    // Store return value (results) in r0
    ///////////////////////////////////////////////////////
    
    // YOUR CODE GOES HERE
	//r0 -> num
	//r1 -> &answer
	cmp	 r0, #1 //if (num == 0)
	bne	.Leven //.
	ldr	r0, [r1]
	b	.Lskip
.Leven:
	and	r3, r0, #1 //r3 = num % 2
	cmp	r3, #0 //if num % 2 == 0
	bne	.Lodd //.
	asr	r0, r0, #1 //num /= 2
	ldr	r4, [r1] //r4 = *answer
	add	r4, r4, #1 //r4+=1
	str	r4, [r1]
	push	{r4-r9, fp, lr}
	bl	collatz2
	pop	{r4-r9, fp, lr}
	b	.Lskip
	
.Lodd:
	mov	r5, #3
	mul	r0, r0, r5 //num = 3(num) + 1
	add	r0, r0, #1 // .
	ldr	r4, [r1]
	add	r4, r4, #1
	str	r4, [r1]
	push	{r4-r9, fp, lr}
	bl	collatz2
	pop	{r4-r9, fp, lr}
	b	.Lskip

.Lskip:
	

    
    ///////////////////////////////////////////////////////
    // DO NOT EDIT EPILOGUE BELOW
    sub     sp, fp, FP_OFFSET   // restore sp
    pop     {r4-r9, fp, lr}     // restore saved registers
    bx      lr                  // function return
    .size   collatz2,(.-collatz2)
