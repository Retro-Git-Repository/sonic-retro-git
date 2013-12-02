;===============================================================================
; Objeto 0x18 - Plataformas
; [ Início ]
;===============================================================================    
Offset_0x010474:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x010482(PC, D0), D1
                jmp     Offset_0x010482(PC, D1)
Offset_0x010482:
                dc.w    Offset_0x010496-Offset_0x010482
                dc.w    Offset_0x010532-Offset_0x010482
                dc.w    Offset_0x01059A-Offset_0x010482
                dc.w    Offset_0x010572-Offset_0x010482
                dc.w    Offset_0x01059E-Offset_0x010482
Offset_0x01048C:
                dc.b    $20, $00, $20, $01, $20, $02, $40, $03, $30, $04
Offset_0x010496:
                addq.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                lea     Offset_0x01048C(PC, D0), A2
                move.b  (A2)+, $0019(A0)
                move.b  (A2)+, $001A(A0)
                move.l  #EHz_HTz_Platform_Mappings, $0004(A0)  ; Offset_0x0107C4
                move.w  #$4000, $0002(A0)
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x0104D6
                move.l  #ARz_Platform_Mappings, $0004(A0)      ; Offset_0x01081C
                move.w  #$4000, $0002(A0)
Offset_0x0104D6:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.w  $000C(A0), $002C(A0)
                move.w  $000C(A0), $0034(A0)
                move.w  $0008(A0), $0032(A0)
                move.w  #$0080, $0026(A0)
                tst.b   $0028(A0)
                bpl.s   Offset_0x01052C
                addq.b  #$06, $0024(A0)
                andi.b  #$0F, $0028(A0)
                move.b  #$30, $0016(A0)
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x010522
                move.b  #$28, $0016(A0)
Offset_0x010522:
                bset    #$04, $0001(A0)
                bra     Offset_0x01059E
Offset_0x01052C:
                andi.b  #$0F, $0028(A0)
Offset_0x010532:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x010548
                tst.b   $0038(A0)
                beq.s   Offset_0x010554
                subq.b  #$04, $0038(A0)
                bra.s   Offset_0x010554
Offset_0x010548:
                cmpi.b  #$40, $0038(A0)
                beq.s   Offset_0x010554
                addq.b  #$04, $0038(A0)
Offset_0x010554:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x010606
                bsr     Offset_0x0105EA
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$08, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                bra.s   Offset_0x01057A
Offset_0x010572:
                bsr     Offset_0x010606
                bsr     Offset_0x0105EA
Offset_0x01057A:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x010584
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x010584:
                move.w  $0032(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x01059A
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x01059A:
                bra     DeleteObject                           ; Offset_0x01646C
Offset_0x01059E:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x0105B4
                tst.b   $0038(A0)
                beq.s   Offset_0x0105C0
                subq.b  #$04, $0038(A0)
                bra.s   Offset_0x0105C0
Offset_0x0105B4:
                cmpi.b  #$40, $0038(A0)
                beq.s   Offset_0x0105C0
                addq.b  #$04, $0038(A0)
Offset_0x0105C0:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x010606
                bsr     Offset_0x0105EA
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                bra.s   Offset_0x01057A
Offset_0x0105EA:
                move.b  $0038(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  #$0400, D1
                muls.w  D1, D0
                swap.w  D0
                add.w   $002C(A0), D0
                move.w  D0, $000C(A0)
                rts
Offset_0x010606:
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                add.w   D0, D0
                move.w  Offset_0x01061A(PC, D0), D1
                jmp     Offset_0x01061A(PC, D1)
Offset_0x01061A:
                dc.w    Offset_0x010636-Offset_0x01061A
                dc.w    Offset_0x010648-Offset_0x01061A
                dc.w    Offset_0x01068E-Offset_0x01061A
                dc.w    Offset_0x0106A6-Offset_0x01061A
                dc.w    Offset_0x0106D0-Offset_0x01061A
                dc.w    Offset_0x010638-Offset_0x01061A
                dc.w    Offset_0x01067E-Offset_0x01061A
                dc.w    Offset_0x010746-Offset_0x01061A
                dc.w    Offset_0x010772-Offset_0x01061A
                dc.w    Offset_0x010636-Offset_0x01061A
                dc.w    Offset_0x01078A-Offset_0x01061A
                dc.w    Offset_0x0107A4-Offset_0x01061A
                dc.w    Offset_0x010670-Offset_0x01061A
                dc.w    Offset_0x010660-Offset_0x01061A
Offset_0x010636:
                rts
Offset_0x010638:
                move.w  $0032(A0), D0
                move.b  $0026(A0), D1
                neg.b   D1
                addi.b  #$40, D1
                bra.s   Offset_0x010654
Offset_0x010648:
                move.w  $0032(A0), D0
                move.b  $0026(A0), D1
                subi.b  #$40, D1
Offset_0x010654:
                ext.w   D1
                add.w   D1, D0
                move.w  D0, $0008(A0)
                bra     Offset_0x0107BC
Offset_0x010660:
                move.w  $0034(A0), D0
                move.b  ($FFFFFE6C).w, D1
                neg.b   D1
                addi.b  #$30, D1
                bra.s   Offset_0x01069A
Offset_0x010670:
                move.w  $0034(A0), D0
                move.b  ($FFFFFE6C).w, D1
                subi.b  #$30, D1
                bra.s   Offset_0x01069A
Offset_0x01067E:
                move.w  $0034(A0), D0
                move.b  $0026(A0), D1
                neg.b   D1
                addi.b  #$40, D1
                bra.s   Offset_0x01069A
Offset_0x01068E:
                move.w  $0034(A0), D0
                move.b  $0026(A0), D1
                subi.b  #$40, D1
Offset_0x01069A:
                ext.w   D1
                add.w   D1, D0
                move.w  D0, $002C(A0)
                bra     Offset_0x0107BC
Offset_0x0106A6:
                tst.w   $003A(A0)
                bne.s   Offset_0x0106BE
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x0106BC
                move.w  #$001E, $003A(A0)
Offset_0x0106BC:
                rts
Offset_0x0106BE:
                subq.w  #$01, $003A(A0)
                bne.s   Offset_0x0106BC
                move.w  #$0020, $003A(A0)
                addq.b  #$01, $0028(A0)
                rts
Offset_0x0106D0:
                tst.w   $003A(A0)
                beq.s   Offset_0x0106FE
                subq.w  #$01, $003A(A0)
                bne.s   Offset_0x0106FE
                bclr    #$03, $0022(A0)
                beq.s   Offset_0x0106EA
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x01072C
Offset_0x0106EA:
                bclr    #$04, $0022(A0)
                beq.s   Offset_0x0106F8
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x01072C
Offset_0x0106F8:
                move.b  #$06, $0024(A0)
Offset_0x0106FE:
                move.l  $002C(A0), D3
                move.w  $0012(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D3, $002C(A0)
                addi.w  #$0038, $0012(A0)
                move.w  ($FFFFEECE).w, D0
                addi.w  #$0120, D0
                cmp.w   $002C(A0), D0
                bcc.s   Offset_0x01072A
                move.b  #$04, $0024(A0)
Offset_0x01072A:
                rts
Offset_0x01072C:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                move.w  $0012(A0), $0012(A1)
                rts
Offset_0x010746:
                tst.w   $003A(A0)
                bne.s   Offset_0x010766
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$04, D0
                tst.b   $00(A2, D0)
                beq.s   Offset_0x010764
                move.w  #$003C, $003A(A0)
Offset_0x010764:
                rts
Offset_0x010766:
                subq.w  #$01, $003A(A0)
                bne.s   Offset_0x010764
                addq.b  #$01, $0028(A0)
                rts
Offset_0x010772:
                subq.w  #$02, $002C(A0)
                move.w  $0034(A0), D0
                subi.w  #$0200, D0
                cmp.w   $002C(A0), D0
                bne.s   Offset_0x010788
                clr.b   $0028(A0)
Offset_0x010788:
                rts
Offset_0x01078A:
                move.w  $0034(A0), D0
                move.b  $0026(A0), D1
                subi.b  #$40, D1
                ext.w   D1
                asr.w   #$01, D1
                add.w   D1, D0
                move.w  D0, $002C(A0)
                bra     Offset_0x0107BC
Offset_0x0107A4:
                move.w  $0034(A0), D0
                move.b  $0026(A0), D1
                neg.b   D1
                addi.b  #$40, D1
                ext.w   D1
                asr.w   #$01, D1
                add.w   D1, D0
                move.w  D0, $002C(A0)
Offset_0x0107BC:
                move.b  ($FFFFFE78).w, $0026(A0)
                rts
;-------------------------------------------------------------------------------                
EHz_HTz_Platform_Mappings: ; Offset_0x0107C4:
                dc.w    Offset_0x0107C8-EHz_HTz_Platform_Mappings
                dc.w    Offset_0x0107DA-EHz_HTz_Platform_Mappings
Offset_0x0107C8:
                dc.w    $0002
                dc.l    $F40F0056, $002BFFE0, $F40F0856, $082B0000
Offset_0x0107DA:
                dc.w    $0008
                dc.l    $CC07000A, $0005FFE0, $CC0D0012, $0009FFF0
                dc.l    $DC0D001A, $000DFFF0, $CC070022, $00110010
                dc.l    $EC0F002A, $0015FFE0, $EC0F082A, $08150000
                dc.l    $0C0F003A, $001DFFE0, $0C0F083A, $081D0000
;-------------------------------------------------------------------------------
ARz_Platform_Mappings: ; Offset_0x01081C:
                dc.w    Offset_0x010820-ARz_Platform_Mappings
                dc.w    Offset_0x010842-ARz_Platform_Mappings
Offset_0x010820:
                dc.w    $0004
                dc.l    $F00E0001, $0000FFE0, $F00E0801, $08000000
                dc.l    $080E002D, $0016FFE0, $080E0039, $001C0000
Offset_0x010842:
                dc.w    $0006
                dc.l    $D00E0001, $0000FFE0, $D00E0801, $08000000
                dc.l    $E80F000D, $0006FFE0, $E80F001D, $000E0000
                dc.l    $080F000D, $0006FFE0, $080F001D, $000E0000                          
;===============================================================================
; Objeto 0x18 - Plataformas
; [ Término ]
;===============================================================================  