;===============================================================================
; Objeto 0x85 - Mola ejetora dos pinball - Casino Night
; [ Início ]
;===============================================================================    
Offset_0x02A7FA:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02A84A(PC, D0), D1
                jsr     Offset_0x02A84A(PC, D1)
                move.w  #$0200, D0
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x02A818
                jmp     (DisplaySprite_Param)                  ; Offset_0x0164B6
Offset_0x02A818:
                move.w  $0008(A0), D1
                andi.w  #$FF80, D1
                sub.w   ($FFFFF7DA).w, D1
                cmpi.w  #$0280, D1
                bhi     Offset_0x02A832
                jmp     (DisplaySprite_Param)                  ; Offset_0x0164B6
Offset_0x02A832:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x02A844
                bclr    #$07, $02(A2, D0)
Offset_0x02A844:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02A84A:
                dc.w    Offset_0x02A850-Offset_0x02A84A
                dc.w    Offset_0x02A902-Offset_0x02A84A
                dc.w    Offset_0x02AAD6-Offset_0x02A84A
Offset_0x02A850:
                addq.b  #$02, $0024(A0)
                move.l  #Diagonal_Pinball_Spring_Mappings, $0004(A0) ; Offset_0x02ACFE
                move.w  #$0422, $0002(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x02A876
                move.l  #Vertical_Pinball_Spring_Mappings, $0004(A0) ; Offset_0x02AD6C
                move.w  #$0402, $0002(A0)
Offset_0x02A876:
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                bset    #$06, $0001(A0)
                move.b  #$01, $000B(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x02A8D2
                addq.b  #$02, $0024(A0)
                move.b  #$20, $000E(A0)
                move.b  #$18, $0019(A0)
                move.w  $0008(A0), $002E(A0)
                move.w  $000C(A0), $0034(A0)
                move.w  $0008(A0), D2
                move.w  $000C(A0), D3
                addi.w  #$0000, D3
                move.b  #$01, $000F(A0)
                lea     $0010(A0), A2
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0002, (A2)+
                bra     Offset_0x02AAD6
Offset_0x02A8D2:
                move.b  #$18, $000E(A0)
                move.b  #$18, $0019(A0)
                move.w  $000C(A0), $0034(A0)
                move.w  $0008(A0), D2
                move.w  $000C(A0), D3
                addi.w  #$0020, D3
                move.b  #$01, $000F(A0)
                lea     $0010(A0), A2
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0002, (A2)+
Offset_0x02A902:
                move.b  #$00, $003A(A0)
                move.w  $0034(A0), D0
                add.w   $0038(A0), D0
                move.w  D0, $000C(A0)
                move.b  #$02, $0015(A0)
                cmpi.w  #$0010, $0038(A0)
                bcs.s   Offset_0x02A928
                move.b  #$03, $0015(A0)
Offset_0x02A928:
                move.w  #$0023, D1
                move.w  #$0020, D2
                move.w  #$001D, D3
                move.w  $0008(A0), D4
                lea     $0036(A0), A2
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF602).w, D5
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr.s   Offset_0x02A9A4
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D5
                moveq   #$04, D6
                bsr.s   Offset_0x02A9A4
                tst.w   $0036(A0)
                beq.s   Offset_0x02A992
                tst.w   $0038(A0)
                beq.s   Offset_0x02A9A2
                moveq   #$00, D0
                cmpi.b  #$01, $0036(A0)
                bne.s   Offset_0x02A978
                or.w    ($FFFFF602).w, D0
Offset_0x02A978:
                cmpi.b  #$01, $0037(A0)
                bne.s   Offset_0x02A984
                or.w    ($FFFFF606).w, D0
Offset_0x02A984:
                andi.w  #$7000, D0
                bne.s   Offset_0x02A9A2
                move.w  #$0202, $0036(A0)
                rts
Offset_0x02A992:
                move.b  #$01, $000B(A0)
                subq.w  #$04, $0038(A0)
                bcc.s   Offset_0x02A9A2
                clr.w   $0038(A0)
Offset_0x02A9A2:
                rts
Offset_0x02A9A4:
                move.b  (A2), D0
                bne.s   Offset_0x02A9FA
Offset_0x02A9A8:
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x02A9F8
                tst.w   $0012(A1)
                bmi.s   Offset_0x02A9F8
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    D6, $0022(A0)
                beq.s   Offset_0x02A9F8
                move.b  #$81, $002A(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                move.w  #$0000, $0014(A1)
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                addq.b  #$01, (A2)
Offset_0x02A9F8:
                rts
Offset_0x02A9FA:
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x02A9F8
                subq.b  #$01, D0
                bne     Offset_0x02AA8C
                tst.b   $0001(A1)
                bmi.s   Offset_0x02AA30
                bclr    D6, $0022(A0)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                move.b  #$00, $002A(A1)
                move.b  #$00, (A2)
                rts
Offset_0x02AA30:
                andi.w  #$7000, D5
                beq.s   Offset_0x02AA7E
                tst.b   $003A(A0)
                bne.s   Offset_0x02AA7E
                move.b  #$01, $003A(A0)
                subq.b  #$01, $0032(A0)
                bpl.s   Offset_0x02AA5A
                move.b  #$03, $0032(A0)
                cmpi.w  #$0020, $0038(A0)
                beq.s   Offset_0x02AA5A
                addq.w  #$01, $0038(A0)
Offset_0x02AA5A:
                subq.b  #$01, $0033(A0)
                bpl.s   Offset_0x02AA78
                move.w  $0038(A0), D0
                subi.w  #$0020, D0
                neg.w   D0
                lsr.w   #$01, D0
                move.b  D0, $0033(A0)
                bchg    #02, $000B(A0)
                bra.s   Offset_0x02AA7E
Offset_0x02AA78:
                move.b  #$01, $000B(A0)
Offset_0x02AA7E:
                move.w  $000C(A0), D0
                subi.w  #$002E, D0
                move.w  D0, $000C(A1)
                rts
Offset_0x02AA8C:
                move.b  #$00, (A2)
                bclr    D6, $0022(A0)
                beq     Offset_0x02A9A8
                move.w  $0038(A0), D0
                addi.w  #$0010, D0
                lsl.w   #$07, D0
                neg.w   D0
                move.w  D0, $0012(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0800, $0014(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                move.b  #$00, $002A(A1)
                move.w  #$00E2, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02AAD6:
                move.b  #$00, $003A(A0)
                move.w  $0038(A0), D1
                lsr.w   #$01, D1
                move.w  $002E(A0), D0
                sub.w   D1, D0
                move.w  D0, $0008(A0)
                move.w  $0034(A0), D0
                add.w   D1, D0
                move.w  D0, $000C(A0)
                move.b  #$02, $0015(A0)
                cmpi.w  #$0010, $0038(A0)
                bcs.s   Offset_0x02AB0A
                move.b  #$03, $0015(A0)
Offset_0x02AB0A:
                move.w  #$0023, D1
                move.w  #$0008, D2
                move.w  #$0005, D3
                move.w  $0008(A0), D4
                lea     $0036(A0), A2
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF602).w, D5
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr.s   Offset_0x02AB86
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D5
                moveq   #$04, D6
                bsr.s   Offset_0x02AB86
                tst.w   $0036(A0)
                beq.s   Offset_0x02AB74
                tst.w   $0038(A0)
                beq.s   Offset_0x02AB84
                moveq   #$00, D0
                cmpi.b  #$01, $0036(A0)
                bne.s   Offset_0x02AB5A
                or.w    ($FFFFF602).w, D0
Offset_0x02AB5A:
                cmpi.b  #$01, $0037(A0)
                bne.s   Offset_0x02AB66
                or.w    ($FFFFF606).w, D0
Offset_0x02AB66:
                andi.w  #$7000, D0
                bne.s   Offset_0x02AB84
                move.w  #$0202, $0036(A0)
                rts
Offset_0x02AB74:
                move.b  #$01, $000B(A0)
                subq.w  #$04, $0038(A0)
                bcc.s   Offset_0x02AB84
                clr.w   $0038(A0)
Offset_0x02AB84:
                rts
Offset_0x02AB86:
                move.b  (A2), D0
                bne.s   Offset_0x02ABFC
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x02ABFA
                tst.w   $0012(A1)
                bmi.s   Offset_0x02ABFA
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    D6, $0022(A0)
                bne.s   Offset_0x02ABB0
                move.b  D6, D0
                addq.b  #$02, D0
                btst    D0, $0022(A0)
                beq.s   Offset_0x02ABFA
                bset    D6, $0022(A0)
Offset_0x02ABB0:
                move.b  #$81, $002A(A1)
                move.w  $0008(A0), $0008(A1)
                addi.w  #$0013, $0008(A1)
                move.w  $000C(A0), $000C(A1)
                subi.w  #$0013, $000C(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                move.w  #$0000, $0014(A1)
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                addq.b  #$01, (A2)
Offset_0x02ABFA:
                rts
Offset_0x02ABFC:
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x02ABFA
                subq.b  #$01, D0
                bne     Offset_0x02AC9A
                tst.b   $0001(A1)
                bmi.s   Offset_0x02AC32
                bclr    D6, $0022(A0)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                move.b  #$00, $002A(A1)
                move.b  #$00, (A2)
                rts
Offset_0x02AC32:
                andi.w  #$7000, D5
                beq.s   Offset_0x02AC80
                tst.b   $003A(A0)
                bne.s   Offset_0x02AC80
                move.b  #$01, $003A(A0)
                subq.b  #$01, $0032(A0)
                bpl.s   Offset_0x02AC5C
                move.b  #$03, $0032(A0)
                cmpi.w  #$001C, $0038(A0)
                beq.s   Offset_0x02AC5C
                addq.w  #$01, $0038(A0)
Offset_0x02AC5C:
                subq.b  #$01, $0033(A0)
                bpl.s   Offset_0x02AC7A
                move.w  $0038(A0), D0
                subi.w  #$001C, D0
                neg.w   D0
                lsr.w   #$01, D0
                move.b  D0, $0033(A0)
                bchg    #02, $000B(A0)
                bra.s   Offset_0x02AC80
Offset_0x02AC7A:
                move.b  #$01, $000B(A0)
Offset_0x02AC80:
                move.w  $0008(A0), D0
                addi.w  #$0013, D0
                move.w  D0, $0008(A1)
                move.w  $000C(A0), D0
                subi.w  #$0013, D0
                move.w  D0, $000C(A1)
                rts
Offset_0x02AC9A:
                move.b  #$00, (A2)
                bclr    D6, $0022(A0)
                beq     Offset_0x02ABFA
                move.w  $0038(A0), D0
                addq.w  #$04, D0
                lsl.w   #$07, D0
                move.w  D0, $0010(A1)
                neg.w   D0
                move.w  D0, $0012(A1)
                move.w  #$0800, $0014(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                tst.b   $0028(A0)
                bpl.s   Offset_0x02ACE8
                neg.w   D0
                move.w  D0, $0014(A1)
                bclr    #$00, $0022(A1)
                bclr    #$01, $0022(A1)
                move.b  #$E0, $0026(A1)
Offset_0x02ACE8:
                move.b  #$02, $0024(A1)
                move.b  #$00, $002A(A1)
                move.w  #$00E2, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------                
Diagonal_Pinball_Spring_Mappings: ; Offset_0x02ACFE:
                dc.w    Offset_0x02AD0A-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD2C-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD36-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD50-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD62-Diagonal_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD62-Diagonal_Pinball_Spring_Mappings
Offset_0x02AD0A:
                dc.w    $0004
                dc.l    $C8090000, $0000FFF4, $D8090006, $0003FFF4
                dc.l    $E8090006, $0003FFF4, $F809000C, $0006FFF4
Offset_0x02AD2C:
                dc.w    $0001
                dc.l    $E0090000, $0000FFF4
Offset_0x02AD36:
                dc.w    $0003
                dc.l    $D0090006, $0003FFF4, $E0090006, $0003FFF4
                dc.l    $F009000C, $0006FFF4
Offset_0x02AD50:
                dc.w    $0002
                dc.l    $E0090006, $0003FFF4, $F009000C, $0006FFF4
Offset_0x02AD62:
                dc.w    $0001
                dc.l    $E0092000, $2000FFF4
;-------------------------------------------------------------------------------
Vertical_Pinball_Spring_Mappings: ; Offset_0x02AD6C:
                dc.w    Offset_0x02AD78-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD8A-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD94-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD94-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD9E-Vertical_Pinball_Spring_Mappings
                dc.w    Offset_0x02AD9E-Vertical_Pinball_Spring_Mappings
Offset_0x02AD78:
                dc.w    $0002
                dc.l    $F00F0000, $0000FFF0, $000F0010, $0008FFE0
Offset_0x02AD8A:
                dc.w    $0001
                dc.l    $F00F0000, $0000FFF0
Offset_0x02AD94:
                dc.w    $0001
                dc.l    $000F0010, $0008FFE0
Offset_0x02AD9E:
                dc.w    $0001
                dc.l    $F00F2000, $2000FFF0                                                                                                     
;===============================================================================
; Objeto 0x85 - Mola ejetora dos pinball - Casino Night
; [ Término ]
;===============================================================================