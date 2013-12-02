;===============================================================================
; Objeto 0xAA - Inimigo Grabber na Chemical Plant
; [ Início ]    Objeto vinculado ao 0xA7
;===============================================================================   
Offset_0x038BFA:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038C08(PC, D0), D1
                jmp     Offset_0x038C08(PC, D1)
Offset_0x038C08:
                dc.w    Offset_0x038C0C-Offset_0x038C08
                dc.w    Offset_0x038C16-Offset_0x038C08
Offset_0x038C0C:
                bsr     ObjectSettings                         ; Offset_0x03601A
                subq.w  #$08, $000C(A0)
                rts
Offset_0x038C16:
                move.w  $002C(A0), A1
                cmpi.b  #$A7, (A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                move.w  $000C(A1), D0
                sub.w   $000C(A0), D0
                bmi.s   Offset_0x038C32
                lsr.w   #$04, D0
                move.b  D0, $001A(A0)
Offset_0x038C32:
                jmp     (DisplaySprite)                        ; Offset_0x01647A                                                                                                                       
;===============================================================================
; Objeto 0xAA - Inimigo Grabber na Chemical Plant
; [ Término ]   Objeto vinculado ao 0xA7
;===============================================================================