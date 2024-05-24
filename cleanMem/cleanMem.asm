	processor 6502
	seg code
	org $F000         ;Define the code origin at $F000
Start:
	sei               ;Disable interrupts
	cld 	          ;Disable the Binary Coded Decimal mode
	ldx #$FF          ;loads the X register with #$FF
	txs               ;Transfer the x register to the stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Clear the Page Zero region ($00 to $FF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda #0            ; A = 0
    ldx #$FF          ; X = #$FF

MemLoop:
    sta $0,X          ; Store the value of A inside memory address $0 + X
    dex               ; X--
    bne MemLoop;      ; Loop until X is equal to zero (z-flag is set)
