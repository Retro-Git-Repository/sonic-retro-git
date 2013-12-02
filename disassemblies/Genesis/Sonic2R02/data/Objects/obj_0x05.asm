;===============================================================================
; Objeto 0x05 - Rabo do Miles
; [ Início ]
;=============================================================================== 
Offset_0x01D18C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01D19A(PC, D0), D1
                jmp     Offset_0x01D19A(PC, D1)
Offset_0x01D19A:
                dc.w    Offset_0x01D19E-Offset_0x01D19A
                dc.w    Offset_0x01D1C6-Offset_0x01D19A
Offset_0x01D19E:
                addq.b  #$02, $0024(A0)
                move.l  #Miles_Mappings, $0004(A0)             ; Offset_0x0739E2
                move.w  #$07B0, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$02, $0018(A0)
                move.b  #$18, $0019(A0)
                move.b  #$04, $0001(A0)
Offset_0x01D1C6:
                move.w  $003E(A0), A2
                move.b  $0026(A2), $0026(A0)
                move.b  $0022(A2), $0022(A0)
                move.w  $0008(A2), $0008(A0)
                move.w  $000C(A2), $000C(A0)
                andi.w  #$7FFF, $0002(A0)
                tst.w   $0002(A2)
                bpl.s   Offset_0x01D1F4
                ori.w   #$8000, $0002(A0)
Offset_0x01D1F4:
                moveq   #$00, D0
                move.b  $001C(A2), D0
                btst    #$05, $0022(A2)
                beq.s   Offset_0x01D204
                moveq   #$04, D0
Offset_0x01D204:
                cmp.b   $0030(A0), D0
                beq.s   Offset_0x01D214
                move.b  D0, $0030(A0)
                move.b  Offset_0x01D22A(PC, D0), $001C(A0)
Offset_0x01D214:
                lea     (Offset_0x01D24C), A1
                bsr     Miles_Animate_A1                       ; Offset_0x01CD46
                bsr     Load_Miles_Tail_Dynamic_PLC            ; Offset_0x01D110
                jsr     (DisplaySprite)                        ; Offset_0x01647A
                rts
;-------------------------------------------------------------------------------
Offset_0x01D22A:    
                dc.b    $00, $00, $03, $03, $09, $01, $00, $02, $01, $07, $00, $00, $00, $08, $00, $00
                dc.b    $00, $00, $00, $00, $0A, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00                
;------------------------------------------------------------------------------- 
Offset_0x01D24C:
                dc.w    Offset_0x01D262-Offset_0x01D24C
                dc.w    Offset_0x01D266-Offset_0x01D24C
                dc.w    Offset_0x01D26E-Offset_0x01D24C
                dc.w    Offset_0x01D276-Offset_0x01D24C
                dc.w    Offset_0x01D27C-Offset_0x01D24C
                dc.w    Offset_0x01D282-Offset_0x01D24C
                dc.w    Offset_0x01D288-Offset_0x01D24C
                dc.w    Offset_0x01D28E-Offset_0x01D24C
                dc.w    Offset_0x01D294-Offset_0x01D24C
                dc.w    Offset_0x01D29A-Offset_0x01D24C
                dc.w    Offset_0x01D2A0-Offset_0x01D24C
Offset_0x01D262:
                dc.b    $20, $00, $FF, $00
Offset_0x01D266:
                dc.b    $07, $09, $0A, $0B, $0C, $0D, $FF, $00
Offset_0x01D26E:
                dc.b    $03, $09, $0A, $0B, $0C, $0D, $FD, $01
Offset_0x01D276:
                dc.b    $FC, $49, $4A, $4B, $4C, $FF
Offset_0x01D27C:
                dc.b    $03, $4D, $4E, $4F, $50, $FF
Offset_0x01D282:
                dc.b    $03, $51, $52, $53, $54, $FF
Offset_0x01D288:
                dc.b    $03, $55, $56, $57, $58, $FF
Offset_0x01D28E:
                dc.b    $02, $81, $82, $83, $84, $FF
Offset_0x01D294:
                dc.b    $02, $87, $88, $89, $8A, $FF
Offset_0x01D29A:
                dc.b    $09, $87, $88, $89, $8A, $FF
Offset_0x01D2A0:
                dc.b    $09, $81, $82, $83, $84, $FF            
;===============================================================================
; Objeto 0x05 - Rabo do Miles
; [ Término ]
;===============================================================================  