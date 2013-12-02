;===============================================================================
; Object 0x29 - Pontos obtidos ao destruir alguns objetos
; [ Início ]
;===============================================================================   
Offset_0x011D72:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x011D80(PC, D0), D1
                jmp     Offset_0x011D80(PC, D1)
Offset_0x011D80:
                dc.w    Offset_0x011D84-Offset_0x011D80
                dc.w    Offset_0x011DB2-Offset_0x011D80
Offset_0x011D84:
                addq.b  #$02, $0024(A0)
                move.l  #Enemy_Points_Mappings, $0004(A0)      ; Offset_0x011E7C
                move.w  #$84AC, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$01, $0018(A0)
                move.b  #$08, $0019(A0)
                move.w  #$FD00, $0012(A0)
Offset_0x011DB2:
                tst.w   $0012(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
;===============================================================================
; Object 0x29 - Pontos obtidos ao destruir alguns objetos
; [ Término ]
;===============================================================================  