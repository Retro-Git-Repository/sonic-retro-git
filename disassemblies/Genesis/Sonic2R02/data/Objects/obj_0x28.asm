;===============================================================================
; Object 0x28 - Flickies (pássaros, esquilos) que aparecem ao destruir iminigos
; [ Início ]
;=============================================================================== 
Offset_0x011836:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x011844(PC, D0), D1
                jmp     Offset_0x011844(PC, D1)
Offset_0x011844:
                dc.w    Offset_0x011968-Offset_0x011844
                dc.w    Offset_0x011A8A-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011B20-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011B20-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011B20-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011AE4-Offset_0x011844
                dc.w    Offset_0x011BA0-Offset_0x011844
                dc.w    Offset_0x011BC0-Offset_0x011844
                dc.w    Offset_0x011BC0-Offset_0x011844
                dc.w    Offset_0x011BE0-Offset_0x011844
                dc.w    Offset_0x011C1A-Offset_0x011844
                dc.w    Offset_0x011C74-Offset_0x011844
                dc.w    Offset_0x011C92-Offset_0x011844
                dc.w    Offset_0x011C74-Offset_0x011844
                dc.w    Offset_0x011C92-Offset_0x011844
                dc.w    Offset_0x011C74-Offset_0x011844
                dc.w    Offset_0x011CD0-Offset_0x011844
                dc.w    Offset_0x011C36-Offset_0x011844
Offset_0x011878:
                dc.b    $06, $05, $06, $05, $06, $05, $06, $05, $09, $07, $09, $07, $09, $07, $09, $07
                dc.b    $08, $03, $08, $03, $02, $03, $08, $01, $0B, $05, $00, $07, $04, $01, $02, $05
                dc.b    $0A, $01
Offset_0x01189A:
                dc.w    $FE00, $FC00
                dc.l    Flickies_Mappings_04                   ; Offset_0x011E58
                dc.w    $FE00, $FD00
                dc.l    Flickies_Mappings                      ; Offset_0x011DC8
                dc.w    $FE80, $FD00
                dc.l    Flickies_Mappings_04                   ; Offset_0x011E58
                dc.w    $FEC0, $FE80
                dc.l    Flickies_Mappings_03                   ; Offset_0x011E34
                dc.w    $FE40, $FD00
                dc.l    Flickies_Mappings_02                   ; Offset_0x011E10
                dc.w    $FD00, $FC00
                dc.l    Flickies_Mappings                      ; Offset_0x011DC8
                dc.w    $FD80, $FC80
                dc.l    Flickies_Mappings_01                   ; Offset_0x011DEC
                dc.w    $FD80, $FD00
                dc.l    Flickies_Mappings                      ; Offset_0x011DC8
                dc.w    $FE00, $FC80
                dc.l    Flickies_Mappings_01                   ; Offset_0x011DEC
                dc.w    $FD40, $FD00
                dc.l    Flickies_Mappings_01                   ; Offset_0x011DEC
                dc.w    $FEC0, $FE00
                dc.l    Flickies_Mappings_01                   ; Offset_0x011DEC
                dc.w    $FE00, $FD00
                dc.l    Flickies_Mappings_01                   ; Offset_0x011DEC
Offset_0x0118FA:
                dc.w    $FBC0, $FC00, $FBC0, $FC00, $FBC0, $FC00, $FD00, $FC00
                dc.w    $FD00, $FC00, $FE80, $FD00, $FE80, $FD00, $FEC0, $FE80
                dc.w    $FE40, $FD00, $FE00, $FD00, $FD80, $FC80
Offset_0x011926:
                dc.l    Flickies_Mappings                      ; Offset_0x011DC8
                dc.l    Flickies_Mappings                      ; Offset_0x011DC8
                dc.l    Flickies_Mappings                      ; Offset_0x011DC8
                dc.l    Flickies_Mappings_04                   ; Offset_0x011E58
                dc.l    Flickies_Mappings_04                   ; Offset_0x011E58
                dc.l    Flickies_Mappings_04                   ; Offset_0x011E58
                dc.l    Flickies_Mappings_04                   ; Offset_0x011E58
                dc.l    Flickies_Mappings_03                   ; Offset_0x011E34
                dc.l    Flickies_Mappings_02                   ; Offset_0x011E10
                dc.l    Flickies_Mappings                      ; Offset_0x011DC8
                dc.l    Flickies_Mappings_01                   ; Offset_0x011DEC
Offset_0x011952:
                dc.w    $05A5, $05A5, $05A5, $0553, $0553, $0573, $0573, $0585
                dc.w    $0593, $0565, $05B3
Offset_0x011968:
                tst.b   $0028(A0)
                beq     Offset_0x0119D6
                moveq   #$00, D0
                move.b  $0028(A0), D0
                add.w   D0, D0
                move.b  D0, $0024(A0)
                subi.w  #$0014, D0
                move.w  Offset_0x011952(PC, D0), $0002(A0)
                add.w   D0, D0
                move.l  Offset_0x011926(PC, D0), $0004(A0)
                lea     Offset_0x0118FA(PC), A1
                move.w  $00(A1, D0), $0032(A0)
                move.w  $00(A1, D0), $0010(A0)
                move.w  $02(A1, D0), $0034(A0)
                move.w  $02(A1, D0), $0012(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$0C, $0016(A0)
                move.b  #$04, $0001(A0)
                bset    #$00, $0001(A0)
                move.b  #$06, $0018(A0)
                move.b  #$08, $0019(A0)
                move.b  #$07, $001E(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0119D6:
                addq.b  #$02, $0024(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.w  #$0580, $0002(A0)
                andi.w  #$0001, D0
                beq.s   Offset_0x0119F2
                move.w  #$0594, $0002(A0)
Offset_0x0119F2:
                moveq   #$00, D1
                move.b  (Level_Id).w, D1                             ; $FFFFFE10
                add.w   D1, D1
                add.w   D0, D1
                lea     Offset_0x011878(PC), A1
                move.b  $00(A1, D1), D0
                move.b  D0, $0030(A0)
                lsl.w   #$03, D0
                lea     Offset_0x01189A(PC), A1
                adda.w  D0, A1
                move.w  (A1)+, $0032(A0)
                move.w  (A1)+, $0034(A0)
                move.l  (A1)+, $0004(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$0C, $0016(A0)
                move.b  #$04, $0001(A0)
                bset    #$00, $0001(A0)
                move.b  #$06, $0018(A0)
                move.b  #$08, $0019(A0)
                move.b  #$07, $001E(A0)
                move.b  #$02, $001A(A0)
                move.w  #$FC00, $0012(A0)
                tst.b   $0038(A0)
                bne.s   Offset_0x011A7C
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x011A78
                move.b  #$29, $0000(A1)  ; Carrega o objeto 0x29 - Ponto dos inimigos
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $003E(A0), D0
                lsr.w   #$01, D0
                move.b  D0, $001A(A1)
Offset_0x011A78:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011A7C:
                move.b  #$1C, $0024(A0)
                clr.w   $0010(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011A8A:
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                bsr     ObjectFall                             ; Offset_0x016306
                tst.w   $0012(A0)
                bmi.s   Offset_0x011AE0
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x011AE0
                add.w   D1, $000C(A0)
                move.w  $0032(A0), $0010(A0)
                move.w  $0034(A0), $0012(A0)
                move.b  #$01, $001A(A0)
                move.b  $0030(A0), D0
                add.b   D0, D0
                addq.b  #$04, D0
                move.b  D0, $0024(A0)
                tst.b   $0038(A0)
                beq.s   Offset_0x011AE0
                btst    #$04, ($FFFFFE0F).w
                beq.s   Offset_0x011AE0
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
Offset_0x011AE0:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011AE4:
                bsr     ObjectFall                             ; Offset_0x016306
                move.b  #$01, $001A(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x011B0E
                move.b  #$00, $001A(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x011B0E
                add.w   D1, $000C(A0)
                move.w  $0034(A0), $0012(A0)
Offset_0x011B0E:
                tst.b   $0028(A0)
                bne.s   Offset_0x011B84
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011B20:
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x011B5C
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x011B5C
                add.w   D1, $000C(A0)
                move.w  $0034(A0), $0012(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x011B5C
                cmpi.b  #$0A, $0028(A0)
                beq.s   Offset_0x011B5C
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
Offset_0x011B5C:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x011B72
                move.b  #$01, $001E(A0)
                addq.b  #$01, $001A(A0)
                andi.b  #$01, $001A(A0)
Offset_0x011B72:
                tst.b   $0028(A0)
                bne.s   Offset_0x011B84
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011B84:
                move.w  $0008(A0), D0
                sub.w   ($FFFFB008).w, D0
                bcs.s   Offset_0x011B9C
                subi.w  #$0180, D0
                bpl.s   Offset_0x011B9C
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
Offset_0x011B9C:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011BA0:
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                subq.w  #$01, $0036(A0)
                bne     Offset_0x011BBC
                move.b  #$02, $0024(A0)
                move.b  #$01, $0018(A0)
Offset_0x011BBC:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011BC0:
                bsr     Offset_0x011D64
                bcc.s   Offset_0x011BDC
                move.w  $0032(A0), $0010(A0)
                move.w  $0034(A0), $0012(A0)
                move.b  #$0E, $0024(A0)
                bra     Offset_0x011B20
Offset_0x011BDC:
                bra     Offset_0x011B84
Offset_0x011BE0:
                bsr     Offset_0x011D64
                bpl.s   Offset_0x011C16
                clr.w   $0010(A0)
                clr.w   $0032(A0)
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                bsr     Offset_0x011D24
                bsr     Offset_0x011D4C
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x011C16
                move.b  #$01, $001E(A0)
                addq.b  #$01, $001A(A0)
                andi.b  #$01, $001A(A0)
Offset_0x011C16:
                bra     Offset_0x011B84
Offset_0x011C1A:
                bsr     Offset_0x011D64
                bpl.s   Offset_0x011C70
                move.w  $0032(A0), $0010(A0)
                move.w  $0034(A0), $0012(A0)
                move.b  #$04, $0024(A0)
                bra     Offset_0x011AE4
Offset_0x011C36:
                bsr     ObjectFall                             ; Offset_0x016306
                move.b  #$01, $001A(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x011C70
                move.b  #$00, $001A(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x011C70
                not.b   $0029(A0)
                bne.s   Offset_0x011C66
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
Offset_0x011C66:
                add.w   D1, $000C(A0)
                move.w  $0034(A0), $0012(A0)
Offset_0x011C70:
                bra     Offset_0x011B84
Offset_0x011C74:
                bsr     Offset_0x011D64
                bpl.s   Offset_0x011C8E
                clr.w   $0010(A0)
                clr.w   $0032(A0)
                bsr     ObjectFall                             ; Offset_0x016306
                bsr     Offset_0x011D24
                bsr     Offset_0x011D4C
Offset_0x011C8E:
                bra     Offset_0x011B84
Offset_0x011C92:
                bsr     Offset_0x011D64
                bpl.s   Offset_0x011CCC
                bsr     ObjectFall                             ; Offset_0x016306
                move.b  #$01, $001A(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x011CCC
                move.b  #$00, $001A(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x011CCC
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
                add.w   D1, $000C(A0)
                move.w  $0034(A0), $0012(A0)
Offset_0x011CCC:
                bra     Offset_0x011B84
Offset_0x011CD0:
                bsr     Offset_0x011D64
                bpl.s   Offset_0x011D20
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x011D0A
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x011D0A
                not.b   $0029(A0)
                bne.s   Offset_0x011D00
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
Offset_0x011D00:
                add.w   D1, $000C(A0)
                move.w  $0034(A0), $0012(A0)
Offset_0x011D0A:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x011D20
                move.b  #$01, $001E(A0)
                addq.b  #$01, $001A(A0)
                andi.b  #$01, $001A(A0)
Offset_0x011D20:
                bra     Offset_0x011B84
Offset_0x011D24:
                move.b  #$01, $001A(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x011D4A
                move.b  #$00, $001A(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x011D4A
                add.w   D1, $000C(A0)
                move.w  $0034(A0), $0012(A0)
Offset_0x011D4A:
                rts
Offset_0x011D4C:
                bset    #$00, $0001(A0)
                move.w  $0008(A0), D0
                sub.w   ($FFFFB008).w, D0
                bcc.s   Offset_0x011D62
                bclr    #$00, $0001(A0)
Offset_0x011D62:
                rts
Offset_0x011D64:
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                subi.w  #$00B8, D0
                rts
;===============================================================================
; Object 0x28 - Flickies (pássaros, esquilos) que aparecem ao destruir iminigos
; [ Término ]
;===============================================================================  