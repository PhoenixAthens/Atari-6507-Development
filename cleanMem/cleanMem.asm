	processor 6502
	seg code
	org $F000  ;Define the code origin at $F000
Start:
	sei        ;Disable interrupts
	cld 	   ;Disable the Binary Coded Decimal mode
	ldx #$FF   ;loads the X register with #$FF
	


