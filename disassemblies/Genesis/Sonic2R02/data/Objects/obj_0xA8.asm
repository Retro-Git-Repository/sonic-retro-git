;===============================================================================
; Objeto 0xA8 - Inimigo Grabber na Chemical Plant
; [ Início ]    Objeto vinculado ao 0xA7
;===============================================================================     
Offset_0x038AF0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038AFE(PC, D0), D1
                jmp     Offset_0x038AFE(PC, D1)
Offset_0x038AFE:
                dc.w    Offset_0x038B06-Offset_0x038AFE
                dc.w    Offset_0x038B12-Offset_0x038AFE
                dc.w    Offset_0x038B74-Offset_0x038AFE
                dc.w    Offset_0x038BB2-Offset_0x038AFE
Offset_0x038B06:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$03, $001A(A0)
                rts
Offset_0x038B12:
                move.w  $002C(A0), A1
                cmpi.b  #$A7, (A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                bsr     Offset_0x0361D0
                move.w  $002C(A0), A1
                move.b  $001A(A1), D0
                addq.b  #$03, D0
                move.b  D0, $001A(A0)
                move.b  $0021(A0), D0
                beq.s   Offset_0x038B62
                clr.b   $0021(A0)
                cmpi.b  #$04, $0025(A1)
                bne.s   Offset_0x038B62
                andi.b  #$03, D0
                beq.s   Offset_0x038B62
                clr.b   $0020(A0)
                addq.b  #$02, $0024(A0)
                add.w   D0, D0
                st      $0030(A1)
                move.w  Offset_0x038B68-$02(PC, D0), $0032(A1)
                move.w  Offset_0x038B6E-$02(PC, D0), $0034(A1)
Offset_0x038B62:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x038B68:
                dc.w    $B000, $B040, $B000
Offset_0x038B6E:
                dc.w    $F604, $F606, $F604
Offset_0x038B74:
                move.w  $002C(A0), A1
                move.w  $0032(A1), D0
                beq.s   Offset_0x038BA8
                move.w  D0, A2
                cmpi.b  #$A7, (A1)
                bne.s   Offset_0x038B98
                move.w  $0008(A0), $0008(A2)
                move.w  $000C(A0), $000C(A2)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x038B98:
                move.b  #$00, $002A(A2)
                bset    #$01, $0022(A2)
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x038BA8:
                addq.b  #$02, $0024(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x038BB2:
                move.w  $002C(A0), A1
                cmpi.b  #$A7, (A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                jmp     (DisplaySprite)                        ; Offset_0x01647A                                                                                
;===============================================================================
; Objeto 0xA8 - Inimigo Grabber na Chemical Plant
; [ Término ]   Objeto vinculado ao 0xA7
;===============================================================================