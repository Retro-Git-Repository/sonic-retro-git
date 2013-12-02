;===============================================================================
; Objeto 0x11 - Pontes na Emerald Hill / Hidden Palace
; [ Início ]
;===============================================================================         
Offset_0x00F656:
                btst    #$06, $0001(A0)
                bne     Offset_0x00F66E
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00F676(PC, D0), D1
                jmp     Offset_0x00F676(PC, D1)
Offset_0x00F66E:
                move.w  #$0180, D0
                bra     DisplaySprite_Param                    ; Offset_0x0164B6
Offset_0x00F676:
                dc.w    Offset_0x00F67E-Offset_0x00F676
                dc.w    Offset_0x00F766-Offset_0x00F676
                dc.w    Offset_0x00F7F8-Offset_0x00F676
                dc.w    Offset_0x00F7FC-Offset_0x00F676
Offset_0x00F67E:
                addq.b  #$02, $0024(A0)
                move.l  #EHz_Bridge_Mappings, $0004(A0)        ; Offset_0x00FC5E
                move.w  #$43B6, $0002(A0)
                move.b  #$03, $0018(A0)
                cmpi.b  #$08, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00F6B0
                addq.b  #$04, $0024(A0)
                move.l  #HPz_Bridge_Mappings, $0004(A0)        ; Offset_0x00FC16
                move.w  #$6300, $0002(A0)
Offset_0x00F6B0:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$80, $0019(A0)
                move.w  $000C(A0), D2
                move.w  D2, $003C(A0)
                move.w  $0008(A0), D3
                lea     $0028(A0), A2
                moveq   #$00, D1
                move.b  (A2), D1
                move.w  D1, D0
                lsr.w   #$01, D0
                lsl.w   #$04, D0
                sub.w   D0, D3
                swap.w  D1
                move.w  #$0008, D1
                bsr.s   Offset_0x00F712
                move.w  $0028(A1), D0
                subq.w  #$08, D0
                move.w  D0, $0008(A1)
                move.l  A1, $0030(A0)
                swap.w  D1
                subq.w  #$08, D1
                bls.s   Offset_0x00F710
                move.w  D1, D4
                bsr.s   Offset_0x00F712
                move.l  A1, $0034(A0)
                move.w  D4, D0
                add.w   D0, D0
                add.w   D4, D0
                move.w  $10(A1, D0), D0
                subq.w  #$08, D0
                move.w  D0, $0008(A1)
Offset_0x00F710:
                bra.s   Offset_0x00F766
Offset_0x00F712:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x00F764
                move.b  $0000(A0), $0000(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  $0001(A0), $0001(A1)
                bset    #$06, $0001(A1)
                move.b  #$40, $000E(A1)
                move.b  D1, $000F(A1)
                subq.b  #$01, D1
                lea     $0010(A1), A2
Offset_0x00F754:
                move.w  D3, (A2)+
                move.w  D2, (A2)+
                move.w  #$0000, (A2)+
                addi.w  #$0010, D3
                dbra    D1, Offset_0x00F754
Offset_0x00F764:
                rts
Offset_0x00F766:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x00F77C
                tst.b   $003E(A0)
                beq.s   Offset_0x00F7A8
                subq.b  #$04, $003E(A0)
                bra.s   Offset_0x00F7A4
Offset_0x00F77C:
                andi.b  #$10, D0
                beq.s   Offset_0x00F798
                move.b  $003F(A0), D0
                sub.b   $003B(A0), D0
                beq.s   Offset_0x00F798
                bcc.s   Offset_0x00F794
                addq.b  #$01, $003F(A0)
                bra.s   Offset_0x00F798
Offset_0x00F794:
                subq.b  #$01, $003F(A0)
Offset_0x00F798:
                cmpi.b  #$40, $003E(A0)
                beq.s   Offset_0x00F7A4
                addq.b  #$04, $003E(A0)
Offset_0x00F7A4:
                bsr     Offset_0x00F9D4
Offset_0x00F7A8:
                moveq   #$00, D1
                move.b  $0028(A0), D1
                lsl.w   #$03, D1
                move.w  D1, D2
                addq.w  #$08, D1
                add.w   D2, D2
                moveq   #$08, D3
                move.w  $0008(A0), D4
                bsr     Offset_0x00F85E
Offset_0x00F7C0:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x00F7C8
                rts
Offset_0x00F7C8:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x00F7DC
                rts
Offset_0x00F7DC:
                move.l  $0030(A0), A1
                bsr     Delete_A1_Object                       ; Offset_0x01646E
                cmpi.b  #$08, $0028(A0)
                bls.s   Offset_0x00F7F4
                move.l  $0034(A0), A1
                bsr     Delete_A1_Object                       ; Offset_0x01646E
Offset_0x00F7F4:
                bra     DeleteObject                           ; Offset_0x01646C
Offset_0x00F7F8:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x00F7FC:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x00F812
                tst.b   $003E(A0)
                beq.s   Offset_0x00F83E
                subq.b  #$04, $003E(A0)
                bra.s   Offset_0x00F83A
Offset_0x00F812:
                andi.b  #$10, D0
                beq.s   Offset_0x00F82E
                move.b  $003F(A0), D0
                sub.b   $003B(A0), D0
                beq.s   Offset_0x00F82E
                bcc.s   Offset_0x00F82A
                addq.b  #$01, $003F(A0)
                bra.s   Offset_0x00F82E
Offset_0x00F82A:
                subq.b  #$01, $003F(A0)
Offset_0x00F82E:
                cmpi.b  #$40, $003E(A0)
                beq.s   Offset_0x00F83A
                addq.b  #$04, $003E(A0)
Offset_0x00F83A:
                bsr     Offset_0x00F9D4
Offset_0x00F83E:
                moveq   #$00, D1
                move.b  $0028(A0), D1
                lsl.w   #$03, D1
                move.w  D1, D2
                addq.w  #$08, D1
                add.w   D2, D2
                moveq   #$08, D3
                move.w  $0008(A0), D4
                bsr     Offset_0x00F85E
                bsr     Offset_0x00F8FE
                bra     Offset_0x00F7C0
Offset_0x00F85E:
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                moveq   #$3B, D5
                movem.l D1-D4, -(A7)
                bsr.s   Offset_0x00F878
                movem.l (A7)+, D1-D4
                lea     ($FFFFB000).w, A1
                subq.b  #$01, D6
                moveq   #$3F, D5
Offset_0x00F878:
                btst    D6, $0022(A0)
                beq.s   Offset_0x00F8DA
                btst    #$01, $0022(A1)
                bne.s   Offset_0x00F898
                moveq   #$00, D0
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                add.w   D1, D0
                bmi.s   Offset_0x00F898
                cmp.w   D2, D0
                bcs.s   Offset_0x00F8A6
Offset_0x00F898:
                bclr    #$03, $0022(A1)
                bclr    D6, $0022(A0)
                moveq   #$00, D4
                rts
Offset_0x00F8A6:
                lsr.w   #$04, D0
                move.b  D0, $00(A0, D5)
                move.l  $0030(A0), A2
                cmpi.w  #$0008, D0
                bcs.s   Offset_0x00F8BC
                move.l  $0034(A0), A2
                subq.w  #$08, D0
Offset_0x00F8BC:
                add.w   D0, D0
                move.w  D0, D1
                add.w   D0, D0
                add.w   D1, D0
                move.w  $12(A2, D0), D0
                subq.w  #$08, D0
                moveq   #$00, D1
                move.b  $0016(A1), D1
                sub.w   D1, D0
                move.w  D0, $000C(A1)
                moveq   #$00, D4
                rts
Offset_0x00F8DA:
                move.w  D1, -(A7)
                jsr     (Offset_0x019D0A)
                move.w  (A7)+, D1
                btst    D6, $0022(A0)
                beq.s   Offset_0x00F8FC
                moveq   #$00, D0
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                add.w   D1, D0
                lsr.w   #$04, D0
                move.b  D0, $00(A0, D5)
Offset_0x00F8FC:
                rts
Offset_0x00F8FE:
                moveq   #$00, D0
                tst.w   ($FFFFB010).w
                bne.s   Offset_0x00F910
                move.b  ($FFFFFE0F).w, D0
                andi.w  #$001C, D0
                lsr.w   #$01, D0
Offset_0x00F910:
                moveq   #$00, D2
                move.b  Offset_0x00F93C+$01(PC, D0), D2
                swap.w  D2
                move.b  Offset_0x00F93C(PC, D0), D2
                moveq   #$00, D0
                tst.w   ($FFFFB050).w
                bne.s   Offset_0x00F92E
                move.b  ($FFFFFE0F).w, D0
                andi.w  #$001C, D0
                lsr.w   #$01, D0
Offset_0x00F92E:
                moveq   #$00, D6
                move.b  Offset_0x00F93C+$01(PC, D0), D6
                swap.w  D6
                move.b  Offset_0x00F93C(PC, D0), D6
                bra.s   Offset_0x00F94C
;-------------------------------------------------------------------------------                  
Offset_0x00F93C:
                dc.b    $01, $02, $01, $02, $01, $02, $01, $02, $00, $01, $00, $00, $00, $00, $00, $01
;-------------------------------------------------------------------------------  
Offset_0x00F94C:
                moveq   #$FFFFFFFE, D3
                moveq   #$FFFFFFFE, D4
                move.b  $0022(A0), D0
                andi.b  #$08, D0
                beq.s   Offset_0x00F95E
                move.b  $003F(A0), D3
Offset_0x00F95E:
                move.b  $0022(A0), D0
                andi.b  #$10, D0
                beq.s   Offset_0x00F96C
                move.b  $003B(A0), D4
Offset_0x00F96C:
                move.l  $0030(A0), A1
                lea     $0045(A1), A2
                lea     $0015(A1), A1
                moveq   #$00, D1
                move.b  $0028(A0), D1
                subq.b  #$01, D1
                moveq   #$00, D5
Offset_0x00F982:
                moveq   #$00, D0
                subq.w  #$01, D3
                cmp.b   D3, D5
                bne.s   Offset_0x00F98C
                move.w  D2, D0
Offset_0x00F98C:
                addq.w  #$02, D3
                cmp.b   D3, D5
                bne.s   Offset_0x00F994
                move.w  D2, D0
Offset_0x00F994:
                subq.w  #$01, D3
                subq.w  #$01, D4
                cmp.b   D4, D5
                bne.s   Offset_0x00F99E
                move.w  D6, D0
Offset_0x00F99E:
                addq.w  #$02, D4
                cmp.b   D4, D5
                bne.s   Offset_0x00F9A6
                move.w  D6, D0
Offset_0x00F9A6:
                subq.w  #$01, D4
                cmp.b   D3, D5
                bne.s   Offset_0x00F9B2
                swap.w  D2
                move.w  D2, D0
                swap.w  D2
Offset_0x00F9B2:
                cmp.b   D4, D5
                bne.s   Offset_0x00F9BC
                swap.w  D6
                move.w  D6, D0
                swap.w  D6
Offset_0x00F9BC:
                move.b  D0, (A1)
                addq.w  #$01, D5
                addq.w  #$06, A1
                cmpa.w  A2, A1
                bne.s   Offset_0x00F9CE
                move.l  $0034(A0), A1
                lea     $0015(A1), A1
Offset_0x00F9CE:
                dbra    D1, Offset_0x00F982
                rts
Offset_0x00F9D4:
                move.b  $003E(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  D0, D4
                lea     (Offset_0x00FB16), A4
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$04, D0
                moveq   #$00, D3
                move.b  $003F(A0), D3
                move.w  D3, D2
                add.w   D0, D3
                moveq   #$00, D5
                lea     (Offset_0x00FA86-$80), A5
                move.b  $00(A5, D3), D5
                andi.w  #$000F, D3
                lsl.w   #$04, D3
                lea     $00(A4, D3), A3
                move.l  $0030(A0), A1
                lea     $0042(A1), A2
                lea     $0012(A1), A1
Offset_0x00FA1A:
                moveq   #$00, D0
                move.b  (A3)+, D0
                addq.w  #$01, D0
                mulu.w  D5, D0
                mulu.w  D4, D0
                swap.w  D0
                add.w   $003C(A0), D0
                move.w  D0, (A1)
                addq.w  #$06, A1
                cmpa.w  A2, A1
                bne.s   Offset_0x00FA3A
                move.l  $0034(A0), A1
                lea     $0012(A1), A1
Offset_0x00FA3A:
                dbra    D2, Offset_0x00FA1A
                moveq   #$00, D0
                move.b  $0028(A0), D0
                moveq   #$00, D3
                move.b  $003F(A0), D3
                addq.b  #$01, D3
                sub.b   D0, D3
                neg.b   D3
                bmi.s   Offset_0x00FA84
                move.w  D3, D2
                lsl.w   #$04, D3
                lea     $00(A4, D3), A3
                adda.w  D2, A3
                subq.w  #$01, D2
                bcs.s   Offset_0x00FA84
Offset_0x00FA60:
                moveq   #$00, D0
                move.b  -(A3), D0
                addq.w  #$01, D0
                mulu.w  D5, D0
                mulu.w  D4, D0
                swap.w  D0
                add.w   $003C(A0), D0
                move.w  D0, (A1)
                addq.w  #$06, A1
                cmpa.w  A2, A1
                bne.s   Offset_0x00FA80
                move.l  $0034(A0), A1
                lea     $0012(A1), A1
Offset_0x00FA80:
                dbra    D2, Offset_0x00FA60
Offset_0x00FA84:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x00FA86:
                dc.b    $02, $04, $06, $08, $08, $06, $04, $02, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $08, $06, $04, $02, $00, $00, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0A, $08, $06, $04, $02, $00, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0A, $08, $06, $04, $02, $00, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0C, $0A, $08, $06, $04, $02, $00, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $0C, $0A, $08, $06, $04, $02, $00, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $0E, $0C, $0A, $08, $06, $04, $02, $00, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $10, $0E, $0C, $0A, $08, $06, $04, $02, $00
                dc.b    $02, $04, $06, $08, $0A, $0C, $0E, $10, $10, $0E, $0C, $0A, $08, $06, $04, $02
;-------------------------------------------------------------------------------    
Offset_0x00FB16:
                dc.b    $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $B5, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $7E, $DB, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $61, $B5, $EC, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $4A, $93, $CD, $F3, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $3E, $7E, $B0, $DB, $F6, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $38, $6D, $9D, $C5, $E4, $F8, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $31, $61, $8E, $B5, $D4, $EC, $FB, $FF, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $2B, $56, $7E, $A2, $C1, $DB, $EE, $FB, $FF, $00, $00, $00, $00, $00, $00, $00
                dc.b    $25, $4A, $73, $93, $B0, $CD, $E1, $F3, $FC, $FF, $00, $00, $00, $00, $00, $00
                dc.b    $1F, $44, $67, $88, $A7, $BD, $D4, $E7, $F4, $FD, $FF, $00, $00, $00, $00, $00
                dc.b    $1F, $3E, $5C, $7E, $98, $B0, $C9, $DB, $EA, $F6, $FD, $FF, $00, $00, $00, $00
                dc.b    $19, $38, $56, $73, $8E, $A7, $BD, $D1, $E1, $EE, $F8, $FE, $FF, $00, $00, $00
                dc.b    $19, $38, $50, $6D, $83, $9D, $B0, $C5, $D8, $E4, $F1, $F8, $FE, $FF, $00, $00
                dc.b    $19, $31, $4A, $67, $7E, $93, $A7, $BD, $CD, $DB, $E7, $F3, $F9, $FE, $FF, $00
                dc.b    $19, $31, $4A, $61, $78, $8E, $A2, $B5, $C5, $D4, $E1, $EC, $F4, $FB, $FE, $FF
;-------------------------------------------------------------------------------
HPz_Bridge_Mappings: ; Offset_0x00FC16:
                dc.w    Offset_0x00FC22-HPz_Bridge_Mappings
                dc.w    Offset_0x00FC2C-HPz_Bridge_Mappings
                dc.w    Offset_0x00FC36-HPz_Bridge_Mappings
                dc.w    Offset_0x00FC40-HPz_Bridge_Mappings
                dc.w    Offset_0x00FC4A-HPz_Bridge_Mappings
                dc.w    Offset_0x00FC54-HPz_Bridge_Mappings
Offset_0x00FC22:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x00FC2C:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x00FC36:
                dc.w    $0001
                dc.l    $F8050008, $0004FFF8
Offset_0x00FC40:
                dc.w    $0001
                dc.l    $F402000C, $0006FFFC
Offset_0x00FC4A:
                dc.w    $0001
                dc.l    $F402000F, $0007FFFC
Offset_0x00FC54:
                dc.w    $0001
                dc.l    $F4020012, $0009FFFC 
;-------------------------------------------------------------------------------  
EHz_Bridge_Mappings: ; Offset_0x00FC5E:
                dc.w    Offset_0x00FC62-EHz_Bridge_Mappings
                dc.w    Offset_0x00FC6C-EHz_Bridge_Mappings
Offset_0x00FC62:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x00FC6C:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8                           
;===============================================================================
; Objeto 0x11 - Pontes na Emerald Hill / Hidden Palace
; [ Término ]
;===============================================================================  