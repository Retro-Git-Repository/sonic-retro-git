;===============================================================================
; Objeto 0x51 - Robotnik na Casino Night
; [ Início ]
;===============================================================================  
Offset_0x0313BE:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x0313CC(PC, D0), D1
                jmp     Offset_0x0313CC(PC, D1)
Offset_0x0313CC:
                dc.w    Offset_0x0313D2-Offset_0x0313CC
                dc.w    Offset_0x0314D2-Offset_0x0313CC
                dc.w    Offset_0x0319FC-Offset_0x0313CC
Offset_0x0313D2:
                move.l  #CNz_Boss_Mappings, $0004(A0)          ; Offset_0x031BD0
                move.w  #$03A7, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.w  #$2A46, $0008(A0)
                move.w  #$0654, $000C(A0)
                move.b  #$00, $000B(A0)
                move.b  #$20, $000E(A0)
                move.b  #$80, $0014(A0)
                addq.b  #$02, $000A(A0)
                move.b  #$00, $0026(A0)
                bset    #$06, $0001(A0)
                move.b  #$04, $000F(A0)
                move.b  #$0F, $0020(A0)
                move.b  #$08, $0032(A0)
                move.w  $0008(A0), ($FFFFF750).w
                move.w  $000C(A0), ($FFFFF754).w
                move.w  $0008(A0), $0010(A0)
                move.w  $000C(A0), $0012(A0)
                move.b  #$05, $0015(A0)
                move.w  $0008(A0), $0016(A0)
                move.w  $000C(A0), $0018(A0)
                move.b  #$01, $001B(A0)
                move.w  $0008(A0), $001C(A0)
                move.w  $000C(A0), $001E(A0)
                move.b  #$06, $0021(A0)
                move.w  $0008(A0), $0022(A0)
                move.w  $000C(A0), $0024(A0)
                move.b  #$02, $0027(A0)
                move.b  #$00, $0038(A0)
                move.w  #$0000, ($FFFFF75A).w
                move.w  #$FE80, ($FFFFF758).w
                move.b  #$00, $002D(A0)
                move.w  #$0001, ($FFFFF75C).w
                bsr     Offset_0x0314A4
                rts
Offset_0x0314A4:
                lea     ($FFFFF740).w, A2
                move.b  #$08, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)+
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                move.b  #$02, (A2)+
                move.b  #$00, (A2)+
                rts
Offset_0x0314D2:
                tst.b   ($FFFFF73F).w
                beq.s   Offset_0x0314EC
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x0314EC
                move.b  #$D0, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0314EC:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x0314FA(PC, D0), D1
                jmp     Offset_0x0314FA(PC, D1)
Offset_0x0314FA:
                dc.w    Offset_0x031506-Offset_0x0314FA
                dc.w    Offset_0x031676-Offset_0x0314FA
                dc.w    Offset_0x0316F2-Offset_0x0314FA
                dc.w    Offset_0x031830-Offset_0x0314FA
                dc.w    Offset_0x0318A2-Offset_0x0314FA
                dc.w    Offset_0x031904-Offset_0x0314FA
Offset_0x031506:
                moveq   #$00, D0
                move.b  $0038(A0), D0
                move.w  Offset_0x031514(PC, D0), D0
                jmp     Offset_0x031514(PC, D0)
Offset_0x031514:
                dc.w    Offset_0x031518-Offset_0x031514
                dc.w    Offset_0x031548-Offset_0x031514
Offset_0x031518:
                cmpi.w  #$28C0, ($FFFFF750).w
                bgt.s   Offset_0x031544
                move.w  #$28C0, ($FFFFF750).w
                move.w  #$0000, ($FFFFF75A).w
                move.w  #$0180, ($FFFFF758).w
                move.b  #$02, $0038(A0)
                bset    #$00, $0001(A0)   ; Muda a direção da nave
                move.b  #$00, $002D(A0)
Offset_0x031544:
                bra     Offset_0x031574
Offset_0x031548:
                cmpi.w  #$29C0, ($FFFFF750).w
                blt.s   Offset_0x031574
                move.w  #$29C0, ($FFFFF750).w
                move.w  #$0000, ($FFFFF75A).w
                move.w  #$FE80, ($FFFFF758).w
                move.b  #$00, $0038(A0)
                bclr    #$00, $0001(A0)   ; Muda a direção da nave
                move.b  #$00, $002D(A0)
Offset_0x031574:
                bsr     Boss_Sub                               ; Offset_0x02D192
                tst.b   $003F(A0)
                beq.s   Offset_0x031586
                subq.b  #$01, $003F(A0)
                bra     Offset_0x031616
Offset_0x031586:
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                addi.w  #$0010, D0
                cmpi.w  #$0020, D0
                bcc.s   Offset_0x031616
                cmpi.w  #$06B0, ($FFFFB00C).w
                bcs.s   Offset_0x0315D6
                cmpi.b  #$03, $002D(A0)
                bcc.s   Offset_0x031616
                addq.b  #$01, $002D(A0)
                addq.b  #$02, $0026(A0)
                move.b  #$08, ($FFFFF740).w
                move.b  #$00, ($FFFFF743).w
                move.b  #$00, ($FFFFF749).w
                move.b  #$00, ($FFFFF73F).w
                bsr     Offset_0x0316BE
                move.w  #$0050, ($FFFFF75C).w
                bra     Offset_0x0316D6
Offset_0x0315D6:
                cmpi.w  #$067C, ($FFFFB00C).w
                bcs.s   Offset_0x031616
                move.b  #$0F, $000B(A0)
                move.b  #$02, ($FFFFF73F).w
                move.b  #$20, ($FFFFF743).w
                move.b  #$20, ($FFFFF749).w
                move.b  #$09, ($FFFFF740).w
                addq.b  #$04, $0026(A0)
                move.w  #$0000, ($FFFFF758).w
                move.w  #$0180, ($FFFFF75A).w
                move.b  #$00, $003E(A0)
                bra     Offset_0x0316D6
Offset_0x031616:
                bra     Offset_0x03161A
Offset_0x03161A:
                addq.w  #$01, ($FFFFF75C).w
                move.w  ($FFFFF75C).w, D0
                andi.w  #$003F, D0
                bne     Offset_0x0316D6
                btst    #$06, ($FFFFF75D).w
                beq.s   Offset_0x031654
                move.b  #$0F, $000B(A0)
                move.b  #$02, ($FFFFF73F).w
                move.b  #$20, ($FFFFF743).w
                move.b  #$20, ($FFFFF749).w
                move.b  #$09, ($FFFFF740).w
                bra     Offset_0x0316D6
Offset_0x031654:
                move.b  #$0C, $000B(A0)
                move.b  #$01, ($FFFFF73F).w
                move.b  #$00, ($FFFFF743).w
                move.b  #$00, ($FFFFF749).w
                move.b  #$04, ($FFFFF740).w
                bra     Offset_0x0316D6
Offset_0x031676:
                move.b  #$00, ($FFFFF73F).w
                subq.w  #$01, ($FFFFF75C).w
                bne.s   Offset_0x031692
                move.b  #$20, ($FFFFF743).w
                move.b  #$20, ($FFFFF749).w
                bra     Offset_0x0316D6
Offset_0x031692:
                cmpi.w  #$FFEC, ($FFFFF75C).w
                bgt     Offset_0x0316D6
                move.b  #$00, ($FFFFF743).w
                move.b  #$00, ($FFFFF749).w
                move.b  #$00, $0026(A0)
                move.w  #$FFFF, ($FFFFF75C).w
                move.b  #$40, $003F(A0)
                bra     Offset_0x0316D6
Offset_0x0316BE:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x0316D4
                move.b  #$51, (A1)         ; Nova instância do objeto na memória
                move.b  #$04, $000A(A1)
                move.l  A0, $0034(A1)
Offset_0x0316D4:
                rts
Offset_0x0316D6:
                bsr     Offset_0x0317AC
                bsr     Offset_0x031952
                bsr     Offset_0x031762
                lea     (CNz_Boss_Animate_Data), A1            ; Offset_0x031B7E
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
CNz_Boss_DisplaySprite: ; Offset_0x0316EC:                     
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0316F2:
                bsr     Boss_Sub                               ; Offset_0x02D192
                tst.b   $003E(A0)
                bne.s   Offset_0x031730
                cmpi.w  #$0680, $000C(A0)
                bcs.s   Offset_0x0316D6
                move.w  #$0000, ($FFFFF758).w
                move.w  #$FE80, ($FFFFF75A).w
                move.b  #$FF, $003E(A0)
                move.b  #$01, ($FFFFF73F).w
                move.b  #$00, ($FFFFF743).w
                move.b  #$00, ($FFFFF749).w
                move.b  #$04, ($FFFFF740).w
                bra.s   Offset_0x0316D6
Offset_0x031730:
                cmpi.w  #$0654, $000C(A0)
                bcc.s   Offset_0x0316D6
                move.b  #$00, $0026(A0)
                move.w  #$0000, ($FFFFF75A).w
                move.w  #$FE80, ($FFFFF758).w
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03175E
                move.w  #$0180, ($FFFFF758).w
                move.b  #$0C, $000B(A0)
Offset_0x03175E:
                bra     Offset_0x0316D6
Offset_0x031762:
                cmpi.b  #$2F, $0014(A0)
                bne.s   Offset_0x03177C
                lea     ($FFFFF740).w, A1
                andi.b  #$F0, $0006(A1)
                ori.b   #$06, $0006(A1)
                rts
Offset_0x03177C:
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x03178C
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x0317AA
Offset_0x03178C:
                lea     ($FFFFF740).w, A1
                move.b  $0006(A1), D0
                andi.b  #$0F, D0
                cmpi.b  #$06, D0
                beq.s   Offset_0x0317AA
                andi.b  #$F0, $0006(A1)
                ori.b   #$05, $0006(A1)
Offset_0x0317AA:
                rts
Offset_0x0317AC:
                move.b  $001A(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$06, D0
                add.w   ($FFFFF754).w, D0
                move.w  D0, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                addq.b  #$02, $001A(A0)
                cmpi.b  #$06, $0026(A0)
                bcc.s   Offset_0x031810
                tst.b   $0032(A0)
                beq.s   Offset_0x031812
                tst.b   $0020(A0)
                bne.s   Offset_0x031810
                tst.b   $0014(A0)
                bne.s   Offset_0x0317F4
                move.b  #$30, $0014(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0317F4:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x031802
                move.w  #$0EEE, D0
Offset_0x031802:
                move.w  D0, (A1)
                subq.b  #$01, $0014(A0)
                bne.s   Offset_0x031810
                move.b  #$0F, $0020(A0)
Offset_0x031810:
                rts
Offset_0x031812:
                moveq   #$64, D0
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.w  #$00B3, ($FFFFF75C).w
                move.b  #$06, $0026(A0)
                moveq   #$40, D0
                jsr     (LoadPLC)                              ; Offset_0x0015DA
                rts
Offset_0x031830:
                st      $002C(A0)
                subq.w  #$01, ($FFFFF75C).w
                bmi.s   Offset_0x031852
                move.b  #$00, ($FFFFF73F).w
                move.b  #$00, $000B(A0)
                move.b  #$0B, $0021(A0)
                bsr     Boss_Defeated                          ; Offset_0x02D278
                bra.s   Offset_0x03188C
Offset_0x031852:
                bset    #$00, $0001(A0)
                clr.w   ($FFFFF758).w
                clr.w   ($FFFFF75A).w
                addq.b  #$02, $0026(A0)
                lea     ($FFFFF740).w, A1
                andi.b  #$F0, $0006(A1)
                ori.b   #$03, $0006(A1)
                move.b  #$08, $0000(A1)
                move.b  #$DD, ($FFFF8C54).w
                move.b  #$01, ($FFFFF72C).w
                move.w  #$FFEE, ($FFFFF75C).w
Offset_0x03188C:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x031952
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0318A2:
                addq.w  #$01, ($FFFFF75C).w
                beq.s   Offset_0x0318B2
                bpl.s   Offset_0x0318B8
                addi.w  #$0018, ($FFFFF75A).w
                bra.s   Offset_0x0318E6
Offset_0x0318B2:
                clr.w   ($FFFFF75A).w
                bra.s   Offset_0x0318E6
Offset_0x0318B8:
                cmpi.w  #$0018, ($FFFFF75C).w
                bcs.s   Offset_0x0318D0
                beq.s   Offset_0x0318D6
                cmpi.w  #$0020, ($FFFFF75C).w
                bcs.s   Offset_0x0318E6
                addq.b  #$02, $0026(A0)
                bra.s   Offset_0x0318E6
Offset_0x0318D0:
                subq.w  #$08, ($FFFFF75A).w
                bra.s   Offset_0x0318E6
Offset_0x0318D6:
                clr.w   ($FFFFF75A).w
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
Offset_0x0318E6:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x0317AC
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x031952
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x031904:
                move.w  #$0400, ($FFFFF758).w
                move.w  #$FFC0, ($FFFFF75A).w
                cmpi.w  #$2B20, ($FFFFEECA).w
                beq.s   Offset_0x03191E
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x031924
Offset_0x03191E:
                tst.b   $0001(A0)
                bpl.s   Offset_0x03194C
Offset_0x031924:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x0317AC
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x031952
                lea     (CNz_Boss_Animate_Data), A1            ; Offset_0x031B7E
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03194C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x031952:
                move.w  $0008(A0), D0
                move.w  $000C(A0), D1
                move.w  D0, $0016(A0)
                move.w  D1, $0018(A0)
                move.w  D0, $001C(A0)
                move.w  D1, $001E(A0)
                tst.b   $002C(A0)
                bne.s   Offset_0x03198A
                move.w  D0, $0022(A0)
                move.w  D1, $0024(A0)
                move.w  D0, $0010(A0)
                move.w  D1, $0012(A0)
                move.w  D1, $003A(A0)
                move.w  D1, $0034(A0)
                rts
Offset_0x03198A:
                cmpi.w  #$0078, ($FFFFF75C).w
                bgt.s   Offset_0x0319FA
                subq.w  #$01, $0022(A0)    ; Ejeta garra esquerda da nave
                move.l  $003A(A0), D0
                move.w  $002E(A0), D1
                addi.w  #$0038, $002E(A0)
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, $003A(A0)
                move.w  $003A(A0), $0024(A0)
                cmpi.w  #$06F0, $0024(A0)
                blt.s   Offset_0x0319C2
                move.w  #$0000, $002E(A0)
Offset_0x0319C2:
                cmpi.w  #$003C, ($FFFFF75C).w
                bgt.s   Offset_0x0319FA
                addq.w  #$01, $0010(A0)    ; Ejeta garra direita da nave
                move.l  $0034(A0), D0
                move.w  $0030(A0), D1
                addi.w  #$0038, $0030(A0)
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, $0034(A0)
                move.w  $0034(A0), $0012(A0)
                cmpi.w  #$06F0, $0012(A0)
                blt.s   Offset_0x0319FA
                move.w  #$0000, $0030(A0)
Offset_0x0319FA:
                rts
Offset_0x0319FC:
                move.l  $0034(A0), A1
                cmpi.b  #$06, $0026(A1)
                bcc     Offset_0x03194C
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x031A18(PC, D0), D1
                jmp     Offset_0x031A18(PC, D1)
Offset_0x031A18:
                dc.w    Offset_0x031A20-Offset_0x031A18
                dc.w    Offset_0x031A6E-Offset_0x031A18
                dc.w    Offset_0x031AB4-Offset_0x031A18
                dc.w    Offset_0x031B5E-Offset_0x031A18
Offset_0x031A20:
                move.l  #CNz_Boss_Mappings, $0004(A0)          ; Offset_0x031BD0
                move.w  #$03A7, $0002(A0)  ; Bola com espinhos VRAM
                ori.b   #$04, $0001(A0)
                move.b  #$07, $0018(A0)
                addq.b  #$02, $0025(A0)
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                addi.w  #$0030, $000C(A0)
                move.b  #$08, $0016(A0)
                move.b  #$08, $0017(A0)
                move.b  #$12, $001A(A0)
                move.b  #$98, $0020(A0)
                rts
Offset_0x031A6E:
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.w  $0028(A0), D0
                add.w   D0, $000C(A0)
                addq.w  #$01, D0
                cmpi.w  #$002E, D0
                blt.s   Offset_0x031A92
                move.w  #$002E, D0
Offset_0x031A92:
                move.w  D0, $0028(A0)
                tst.w   ($FFFFF75C).w
                bne     CNz_Boss_DisplaySprite                 ; Offset_0x0316EC
                addq.b  #$02, $0025(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x031AB4:
                bsr     Offset_0x031AD2
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl     CNz_Boss_DisplaySprite                 ; Offset_0x0316EC
                add.w   D1, $000C(A0)
                bsr     Offset_0x031B0A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x031AD2:
                moveq   #$00, D2
                move.w  $0008(A0), D2
                swap.w  D2
                moveq   #$00, D3
                move.w  $000C(A0), D3
                swap.w  D3
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                addi.w  #$0038, $0012(A0)
                swap.w  D2
                move.w  D2, $0008(A0)
                swap.w  D3
                move.w  D3, $000C(A0)
                rts
Offset_0x031B0A:
                move.b  #Explosion_Sfx, D0      ; $C4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.w  #$03A7, $0002(A0)  ; Bola com espinhos VRAM
                move.b  #$07, $001C(A0)
                move.w  #$FD00, $0012(A0)
                move.w  #$FF00, $0010(A0)
                move.b  #$04, $000A(A0)
                move.b  #$06, $0025(A0)
                move.b  #$98, $0020(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x031B5C
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x031B4C:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x031B4C
                neg.w   $0010(A1)
Offset_0x031B5C:
                rts
Offset_0x031B5E:
                bsr     Offset_0x031AD2
                lea     (CNz_Boss_Animate_Data), A1            ; Offset_0x031B7E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                cmpi.w  #$0705, $000C(A0)
                bcs     CNz_Boss_DisplaySprite                 ; Offset_0x0316EC
                jmp     (Offset_0x03194C)
;-------------------------------------------------------------------------------
CNz_Boss_Animate_Data: ; Offset_0x031B7E:
                dc.w    Offset_0x031B92-CNz_Boss_Animate_Data
                dc.w    Offset_0x031B96-CNz_Boss_Animate_Data
                dc.w    Offset_0x031B9C-CNz_Boss_Animate_Data
                dc.w    Offset_0x031BA2-CNz_Boss_Animate_Data
                dc.w    Offset_0x031BA6-CNz_Boss_Animate_Data
                dc.w    Offset_0x031BAC-CNz_Boss_Animate_Data
                dc.w    Offset_0x031BB8-CNz_Boss_Animate_Data
                dc.w    Offset_0x031BC2-CNz_Boss_Animate_Data
                dc.w    Offset_0x031BC6-CNz_Boss_Animate_Data
                dc.w    Offset_0x031BCA-CNz_Boss_Animate_Data
Offset_0x031B92:
                dc.b    $0F, $01, $FF, $00
Offset_0x031B96:
                dc.b    $0F, $04, $FF, $05, $FC, $02
Offset_0x031B9C:
                dc.b    $0F, $02, $FF, $03, $FC, $02
Offset_0x031BA2:
                dc.b    $07, $06, $07, $FF
Offset_0x031BA6:
                dc.b    $01, $0C, $0D, $0E, $FF, $00
Offset_0x031BAC:
                dc.b    $07, $08, $09, $08, $09, $08, $09, $08, $09, $FD, $03, $00
Offset_0x031BB8:
                dc.b    $07, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $FD, $03
Offset_0x031BC2:
                dc.b    $03, $13, $14, $FF
Offset_0x031BC6:
                dc.b    $01, $00, $FF, $00
Offset_0x031BCA:
                dc.b    $01, $0F, $10, $11, $FF, $00
;-------------------------------------------------------------------------------
CNz_Boss_Mappings: ; Offset_0x031BD0:
                dc.w    CNz_Boss_Mappings-CNz_Boss_Mappings
                dc.w    Offset_0x031BFA-CNz_Boss_Mappings
                dc.w    Offset_0x031C24-CNz_Boss_Mappings
                dc.w    Offset_0x031C2E-CNz_Boss_Mappings
                dc.w    Offset_0x031C38-CNz_Boss_Mappings
                dc.w    Offset_0x031C42-CNz_Boss_Mappings
                dc.w    Offset_0x031C54-CNz_Boss_Mappings
                dc.w    Offset_0x031C66-CNz_Boss_Mappings
                dc.w    Offset_0x031C78-CNz_Boss_Mappings
                dc.w    Offset_0x031C8A-CNz_Boss_Mappings
                dc.w    Offset_0x031C9C-CNz_Boss_Mappings
                dc.w    Offset_0x031CAE-CNz_Boss_Mappings
                dc.w    Offset_0x031CC0-CNz_Boss_Mappings
                dc.w    Offset_0x031CCA-CNz_Boss_Mappings
                dc.w    Offset_0x031CD4-CNz_Boss_Mappings
                dc.w    Offset_0x031CDE-CNz_Boss_Mappings
                dc.w    Offset_0x031CF0-CNz_Boss_Mappings
                dc.w    Offset_0x031D02-CNz_Boss_Mappings
                dc.w    Offset_0x031D14-CNz_Boss_Mappings
                dc.w    Offset_0x031D1E-CNz_Boss_Mappings
                dc.w    Offset_0x031D28-CNz_Boss_Mappings
Offset_0x031BFA:
                dc.w    $0005
                dc.l    $F005017D, $00BE0010, $D80E2060, $2030FFF9
                dc.l    $000F206C, $2036FFD8, $000F207C, $203EFFF8
                dc.l    $0006208C, $20460018
Offset_0x031C24:
                dc.w    $0001
                dc.l    $180620AA, $2055FFE4
Offset_0x031C2E:
                dc.w    $0001
                dc.l    $100620B0, $2058FFDB
Offset_0x031C38:
                dc.w    $0001
                dc.l    $100B2092, $20490008
Offset_0x031C42:
                dc.w    $0002
                dc.l    $1009209E, $204F0008, $100620A4, $20520020
Offset_0x031C54:
                dc.w    $0002
                dc.l    $F00D0189, $00C4FFF0, $F0050181, $00C0FFE0
Offset_0x031C66:
                dc.w    $0002
                dc.l    $F00D0191, $00C8FFF0, $F0050181, $00C0FFE0
Offset_0x031C78:
                dc.w    $0002
                dc.l    $F00D0199, $00CCFFF0, $F0050185, $00C2FFE0
Offset_0x031C8A:
                dc.w    $0002
                dc.l    $F00D01A1, $00D0FFF0, $F0050185, $00C2FFE0
Offset_0x031C9C:
                dc.w    $0002
                dc.l    $F00D01A9, $00D4FFF0, $F0050185, $00C2FFE0
Offset_0x031CAE:
                dc.w    $0002
                dc.l    $F00D01B1, $00D8FFF0, $F0050185, $00C2FFE0
Offset_0x031CC0:
                dc.w    $0001
                dc.l    $280C20B6, $205BFFF0
Offset_0x031CCA:
                dc.w    $0001
                dc.l    $280C20BA, $205DFFF0
Offset_0x031CD4:
                dc.w    $0001
                dc.l    $280C20BE, $205FFFF0
Offset_0x031CDE:
                dc.w    $0002
                dc.l    $200C20C2, $2061FFE4, $200C20C6, $20630004
Offset_0x031CF0:
                dc.w    $0002
                dc.l    $200C20CA, $2065FFE4, $200C20CE, $20670004
Offset_0x031D02:
                dc.w    $0002
                dc.l    $200C20D2, $2069FFE4, $200C20D6, $206B0004
Offset_0x031D14:
                dc.w    $0001
                dc.l    $F40A00DA, $006DFFF4
Offset_0x031D1E:
                dc.w    $0001
                dc.l    $FC0000E3, $0071FFFC
Offset_0x031D28:
                dc.w    $0001
                dc.l    $FC0000E4, $0072FFFC
;===============================================================================
; Objeto 0x51 - Robotnik na Casino Night
; [ Término ]
;===============================================================================  