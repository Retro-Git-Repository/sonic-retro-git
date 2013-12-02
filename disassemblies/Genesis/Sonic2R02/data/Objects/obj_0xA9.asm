;===============================================================================
; Objeto 0xA9 - Inimigo Grabber na Chemical Plant
; [ Início ]    Objeto vinculado ao 0xA7
;===============================================================================     
Offset_0x038BC4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038BD2(PC, D0), D1
                jmp     Offset_0x038BD2(PC, D1)
Offset_0x038BD2:
                dc.w    Offset_0x038BD6-Offset_0x038BD2
                dc.w    Offset_0x038BE8-Offset_0x038BD2
Offset_0x038BD6:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$02, $001A(A0)
                subi.w  #$000C, $000C(A0)
                rts
Offset_0x038BE8:
                move.w  $002C(A0), A1
                cmpi.b  #$A7, (A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                jmp     (DisplaySprite)                        ; Offset_0x01647A                                                                                                                                   
;===============================================================================
; Objeto 0xA9 - Inimigo Grabber na Chemical Plant
; [ Término ]   Objeto vinculado ao 0xA7
;===============================================================================