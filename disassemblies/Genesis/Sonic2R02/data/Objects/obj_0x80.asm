;===============================================================================
; Objeto 0x80 - Corrente com gancho na Wing Fortress. 
; [ Início ]    Raízes que pode se pendurar na Mystic Cave.
;=============================================================================== 
Offset_0x029654:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x029662(PC, D0), D1
                jmp     Offset_0x029662(PC, D1)
Offset_0x029662:
                dc.w    Offset_0x029668-Offset_0x029662
                dc.w    Offset_0x029742-Offset_0x029662
                dc.w    Offset_0x0298D8-Offset_0x029662
Offset_0x029668:
                addq.b  #$02, $0024(A0)
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                move.b  #$80, $0016(A0)
                bset    #$04, $0001(A0)
                move.w  $000C(A0), $003C(A0)
                cmpi.b  #$06, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x0296F6
                addq.b  #$02, $0024(A0)
                move.l  #Chain_Hook_Mappings, $0004(A0)        ; Offset_0x029AB0
                move.w  #$23FE, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.w  #$00A0, $002E(A0)
                move.b  $0028(A0), D0
                move.b  D0, D1
                andi.b  #$0F, D0
                beq.s   Offset_0x0296C8
                move.w  #$0060, $002E(A0)
Offset_0x0296C8:
                move.b  $0028(A0), D0
                move.w  #$0002, $003A(A0)
                andi.b  #$70, D1
                beq.s   Offset_0x0296F2
                move.w  $002E(A0), D0
                move.w  D0, $0038(A0)
                move.b  #$01, $0036(A0)
                add.w   D0, $000C(A0)
                lsr.w   #$04, D0
                addq.w  #$01, D0
                move.b  D0, $001A(A0)
Offset_0x0296F2:
                bra     Offset_0x0298D8
Offset_0x0296F6:
                move.l  #Vines_Mappings, $0004(A0)             ; Offset_0x029944
                move.w  #$641E, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.w  #$00B0, $002E(A0)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x02971C
                move.b  #$01, $0034(A0)
Offset_0x02971C:
                move.w  #$0002, $003A(A0)
                andi.b  #$70, D0
                beq.s   Offset_0x029742
                move.w  $002E(A0), D0
                move.w  D0, $0038(A0)
                move.b  #$01, $0036(A0)
                add.w   D0, $000C(A0)
                lsr.w   #$05, D0
                addq.w  #$01, D0
                move.b  D0, $001A(A0)
Offset_0x029742:
                tst.b   $0036(A0)
                beq.s   Offset_0x029750
                tst.w   $0030(A0)
                bne.s   Offset_0x029766
                bra.s   Offset_0x029756
Offset_0x029750:
                tst.w   $0030(A0)
                beq.s   Offset_0x029766
Offset_0x029756:
                move.w  $0038(A0), D2
                cmp.w   $002E(A0), D2
                beq.s   Offset_0x02978A
                add.w   $003A(A0), D2
                bra.s   Offset_0x029770
Offset_0x029766:
                move.w  $0038(A0), D2
                beq.s   Offset_0x02978A
                sub.w   $003A(A0), D2
Offset_0x029770:
                move.w  D2, $0038(A0)
                move.w  $003C(A0), D0
                add.w   D2, D0
                move.w  D0, $000C(A0)
                move.w  D2, D0
                beq.s   Offset_0x029786
                lsr.w   #$05, D0
                addq.w  #$01, D0
Offset_0x029786:
                move.b  D0, $001A(A0)
Offset_0x02978A:
                lea     $0030(A0), A2
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF604).w, D0
                bsr.s   Offset_0x0297AA
                lea     ($FFFFB040).w, A1
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D0
                bsr.s   Offset_0x0297AA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0297AA:
                tst.b   (A2)
                beq     Offset_0x02983C
                tst.b   $0001(A1)
                bpl.s   Offset_0x029820
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x029820
                andi.b  #$70, D0
                beq     Offset_0x02982E
                clr.b   $002A(A1)
                clr.b   (A2)
                move.b  #$12, $0002(A2)
                andi.w  #$0F00, D0
                beq     Offset_0x0297E0
                move.b  #$3C, $0002(A2)
Offset_0x0297E0:
                btst    #$0A, D0
                beq.s   Offset_0x0297EC
                move.w  #$FE00, $0010(A1)
Offset_0x0297EC:
                btst    #$0B, D0
                beq.s   Offset_0x0297F8
                move.w  #$0200, $0010(A1)
Offset_0x0297F8:
                move.w  #$FC80, $0012(A1)
                bset    #$01, $0022(A1)
                tst.b   $0034(A0)
                beq.s   Offset_0x02981E
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                lea     ($FFFFF7E0).w, A3
                lea     $00(A3, D0), A3
                bclr    #$00, (A3)
Offset_0x02981E:
                rts
Offset_0x029820:
                clr.b   $002A(A1)
                clr.b   (A2)
                move.b  #$3C, $0002(A2)
                rts
Offset_0x02982E:
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0094, $000C(A1)
                rts
Offset_0x02983C:
                tst.b   $0002(A2)
                beq.s   Offset_0x02984A
                subq.b  #$01, $0002(A2)
                bne     Offset_0x0298D6
Offset_0x02984A:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$0010, D0
                cmpi.w  #$0020, D0
                bcc     Offset_0x0298D6
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                subi.w  #$0088, D1
                cmpi.w  #$0018, D1
                bcc     Offset_0x0298D6
                tst.b   $002A(A1)
                bmi.s   Offset_0x0298D6
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x0298D6
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x0298D6
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                clr.w   $0014(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0094, $000C(A1)
                move.b  #$14, $001C(A1)
                move.b  #$01, $002A(A1)
                move.b  #$01, (A2)
                tst.b   $0034(A0)
                beq.s   Offset_0x0298D6
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                lea     ($FFFFF7E0).w, A3
                bset    #$00, $00(A3, D0)
                move.w  #Switch_Pressed_Sfx, D0 ; $00CD
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0298D6:
                rts
Offset_0x0298D8:
                tst.b   $0036(A0)
                beq.s   Offset_0x0298E6
                tst.w   $0030(A0)
                bne.s   Offset_0x0298FC
                bra.s   Offset_0x0298EC
Offset_0x0298E6:
                tst.w   $0030(A0)
                beq.s   Offset_0x0298FC
Offset_0x0298EC:
                move.w  $0038(A0), D2
                cmp.w   $002E(A0), D2
                beq.s   Offset_0x029920
                add.w   $003A(A0), D2
                bra.s   Offset_0x029906
Offset_0x0298FC:
                move.w  $0038(A0), D2
                beq.s   Offset_0x029920
                sub.w   $003A(A0), D2
Offset_0x029906:
                move.w  D2, $0038(A0)
                move.w  $003C(A0), D0
                add.w   D2, D0
                move.w  D0, $000C(A0)
                move.w  D2, D0
                beq.s   Offset_0x02991C
                lsr.w   #$04, D0
                addq.w  #$01, D0
Offset_0x02991C:
                move.b  D0, $001A(A0)
Offset_0x029920:
                lea     $0030(A0), A2
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF604).w, D0
                bsr     Offset_0x0297AA
                lea     ($FFFFB040).w, A1
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D0
                bsr     Offset_0x0297AA
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Vines_Mappings: ; Offset_0x029944:
                dc.w    Offset_0x029952-Vines_Mappings
                dc.w    Offset_0x02996C-Vines_Mappings
                dc.w    Offset_0x02998E-Vines_Mappings
                dc.w    Offset_0x0299B8-Vines_Mappings
                dc.w    Offset_0x0299EA-Vines_Mappings
                dc.w    Offset_0x029A24-Vines_Mappings
                dc.w    Offset_0x029A66-Vines_Mappings
Offset_0x029952:
                dc.w    $0003
                dc.l    $30030000, $0000FFFC, $50030000, $0000FFFC
                dc.l    $70090004, $0002FFF4
Offset_0x02996C:
                dc.w    $0004
                dc.l    $10030000, $0000FFFC, $30030000, $0000FFFC
                dc.l    $50030000, $0000FFFC, $70090004, $0002FFF4
Offset_0x02998E:
                dc.w    $0005
                dc.l    $F0030000, $0000FFFC, $10030000, $0000FFFC
                dc.l    $30030000, $0000FFFC, $50030000, $0000FFFC
                dc.l    $70090004, $0002FFF4
Offset_0x0299B8:
                dc.w    $0006
                dc.l    $D0030000, $0000FFFC, $F0030000, $0000FFFC
                dc.l    $10030000, $0000FFFC, $30030000, $0000FFFC
                dc.l    $50030000, $0000FFFC, $70090004, $0002FFF4
Offset_0x0299EA:
                dc.w    $0007
                dc.l    $B0030000, $0000FFFC, $D0030000, $0000FFFC
                dc.l    $F0030000, $0000FFFC, $10030000, $0000FFFC
                dc.l    $30030000, $0000FFFC, $50030000, $0000FFFC
                dc.l    $70090004, $0002FFF4
Offset_0x029A24:
                dc.w    $0008
                dc.l    $90030000, $0000FFFC, $B0030000, $0000FFFC
                dc.l    $D0030000, $0000FFFC, $F0030000, $0000FFFC
                dc.l    $10030000, $0000FFFC, $30030000, $0000FFFC
                dc.l    $50030000, $0000FFFC, $70090004, $0002FFF4
Offset_0x029A66:
                dc.w    $0009
                dc.l    $80010002, $0001FFFC, $90030000, $0000FFFC
                dc.l    $B0030000, $0000FFFC, $D0030000, $0000FFFC
                dc.l    $F0030000, $0000FFFC, $10030000, $0000FFFC
                dc.l    $30030000, $0000FFFC, $50030000, $0000FFFC
                dc.l    $70090004, $0002FFF4
;-------------------------------------------------------------------------------
Chain_Hook_Mappings: ; Offset_0x029AB0:
                dc.w    Offset_0x029ACA-Chain_Hook_Mappings
                dc.w    Offset_0x029ADC-Chain_Hook_Mappings
                dc.w    Offset_0x029AEE-Chain_Hook_Mappings
                dc.w    Offset_0x029B08-Chain_Hook_Mappings
                dc.w    Offset_0x029B22-Chain_Hook_Mappings
                dc.w    Offset_0x029B44-Chain_Hook_Mappings
                dc.w    Offset_0x029B66-Chain_Hook_Mappings
                dc.w    Offset_0x029B90-Chain_Hook_Mappings
                dc.w    Offset_0x029BBA-Chain_Hook_Mappings
                dc.w    Offset_0x029BEC-Chain_Hook_Mappings
                dc.w    Offset_0x029C1E-Chain_Hook_Mappings
                dc.w    Offset_0x029C58-Chain_Hook_Mappings
                dc.w    Offset_0x029C92-Chain_Hook_Mappings
Offset_0x029ACA:
                dc.w    $0002
                dc.l    $50010000, $0000FFFC, $600B0004, $0002FFF4
Offset_0x029ADC:
                dc.w    $0002
                dc.l    $40030000, $0000FFFC, $600B0004, $0002FFF4
Offset_0x029AEE:
                dc.w    $0003
                dc.l    $30010000, $0000FFFC, $40030000, $0000FFFC
                dc.l    $600B0004, $0002FFF4
Offset_0x029B08:
                dc.w    $0003
                dc.l    $20030000, $0000FFFC, $40030000, $0000FFFC
                dc.l    $600B0004, $0002FFF4
Offset_0x029B22:
                dc.w    $0004
                dc.l    $10010000, $0000FFFC, $20030000, $0000FFFC
                dc.l    $40030000, $0000FFFC, $600B0004, $0002FFF4
Offset_0x029B44:
                dc.w    $0004
                dc.l    $00030000, $0000FFFC, $20030000, $0000FFFC
                dc.l    $40030000, $0000FFFC, $600B0004, $0002FFF4
Offset_0x029B66:
                dc.w    $0005
                dc.l    $F0010000, $0000FFFC, $00030000, $0000FFFC
                dc.l    $20030000, $0000FFFC, $40030000, $0000FFFC
                dc.l    $600B0004, $0002FFF4
Offset_0x029B90:
                dc.w    $0005
                dc.l    $E0030000, $0000FFFC, $00030000, $0000FFFC
                dc.l    $20030000, $0000FFFC, $40030000, $0000FFFC
                dc.l    $600B0004, $0002FFF4
Offset_0x029BBA:
                dc.w    $0006
                dc.l    $D0010000, $0000FFFC, $E0030000, $0000FFFC
                dc.l    $00030000, $0000FFFC, $20030000, $0000FFFC
                dc.l    $40030000, $0000FFFC, $600B0004, $0002FFF4
Offset_0x029BEC:
                dc.w    $0006
                dc.l    $C0030000, $0000FFFC, $E0030000, $0000FFFC
                dc.l    $00030000, $0000FFFC, $20030000, $0000FFFC
                dc.l    $40030000, $0000FFFC, $600B0004, $0002FFF4
Offset_0x029C1E:
                dc.w    $0007
                dc.l    $B0010000, $0000FFFC, $C0030000, $0000FFFC
                dc.l    $E0030000, $0000FFFC, $00030000, $0000FFFC
                dc.l    $20030000, $0000FFFC, $40030000, $0000FFFC
                dc.l    $600B0004, $0002FFF4
Offset_0x029C58:
                dc.w    $0007
                dc.l    $A0030000, $0000FFFC, $C0030000, $0000FFFC
                dc.l    $E0030000, $0000FFFC, $00030000, $0000FFFC
                dc.l    $20030000, $0000FFFC, $40030000, $0000FFFC
                dc.l    $600B0004, $0002FFF4
Offset_0x029C92:
                dc.w    $0008
                dc.l    $90010000, $0000FFFC, $A0030000, $0000FFFC
                dc.l    $C0030000, $0000FFFC, $E0030000, $0000FFFC
                dc.l    $00030000, $0000FFFC, $20030000, $0000FFFC
                dc.l    $40030000, $0000FFFC, $600B0004, $0002FFF4         
;===============================================================================
; Objeto 0x80 - Corrente com gancho na Wing Fortress.
; [ Término ]   Raízes que pode se pendurar na Mystic Cave.
;===============================================================================  