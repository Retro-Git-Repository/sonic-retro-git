;===============================================================================
; Objeto 0x42 - Molas a vapor na Metropolis
; [ Início ]
;=============================================================================== 
Offset_0x026454:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x026462(PC, D0), D1
                jmp     Offset_0x026462(PC, D1)
Offset_0x026462:
                dc.w    Offset_0x026468-Offset_0x026462
                dc.w    Offset_0x0264AA-Offset_0x026462
                dc.w    Offset_0x026664-Offset_0x026462
Offset_0x026468:
                addq.b  #$02, $0024(A0)
                move.l  #Steam_Vent_Mappings, $0004(A0)        ; Offset_0x02669E
                move.w  #$6000, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$07, $001A(A0)
                move.w  $000C(A0), $0034(A0)
                move.w  #$0010, $0036(A0)
                addi.w  #$0010, $000C(A0)
Offset_0x0264AA:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0010, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    #$03, $0022(A0)
                beq.s   Offset_0x0264D6
                bsr     Offset_0x0265B8
Offset_0x0264D6:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    #$04, $0022(A0)
                beq.s   Offset_0x0264F2
                bsr     Offset_0x0265B8
Offset_0x0264F2:
                move.b  $0025(A0), D0
                bne.s   Offset_0x02650A
                subq.w  #$01, $0032(A0)
                bpl.s   Offset_0x02656E
                move.w  #$003B, $0032(A0)
                addq.b  #$02, $0025(A0)
                bra.s   Offset_0x02656E
Offset_0x02650A:
                subq.b  #$02, D0
                bne.s   Offset_0x02653C
                subq.w  #$08, $0036(A0)
                bne.s   Offset_0x02652E
                addq.b  #$02, $0025(A0)
                bsr.s   Offset_0x026574
                addi.w  #$0028, $0008(A1)
                bsr.s   Offset_0x026574
                subi.w  #$0028, $0008(A1)
                bset    #$00, $0001(A1)
Offset_0x02652E:
                move.w  $0036(A0), D0
                add.w   $0034(A0), D0
                move.w  D0, $000C(A0)
                bra.s   Offset_0x02656E
Offset_0x02653C:
                subq.b  #$02, D0
                bne.s   Offset_0x026552
                subq.w  #$01, $0032(A0)
                bpl.s   Offset_0x02656E
                move.w  #$003B, $0032(A0)
                addq.b  #$02, $0025(A0)
                bra.s   Offset_0x02656E
Offset_0x026552:
                addq.w  #$08, $0036(A0)
                cmpi.w  #$0010, $0036(A0)
                bne.s   Offset_0x026562
                clr.b   $0025(A0)
Offset_0x026562:
                move.w  $0036(A0), D0
                add.w   $0034(A0), D0
                move.w  D0, $000C(A0)
Offset_0x02656E:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x026574:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x0265B6
                move.b  $0000(A0), $0000(A1)
                addq.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $0034(A0), $000C(A1)
                move.b  #$07, $001E(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  #$2405, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$18, $0019(A1)
                move.b  #$04, $0018(A1)
Offset_0x0265B6:
                rts
Offset_0x0265B8:
                cmpi.b  #$02, $0025(A0)
                beq.s   Offset_0x0265C2
                rts
Offset_0x0265C2:
                move.w  #$F600, $0012(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$10, $001C(A1)
                move.b  #$02, $0024(A1)
                move.b  #$00, $0039(A1)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x0265F2
                move.w  #$0000, $0010(A1)
Offset_0x0265F2:
                btst    #$00, D0
                beq.s   Offset_0x026632
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$00, $002C(A1)
                move.b  #$04, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x026622
                move.b  #$01, $002C(A1)
Offset_0x026622:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x026632
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x026632:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x026648
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x026648:
                cmpi.b  #$08, D0
                bne.s   Offset_0x02665A
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x02665A:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x026664:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x026692
                move.b  #$07, $001E(A0)
                move.b  #$00, $0020(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$03, $001A(A0)
                bne.s   Offset_0x026688
                move.b  #$A6, $0020(A0)
Offset_0x026688:
                cmpi.b  #$07, $001A(A0)
                beq     Offset_0x026698
Offset_0x026692:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x026698:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------
Steam_Vent_Mappings: ; Offset_0x02669E:
                dc.w    Offset_0x0266AE-Steam_Vent_Mappings
                dc.w    Offset_0x0266B8-Steam_Vent_Mappings
                dc.w    Offset_0x0266C2-Steam_Vent_Mappings
                dc.w    Offset_0x0266CC-Steam_Vent_Mappings
                dc.w    Offset_0x0266DE-Steam_Vent_Mappings
                dc.w    Offset_0x0266F0-Steam_Vent_Mappings
                dc.w    Offset_0x02670A-Steam_Vent_Mappings
                dc.w    Offset_0x02671C-Steam_Vent_Mappings
Offset_0x0266AE:
                dc.w    $0001
                dc.l    $FF000000, $0000FFE8
Offset_0x0266B8:
                dc.w    $0001
                dc.l    $FF040001, $0000FFE8
Offset_0x0266C2:
                dc.w    $0001
                dc.l    $FC050003, $0001FFEC
Offset_0x0266CC:
                dc.w    $0002
                dc.l    $FC050007, $0003FFF8, $FC050003, $0001FFF0
Offset_0x0266DE:
                dc.w    $0002
                dc.l    $FC051007, $10030000, $FC01100B, $1005FFF8
Offset_0x0266F0:
                dc.w    $0003
                dc.l    $FC01000D, $0006000C, $FC01000B, $00050004
                dc.l    $FC01180D, $1806FFFC
Offset_0x02670A:
                dc.w    $0002
                dc.l    $FC01000D, $00060010, $FC01180D, $18060008
Offset_0x02671C:
                dc.w    $0002
                dc.l    $F0070015, $000AFFF0, $F007001D, $000E0000
;===============================================================================
; Objeto 0x42 - Molas a vapor na Metropolis
; [ Término ]
;===============================================================================  