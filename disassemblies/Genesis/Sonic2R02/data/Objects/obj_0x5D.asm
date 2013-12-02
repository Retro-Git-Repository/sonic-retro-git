;===============================================================================
; Objeto 0x5D - Robotnik na Chemical Plant
; [ Início ]
;===============================================================================   
Offset_0x02D2C0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02D2CE(PC, D0), D1
                jmp     Offset_0x02D2CE(PC, D1)
Offset_0x02D2CE:
                dc.w    Offset_0x02D2EA-Offset_0x02D2CE
                dc.w    Offset_0x02D4E0-Offset_0x02D2CE
                dc.w    Offset_0x02D93A-Offset_0x02D2CE
                dc.w    Offset_0x02D9FE-Offset_0x02D2CE
                dc.w    Offset_0x02DB44-Offset_0x02D2CE
                dc.w    Offset_0x02DC0C-Offset_0x02D2CE
                dc.w    Offset_0x02E202-Offset_0x02D2CE
                dc.w    Offset_0x02DB8E-Offset_0x02D2CE
                dc.w    Offset_0x02DD1E-Offset_0x02D2CE
                dc.w    Offset_0x02D84E-Offset_0x02D2CE
                dc.w    Offset_0x02D7F6-Offset_0x02D2CE
                dc.w    Offset_0x02E486-Offset_0x02D2CE
                dc.w    Offset_0x02E4DE-Offset_0x02D2CE
                dc.w    Offset_0x02E586-Offset_0x02D2CE
Offset_0x02D2EA:
                move.l  #CPz_Boss_Mappings_1, $0004(A0)        ; Offset_0x02E938
                move.w  #$2420, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.w  #$2B80, $0008(A0)
                move.w  #$04B0, $000C(A0)
                move.b  #$03, $0018(A0)
                move.b  #$0F, $0020(A0)
                move.b  #$08, $0021(A0)
                addq.b  #$02, $0024(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0038(A0)
                bclr    #$03, $002D(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x02D43E
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  A1, $0034(A0)
                move.l  #CPz_Boss_Mappings_1, $0004(A1)        ; Offset_0x02E938
                move.w  #$0420, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$03, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$16, $0024(A1)
                move.b  #$01, $001C(A1)
                move.b  $0001(A0), $0001(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                tst.b   $0028(A0)
                bmi     Offset_0x02D43E
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x02D43E
                move.b  #$5D, $0000(A1)
                move.l  A0, $0034(A1)
                move.l  #CPz_Boss_Mappings_2, $0004(A1)        ; Offset_0x02EA34
                move.w  #$0418, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$01, $001E(A0)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$03, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$18, $0024(A1)
                move.b  $0001(A0), $0001(A1)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02D43E
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$02, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$12, $0024(A1)
Offset_0x02D43E:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02D49A
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$04, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                subi.w  #$0038, $000C(A1)
                subi.w  #$0010, $0008(A1)
                move.w  #$FFF0, $002E(A1)
                addi.b  #$10, $0024(A1)
                move.b  #$06, $001C(A1)
Offset_0x02D49A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02D4DE
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$04, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$04, $0024(A1)
Offset_0x02D4DE:
                rts
Offset_0x02D4E0:
                bsr     Offset_0x02D524
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02D516(PC, D0), D1
                jsr     Offset_0x02D516(PC, D1)
                lea     (CPz_Boss_Animate_Data_1), A1          ; Offset_0x02E904
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                move.b  $0022(A0), D0
                andi.b  #$03, D0
                andi.b  #$FC, $0001(A0)
                or.b    D0, $0001(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02D516:
                dc.w    Offset_0x02D5F6-Offset_0x02D516
                dc.w    Offset_0x02D730-Offset_0x02D516
                dc.w    Offset_0x02D798-Offset_0x02D516
                dc.w    Offset_0x02D7AC-Offset_0x02D516
                dc.w    Offset_0x02D546-Offset_0x02D516
                dc.w    Offset_0x02D56A-Offset_0x02D516
                dc.w    Offset_0x02D5B6-Offset_0x02D516
Offset_0x02D524:
                cmpi.b  #$08, $0025(A0)
                bge.s   Offset_0x02D53C
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                bgt.s   Offset_0x02D53E
                bclr    #$00, $0022(A0)
Offset_0x02D53C:
                rts
Offset_0x02D53E:
                bset    #$00, $0022(A0)
                rts
Offset_0x02D546:
                subq.w  #$01, $003C(A0)
                bpl     Offset_0x02D6CC
                bset    #$00, $0022(A0)
                bclr    #$07, $0022(A0)
                clr.w   $0010(A0)
                addq.b  #$02, $0025(A0)
                move.w  #$FFDA, $003C(A0)
                rts
Offset_0x02D56A:
                addq.w  #$01, $003C(A0)
                beq.s   Offset_0x02D57A
                bpl.s   Offset_0x02D580
                addi.w  #$0018, $0012(A0)
                bra.s   Offset_0x02D5AE
Offset_0x02D57A:
                clr.w   $0012(A0)
                bra.s   Offset_0x02D5AE
Offset_0x02D580:
                cmpi.w  #$0030, $003C(A0)
                bcs.s   Offset_0x02D598
                beq.s   Offset_0x02D59E
                cmpi.w  #$0038, $003C(A0)
                bcs.s   Offset_0x02D5AE
                addq.b  #$02, $0025(A0)
                bra.s   Offset_0x02D5AE
Offset_0x02D598:
                subq.w  #$08, $0012(A0)
                bra.s   Offset_0x02D5AE
Offset_0x02D59E:
                clr.w   $0012(A0)
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
Offset_0x02D5AE:
                bsr     Offset_0x02D6A6
                bra     Offset_0x02D612
Offset_0x02D5B6:
                bset    #$06, $002E(A0)
                move.w  #$0400, $0010(A0)
                move.w  #$FFC0, $0012(A0)
                cmpi.w  #$2C30, ($FFFFEECA).w
                bcc.s   Offset_0x02D5D6
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x02D5DC
Offset_0x02D5D6:
                tst.b   $0001(A0)
                bpl.s   Offset_0x02D5E4
Offset_0x02D5DC:
                bsr     Offset_0x02D6A6
                bra     Offset_0x02D612
Offset_0x02D5E4:
                addq.l  #$04, A7
                move.l  $0034(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
Offset_0x02D5F0:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02D5F6:
                move.w  #$0100, $0012(A0)
                bsr     Offset_0x02D6A6
                cmpi.w  #$04C0, $0038(A0)
                bne.s   Offset_0x02D612
                move.w  #$0000, $0012(A0)
                addq.b  #$02, $0025(A0)
Offset_0x02D612:
                move.b  $003F(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$06, D0
                add.w   $0038(A0), D0
                move.w  D0, $000C(A0)
                move.w  $0030(A0), $0008(A0)
                addq.b  #$02, $003F(A0)
                cmpi.b  #$08, $0025(A0)
                bcc.s   Offset_0x02D67C
                tst.b   $0022(A0)
                bmi.s   Offset_0x02D67E
                tst.b   $0020(A0)
                bne.s   Offset_0x02D67C
                tst.b   $003E(A0)
                bne.s   Offset_0x02D65A
                move.b  #$20, $003E(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02D65A:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02D668
                move.w  #$0EEE, D0
Offset_0x02D668:
                move.w  D0, (A1)
                subq.b  #$01, $003E(A0)
                bne.s   Offset_0x02D67C
                move.b  #$0F, $0020(A0)
                bclr    #$01, $002D(A0)
Offset_0x02D67C:
                rts
Offset_0x02D67E:
                moveq   #$64, D0
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.b  #$08, $0025(A0)
                move.w  #$00B3, $003C(A0)
                move.l  $0034(A0), A1
                move.b  #$04, $001C(A1)
                moveq   #$40, D0
                jmp     (LoadPLC)                              ; Offset_0x0015DA
                rts
Offset_0x02D6A6:
                move.l  $0030(A0), D2
                move.l  $0038(A0), D3
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, $0030(A0)
                move.l  D3, $0038(A0)
                rts
Offset_0x02D6CC:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$07, D0
                bne.s   Offset_0x02D712
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02D712
                move.b  #$58, $0000(A1)      ; Carrega o objeto 0x58 - Explosões
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.w  D0, D1
                moveq   #$00, D1
                move.b  D0, D1
                lsr.b   #$02, D1
                subi.w  #$0020, D1
                add.w   D1, $0008(A1)
                lsr.w   #$08, D0
                lsr.b   #$02, D0
                subi.w  #$0020, D0
                add.w   D0, $000C(A1)
Offset_0x02D712:
                rts
Offset_0x02D714:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02D72E
                move.b  #$58, $0000(A1)      ; Carrega o objeto 0x58 - Explosões
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
Offset_0x02D72E:
                rts
Offset_0x02D730:
                btst    #$03, $002D(A0)
                bne.s   Offset_0x02D73E
                move.w  #$2B30, D0
                bra.s   Offset_0x02D742
Offset_0x02D73E:
                move.w  #$2A50, D0
Offset_0x02D742:
                move.w  D0, D1
                sub.w   $0030(A0), D0
                bpl.s   Offset_0x02D74C
                neg.w   D0
Offset_0x02D74C:
                cmpi.w  #$0003, D0
                ble.s   Offset_0x02D76E
                cmp.w   $0030(A0), D1
                bgt.s   Offset_0x02D760
                move.w  #$FD00, $0010(A0)
                bra.s   Offset_0x02D766
Offset_0x02D760:
                move.w  #$0300, $0010(A0)
Offset_0x02D766:
                bsr     Offset_0x02D6A6
                bra     Offset_0x02D612
Offset_0x02D76E:
                cmpi.w  #$04C0, $0038(A0)
                bne     Offset_0x02D612
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                addq.b  #$02, $0025(A0)
                bchg    #03, $002D(A0)
                bset    #$00, $002E(A0)
                bra     Offset_0x02D612
Offset_0x02D798:
                btst    #$00, $002E(A0)
                beq.s   Offset_0x02D7A4
                bra     Offset_0x02D612
Offset_0x02D7A4:
                addq.b  #$02, $0025(A0)
                bra     Offset_0x02D612
Offset_0x02D7AC:
                move.w  ($FFFFB008).w, D0
                addi.w  #$004C, D0
                cmp.w   $0030(A0), D0
                bgt.s   Offset_0x02D7DA
                beq     Offset_0x02D612
                subi.l  #$00010000, $0030(A0)
                cmpi.w  #$2A28, $0030(A0)
                bgt     Offset_0x02D612
                move.w  #$2A28, $0030(A0)
                bra     Offset_0x02D612
Offset_0x02D7DA:
                addi.l  #$00010000, $0030(A0)
                cmpi.w  #$2B70, $0030(A0)
                blt     Offset_0x02D612
                move.w  #$2B70, $0030(A0)
                bra     Offset_0x02D612
Offset_0x02D7F6:
                cmpi.b  #$F9, $0030(A0)
                beq.s   Offset_0x02D816
                subq.b  #$01, $0030(A0)
                bgt     Offset_0x02DF72
                bsr     Offset_0x02D714
                move.b  #$F9, $0030(A0)
                move.w  #$001E, $002A(A0)
Offset_0x02D816:
                subq.w  #$01, $002A(A0)
                bpl     Offset_0x02DF72
                move.w  $0010(A0), D0
                add.w   D0, $0008(A0)
                move.l  $000C(A0), D3
                move.w  $0012(A0), D0
                addi.w  #$0038, $0012(A0)
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D3, $000C(A0)
                cmpi.l  #$05800000, D3
                bcc     Offset_0x02D5F0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02D84E:
                btst    #$07, $0022(A0)
                bne.s   Offset_0x02D884
                move.l  $0034(A0), A1
                move.l  $0008(A1), $0008(A0)
                move.l  $000C(A1), $000C(A0)
                move.b  $0001(A1), $0001(A0)
                move.b  $0022(A1), $0022(A0)
                move.l  #CPz_Boss_Animate_Data, A1             ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02D884:
                moveq   #$22, D3
                move.b  #$78, $0030(A0)
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  D3, $001A(A0)
                move.b  #$14, $0024(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, $0010(A0)
                move.w  #$FC80, $0012(A0)
                moveq   #$01, D2
                addq.w  #$01, D3
Offset_0x02D8BE:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x02D5F0
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.b  D3, $001A(A1)
                move.b  #$14, $0024(A1)
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$02, $0018(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  $0022(A0), $0022(A1)
                move.b  $0001(A0), $0001(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, $0010(A1)
                move.w  #$FC80, $0012(A1)
                swap.w  D0
                addi.b  #$1E, D0
                andi.w  #$007F, D0
                move.b  D0, $0030(A1)
                addq.w  #$01, D3
                dbra    D2, Offset_0x02D8BE
                rts
Offset_0x02D93A:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02D948(PC, D0), D1
                jmp     Offset_0x02D948(PC, D1)
Offset_0x02D948:
                dc.w    Offset_0x02D94C-Offset_0x02D948
                dc.w    Offset_0x02D97A-Offset_0x02D948
Offset_0x02D94C:
                move.l  $0034(A0), A1
                btst    #$00, $002E(A1)
                bne.s   Offset_0x02D95A
                rts
Offset_0x02D95A:
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                addi.w  #$0018, $000C(A0)
                move.w  #$000C, $002C(A0)
                addq.b  #$02, $0025(A0)
                move.l  A0, A1
                bra.s   Offset_0x02D988
Offset_0x02D97A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                beq.s   Offset_0x02D984
                rts
Offset_0x02D984:
                move.l  A0, $0034(A1)
Offset_0x02D988:
                subq.w  #$01, $002C(A0)
                blt.s   Offset_0x02D9EE
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$05, $0018(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $002C(A0), D0
                subi.w  #$000B, D0
                neg.w   D0
                lsl.w   #$03, D0
                move.w  D0, $0038(A1)
                add.w   D0, $000C(A1)
                move.b  #$01, $001C(A1)
                cmpi.b  #$02, $0025(A1)
                beq     Offset_0x02DB8E
                move.b  #$0E, $0024(A1)
                bra     Offset_0x02DB8E
Offset_0x02D9EE:
                move.b  #$00, $0025(A0)
                move.b  #$06, $0024(A0)
                bra     Offset_0x02DB8E
Offset_0x02D9FE:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02DA0C(PC, D0), D1
                jmp     Offset_0x02DA0C(PC, D1)
Offset_0x02DA0C:
                dc.w    Offset_0x02DA12-Offset_0x02DA0C
                dc.w    Offset_0x02DAA0-Offset_0x02DA0C
                dc.w    Offset_0x02DB0A-Offset_0x02DA0C
Offset_0x02DA12:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x02DB8E
                move.b  #$0E, $0024(A0)
                move.b  #$06, $0024(A1)
                move.b  #$02, $0025(A1)
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$04, $0018(A1)
                move.b  #$02, $0032(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  #$0058, D0
                move.b  D0, $0031(A1)
                add.w   D0, $000C(A1)
                move.b  #$02, $001C(A1)
                move.l  A0, $0034(A1)
                move.b  #$12, $0030(A1)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02DA9C
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$0A, $0024(A1)
                move.l  $0034(A0), $0034(A1)
Offset_0x02DA9C:
                bra     Offset_0x02DB8E
Offset_0x02DAA0:
                move.l  $0034(A0), A1
                move.l  $0034(A1), A2
                btst    #$07, $0022(A2)
                bne     Offset_0x02D5F0
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                subq.b  #$01, $0030(A0)
                bne.s   Offset_0x02DAEE
                move.b  #$12, $0030(A0)
                subq.b  #$08, $0031(A0)
                bgt.s   Offset_0x02DAEE
                bmi.s   Offset_0x02DAE0
                move.b  #$03, $001C(A0)
                move.b  #$0C, $0030(A0)
                bra.s   Offset_0x02DAEE
Offset_0x02DAE0:
                move.b  #$06, $0030(A0)
                move.b  #$04, $0025(A0)
                rts
Offset_0x02DAEE:
                moveq   #$00, D0
                move.b  $0031(A0), D0
                add.w   D0, $000C(A0)
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02DB0A:
                subq.b  #$01, $0030(A0)
                beq.s   Offset_0x02DB12
                rts
Offset_0x02DB12:
                subq.b  #$01, $0032(A0)
                beq.s   Offset_0x02DB30
                move.b  #$02, $001C(A0)
                move.b  #$12, $0030(A0)
                move.b  #$02, $0025(A0)
                move.b  #$58, $0031(A0)
Offset_0x02DB30:
                move.l  $0034(A0), A1
                move.b  #$08, $0024(A1)
                move.b  #$58, $0031(A1)
                bra     Offset_0x02D5F0
Offset_0x02DB44:
                tst.b   $003C(A0)
                bne.s   Offset_0x02DB80
                moveq   #$00, D0
                move.b  $0031(A0), D0
                add.w   $000C(A0), D0
                lea     ($FFFFB000).w, A1
                moveq   #$7F, D1
Offset_0x02DB5A:
                cmp.w   $000C(A1), D0
                beq.s   Offset_0x02DB70
                lea     $0040(A1), A1
                dbra    D1, Offset_0x02DB5A
                bra.s   Offset_0x02DB8E
Offset_0x02DB6A:
                st      $003C(A0)
                bra.s   Offset_0x02DB8E
Offset_0x02DB70:
                moveq   #$00, D7
                move.b  #$5D, D7
                cmp.b   (A1), D7
                beq.s   Offset_0x02DB82
                dbra    D1, Offset_0x02DB5A
                bra.s   Offset_0x02DB8E
Offset_0x02DB80:
                move.l  A0, A1
Offset_0x02DB82:
                bset    #$07, $0022(A1)
                subq.b  #$08, $0031(A0)
                beq.s   Offset_0x02DB6A
Offset_0x02DB8E:
                move.l  $0034(A0), A1
                move.l  $0034(A1), A2
                btst    #$07, $0022(A2)
                bne.s   Offset_0x02DBDE
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                cmpi.b  #$04, $0025(A0)
                bne.s   Offset_0x02DBB8
                addi.w  #$0018, $000C(A0)
Offset_0x02DBB8:
                btst    #$07, $0022(A0)
                bne.s   Offset_0x02DBDA
                move.w  $0038(A0), D0
                add.w   D0, $000C(A0)
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02DBDA:
                bra     Offset_0x02D5F0
Offset_0x02DBDE:
                move.b  #$14, $0024(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, $0010(A0)
                move.w  #$FC80, $0012(A0)
                swap.w  D0
                addi.b  #$1E, D0
                andi.w  #$007F, D0
                move.b  D0, $0030(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02DC0C:
                btst    #$07, $0022(A0)
                bne     Offset_0x02D5F0
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02DC24(PC, D0), D1
                jmp     Offset_0x02DC24(PC, D1)
Offset_0x02DC24:
                dc.w    Offset_0x02DC2A-Offset_0x02DC24
                dc.w    Offset_0x02DC70-Offset_0x02DC24
                dc.w    Offset_0x02DCC0-Offset_0x02DC24
Offset_0x02DC2A:
                addq.b  #$02, $0025(A0)
                move.b  #$5D, $0000(A0)    ; Nova instância do objeto na memória
                move.l  #CPz_Boss_Mappings, $0004(A0)          ; Offset_0x02E684
                move.w  #$6500, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.b  #$04, $0018(A0)
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  #$0F, $0030(A0)
                move.b  #$04, $001C(A0)
Offset_0x02DC70:
                subq.b  #$01, $0030(A0)
                bne.s   Offset_0x02DC92
                move.b  #$05, $001C(A0)
                move.b  #$04, $0030(A0)
                addq.b  #$02, $0025(A0)
                subi.w  #$0024, $000C(A0)
                subq.w  #$02, $0008(A0)
                rts
Offset_0x02DC92:
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02DCC0:
                subq.b  #$01, $0030(A0)
                bne.s   Offset_0x02DCE6
                move.b  #$00, $0025(A0)
                move.l  $0034(A0), A1
                bset    #$01, $002E(A1)
                addq.b  #$01, $003C(A0)
                cmpi.b  #$0C, $003C(A0)
                bge     Offset_0x02D5F0
                rts
Offset_0x02DCE6:
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                subi.w  #$0024, $000C(A0)
                subq.w  #$02, $0008(A0)
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02DD0C
                addq.w  #$04, $0008(A0)
Offset_0x02DD0C:
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02DD1E:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02DD2C(PC, D0), D1
                jmp     Offset_0x02DD2C(PC, D1)
Offset_0x02DD2C:
                dc.w    Offset_0x02DD38-Offset_0x02DD2C
                dc.w    Offset_0x02DDE8-Offset_0x02DD2C
                dc.w    Offset_0x02E198-Offset_0x02DD2C
                dc.w    Offset_0x02E12E-Offset_0x02DD2C
                dc.w    Offset_0x02E1EE-Offset_0x02DD2C
                dc.w    Offset_0x02DE74-Offset_0x02DD2C
Offset_0x02DD38:
                move.l  $0034(A0), A1
                btst    #$07, $002E(A1)
                bne.s   Offset_0x02DD9A
                bset    #$07, $002E(A1)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02DD9A
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$04, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$10, $0024(A1)
                move.b  #$04, $0025(A1)
                move.b  #$09, $001C(A1)
Offset_0x02DD9A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02DDE4
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$6500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$04, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                addi.b  #$10, $0024(A1)
                move.b  #$06, $0025(A1)
Offset_0x02DDE4:
                addq.b  #$02, $0025(A0)
Offset_0x02DDE8:
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                subi.w  #$0038, $000C(A0)
                btst    #$07, $0022(A0)
                bne.s   Offset_0x02DE6C
                btst    #$02, $002E(A1)
                beq.s   Offset_0x02DE18
                bsr     Offset_0x02E058
                bsr     Offset_0x02DF7E
                bra.s   Offset_0x02DE38
Offset_0x02DE18:
                btst    #$05, $002E(A1)
                beq.s   Offset_0x02DE38
                subq.w  #$01, $002A(A0)
                bne.s   Offset_0x02DE38
                bclr    #$05, $002E(A1)
                bset    #$03, $002E(A1)
                bset    #$04, $002E(A1)
Offset_0x02DE38:
                move.l  $0034(A0), A1
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                move.w  $002E(A0), D0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02DE56
                neg.w   D0
Offset_0x02DE56:
                add.w   D0, $0008(A0)
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02DE6C:
                move.b  #$0A, $0025(A0)
                bra.s   Offset_0x02DE38
Offset_0x02DE74:
                move.l  D7, -(A7)
                move.b  #$1E, $0030(A0)
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                subi.w  #$0038, $000C(A0)
                move.w  $002E(A0), D0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02DEA0
                neg.w   D0
Offset_0x02DEA0:
                add.w   D0, $0008(A0)
                move.b  #$20, $001A(A0)
                move.b  #$14, $0024(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, $0010(A0)
                move.w  #$FC80, $0012(A0)
                moveq   #$00, D7
                move.w  $002E(A0), D0
                addi.w  #$0018, D0
                bge.s   Offset_0x02DEE2
                addi.w  #$0018, D0
                bge.s   Offset_0x02DEE0
                addi.w  #$0018, D0
                bge.s   Offset_0x02DEDE
                addq.w  #$01, D7
Offset_0x02DEDE:
                addq.w  #$01, D7
Offset_0x02DEE0:
                addq.w  #$01, D7
Offset_0x02DEE2:
                subq.w  #$01, D7
                bmi     Offset_0x02DF70
Offset_0x02DEE8:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x02D5F0
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.b  #$21, $001A(A1)
                move.b  #$14, $0024(A1)
                move.w  #$2500, $0002(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$02, $0018(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addq.w  #$08, $000C(A1)
                move.w  D7, D2
                add.w   D2, D2
                move.w  Offset_0x02DF78(PC, D2), D3
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02DF46
                neg.w   D3
Offset_0x02DF46:
                add.w   D3, $0008(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                asr.w   #$08, D0
                asr.w   #$06, D0
                move.w  D0, $0010(A1)
                move.w  #$FC80, $0012(A1)
                swap.w  D0
                addi.b  #$1E, D0
                andi.w  #$007F, D0
                move.b  D0, $0030(A1)
                dbra    D7, Offset_0x02DEE8
Offset_0x02DF70:
                move.l  (A7)+, D7
Offset_0x02DF72:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02DF78:
                dc.w    $0018, $0030, $0048
Offset_0x02DF7E:
                btst    #$03, $002E(A1)
                bne     Offset_0x02E056
                btst    #$04, $002E(A1)
                bne     Offset_0x02E056
                cmpi.w  #$FFEC, $002E(A0)
                blt.s   Offset_0x02DFB2
                btst    #$01, $002D(A1)
                beq     Offset_0x02E056
                bclr    #$01, $002D(A1)
                bset    #$02, $002D(A1)
                bra.s   Offset_0x02DFEE
Offset_0x02DFB2:
                cmpi.w  #$FFC0, $002E(A0)
                bge     Offset_0x02E056
                move.w  ($FFFFB008).w, D1
                subq.w  #$08, D1
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02DFDE
                add.w   $002E(A0), D1
                sub.w   $0008(A0), D1
                bgt     Offset_0x02E056
                cmpi.w  #$FFE8, D1
                bge.s   Offset_0x02DFEE
                rts
Offset_0x02DFDE:
                sub.w   $002E(A0), D1
                sub.w   $0008(A0), D1
                blt.s   Offset_0x02E056
                cmpi.w  #$0018, D1
                bgt.s   Offset_0x02E056
Offset_0x02DFEE:
                bset    #$05, $002E(A1)
                bclr    #$02, $002E(A1)
                move.w  #$0012, $002A(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02E056
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.b  #$10, $0024(A1)
                move.b  #$08, $0025(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$05, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$0B, $001C(A1)
                move.w  #$0024, $002A(A1)
Offset_0x02E056:
                rts
Offset_0x02E058:
                moveq   #$01, D0
                btst    #$04, $002E(A1)
                bne.s   Offset_0x02E064
                moveq   #$FFFFFFFF, D0
Offset_0x02E064:
                cmpi.w  #$FFF0, $002E(A0)
                bne.s   Offset_0x02E0DC
                bclr    #$04, $002E(A1)
                beq.s   Offset_0x02E0DC
                bclr    #$02, $002E(A1)
                clr.b   $0025(A0)
                move.l  A1, A2
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02E0DA
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  $0034(A0), $0034(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$2500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$04, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$04, $0024(A1)
                move.b  #$00, $0025(A0)
                bra.s   Offset_0x02E0DA
                move.b  #$0A, $0024(A1)
                move.l  $0034(A0), $0034(A1)
Offset_0x02E0DA:
                rts
Offset_0x02E0DC:
                move.w  $002E(A0), D1
                cmpi.w  #$FFD8, D1
                bge.s   Offset_0x02E126
                cmpi.w  #$FFC0, D1
                bge.s   Offset_0x02E11E
                move.b  #$08, $001C(A0)
                cmpi.w  #$FFA8, D1
                blt.s   Offset_0x02E108
                bgt.s   Offset_0x02E102
                btst    #$04, $002E(A1)
                beq.s   Offset_0x02E106
Offset_0x02E102:
                add.w   D0, $002E(A0)
Offset_0x02E106:
                rts
Offset_0x02E108:
                move.w  #$FFA8, $002E(A0)
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02E102
                move.w  #$0058, $002E(A0)
                bra.s   Offset_0x02E102
Offset_0x02E11E:
                move.b  #$07, $001C(A0)
                bra.s   Offset_0x02E102
Offset_0x02E126:
                move.b  #$06, $001C(A0)
                bra.s   Offset_0x02E102
Offset_0x02E12E:
                btst    #$07, $0022(A0)
                bne     Offset_0x02D5F0
                move.l  $0034(A0), A1
                move.l  $0034(A1), D0
                beq     Offset_0x02D5F0
                move.l  D0, A1
                bclr    #$03, $002E(A1)
                beq.s   Offset_0x02E162
                move.b  #$0C, $0024(A0)
                move.b  #$00, $0025(A0)
                move.b  #$87, $0020(A0)
                bra.s   Offset_0x02E1C0
Offset_0x02E162:
                bclr    #$01, $002E(A1)
                bne.s   Offset_0x02E172
                tst.b   $001C(A0)
                bne.s   Offset_0x02E1C0
                rts
Offset_0x02E172:
                tst.b   $001C(A0)
                bne.s   Offset_0x02E17E
                move.b  #$0B, $001C(A0)
Offset_0x02E17E:
                addq.b  #$01, $001C(A0)
                cmpi.b  #$17, $001C(A0)
                blt.s   Offset_0x02E1C0
                bclr    #$00, $002E(A1)
                bset    #$02, $002E(A1)
                bra.s   Offset_0x02E1C0
Offset_0x02E198:
                btst    #$07, $0022(A0)
                bne     Offset_0x02D5F0
                move.l  $0034(A0), A1
                move.l  $0034(A1), A1
                btst    #$05, $002E(A1)
                beq.s   Offset_0x02E1C0
                cmpi.b  #$09, $001C(A0)
                bne.s   Offset_0x02E1C0
                move.b  #$0A, $001C(A0)
Offset_0x02E1C0:
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  $0001(A1), $0001(A0)
                move.b  $0022(A1), $0022(A0)
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E1EE:
                btst    #$07, $0022(A0)
                bne     Offset_0x02D5F0
                subq.w  #$01, $002A(A0)
                beq     Offset_0x02D5F0
                bra.s   Offset_0x02E1C0
Offset_0x02E202:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02E210(PC, D0), D1
                jmp     Offset_0x02E210(PC, D1)
Offset_0x02E210:
                dc.w    Offset_0x02E21A-Offset_0x02E210
                dc.w    Offset_0x02E252-Offset_0x02E210
                dc.w    Offset_0x02E358-Offset_0x02E210
                dc.w    Offset_0x02E2D2-Offset_0x02E210
                dc.w    Offset_0x02E31C-Offset_0x02E210
Offset_0x02E21A:
                addq.b  #$02, $0025(A0)
                move.b  #$20, $0016(A0)
                move.b  #$19, $001C(A0)
                move.w  #$0000, $0012(A0)
                move.l  $0034(A0), A1
                move.l  $0034(A1), A1
                btst    #$02, $002D(A1)
                beq.s   Offset_0x02E252
                bclr    #$02, $002D(A1)
                move.b  #$06, $0025(A0)
                move.w  #$0009, $002A(A0)
Offset_0x02E252:
                jsr     (ObjectFall)                           ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bmi.s   Offset_0x02E27C
                cmpi.w  #$0518, $000C(A0)
                bge.s   Offset_0x02E2B4
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E27C:
                add.w   D1, $000C(A0)
                move.l  $0034(A0), A1
                move.l  $0034(A1), A1
                bset    #$02, $002E(A1)
                bset    #$04, $002E(A1)
                move.b  #$02, $0025(A1)
                addq.b  #$02, $0025(A0)
                move.b  #$00, $0028(A0)
                move.w  #$00E6, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E2B4:
                move.l  $0034(A0), A1
                move.l  $0034(A1), A1
                bset    #$02, $002E(A1)
                bset    #$04, $002E(A1)
                move.b  #$02, $0025(A1)
                bra     Offset_0x02D5F0
Offset_0x02E2D2:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x02E304
                move.b  #$02, $0018(A0)
                move.b  #$25, $001A(A0)
                move.l  $0034(A0), A1
                move.l  $0034(A1), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                addq.b  #$02, $0025(A0)
                move.b  #$08, $001E(A0)
                bra.s   Offset_0x02E31C
Offset_0x02E304:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (CPz_Boss_Animate_Data), A1            ; Offset_0x02E5CC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E31C:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02E33E
                addq.b  #$01, $001A(A0)
                move.b  #$08, $001E(A0)
                cmpi.b  #$27, $001A(A0)
                bgt     Offset_0x02E2B4
                blt.s   Offset_0x02E33E
                addi.b  #$0C, $001E(A0)
Offset_0x02E33E:
                move.l  $0034(A0), A1
                move.l  $0034(A1), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E358:
                moveq   #$00, D0
                move.b  $0028(A0), D0
                bne     Offset_0x02E456
                addi.w  #$0018, $000C(A0)
                addi.w  #$000C, $0008(A0)
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02E37C
                subi.w  #$0018, $0008(A0)
Offset_0x02E37C:
                move.b  #$04, $0016(A0)
                move.b  #$04, $0017(A0)
                addq.b  #$01, $0028(A0)
                move.b  #$09, $001A(A0)
                move.w  $0012(A0), D0
                lsr.w   #$01, D0
                neg.w   D0
                move.w  D0, $0012(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                asr.w   #$06, D0
                bmi.s   Offset_0x02E3AC
                addi.w  #$0200, D0
Offset_0x02E3AC:
                addi.w  #$FF00, D0
                move.w  D0, $0010(A0)
                move.b  #$00, $0020(A0)
                moveq   #$03, D3
Offset_0x02E3BC:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x02E450
                move.b  #$5D, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #CPz_Boss_Mappings, $0004(A1)          ; Offset_0x02E684
                move.w  #$6500, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$02, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$04, $0016(A1)
                move.b  #$04, $0017(A1)
                move.b  #$09, $001A(A1)
                move.b  #$0C, $0024(A1)
                move.b  #$04, $0025(A1)
                move.b  #$01, $0028(A1)
                move.w  $0012(A0), $0012(A1)
                move.b  $0020(A0), $0020(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                asr.w   #$06, D0
                bmi.s   Offset_0x02E43A
                addi.w  #$0080, D0
Offset_0x02E43A:
                addi.w  #$FF80, D0
                move.w  D0, $0010(A1)
                swap.w  D0
                andi.w  #$03FF, D0
                sub.w   D0, $0012(A1)
                dbra    D3, Offset_0x02E3BC
Offset_0x02E450:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E456:
                jsr     (ObjectFall)                           ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bmi.s   Offset_0x02E46C
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02E46C:
                bra     Offset_0x02D5F0
                add.w   D1, $000C(A0)
                move.w  $0012(A0), D0
                lsr.w   #$01, D0
                neg.w   D0
                move.w  D0, $0012(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E486:
                move.l  $0034(A0), A1
                move.l  $0008(A1), $0008(A0)
                move.l  $000C(A1), $000C(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                move.b  $003E(A1), D0
                cmpi.b  #$1F, D0
                bne.s   Offset_0x02E4B2
                move.b  #$02, $001C(A0)
Offset_0x02E4B2:
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x02E4C2
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x02E4C8
Offset_0x02E4C2:
                move.b  #$03, $001C(A0)
Offset_0x02E4C8:
                lea     (CPz_Boss_Animate_Data_1), A1          ; Offset_0x02E904
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02E4DA:
                dc.b    $00, $FF, $01, $00
Offset_0x02E4DE:
                btst    #$07, $0022(A0)
                bne.s   Offset_0x02E538
                move.l  $0034(A0), A1
                move.l  $0008(A1), $0008(A0)
                move.l  $000C(A1), $000C(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02E526
                move.b  #$01, $001E(A0)
                move.b  $002A(A0), D0
                addq.b  #$01, D0
                cmpi.b  #$02, D0
                ble.s   Offset_0x02E51C
                moveq   #$00, D0
Offset_0x02E51C:
                move.b  Offset_0x02E4DA(PC, D0), $001A(A0)
                move.b  D0, $002A(A0)
Offset_0x02E526:
                cmpi.b  #$FF, $001A(A0)
                bne     Offset_0x02DF72
                move.b  #$00, $001A(A0)
                rts
Offset_0x02E538:
                move.l  $0034(A0), A1
                btst    #$06, $002E(A1)
                bne.s   Offset_0x02E546
                rts
Offset_0x02E546:
                addq.b  #$02, $0025(A0)
                move.l  #CPz_Boss_Mappings_3, $0004(A0)        ; Offset_0x02EA4C
                move.w  #$0418, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$00, $001A(A0)
                move.b  #$05, $001E(A0)
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                addq.w  #$04, $000C(A0)
                subi.w  #$0028, $0008(A0)
                rts
Offset_0x02E586:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02E5C6
                move.b  #$05, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$04, $001A(A0)
                bne     Offset_0x02E5C6
                move.b  #$00, $001A(A0)
                move.l  $0034(A0), A1
                move.b  (A1), D0
                beq     Offset_0x02D5F0
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                addq.w  #$04, $000C(A0)
                subi.w  #$0028, $0008(A0)
Offset_0x02E5C6:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
CPz_Boss_Animate_Data: ; Offset_0x02E5CC:     
                dc.w    Offset_0x02E602-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E606-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E60A-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E610-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E614-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E61C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E620-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E624-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E628-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E62C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E630-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E63C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E648-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E64C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E650-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E654-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E658-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E65C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E660-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E664-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E668-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E66C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E670-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E674-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E678-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E67C-CPz_Boss_Animate_Data
                dc.w    Offset_0x02E680-CPz_Boss_Animate_Data
Offset_0x02E602:
                dc.b    $0F, $00, $FF, $00
Offset_0x02E606:
                dc.b    $0F, $01, $FF, $00
Offset_0x02E60A:
                dc.b    $05, $02, $03, $02, $FF, $00
Offset_0x02E610:
                dc.b    $05, $02, $03, $FF
Offset_0x02E614:
                dc.b    $02, $04, $05, $06, $07, $08, $FF, $00
Offset_0x02E61C:
                dc.b    $03, $09, $FF, $00
Offset_0x02E620:
                dc.b    $0F, $0A, $FF, $00
Offset_0x02E624:
                dc.b    $0F, $1C, $FF, $00
Offset_0x02E628:
                dc.b    $0F, $1E, $FF, $00
Offset_0x02E62C:
                dc.b    $0F, $0B, $FF, $00
Offset_0x02E630:
                dc.b    $03, $0C, $0C, $0D, $0D, $0D, $0D, $0D, $0C, $0C, $FD, $09
Offset_0x02E63C:
                dc.b    $03, $0E, $0E, $0F, $0F, $0F, $0F, $0F, $0E, $0E, $FF, $00
Offset_0x02E648:
                dc.b    $0F, $10, $FF, $00
Offset_0x02E64C:
                dc.b    $0F, $11, $FF, $00
Offset_0x02E650:
                dc.b    $0F, $12, $FF, $00
Offset_0x02E654:
                dc.b    $0F, $13, $FF, $00
Offset_0x02E658:
                dc.b    $0F, $14, $FF, $00
Offset_0x02E65C:
                dc.b    $0F, $15, $FF, $00
Offset_0x02E660:
                dc.b    $0F, $16, $FF, $00
Offset_0x02E664:
                dc.b    $0F, $17, $FF, $00
Offset_0x02E668:
                dc.b    $0F, $18, $FF, $00
Offset_0x02E66C:
                dc.b    $0F, $19, $FF, $00
Offset_0x02E670:
                dc.b    $0F, $1A, $FF, $00
Offset_0x02E674:
                dc.b    $0F, $1B, $FF, $00
Offset_0x02E678:
                dc.b    $0F, $1C, $FF, $00
Offset_0x02E67C:
                dc.b    $01, $1D, $1F, $FF
Offset_0x02E680:
                dc.b    $0F, $1E, $FF, $00
;-------------------------------------------------------------------------------
CPz_Boss_Mappings: ; Offset_0x02E684:    
                dc.w    Offset_0x02E6D4-CPz_Boss_Mappings
                dc.w    Offset_0x02E6EE-CPz_Boss_Mappings
                dc.w    Offset_0x02E6F8-CPz_Boss_Mappings
                dc.w    Offset_0x02E702-CPz_Boss_Mappings
                dc.w    Offset_0x02E70C-CPz_Boss_Mappings
                dc.w    Offset_0x02E716-CPz_Boss_Mappings
                dc.w    Offset_0x02E720-CPz_Boss_Mappings
                dc.w    Offset_0x02E72A-CPz_Boss_Mappings
                dc.w    Offset_0x02E734-CPz_Boss_Mappings
                dc.w    Offset_0x02E73E-CPz_Boss_Mappings
                dc.w    Offset_0x02E748-CPz_Boss_Mappings
                dc.w    Offset_0x02E75A-CPz_Boss_Mappings
                dc.w    Offset_0x02E764-CPz_Boss_Mappings
                dc.w    Offset_0x02E76E-CPz_Boss_Mappings
                dc.w    Offset_0x02E778-CPz_Boss_Mappings
                dc.w    Offset_0x02E782-CPz_Boss_Mappings
                dc.w    Offset_0x02E78C-CPz_Boss_Mappings
                dc.w    Offset_0x02E796-CPz_Boss_Mappings
                dc.w    Offset_0x02E7A0-CPz_Boss_Mappings
                dc.w    Offset_0x02E7AA-CPz_Boss_Mappings
                dc.w    Offset_0x02E7B4-CPz_Boss_Mappings
                dc.w    Offset_0x02E7C6-CPz_Boss_Mappings
                dc.w    Offset_0x02E7D8-CPz_Boss_Mappings
                dc.w    Offset_0x02E7EA-CPz_Boss_Mappings
                dc.w    Offset_0x02E7FC-CPz_Boss_Mappings
                dc.w    Offset_0x02E816-CPz_Boss_Mappings
                dc.w    Offset_0x02E830-CPz_Boss_Mappings
                dc.w    Offset_0x02E84A-CPz_Boss_Mappings
                dc.w    Offset_0x02E864-CPz_Boss_Mappings
                dc.w    Offset_0x02E87E-CPz_Boss_Mappings
                dc.w    Offset_0x02E888-CPz_Boss_Mappings
                dc.w    Offset_0x02E8AA-CPz_Boss_Mappings
                dc.w    Offset_0x02E8B4-CPz_Boss_Mappings
                dc.w    Offset_0x02E8BE-CPz_Boss_Mappings
                dc.w    Offset_0x02E8C8-CPz_Boss_Mappings
                dc.w    Offset_0x02E8D2-CPz_Boss_Mappings
                dc.w    Offset_0x02E8DC-CPz_Boss_Mappings
                dc.w    Offset_0x02E8E6-CPz_Boss_Mappings
                dc.w    Offset_0x02E8F0-CPz_Boss_Mappings
                dc.w    Offset_0x02E8FA-CPz_Boss_Mappings
Offset_0x02E6D4:
                dc.w    $0003
                dc.l    $B80D0000, $0000FFF8, $C80A0008, $00040008
                dc.l    $E0050011, $00080010
Offset_0x02E6EE:
                dc.w    $0001
                dc.l    $FC000024, $0012FFFC
Offset_0x02E6F8:
                dc.w    $0001
                dc.l    $FC040025, $0012FFF5
Offset_0x02E702:
                dc.w    $0001
                dc.l    $FC040027, $0013FFF6
Offset_0x02E70C:
                dc.w    $0001
                dc.l    $C4000036, $001BFFFB
Offset_0x02E716:
                dc.w    $0001
                dc.l    $C4000037, $001BFFFB
Offset_0x02E720:
                dc.w    $0001
                dc.l    $C4000038, $001CFFFB
Offset_0x02E72A:
                dc.w    $0001
                dc.l    $C4010039, $001CFFFB
Offset_0x02E734:
                dc.w    $0001
                dc.l    $C401003B, $001DFFFB
Offset_0x02E73E:
                dc.w    $0001
                dc.l    $FC00003D, $001EFFFC
Offset_0x02E748:
                dc.w    $0002
                dc.l    $000E0015, $000A0000, $08080021, $00100018
Offset_0x02E75A:
                dc.w    $0001
                dc.l    $18080029, $00140000
Offset_0x02E764:
                dc.w    $0001
                dc.l    $1808002C, $00160000
Offset_0x02E76E:
                dc.w    $0001
                dc.l    $1808002F, $00170008
Offset_0x02E778:
                dc.w    $0001
                dc.l    $18040032, $0019FFFC
Offset_0x02E782:
                dc.w    $0001
                dc.l    $18040034, $001AFFFC
Offset_0x02E78C:
                dc.w    $0001
                dc.l    $10080063, $00310000
Offset_0x02E796:
                dc.w    $0001
                dc.l    $10080066, $00330000
Offset_0x02E7A0:
                dc.w    $0001
                dc.l    $10080069, $00340000
Offset_0x02E7AA:
                dc.w    $0001
                dc.l    $1008006C, $00360000
Offset_0x02E7B4:
                dc.w    $0002
                dc.l    $1008006C, $00360000, $08080063, $00310000
Offset_0x02E7C6:
                dc.w    $0002
                dc.l    $1008006C, $00360000, $08080066, $00330000
Offset_0x02E7D8:
                dc.w    $0002
                dc.l    $1008006C, $00360000, $08080069, $00340000
Offset_0x02E7EA:
                dc.w    $0002
                dc.l    $1008006C, $00360000, $0808006C, $00360000
Offset_0x02E7FC:
                dc.w    $0003
                dc.l    $1008006C, $00360000, $0808006C, $00360000
                dc.l    $00080063, $00310000
Offset_0x02E816:
                dc.w    $0003
                dc.l    $1008006C, $00360000, $0808006C, $00360000
                dc.l    $00080066, $00330000
Offset_0x02E830:
                dc.w    $0003
                dc.l    $1008006C, $00360000, $0808006C, $00360000
                dc.l    $00080069, $00340000
Offset_0x02E84A:
                dc.w    $0003
                dc.l    $1008006C, $00360000, $0808006C, $00360000
                dc.l    $0008006C, $00360000
Offset_0x02E864:
                dc.w    $0003
                dc.l    $000E0015, $000A0000, $08080021, $00100018
                dc.l    $08080021, $00100030
Offset_0x02E87E:
                dc.w    $0001
                dc.l    $000B003E, $001F0000
Offset_0x02E888:
                dc.w    $0004
                dc.l    $000E0015, $000A0000, $08080021, $00100018
                dc.l    $08080021, $00100030, $08080021, $00100048
Offset_0x02E8AA:
                dc.w    $0001
                dc.l    $000B083E, $081F0000
Offset_0x02E8B4:
                dc.w    $0001
                dc.l    $000E0015, $000A0000
Offset_0x02E8BE:
                dc.w    $0001
                dc.l    $00080021, $00100000
Offset_0x02E8C8:
                dc.w    $0001
                dc.l    $B80D0000, $0000FFF8
Offset_0x02E8D2:
                dc.w    $0001
                dc.l    $C80A0008, $00040008
Offset_0x02E8DC:
                dc.w    $0001
                dc.l    $E0050011, $00080010
Offset_0x02E8E6:
                dc.w    $0001
                dc.l    $E00A004A, $0025FFF0
Offset_0x02E8F0:
                dc.w    $0001
                dc.l    $E80D0053, $0029FFF0
Offset_0x02E8FA:
                dc.w    $0001
                dc.l    $E80D005B, $002DFFF0
;-------------------------------------------------------------------------------
CPz_Boss_Animate_Data_1: ; Offset_0x02E904:   
                dc.w    Offset_0x02E90E-CPz_Boss_Animate_Data_1
                dc.w    Offset_0x02E912-CPz_Boss_Animate_Data_1
                dc.w    Offset_0x02E916-CPz_Boss_Animate_Data_1
                dc.w    Offset_0x02E920-CPz_Boss_Animate_Data_1
                dc.w    Offset_0x02E92A-CPz_Boss_Animate_Data_1
Offset_0x02E90E:
                dc.b    $0F, $00, $FF, $00
Offset_0x02E912:
                dc.b    $07, $01, $02, $FF
Offset_0x02E916:
                dc.b    $07, $05, $05, $05, $05, $05, $05, $FD, $01, $00
Offset_0x02E920:
                dc.b    $07, $03, $04, $03, $04, $03, $04, $FD, $01, $00
Offset_0x02E92A:
                dc.b    $0F, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $FD, $01, $00
;-------------------------------------------------------------------------------     
CPz_Boss_Mappings_1: ; Offset_0x02E938:    
                dc.w    Offset_0x02E946-CPz_Boss_Mappings_1
                dc.w    Offset_0x02E968-CPz_Boss_Mappings_1
                dc.w    Offset_0x02E98A-CPz_Boss_Mappings_1
                dc.w    Offset_0x02E9AC-CPz_Boss_Mappings_1
                dc.w    Offset_0x02E9CE-CPz_Boss_Mappings_1
                dc.w    Offset_0x02E9F0-CPz_Boss_Mappings_1
                dc.w    Offset_0x02EA12-CPz_Boss_Mappings_1
Offset_0x02E946:
                dc.w    $0004
                dc.l    $F8050000, $0000FFE0, $08050004, $0002FFE0
                dc.l    $F80F0008, $0004FFF0, $F8070018, $000C0010
Offset_0x02E968:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0030, $0018FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02E98A:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0038, $001CFFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02E9AC:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0040, $0020FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02E9CE:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0048, $0024FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02E9F0:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0050, $0028FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02EA12:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0058, $002CFFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002    
;-------------------------------------------------------------------------------
CPz_Boss_Mappings_2: ; Offset_0x02EA34:
                dc.w    Offset_0x02EA38-CPz_Boss_Mappings_2
                dc.w    Offset_0x02EA42-CPz_Boss_Mappings_2
Offset_0x02EA38:
                dc.w    $0001
                dc.l    $00050000, $0000001C
Offset_0x02EA42:
                dc.w    $0001
                dc.l    $00050004, $0002001C  
;-------------------------------------------------------------------------------  
CPz_Boss_Mappings_3: ; Offset_0x02EA4C:          
                dc.w    Offset_0x02EA54-CPz_Boss_Mappings_3
                dc.w    Offset_0x02EA5E-CPz_Boss_Mappings_3
                dc.w    Offset_0x02EA68-CPz_Boss_Mappings_3
                dc.w    Offset_0x02EA72-CPz_Boss_Mappings_3
Offset_0x02EA54:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x02EA5E:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x02EA68:
                dc.w    $0001
                dc.l    $F8050008, $0004FFF8
Offset_0x02EA72:
                dc.w    $0001
                dc.l    $F805000C, $0006FFF8                                                                                                                                                       
;===============================================================================
; Objeto 0x5D - Robotnik na Chemical Plant
; [ Término ]
;===============================================================================  