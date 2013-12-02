;===============================================================================
; Objeto 0x0F - Seleção de modos na tela titulo 1 Player / 2 Player Vs / Options
; [ Início ]
;===============================================================================  
Offset_0x0135A6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0135B8(PC, D0), D1
                jsr     Offset_0x0135B8(PC, D1)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0135B8:
                dc.w    Offset_0x0135BC-Offset_0x0135B8
                dc.w    Offset_0x0135EA-Offset_0x0135B8
Offset_0x0135BC:
                addq.b  #$02, $0024(A0)
                move.w  #$0128, $0008(A0)
                move.w  #$014C, $000A(A0)
                move.l  #_1Player2Vs_Options_Mappings, $0004(A0) ; Offset_0x013B18
                move.w  #$0000, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                andi.b  #$01, ($FFFFFF66).w
                move.b  ($FFFFFF66).w, $001A(A0)
Offset_0x0135EA:
                moveq   #$00, D2
                move.b  ($FFFFFF66).w, D2
                move.b  ($FFFFF605).w, D0
                or.b    ($FFFFF607).w, D0
                btst    #$00, D0
                beq.s   Offset_0x013606
                subq.b  #$01, D2
                bcc.s   Offset_0x013606
                move.b  #$02, D2
Offset_0x013606:
                btst    #$01, D0
                beq.s   Offset_0x013616
                addq.b  #$01, D2
                cmpi.b  #$03, D2
                bcs.s   Offset_0x013616
                moveq   #$00, D2
Offset_0x013616:
                move.b  D2, $001A(A0)
                move.b  D2, ($FFFFFF66).w
                andi.b  #$03, D0
                beq.s   Offset_0x01362C
                moveq   #Select_Sfx, D0                              ; $FFFFFFCD
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x01362C:
                rts
;===============================================================================
; Objeto 0x0F - Seleção de modos na tela titulo 1 Player / 2 Player Vs / Options
; [ Término ]
;===============================================================================  