;===============================================================================
; Objeto 0x53 - Bolas e mini Robotniks a partir das bolas na Metropolis
; [ Início ]
;===============================================================================  
Offset_0x0323FE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03240C(PC, D0), D1
                jmp     Offset_0x03240C(PC, D1)
Offset_0x03240C:
                dc.w    Offset_0x032416-Offset_0x03240C
                dc.w    Offset_0x03249C-Offset_0x03240C
                dc.w    Offset_0x032624-Offset_0x03240C
                dc.w    Offset_0x0326A2-Offset_0x03240C
                dc.w    Offset_0x032762-Offset_0x03240C
Offset_0x032416:
                move.l  A0, A1
                moveq   #$06, D3
                moveq   #$00, D2
                bra.s   Offset_0x032426
Offset_0x03241E:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03248A
Offset_0x032426:
                move.b  #$20, $0019(A1)
                move.l  $0034(A0), $0034(A1)
                move.b  #$53, (A1)
                move.l  #Mz_Boss_Mappings, $0004(A1)           ; Offset_0x03289A
                move.w  #$037C, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                addq.b  #$02, $0024(A1)
                move.b  #$05, $001A(A1)
                move.b  Offset_0x03248C(PC, D2), $0028(A1)
                move.b  Offset_0x03248C(PC, D2), $003B(A1)
                move.b  Offset_0x032494(PC, D2), $003A(A1)
                move.b  #$40, $0029(A1)
                move.b  #$87, $0020(A1)
                move.b  #$02, $0021(A1)
                move.b  #$00, $003C(A1)
                addq.w  #$01, D2
                dbra    D3, Offset_0x03241E
Offset_0x03248A:
                rts
Offset_0x03248C:
                dc.b    $24, $6C, $B4, $FC, $48, $90, $D8, $00
Offset_0x032494:
                dc.b    $00, $01, $01, $00, $01, $01, $00, $00
Offset_0x03249C:
                move.l  $0034(A0), A1
                move.w  $000C(A1), $002A(A0)
                subq.w  #$04, $002A(A0)
                move.w  $0008(A1), $0038(A0)
                tst.b   $0038(A1)
                beq.s   Offset_0x032514
                move.b  #$00, $0038(A1)
                addq.b  #$01, $002C(A1)
                addq.b  #$02, $0024(A0)
                move.b  #$3C, $0032(A0)
                move.b  #$02, $001C(A0)
                move.w  #$FC00, $0012(A0)
                move.w  #$FF80, D1
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                bpl.s   Offset_0x0324E6
                neg.w   D1
Offset_0x0324E6:
                cmpi.w  #$2AF0, $0008(A0)
                bcc.s   Offset_0x0324F2
                move.w  #$0080, D1
Offset_0x0324F2:
                cmpi.w  #$2BB0, $0008(A0)
                bcs.s   Offset_0x0324FE
                move.w  #$FF80, D1
Offset_0x0324FE:
                bclr    #$00, $0001(A0)
                tst.w   D1
                bmi.s   Offset_0x03250E
                bset    #$00, $0001(A0)
Offset_0x03250E:
                move.w  D1, $0010(A0)
                bra.s   Offset_0x032522
Offset_0x032514:
                cmpi.b  #$02, $0021(A0)
                beq.s   Offset_0x032522
                move.b  #$00, $0020(A1)
Offset_0x032522:
                bsr     Offset_0x032530
                bsr     Offset_0x0325DA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032530:
                move.b  $0029(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  D0, D3
                moveq   #$00, D1
                move.b  $0033(A1), D1
                muls.w  D1, D0
                move.w  D0, D5
                move.w  D0, D4
                move.b  $0039(A1), D2
                tst.b   $003A(A1)
                beq.s   Offset_0x032556
                move.w  #$0010, D2
Offset_0x032556:
                muls.w  D3, D2
                move.w  $0038(A0), D6
                move.b  $0028(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  D0, D5
                swap.w  D5
                add.w   D6, D5
                move.w  D5, $0008(A0)
                muls.w  D1, D4
                swap.w  D4
                move.w  D4, $0030(A0)
                move.w  $002A(A0), D6
                move.b  $003B(A0), D0
                tst.b   $003A(A1)
                beq.s   Offset_0x03258A
                move.b  $003C(A0), D0
Offset_0x03258A:
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  D0, D2
                swap.w  D2
                add.w   D6, D2
                move.w  D2, $000C(A0)
                addq.b  #$04, $0028(A0)
                tst.b   $003A(A1)
                bne.s   Offset_0x0325AA
                addq.b  #$08, $003B(A0)
                rts
Offset_0x0325AA:
                cmpi.b  #$FF, $003A(A1)
                beq.s   Offset_0x0325CC
                cmpi.b  #$80, $003A(A1)
                bne.s   Offset_0x0325C4
                subq.b  #$02, $003C(A0)
                bpl.s   Offset_0x0325D8
                clr.b   $003C(A0)
Offset_0x0325C4:
                move.b  #$00, $003A(A1)
                rts
Offset_0x0325CC:
                cmpi.b  #$40, $003C(A0)
                bcc.s   Offset_0x0325D8
                addq.b  #$02, $003C(A0)
Offset_0x0325D8:
                rts
Offset_0x0325DA:
                move.w  $0030(A0), D0
                bmi.s   Offset_0x032602
                cmpi.w  #$000C, D0
                blt.s   Offset_0x0325F4
                move.b  #$03, $001A(A0)
                move.b  #$01, $0018(A0)
                rts
Offset_0x0325F4:
                move.b  #$04, $001A(A0)
                move.b  #$02, $0018(A0)
                rts
Offset_0x032602:
                cmpi.w  #$FFF4, D0
                blt.s   Offset_0x032616
                move.b  #$04, $001A(A0)
                move.b  #$06, $0018(A0)
                rts
Offset_0x032616:
                move.b  #$05, $001A(A0)
                move.b  #$07, $0018(A0)
                rts
Offset_0x032624:
                tst.b   $0032(A0)
                bmi.s   Offset_0x032636
                subq.b  #$01, $0032(A0)
                bpl.s   Offset_0x032636
                move.b  #$DA, $0020(A0)
Offset_0x032636:
                jsr     (ObjectFall)                           ; Offset_0x016306
                subi.w  #$0020, $0012(A0)
                cmpi.w  #$0180, $0012(A0)
                blt.s   Offset_0x032650
                move.w  #$0180, $0012(A0)
Offset_0x032650:
                cmpi.w  #$04AC, $000C(A0)
                bcs.s   Offset_0x032672
                move.w  #$04AC, $000C(A0)
                move.w  #$04AC, $002E(A0)
                move.b  #$01, $002C(A0)
                addq.b  #$02, $0024(A0)
                bsr     Offset_0x032716
Offset_0x032672:
                bsr     Offset_0x032688
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x032848
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032688:
                cmpi.b  #$FE, $0021(A0)
                bgt.s   Offset_0x0326A0
                move.b  #$14, $001A(A0)
                move.b  #$06, $001C(A0)
                addq.b  #$02, $0024(A0)
Offset_0x0326A0:
                rts
Offset_0x0326A2:
                tst.b   $0032(A0)
                bmi.s   Offset_0x0326B4
                subq.b  #$01, $0032(A0)
                bpl.s   Offset_0x0326B4
                move.b  #$DA, $0020(A0)
Offset_0x0326B4:
                bsr     Offset_0x032730
                cmpi.b  #$0B, $001A(A0)
                bne.s   Offset_0x032672
                move.b  $002C(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                neg.w   D0
                asr.w   #$02, D0
                add.w   $002E(A0), D0
                cmpi.w  #$04AC, D0
                bcc.s   Offset_0x032700
                move.w  D0, $000C(A0)
                addq.b  #$01, $002C(A0)
                btst    #$00, $002C(A0)
                beq     Offset_0x032842
                moveq   #$FFFFFFFF, D0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x0326F6
                neg.w   D0
Offset_0x0326F6:
                add.w   D0, $0008(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032700:
                move.w  #$04AC, $000C(A0)
                bsr     Offset_0x032716
                move.b  #$01, $002C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032716:
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                bpl.s   Offset_0x032728
                bclr    #$00, $0001(A0)
                rts
Offset_0x032728:
                bset    #$00, $0001(A0)
                rts
Offset_0x032730:
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x032740
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x03274C
Offset_0x032740:
                move.b  #$14, $001A(A0)
                move.b  #$06, $001C(A0)
Offset_0x03274C:
                cmpi.b  #$FE, $0021(A0)
                bgt.s   Offset_0x032760
                move.b  #$14, $001A(A0)
                move.b  #$06, $001C(A0)
Offset_0x032760:
                rts
Offset_0x032762:
                move.b  #Explosion_Sfx, D0      ; $C4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.l  $0034(A0), A1
                subq.b  #$01, $002C(A1)
Offset_0x032774:                
                jmp     (DeleteObject)                         ; Offset_0x01646C                          
;-------------------------------------------------------------------------------   
Mz_Boss_Sub_02: ; Offset_0x03277A:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x032788(PC, D0), D0
                jmp     Offset_0x032788(PC, D0)
Offset_0x032788:
                dc.w    Offset_0x03278C-Offset_0x032788
                dc.w    Offset_0x0327F4-Offset_0x032788
Offset_0x03278C:
                move.l  #Mz_Boss_Mappings, $0004(A0)           ; Offset_0x03289A
                move.w  #$037C, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$05, $0018(A0)
                move.b  #$12, $001A(A0)
                addq.b  #$02, $0025(A0)
                move.l  $0034(A0), A1
                move.b  #$50, $0019(A0)
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                addq.w  #$07, $000C(A0)
                subq.w  #$04, $0008(A0)
                move.w  #$FC00, D0
                btst    #$00, $0001(A1)
                beq.s   Offset_0x0327E0
                neg.w   D0
                addq.w  #$08, $0008(A0)
Offset_0x0327E0:
                move.w  D0, $0010(A0)
                move.b  #$99, $0020(A0)
                move.b  #$EA, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0327F4:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                cmpi.w  #$2AB0, $0008(A0)
                bcs     Offset_0x032774
                cmpi.w  #$2BF0, $0008(A0)
                bcc     Offset_0x032774
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
Mz_Boss_Sub_03: ; Offset_0x032814:
                move.l  $0034(A0), A1
                cmpi.b  #$54, (A1)
                bne     Offset_0x032774
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                bclr    #$00, $0001(A0)
                btst    #$00, $0001(A1)
                beq     Offset_0x032842
                bset    #$00, $0001(A0)
Offset_0x032842:
                jmp     (DisplaySprite)                        ; Offset_0x01647A   
;-------------------------------------------------------------------------------   
Mz_Boss_Animate_Data: ; Offset_0x032848:
                dc.w    Offset_0x032858-Mz_Boss_Animate_Data
                dc.w    Offset_0x03285C-Mz_Boss_Animate_Data
                dc.w    Offset_0x032860-Mz_Boss_Animate_Data
                dc.w    Offset_0x032876-Mz_Boss_Animate_Data
                dc.w    Offset_0x03287A-Mz_Boss_Animate_Data
                dc.w    Offset_0x032886-Mz_Boss_Animate_Data
                dc.w    Offset_0x032892-Mz_Boss_Animate_Data
                dc.w    Offset_0x032896-Mz_Boss_Animate_Data
Offset_0x032858:
                dc.b    $0F, $02, $FF, $00
Offset_0x03285C:
                dc.b    $01, $00, $01, $FF
Offset_0x032860:
                dc.b    $03, $05, $05, $05, $05, $05, $05, $05, $05, $06, $07, $06, $07, $06, $07, $08
                dc.b    $09, $0A, $0B, $FE, $01, $00
Offset_0x032876:
                dc.b    $07, $0C, $0D, $FF
Offset_0x03287A:
                dc.b    $07, $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F, $FD, $03, $00
Offset_0x032886:
                dc.b    $07, $10, $10, $10, $10, $10, $10, $10, $10, $FD, $03, $00
Offset_0x032892:
                dc.b    $01, $14, $FC, $00
Offset_0x032896:
                dc.b    $07, $11, $FF, $00
;-------------------------------------------------------------------------------
Mz_Boss_Mappings: ; Offset_0x03289A:
                dc.w    Offset_0x0328C4-Mz_Boss_Mappings
                dc.w    Offset_0x0328CE-Mz_Boss_Mappings
                dc.w    Offset_0x0328D8-Mz_Boss_Mappings
                dc.w    Offset_0x032902-Mz_Boss_Mappings
                dc.w    Offset_0x03290C-Mz_Boss_Mappings
                dc.w    Offset_0x032916-Mz_Boss_Mappings
                dc.w    Offset_0x032920-Mz_Boss_Mappings
                dc.w    Offset_0x03292A-Mz_Boss_Mappings
                dc.w    Offset_0x032934-Mz_Boss_Mappings
                dc.w    Offset_0x03293E-Mz_Boss_Mappings
                dc.w    Offset_0x032948-Mz_Boss_Mappings
                dc.w    Offset_0x032952-Mz_Boss_Mappings
                dc.w    Offset_0x032974-Mz_Boss_Mappings
                dc.w    Offset_0x032986-Mz_Boss_Mappings
                dc.w    Offset_0x032998-Mz_Boss_Mappings
                dc.w    Offset_0x0329AA-Mz_Boss_Mappings
                dc.w    Offset_0x0329BC-Mz_Boss_Mappings
                dc.w    Offset_0x0329CE-Mz_Boss_Mappings
                dc.w    Offset_0x0329E0-Mz_Boss_Mappings
                dc.w    Offset_0x0329F2-Mz_Boss_Mappings
                dc.w    Offset_0x0329FC-Mz_Boss_Mappings
Offset_0x0328C4:
                dc.w    $0001
                dc.l    $000501E4, $00F2001C
Offset_0x0328CE:
                dc.w    $0001
                dc.l    $000501E8, $00F4001C
Offset_0x0328D8:
                dc.w    $0005
                dc.l    $D80501A4, $00D20002, $E80501A8, $00D40010
                dc.l    $F80F218C, $20C6FFF0, $F807219C, $20CE0010
                dc.l    $F8022003, $2001FFE8
Offset_0x032902:
                dc.w    $0001
                dc.l    $F40A200E, $2007FFF4
Offset_0x03290C:
                dc.w    $0001
                dc.l    $F40A206F, $2037FFF4
Offset_0x032916:
                dc.w    $0001
                dc.l    $F8052078, $203CFFF8
Offset_0x032920:
                dc.w    $0001
                dc.l    $F4062017, $200BFFF8
Offset_0x03292A:
                dc.w    $0001
                dc.l    $F809201D, $200EFFF4
Offset_0x032934:
                dc.w    $0001
                dc.l    $F4062023, $2011FFF8
Offset_0x03293E:
                dc.w    $0001
                dc.l    $F40A0029, $0014FFF4
Offset_0x032948:
                dc.w    $0001
                dc.l    $F00F0032, $0019FFF0
Offset_0x032952:
                dc.w    $0004
                dc.l    $E80A0042, $0021FFE8, $E80A004B, $00250000
                dc.l    $000A0054, $002AFFE8, $000A005D, $002E0000
Offset_0x032974:
                dc.w    $0002
                dc.l    $E80D01B4, $00DAFFF0, $E80501AC, $00D6FFE0
Offset_0x032986:
                dc.w    $0002
                dc.l    $E80D01BC, $00DEFFF0, $E80501AC, $00D6FFE0
Offset_0x032998:
                dc.w    $0002
                dc.l    $E80D01C4, $00E2FFF0, $E80501B0, $00D8FFE0
Offset_0x0329AA:
                dc.w    $0002
                dc.l    $E80D01CC, $00E6FFF0, $E80501B0, $00D8FFE0
Offset_0x0329BC:
                dc.w    $0002
                dc.l    $E80D01D4, $00EAFFF0, $E80501B0, $00D8FFE0
Offset_0x0329CE:
                dc.w    $0002
                dc.l    $E80D01DC, $00EEFFF0, $E80501B0, $00D8FFE0
Offset_0x0329E0:
                dc.w    $0002
                dc.l    $F80D2006, $2003FFE0, $F80D2806, $28030000
Offset_0x0329F2:
                dc.w    $0001
                dc.l    $F8022000, $2000FFE0
Offset_0x0329FC:
                dc.w    $0004
                dc.l    $E80A0066, $0033FFE8, $E80A0866, $08330000
                dc.l    $000A1066, $1033FFE8, $000A1866, $18330000                                                             
;===============================================================================
; Objeto 0x53 - Bolas e mini Robotniks a partir das bolas na Metropolis
; [ Término ]
;===============================================================================  