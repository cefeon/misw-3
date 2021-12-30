;Set Bytes number
MOV R3, #4H;
;Set summands pointers
MOV R0,#20H;
MOV R1, #30H;

;Set result pointer
MOV R4, #40H;

ADDBYTE:
;Add numbers from addresses
MOV A, @R0;
ADD A, @R1;

;Store start address in R2 for further use
MOV B, R0;
MOV R2, B;

;Store sum for further use
MOV B, A;

;Set result address
MOV A, R4;
MOV R0, A;

MOV A, B;

JNC RESULT
	;Set Accumulator to Carry Flag
	CLR A;
	ADDC A, #0H;

	;Set result
	MOV @R0, B;
	INC R0;
RESULT:
ADD A, @R0;
MOV @R0, A;

;Restore pointers
MOV B, R2;
MOV R0, B;

;Increment pointers
INC R4;
INC R1;
INC R0;
DJNZ R3, ADDBYTE;
EXIT:   SJMP EXIT;