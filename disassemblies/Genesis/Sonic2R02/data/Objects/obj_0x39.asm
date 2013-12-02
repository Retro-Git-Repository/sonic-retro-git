;===============================================================================
; Objeto 0x39 - Objeto de controle para fim de jogo e limite de tempo
; [ Início ]              
;===============================================================================  
Offset_0x013F12:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x013F20(PC, D0), D1
                jmp     Offset_0x013F20(PC, D1)
Offset_0x013F20:
                dc.w    Offset_0x013F26-Offset_0x013F20
                dc.w    Offset_0x013F6A-Offset_0x013F20
                dc.w    Offset_0x013F8C-Offset_0x013F20
Offset_0x013F26:
                tst.l   ($FFFFF680).w
                beq.s   Offset_0x013F2E
                rts
Offset_0x013F2E:
                addq.b  #$02, $0024(A0)
                move.w  #$0050, $0008(A0)
                btst    #$00, $001A(A0)
                beq.s   Offset_0x013F46
                move.w  #$01F0, $0008(A0)
Offset_0x013F46:
                move.w  #$00F0, $000A(A0)
                move.l  #Time_Over_Game_Over_Mappings, $0004(A0) ; Offset_0x014C0A
                move.w  #$84DE, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$00, $0001(A0)
                move.b  #$00, $0018(A0)
Offset_0x013F6A:
                moveq   #$10, D1
                cmpi.w  #$0120, $0008(A0)
                beq.s   Offset_0x013F80
                bcs.s   Offset_0x013F78
                neg.w   D1
Offset_0x013F78:
                add.w   D1, $0008(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x013F80:
                move.w  #$02D0, $001E(A0)
                addq.b  #$02, $0024(A0)
                rts
Offset_0x013F8C:
                btst    #$00, $001A(A0)
                bne     Offset_0x014022
                move.b  ($FFFFF605).w, D0
                or.b    ($FFFFF607).w, D0
                andi.b  #$70, D0
                bne.s   Offset_0x013FB2
                tst.w   $001E(A0)
                beq.s   Offset_0x013FB2
                subq.w  #$01, $001E(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x013FB2:
                tst.b   ($FFFFFE1A).w
                bne.s   Offset_0x013FD2
                tst.b   ($FFFFFECC).w
                bne.s   Offset_0x013FD2
                move.b  #gm_Continue, (Game_Mode).w             ; $14, $FFFFF600
                tst.b   ($FFFFFE18).w
                bne.s   Offset_0x013FDC
                move.b  #gm_SegaScreen, (Game_Mode).w           ; $00, $FFFFF600
                bra.s   Offset_0x013FDC
Offset_0x013FD2:
                clr.l   ($FFFFFE38).w
                move.w  #$0001, ($FFFFFE02).w
Offset_0x013FDC:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x014022
                move.w  #$0000, ($FFFFFE02).w
                move.b  #gm_Two_Player_Results, (Game_Mode).w   ; $18, $FFFFF600
                move.w  #$0000, ($FFFFFF10).w
                tst.b   ($FFFFFE1A).w
                bne.s   Offset_0x014022
                tst.b   ($FFFFFECC).w
                bne.s   Offset_0x014022
                move.w  #$0001, ($FFFFFF78).w
                move.w  #$0001, ($FFFFFF10).w
                jsr     (Offset_0x0083F8)
                move.w  #$FFFF, (A4)
                tst.b   $003F(A0)
                beq.s   Offset_0x01401E
                addq.w  #$01, A4
Offset_0x01401E:
                move.b  #$FE, (A4)
Offset_0x014022:
                bra     DisplaySprite                          ; Offset_0x01647A  
;===============================================================================
; Objeto 0x39 - Objeto de controle para fim de jogo e limite de tempo
; [ Término ]          
;===============================================================================  