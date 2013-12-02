;===============================================================================
; Objeto 0x03 - Rotina para mudar os jogadores de plano / layer
; [ Início ]
;===============================================================================  
Offset_0x01FC38:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01FC4C(PC, D0), D1
                jsr     Offset_0x01FC4C(PC, D1)
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x01FC4C:
                dc.w    Offset_0x01FC52-Offset_0x01FC4C
                dc.w    Offset_0x01FD02-Offset_0x01FC4C
                dc.w    Offset_0x01FE0C-Offset_0x01FC4C
Offset_0x01FC52:
                addq.b  #$02, $0024(A0)
                move.l  #Layer_Switch_Mappings, $0004(A0)      ; Offset_0x01FF16
                move.w  #$26BC, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$05, $0018(A0)
                move.b  $0028(A0), D0
                btst    #$02, D0
                beq.s   Offset_0x01FCCE
                addq.b  #$02, $0024(A0)
                andi.w  #$0007, D0
                move.b  D0, $001A(A0)
                andi.w  #$0003, D0
                add.w   D0, D0
                move.w  Offset_0x01FCC6(PC, D0), $0032(A0)
                move.w  $000C(A0), D1
                lea     ($FFFFB000).w, A1
                cmp.w   $000C(A1), D1
                bcc.s   Offset_0x01FCB2
                move.b  #$01, $0034(A0)
Offset_0x01FCB2:
                lea     ($FFFFB040).w, A1
                cmp.w   $000C(A1), D1
                bcc.s   Offset_0x01FCC2
                move.b  #$01, $0035(A0)
Offset_0x01FCC2:
                bra     Offset_0x01FE0C
Offset_0x01FCC6:
                dc.w    $0020, $0040, $0080, $0100 
Offset_0x01FCCE:
                andi.w  #$0003, D0
                move.b  D0, $001A(A0)
                add.w   D0, D0
                move.w  Offset_0x01FCC6(PC, D0), $0032(A0)
                move.w  $0008(A0), D1
                lea     ($FFFFB000).w, A1
                cmp.w   $0008(A1), D1
                bcc.s   Offset_0x01FCF2
                move.b  #$01, $0034(A0)
Offset_0x01FCF2:
                lea     ($FFFFB040).w, A1
                cmp.w   $0008(A1), D1
                bcc.s   Offset_0x01FD02
                move.b  #$01, $0035(A0)
Offset_0x01FD02:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x01FE0A
                move.w  $0008(A0), D1
                lea     $0034(A0), A2
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x01FD1C
                lea     ($FFFFB040).w, A1
Offset_0x01FD1C:
                tst.b   (A2)+
                bne.s   Offset_0x01FD96
                cmp.w   $0008(A1), D1
                bhi     Offset_0x01FE0A
                move.b  #$01, $FFFF(A2)
                move.w  $000C(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                blt     Offset_0x01FE0A
                cmp.w   D3, D4
                bge     Offset_0x01FE0A
                move.b  $0028(A0), D0
                bpl.s   Offset_0x01FD5C
                btst    #$01, $0022(A1)
                bne     Offset_0x01FE0A
Offset_0x01FD5C:
                btst    #$00, $0001(A0)
                bne.s   Offset_0x01FD82
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
                btst    #$03, D0
                beq.s   Offset_0x01FD82
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x01FD82:
                andi.w  #$7FFF, $0002(A1)
                btst    #$05, D0
                beq.s   Offset_0x01FE0A
                ori.w   #$8000, $0002(A1)
                bra.s   Offset_0x01FE0A
Offset_0x01FD96:
                cmp.w   $0008(A1), D1
                bls     Offset_0x01FE0A
                move.b  #$00, $FFFF(A2)
                move.w  $000C(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                blt     Offset_0x01FE0A
                cmp.w   D3, D4
                bge     Offset_0x01FE0A
                move.b  $0028(A0), D0
                bpl.s   Offset_0x01FDD2
                btst    #$01, $0022(A1)
                bne     Offset_0x01FE0A
Offset_0x01FDD2:
                btst    #$00, $0001(A0)
                bne.s   Offset_0x01FDF8
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
                btst    #$04, D0
                beq.s   Offset_0x01FDF8
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x01FDF8:
                andi.w  #$7FFF, $0002(A1)
                btst    #$06, D0
                beq.s   Offset_0x01FE0A
                ori.w   #$8000, $0002(A1)
Offset_0x01FE0A:
                rts
Offset_0x01FE0C:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x01FF14
                move.w  $000C(A0), D1
                lea     $0034(A0), A2
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x01FE26
                lea     ($FFFFB040).w, A1
Offset_0x01FE26:
                tst.b   (A2)+
                bne.s   Offset_0x01FEA0
                cmp.w   $000C(A1), D1
                bhi     Offset_0x01FF14
                move.b  #$01, $FFFF(A2)
                move.w  $0008(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $0008(A1), D4
                cmp.w   D2, D4
                blt     Offset_0x01FF14
                cmp.w   D3, D4
                bge     Offset_0x01FF14
                move.b  $0028(A0), D0
                bpl.s   Offset_0x01FE66
                btst    #$01, $0022(A1)
                bne     Offset_0x01FF14
Offset_0x01FE66:
                btst    #$00, $0001(A0)
                bne.s   Offset_0x01FE8C
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
                btst    #$03, D0
                beq.s   Offset_0x01FE8C
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x01FE8C:
                andi.w  #$7FFF, $0002(A1)
                btst    #$05, D0
                beq.s   Offset_0x01FF14
                ori.w   #$8000, $0002(A1)
                bra.s   Offset_0x01FF14
Offset_0x01FEA0:
                cmp.w   $000C(A1), D1
                bls     Offset_0x01FF14
                move.b  #$00, $FFFF(A2)
                move.w  $0008(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $0008(A1), D4
                cmp.w   D2, D4
                blt     Offset_0x01FF14
                cmp.w   D3, D4
                bge     Offset_0x01FF14
                move.b  $0028(A0), D0
                bpl.s   Offset_0x01FEDC
                btst    #$01, $0022(A1)
                bne     Offset_0x01FF14
Offset_0x01FEDC:
                btst    #$00, $0001(A0)
                bne.s   Offset_0x01FF02
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
                btst    #$04, D0
                beq.s   Offset_0x01FF02
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x01FF02:
                andi.w  #$7FFF, $0002(A1)
                btst    #$06, D0
                beq.s   Offset_0x01FF14
                ori.w   #$8000, $0002(A1)
Offset_0x01FF14:
                rts
;-------------------------------------------------------------------------------                
Layer_Switch_Mappings: ; Offset_0x01FF16:                
                dc.w    Offset_0x01FF26-Layer_Switch_Mappings
                dc.w    Offset_0x01FF48-Layer_Switch_Mappings
                dc.w    Offset_0x01FF6A-Layer_Switch_Mappings
                dc.w    Offset_0x01FF6A-Layer_Switch_Mappings
                dc.w    Offset_0x01FF8C-Layer_Switch_Mappings
                dc.w    Offset_0x01FFAE-Layer_Switch_Mappings
                dc.w    Offset_0x01FFD0-Layer_Switch_Mappings
                dc.w    Offset_0x01FFD0-Layer_Switch_Mappings
Offset_0x01FF26:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8, $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $10050000, $0000FFF8
Offset_0x01FF48:
                dc.w    $0004
                dc.l    $C0050000, $0000FFF8, $E0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $30050000, $0000FFF8
Offset_0x01FF6A:
                dc.w    $0004
                dc.l    $80050000, $0000FFF8, $E0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $70050000, $0000FFF8
Offset_0x01FF8C:
                dc.w    $0004
                dc.l    $F8050000, $0000FFE0, $F8050000, $0000FFF0
                dc.l    $F8050000, $00000000, $F8050000, $00000010
Offset_0x01FFAE:
                dc.w    $0004
                dc.l    $F8050000, $0000FFC0, $F8050000, $0000FFE0
                dc.l    $F8050000, $00000000, $F8050000, $00000030
Offset_0x01FFD0:
                dc.w    $0004
                dc.l    $F8050000, $0000FF80, $F8050000, $0000FFE0
                dc.l    $F8050000, $00000000, $F8050000, $00000070
;===============================================================================
; Objeto 0x03 - Rotina para mudar os jogadores de plano / layer
; [ Término ]
;===============================================================================  