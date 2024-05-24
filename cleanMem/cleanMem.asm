	processor 6502
	seg code
	org $F000         ;Define the code origin at $F000

Start:                ;'Start' label is an alias to the ROM address $F000
	sei               ;Disable interrupts
	cld 	          ;Disable the Binary Coded Decimal mode
	ldx #$FF          ;loads the X register with #$FF
	txs               ;Transfer the x register to the stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           Clear the Page Zero region ($00 to $FF)
;     Meaning the entire RAM and also the entire TIA register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda #0            ; A = 0
    ldx #$FF          ; X = #$FF

MemLoop:
    sta $0,X          ; Store the value of A inside memory address $0 + X (whatever I have in register 'x'),
                      ; this instruction is doing the job of over-writing each memory address with the value 0
    dex               ; X--
    bne MemLoop;      ; Loop until X is equal to zero (i.e. until 'z-flag' of processor register is set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;               Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    org $FFFC
    .word Start       ; Reset vector at $FFFC (where the program starts)
    .word Start
