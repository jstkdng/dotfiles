" Vim syntax file
" Language:     Avr 8bit Assembler (Atmel's microcontroller)
" Maintainer:   Alfred Hell <alhell@ajhe.eu>
" Last Change:  2017 1 1
" Revision:     1.31
" for M8, M16, M162, M48, M88, M168, M328, 4434, M8535, M8515
" M164 M324 M644 M1284 M165 M325 M3250 M645 M6450
" M32 M64 M128 M640 M1280 M1281 M2560 M2561
" Tiny26 Tiny10 Tiny11 Tiny12 Tiny13 TINY15 Tiny25 Tiny45 Tiny85
" TINY22 Tiny24 Tiny44 Tiny84 ATTiny2313 Tiny261 Tiny461 Tiny861

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword avrTodo NOTE TODO XXX contained

" Directives
syn match avrDirective		"\.[a-z]\+"

syn match avrIdentifier 	"[a-z_$][a-z0-9_$]*"
syn match avrLabel      	"^[A-Z_$][A-Z0-9_$]*:"

syn match decNumber		"0\+[1-7]\=[\t\n$,; ]"
syn match decNumber		"[0-9]\d*"
syn match octNumber		"0[oO][0-7]\+"
syn match octNumber		"0[0-7][0-7]\+"
syn match hexNumber		"0[xX][0-9A-Fa-f]\+"
syn match hexNumber     	"\$[0-9A-Fa-f]\+\>"
syn match binNumber		"0[bB][0-1]*"

syn match avrComment    	";.*" contains=avrTodo

syn region avrString    	start=+"+ end=+"+

" REGISTER
syn keyword avrRegister		SREG SPH SPL SPMCR ASSR WDTCR SMCR XDIV ACSRA EIND
syn keyword avrRegister		MCUCR MCUCSR OSCCAL OCDR SFIOR ACSR EMCUCR WDTCSR
syn keyword avrRegister		SPMCSR MCUSR CLKPR DIDR DIDR0 DIDR1 DIDR2 XMCRA
syn keyword avrRegister		GTCCR  GPIOR2 GPIOR1 GPIOR0 SP DWDR XMCRB PRR0
syn keyword avrRegister		RAMPZ PLLCSR DT1A DT1B DTPS1 PRR DT1 ACSRB PRR1

" EEPROM
syn keyword avrRegister         EEARH EEARL EEDR EECR EEAR

" PORT
syn match avrRegister           "PORT[A-L]" 
syn match avrRegister           "DDR[A-L]" 
syn match avrRegister           "PIN[A-L]" 

" INT
syn match avrRegister           "TIMSK[0-5]" 
syn match avrRegister           "TIFR[0-5]" 
syn keyword avrRegister         GICR GIFR TIMSK TIFR TWCR EIFR PCMSK EICRA
syn keyword avrRegister         PCMSK3 PCMSK2 PCMSK1 PCMSK0 PCICR
syn keyword avrRegister		EIMSK PCIFR ETIMSK ETIFR EICRB

" TiCou
syn keyword avrRegister         TCCR1A TCCR1B TCNT1H TCNT1L OCR1AH OCR1AL OCR1BH 
syn keyword avrRegister         OCR1BL ICR1H ICR1L TCCR2 TCNT2 OCR2 TCCR0 TCNT0 TCCR1E
syn keyword avrRegister         GIMSK ICR1H ICR1L TCCR0B TCCR0A TCCR1C OCR0 TCCR1
syn keyword avrRegister         OCR0B OCR0A OCR2A OCR2B TCCR2A TCCR2B OCR1C TCNT1
syn keyword avrRegister         OCR3BH OCR3AH OCR3AL OCR3BL TCCR3A TCCR3B TCCR3C
syn keyword avrRegister         TCNT3H TCNT3L ICR3H ICR3L OCR3CL OCR3CH OCR1CH OCR1CL
syn keyword avrRegister         OCR1A OCR1B TCCR1D TCNT0L OCR1D TC1H TCNT0H
syn keyword avrRegister         OCR5CH OCR5CL OCR5BH OCR5BL OCR5AH OCR5AL ICR5H ICR5L
syn keyword avrRegister         TCNT5H TCNT5L TCCR5C TCCR5B TCCR5A OCR4CH OCR4CL
syn keyword avrRegister         OCR4BH OCR4BL OCR4AH OCR4AL ICR4H ICR4L TCNT4H TCNT4L
syn keyword avrRegister         TCCR4C TCCR4B TCCR4A

" UART
syn keyword avrRegister         UDR UDR1 UDR0 UCSRA UCSRB UBRRL UCSRC UBRRH UBRR1H
syn keyword avrRegister         UBRR1L UCSR1A UCSR1B UCSR1C UBRR0H UBRR0L UCSR0C UDR2
syn keyword avrRegister		UCSR0B UCSR0A UDR3 UBRR3H UBRR3L UCSR3C UCSR3A UCSR3B
syn keyword avrRegister		UBRR2H UBRR2L UCSR2C UCSR2B UCSR2A

" ADC
syn keyword avrRegister         ADMUX ADCSRA ADCSRB ADCH ADCL ADCSR

" USI
syn keyword avrRegister         USIDR USISR USICR USIBR USIPP 

" SPI
syn keyword avrRegister         SPDR SPSR SPCR 

" TWI
syn keyword avrRegister         TWDR TWAR TWSR TWBR TWAMR TWCR 

" Rx
syn match avrRegister           "\<[Rr]\([0-9]\|[0-2][0-9]\|30\|31\)\>" 
syn keyword avrRegister 	ZL ZH YL YH XL XH X Y Z
setlocal iskeyword+=-
setlocal iskeyword+=+
syn keyword avrRegister X- Y- Z- -X -Y -Z +X +Y +Z X+ Y+ Z+


" REGISTER BITS
syn match avrRegisterPart	"\<PCINT\([0-9]\|[1-2][0-9]\|3[0-1]\)\>"
syn match avrRegisterPart	"CAL[0-7]"
syn match avrRegisterPart	"TWA[0-6]"
syn match avrRegisterPart	"TWS[0-7]"
syn match avrRegisterPart	"TWAM[0-6]"
syn match avrRegisterPart	"PORT[A-L][0-7]"
syn match avrRegisterPart	"DDR[A-L][0-7]"
syn match avrRegisterPart	"PIN[A-L][0-7]"
syn match avrRegisterPart	"P[A-L][0-7]"
syn match avrRegisterPart	"\<ADC\([0-9]D\|1[0-5]D\)\>"
syn match avrRegisterPart	"MUX[0-5]"
syn match avrRegisterPart	"CLKPS[0-3]"
syn match avrRegisterPart	"EEAR[0-8]"
syn match avrRegisterPart	"XDIV[0-6]"
syn match avrRegisterPart	"\<ISC\([0-2]\|[0-7][0-1]\)\>"
syn match avrRegisterPart	"INT[0-7]"
syn match avrRegisterPart	"INTF[0-7]"
syn match avrRegisterPart	"\<SP\([0-9]\|1[0-5]\)\>"
syn match avrRegisterPart	"\<DT1\([A-B]H[0-3]\|[A-B]L[0-3]\|H[0-3]\|L[0-3]\)\>"
syn match avrRegisterPart	"DT1L[0-3]"
syn match avrRegisterPart	"DWDR[0-7]"
syn match avrRegisterPart	"WDP[0-3]"
syn match avrRegisterPart	"USICNT[0-3]"
syn match avrRegisterPart	"ACM[0-2]"
syn match avrRegisterPart	"ADPS[0-2]"
syn match avrRegisterPart	"OC1OE[0-5]"
syn match avrRegisterPart	"WGM[0-5][0-3]"
syn match avrRegisterPart	"OCIE[0-5][A-C]"
syn match avrRegisterPart	"TOIE[0-5]"
syn match avrRegisterPart	"PRTIM[0-5]"
syn match avrRegisterPart	"PRUSART[0-3]"
syn match avrRegisterPart	"OCDR[0-7]"
syn match avrRegisterPart	"PCIF[0-3]"
syn match avrRegisterPart	"ICF[0-5]"
syn match avrRegisterPart	"OCF[0-5][A-C]"
syn match avrRegisterPart	"TOV[0-5]"
syn match avrRegisterPart	"CS[0-2][0-2]"


" eeprom
syn keyword avrRegisterPart     EERIE EEMWE EEWE EERE 
syn keyword avrRegisterPart     EEPE EEMPE EEPM1 EEPM0  

" UART
syn keyword avrRegisterPart     RXC TXC UDRE FE OR DOR PE U2X MPCM RXCIE TXCIE UDRIE 
syn keyword avrRegisterPart     RXEN TXEN UCSZ2 RXB8 TXB8 UMSEL01 UMSEL00 CHR9 UPE
syn keyword avrRegisterPart     UPM01 UPM00 USBS0 UDORD0 UCPHA0 UCPOL0 RXCIE0 TXCIE0
syn keyword avrRegisterPart     UDRIE0 RXEN0 TXEN0 UCSZ02 RXB80 TXB80 RXC0 TXC0 UDRE0 
syn keyword avrRegisterPart     FE0 DOR0 UPE0 U2X0 MPCM0 URSEL UMSEL UPM1 UPM0 USBS
syn keyword avrRegisterPart	UCSZ11 UCSZ10 UCPOL1 RXCIE1 TXCIE1 UDRIE1 RXEN1 TXEN1
syn keyword avrRegisterPart	UCSZ12 RXB81 TXB81 RXC1 TXC1 UDRE1 FE1 DOR1 UPE1 U2X1
syn keyword avrRegisterPart	MPCM1 UCSZ01 UCSZ00 UMSEL31 UMSEL30 UPM31 UPM30 USBS3
syn keyword avrRegisterPart	UCSZ0 UCSZ1 UCSZ31 UCSZ30 UCPOL UCPOL3 RXCIE3 RXEN3
syn keyword avrRegisterPart	RXB83 TXCIE3 TXEN3 TXB83 UDRIE3 UCSZ32 RXC3 TXC3 UDRE3
syn keyword avrRegisterPart	FE3 DOR3 UPE3 U2X3 MPCM3 UMSEL20 UMSEL21 UPM21 UPM20
syn keyword avrRegisterPart	USBS2 UCSZ21 UCSZ20 UCPOL2 RXCIE2 TXCIE2 UDRIE2 RXEN2
syn keyword avrRegisterPart	TXEN2 UCSZ22 RXB82 TXB82 RXC2 TXC2 UDRE2 FE2 DOR2 UPE2
syn keyword avrRegisterPart	U2X2 MPCM2 UMSEL11 UMSEL10 UPM11 UPM10 USBS1 

" On Chip Debug Register
syn keyword avrRegisterPart     ACD ACBG ACO ACI ACIE ACIC ACIS1 ACIS0 ACIC0 ACME 

" ADC
syn keyword avrRegisterPart     REFS1 REFS0 ADLAR BIN REFS2 GSEL AREFD
syn keyword avrRegisterPart     ADEN ADSC ADATE ADIF ADIE ADFR
syn keyword avrRegisterPart     ADTS2 ADTS1 ADTS0  

" TWI				
syn keyword avrRegisterPart     TWGCE TWPS1 TWPS0 SPIF WCOL SPI2X WCOL0 CPHA0
syn keyword avrRegisterPart     SPIE SPE DORD MSTR CPOL CPHA SPR1 SPR0 CPOL0
syn keyword avrRegisterPart     TWWC TWEN TWIE SPIE0 SPE0 DORD0 MSTR0
syn keyword avrRegisterPart     TWINT TWEA TWSTA TWSTO TWWC TWEN TWIE SPR00 SPR01

" TimerCounter
syn keyword avrRegisterPart     FOC0 COM01 COM00 PSR10 PSR0 PSR1 
syn keyword avrRegisterPart     COM1A0 COM1B1 COM1B0 FOC1A FOC1B COM1A1 FOC4A FOC4B
syn keyword avrRegisterPart     ICNC1 ICES1 CS13 FOC4C ICNC4
syn keyword avrRegisterPart     FOC2 COM21 COM20 OCF0 TICIE3 PWM1
syn keyword avrRegisterPart     AS2 OCR2UB TCR2UB PSR2 FOC2A FOC2B ICES4
syn keyword avrRegisterPart     TWINT TWEA TWSTA SPMIE RWWSB PWM1A PWM1B CTC1 
syn keyword avrRegisterPart     RFLB FOC0B CTC0 TICIE1 OCIE0 OCF2
syn keyword avrRegisterPart     COM0A1 COM0A0 COM0B0 COM0B1 PCIE0 PCIE
syn keyword avrRegisterPart     CLKPCE FOC0A PCIE2 PCIE1 FOC3A FOC3B FOC3C
syn keyword avrRegisterPart     TCN2UB OCR2AUB OCR2BUB TCR2AUB TCR2BUB 
syn keyword avrRegisterPart	COM2A1 COM2A0 COM2B1 COM2B0 COM3A1 COM3A0 COM3B1 COM3B0
syn keyword avrRegisterPart	ICNC3 ICES3 CS32 CS31 CS30 CS52 CS51 CS50 CS42 CS41 CS40
syn keyword avrRegisterPart	COM3C0 COM3C1 OCIE2 FOC1C OCIE1D TICIE0 
syn keyword avrRegisterPart	OCF1D PWM1C COM1A1S COM1A0S COM1B0S COM1B1S COM1D1
syn keyword avrRegisterPart	COM1D0 FOC1D PWM1D FPIE1 FPEN1 FPNC1 FPES1 FPAC1 FPF1
syn keyword avrRegisterPart	TC19 TC18 TCW0 ICEN0 ICNC0 ICES0 FOC5A FOC5B FOC5C
syn keyword avrRegisterPart	ICNC5 ICES5 COM5A1 COM5A0 COM5B1 COM5B0 COM5C1 COM5C0
syn keyword avrRegisterPart	COM4A1 COM4A0 COM4B1 COM4B0 COM4C1 COM4C0 COM1C1 COM1C0
syn keyword avrRegisterPart	ICIE5 ICIE4 ICIE3 ICIE1
syn keyword avrRegisterPart	COM4A1 COM4A0 COM4B1 COM4B0 COM4C1 COM4C0 COM1C1 COM1C0

" other
syn keyword avrRegisterPart     SM2 SE SM1 SM0 PCKE PLLE PLOCK SM AINBG LSM IPR
syn keyword avrRegisterPart     JTD JTRF WDRF BORF EXTRF PORF DTPS11 DTPS10
syn keyword avrRegisterPart     ADTS2 ADTS1 ADTS0 ADHSM PUD CTPB SRL2 SRL1 SRL0
syn keyword avrRegisterPart     WDTOE WDE RSIG HSEL HLEV SRE EIND0
syn keyword avrRegisterPart     PCIF RFLB WDIF WDIE RWWSRE BLBSET PGWRT PGERS SPMEN 
syn keyword avrRegisterPart     WDCE USISF USIOIF USIPF USIDC JRTF USISIF 
syn keyword avrRegisterPart     USISIE USIOIE USIWM1 PRADC SELFPRGEN
syn keyword avrRegisterPart     USIWM0 USICS1 USICS0 USICLK USITC AIN1D AIN0D PRUSI
syn keyword avrRegisterPart     TWS3 TWPS1 TWPS0 EXCLK AS2 TWGCEADFR
syn keyword avrRegisterPart     IVSEL IVCE TSM PSRASY PSRSYNC JDT BODS BODSE 
syn keyword avrRegisterPart     RAMPZ0 RAMPZ1 SRW11 SRW10 PRTWI PRSPI SIGRD
syn keyword avrRegisterPart     SRW00 SRW01 SRW11 ICS2 XMBK XMM2 XMM1 XMM0 XDIVEN



" OpCodes...
syn keyword avrOpcode  		ADD ADC ADIW SUB SUBI SBC SBCI SBIW AND ANDI OR ORI EOR
syn keyword avrOpcode  		COM NEG SBR CBR INC DEC TST CLR SER MUL MULS MULSU FMUL
syn keyword avrOpcode  		FMULS FMULSU RJMP IJMP EIJMP JMP RCALL ICALL EICALL CALL
syn keyword avrOpcode  		RET RETI CPSE CP CPC CPI SBRC SBRS SBIC SBIS BRBS BRBC
syn keyword avrOpcode  		BREQ BRNE BRCS BRCC BRSH BRLO BRMI BRPL BRGE BRLT BRHS
syn keyword avrOpcode  		BRHC BRTS BRTC BRVS BRVC BRIE BRID SBI CBI LSL LSR ROL 
syn keyword avrOpcode  		ROR ASR SWAP BSET BCLR BST BLD SEC CLC SEN CLN SEZ CLZ 
syn keyword avrOpcode  		SEI CLI SES CLS SEV CLV SET CLT SEH CLH MOV MOVW LDI LD 
syn keyword avrOpcode  		LDD LDS ST STD STS LPM ELPM SPM IN OUT PUSH POP 
syn keyword avrOpcode  		NOP SLEEP WDR BREAK


syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_avr_syntax_inits")
  if version < 508
    let did_avr_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink avrTodo		Todo
  HiLink avrComment		Comment
  HiLink avrDirective		PreProc
  HiLink avrLabel		Label
  HiLink avrString		String
  HiLink avrOpcode		Statement
  HiLink avrRegister		StorageClass
  HiLink avrRegisterPart	Special
  HiLink hexNumber		Number
  HiLink decNumber		Number
  HiLink octNumber		Number
  HiLink binNumber		Number
  HiLink avrIdentifier		Identifier

  delcommand HiLink
endif

let b:current_syntax = "avr8bit"

" vim: ts=8
