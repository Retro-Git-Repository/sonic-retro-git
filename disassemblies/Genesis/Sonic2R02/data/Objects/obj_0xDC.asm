;===============================================================================
; Objeto 0xDC - Anéis usados como prêmio nos caça níqueis na Casino Night
; [ Início ]
;===============================================================================     
Offset_0x01258C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01259A(PC, D0), D1
                jmp     Offset_0x01259A(PC, D1)
Offset_0x01259A:
                dc.w    Offset_0x0125A0-Offset_0x01259A
                dc.w    Offset_0x0125F2-Offset_0x01259A
                dc.w    Offset_0x0125FE-Offset_0x01259A
Offset_0x0125A0:
                moveq   #$00, D1
                move.w  $0038(A0), D1
                swap.w  D1
                move.l  $0030(A0), D0
                sub.l   D1, D0
                asr.l   #$04, D0
                sub.l   D0, $0030(A0)
                move.w  $0030(A0), $0008(A0)
                moveq   #$00, D1
                move.w  $003A(A0), D1
                swap.w  D1
                move.l  $0034(A0), D0
                sub.l   D1, D0
                asr.l   #$04, D0
                sub.l   D0, $0034(A0)
                move.w  $0034(A0), $000C(A0)
                lea     Slot_Machine_Rings_Animate_Data(PC), A1 ; Offset_0x012602
                bsr     AnimateSprite                          ; Offset_0x0164CA
                subq.w  #$01, $003C(A0)
                bne     DisplaySprite                          ; Offset_0x01647A
                move.l  $002A(A0), A1
                subq.w  #$01, (A1)
                bsr     Add_Rings                              ; Offset_0x011F66
                addq.b  #$02, $0024(A0)
Offset_0x0125F2:
                lea     Rings_Animate_Data(PC), A1             ; Offset_0x012320
                bsr     AnimateSprite                          ; Offset_0x0164CA
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0125FE:
                bra     DeleteObject                           ; Offset_0x01646C
;-------------------------------------------------------------------------------
Slot_Machine_Rings_Animate_Data: ; Offset_0x012602:                
                dc.w    Offset_0x012604-Slot_Machine_Rings_Animate_Data
Offset_0x012604:
                dc.b    $01, $00, $01, $02, $03, $FF
;===============================================================================
; Objeto 0xDC - Anéis usados como prêmio nos caça níqueis na Casino Night
; [ Término ]
;===============================================================================