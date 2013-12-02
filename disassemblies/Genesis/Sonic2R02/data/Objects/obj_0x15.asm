;===============================================================================
; Objeto 0x15 - Plataformas tipo pendúlo na Aquatic Ruin, Mystic Cave e 
; [ Início ]    Oil Ocean
;===============================================================================   
Offset_0x00FC76:
                btst    #$06, $0001(A0)
                bne     Offset_0x00FC8E
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00FC96(PC, D0), D1
                jmp     Offset_0x00FC96(PC, D1)
Offset_0x00FC8E:
                move.w  #$0200, D0
                bra     DisplaySprite_Param                    ; Offset_0x0164B6
Offset_0x00FC96:
                dc.w    Offset_0x00FCA4-Offset_0x00FC96
                dc.w    Offset_0x00FE2A-Offset_0x00FC96
                dc.w    Offset_0x010014-Offset_0x00FC96
                dc.w    Offset_0x010018-Offset_0x00FC96
                dc.w    Offset_0x0100D6-Offset_0x00FC96
                dc.w    Offset_0x0100DE-Offset_0x00FC96
                dc.w    Offset_0x010146-Offset_0x00FC96
Offset_0x00FCA4:
                addq.b  #$02, $0024(A0)
                move.l  #OOz_Swing_Platforms_Mappings, $0004(A0) ; Offset_0x0101CC
                move.w  #$43E3, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$20, $0019(A0)
                move.b  #$10, $0016(A0)
                move.w  $000C(A0), $0038(A0)
                move.w  $0008(A0), $003A(A0)
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00FCFC
                move.l  #MCz_Swing_Platforms_Mappings, $0004(A0) ; Offset_0x01023A
                move.w  #$0000, $0002(A0)
                move.b  #$18, $0019(A0)
                move.b  #$08, $0016(A0)
Offset_0x00FCFC:
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x00FD1E
                move.l  #ARz_Swing_Platforms_Mappings, $0004(A0) ; Offset_0x010202
                move.w  #$0000, $0002(A0)
                move.b  #$20, $0019(A0)
                move.b  #$08, $0016(A0)
Offset_0x00FD1E:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                moveq   #$00, D1
                move.b  $0028(A0), D1
                bpl.s   Offset_0x00FD2E
                addq.b  #$04, $0024(A0)
Offset_0x00FD2E:
                move.b  D1, D4
                andi.b  #$70, D4
                andi.w  #$000F, D1
                move.w  $0008(A0), D2
                move.w  $000C(A0), D3
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x00FDFE
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                cmpi.b  #$20, D4
                bne.s   Offset_0x00FDA2
                move.b  #$04, $0024(A1)
                move.b  #$04, $0018(A1)
                move.b  #$10, $0019(A1)
                move.b  #$50, $0016(A1)
                bset    #$04, $0001(A1)
                move.b  #$03, $001A(A1)
                move.w  D2, $0008(A1)
                addi.w  #$0040, D3
                move.w  D3, $000C(A1)
                addi.w  #$0048, D3
                move.w  D3, $000C(A0)
                bra.s   Offset_0x00FDFA
Offset_0x00FDA2:
                bset    #$06, $0001(A1)
                move.b  #$48, $000E(A1)
                move.b  D1, $000F(A1)
                subq.b  #$01, D1
                lea     $0010(A1), A2
Offset_0x00FDB8:
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0001, (A2)+
                addi.w  #$0010, D3
                dbra    D1, Offset_0x00FDB8
                move.b  #$02, $0015(A1)
                move.w  $0028(A1), $0008(A1)
                move.w  $002A(A1), $000C(A1)
                move.w  D2, $0028(A1)
                move.w  D3, $002A(A1)
                move.b  #$01, $000B(A1)
                addq.w  #$08, D3
                move.w  D3, $000C(A0)
                move.b  #$50, $0014(A1)
                bset    #$04, $0001(A1)
Offset_0x00FDFA:
                move.l  A1, $0030(A0)
Offset_0x00FDFE:
                move.w  #$8000, $0026(A0)
                move.w  #$0000, $003E(A0)
                move.b  $0028(A0), D1
                andi.w  #$0070, D1
                move.b  D1, $0028(A0)
                cmpi.b  #$40, D1
                bne.s   Offset_0x00FE2A
                move.l  #MCz_Swing_Platforms_Mappings_01, $0004(A0) ; Offset_0x0102C2
                move.b  #$A7, $0020(A0)
Offset_0x00FE2A:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x00FE4C
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$00, D3
                move.b  $0016(A0), D3
                addq.b  #$01, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object_3)                    ; Offset_0x019C50
                bra     Offset_0x00FFE6
Offset_0x00FE4C:
                moveq   #$00, D0
                moveq   #$00, D1
                move.b  ($FFFFFE78).w, D0
                move.b  $0028(A0), D1
                beq.s   Offset_0x00FE9E
                cmpi.b  #$10, D1
                bne.s   Offset_0x00FE7A
                cmpi.b  #$3F, D0
                beq.s   Offset_0x00FE6C
                bcc.s   Offset_0x00FE9E
                moveq   #$40, D0
                bra.s   Offset_0x00FE9E
Offset_0x00FE6C:
                move.w  #Platform_Colision_Sfx, D0 ; $00D7
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
                moveq   #$40, D0
                bra.s   Offset_0x00FE9E
Offset_0x00FE7A:
                cmpi.b  #$20, D1
                beq     Offset_0x00FF4A
                cmpi.b  #$30, D1
                bne.s   Offset_0x00FE94
                cmpi.b  #$41, D0
                beq.s   Offset_0x00FE6C
                bcs.s   Offset_0x00FE9E
                moveq   #$40, D0
                bra.s   Offset_0x00FE9E
Offset_0x00FE94:
                cmpi.b  #$40, D1
                bne.s   Offset_0x00FE9E
                bsr     Offset_0x00FF4C
Offset_0x00FE9E:
                move.b  $002E(A0), D1
                cmp.b   D0, D1
                beq     Offset_0x00FF4A
                move.b  D0, $002E(A0)
                move.w  #$0080, D1
                btst    #$00, $0022(A0)
                beq.s   Offset_0x00FEBC
                neg.w   D0
                add.w   D1, D0
Offset_0x00FEBC:
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  $0038(A0), D2
                move.w  $003A(A0), D3
                moveq   #$00, D6
                move.l  $0030(A0), A1
                move.b  $000F(A1), D6
                subq.w  #$01, D6
                bcs.s   Offset_0x00FF4A
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                moveq   #$00, D4
                moveq   #$00, D5
                lea     $0010(A1), A2
Offset_0x00FEE8:
                movem.l D4/D5, -(A7)
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, (A2)+
                move.w  D4, (A2)+
                movem.l (A7)+, D4/D5
                add.l   D0, D4
                add.l   D1, D5
                addq.w  #$02, A2
                dbra    D6, Offset_0x00FEE8
                movem.l D4/D5, -(A7)
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  $0028(A1), D2
                move.w  $002A(A1), D3
                move.w  D5, $0028(A1)
                move.w  D4, $002A(A1)
                move.w  D2, $0008(A1)
                move.w  D3, $000C(A1)
                movem.l (A7)+, D4/D5
                asr.l   #$01, D0
                asr.l   #$01, D1
                add.l   D0, D4
                add.l   D1, D5
                swap.w  D4
                swap.w  D5
                add.w   $0038(A0), D4
                add.w   $003A(A0), D5
                move.w  D4, $000C(A0)
                move.w  D5, $0008(A0)
Offset_0x00FF4A:
                rts
Offset_0x00FF4C:
                tst.w   $0036(A0)
                beq.s   Offset_0x00FF5A
                subq.w  #$01, $0036(A0)
                bra     Offset_0x00FFE0
Offset_0x00FF5A:
                tst.b   $0034(A0)
                bne.s   Offset_0x00FF80
                move.w  ($FFFFB008).w, D0
                sub.w   $003A(A0), D0
                addi.w  #$0020, D0
                cmpi.w  #$0040, D0
                bcc.s   Offset_0x00FFE0
                tst.w   ($FFFFFE08).w
                bne     Offset_0x00FFE0
                move.b  #$01, $0034(A0)
Offset_0x00FF80:
                tst.b   $003D(A0)
                beq.s   Offset_0x00FFB4
                move.w  $003E(A0), D0
                addq.w  #$08, D0
                move.w  D0, $003E(A0)
                add.w   D0, $0026(A0)
                cmpi.w  #$0200, D0
                bne.s   Offset_0x00FFE0
                move.w  #$0000, $003E(A0)
                move.w  #$8000, $0026(A0)
                move.b  #$00, $003D(A0)
                move.w  #$003C, $0036(A0)
                bra.s   Offset_0x00FFE0
Offset_0x00FFB4:
                move.w  $003E(A0), D0
                subq.w  #$08, D0
                move.w  D0, $003E(A0)
                add.w   D0, $0026(A0)
                cmpi.w  #$FE00, D0
                bne.s   Offset_0x00FFE0
                move.w  #$0000, $003E(A0)
                move.w  #$4000, $0026(A0)
                move.b  #$01, $003D(A0)
                move.w  #$003C, $0036(A0)
Offset_0x00FFE0:
                move.b  $0026(A0), D0
                rts
Offset_0x00FFE6:
                tst.w   ($FFFFFFB8).w
                beq.s   Offset_0x00FFF0
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x00FFF0:
                move.w  $003A(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x010008
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x010008:
                move.l  $0030(A0), A1
                bsr     Delete_A1_Object                       ; Offset_0x01646E
                bra     DeleteObject                           ; Offset_0x01646C
Offset_0x010014:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x010018:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x00FE4C
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$00, D3
                move.b  $0016(A0), D3
                addq.b  #$01, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object_3)                    ; Offset_0x019C50
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq     Offset_0x0100D2
                tst.b   ($FFFFFE78).w
                bne     Offset_0x0100D2
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0100C2
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x010058:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x010058
                move.b  #$0A, $0024(A1)
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x010076
                addq.b  #$02, $0024(A1)
Offset_0x010076:
                move.w  #$0200, $0010(A1)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x010088
                neg.w   $0010(A1)
Offset_0x010088:
                bset    #$01, $0022(A1)
                move.w  A0, D0
                subi.w  #$B000, D0
                lsr.w   #$06, D0
                andi.w  #$007F, D0
                move.w  A1, D1
                subi.w  #$B000, D1
                lsr.w   #$06, D1
                andi.w  #$007F, D1
                lea     ($FFFFB000).w, A1
                cmp.b   $003D(A1), D0
                bne.s   Offset_0x0100B4
                move.b  D1, $003D(A1)
Offset_0x0100B4:
                lea     ($FFFFB040).w, A1
                cmp.b   $003D(A1), D0
                bne.s   Offset_0x0100C2
                move.b  D1, $003D(A1)
Offset_0x0100C2:
                move.b  #$03, $001A(A0)
                addq.b  #$02, $0024(A0)
                andi.b  #$E7, $0022(A0)
Offset_0x0100D2:
                bra     Offset_0x00FFE6
Offset_0x0100D6:
                bsr     Offset_0x00FE4C
                bra     Offset_0x00FFE6
Offset_0x0100DE:
                move.w  $0008(A0), -(A7)
                btst    #$01, $0022(A0)
                beq.s   Offset_0x01011C
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                cmpi.w  #$0720, $000C(A0)
                bcs.s   Offset_0x01012C
                move.w  #$0720, $000C(A0)
                bclr    #$01, $0022(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                move.w  $000C(A0), $0038(A0)
                bra.s   Offset_0x01012C
Offset_0x01011C:
                moveq   #$00, D0
                move.b  ($FFFFFE74).w, D0
                lsr.w   #$01, D0
                add.w   $0038(A0), D0
                move.w  D0, $000C(A0)
Offset_0x01012C:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$00, D3
                move.b  $0016(A0), D3
                addq.b  #$01, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object_3)                    ; Offset_0x019C50
                bra     MarkObjGone                            ; Offset_0x016358
Offset_0x010146:
                move.w  $0008(A0), -(A7)
                bsr     SpeedToPos                             ; Offset_0x016332
                btst    #$01, $0022(A0)
                beq.s   Offset_0x010182
                addi.w  #$0018, $0012(A0)
                move.w  ($FFFFF648).w, D0
                cmp.w   $000C(A0), D0
                bhi.s   Offset_0x0101B2
                move.w  D0, $000C(A0)
                move.w  D0, $0038(A0)
                bclr    #$01, $0022(A0)
                move.w  #$0100, $0010(A0)
                move.w  #$0000, $0012(A0)
                bra.s   Offset_0x0101B2
Offset_0x010182:
                moveq   #$00, D0
                move.b  ($FFFFFE74).w, D0
                lsr.w   #$01, D0
                add.w   $0038(A0), D0
                move.w  D0, $000C(A0)
                tst.w   $0010(A0)
                beq.s   Offset_0x0101B2
                moveq   #$00, D3
                move.b  $0019(A0), D3
                jsr     (Object_HitWall_Right)                 ; Offset_0x01EE90
                tst.w   D1
                bpl.s   Offset_0x0101B2
                add.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x0101B2:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$00, D3
                move.b  $0016(A0), D3
                addq.b  #$01, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object_3)                    ; Offset_0x019C50
                bra     MarkObjGone                            ; Offset_0x016358
;-------------------------------------------------------------------------------   
OOz_Swing_Platforms_Mappings: ; Offset_0x0101CC:
                dc.w    Offset_0x0101D4-OOz_Swing_Platforms_Mappings
                dc.w    Offset_0x0101F6-OOz_Swing_Platforms_Mappings
                dc.w    Offset_0x0101F6-OOz_Swing_Platforms_Mappings
                dc.w    Offset_0x010200-OOz_Swing_Platforms_Mappings
Offset_0x0101D4:
                dc.w    $0004
                dc.l    $F00D2004, $2002FFE0, $F00D200C, $20060000
                dc.l    $000D2014, $200AFFE0, $000D2814, $280A0000
Offset_0x0101F6:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x010200:
                dc.w    $0000
;-------------------------------------------------------------------------------
ARz_Swing_Platforms_Mappings: ; Offset_0x010202:
                dc.w    Offset_0x01020A-ARz_Swing_Platforms_Mappings
                dc.w    Offset_0x01021C-ARz_Swing_Platforms_Mappings
                dc.w    Offset_0x010226-ARz_Swing_Platforms_Mappings
                dc.w    Offset_0x010238-ARz_Swing_Platforms_Mappings
Offset_0x01020A:
                dc.w    $0002
                dc.l    $F80D6055, $602AFFE0, $F80D6055, $602A0000
Offset_0x01021C:
                dc.w    $0001
                dc.l    $F8052051, $2028FFF8
Offset_0x010226:
                dc.w    $0002
                dc.l    $F00E4045, $4022FFF0, $F8052051, $2028FFF8
Offset_0x010238:
                dc.w    $0000
;-------------------------------------------------------------------------------
MCz_Swing_Platforms_Mappings: ; Offset_0x01023A:
                dc.w    Offset_0x010242-MCz_Swing_Platforms_Mappings
                dc.w    Offset_0x010254-MCz_Swing_Platforms_Mappings
                dc.w    Offset_0x01025E-MCz_Swing_Platforms_Mappings
                dc.w    Offset_0x010270-MCz_Swing_Platforms_Mappings
Offset_0x010242:
                dc.w    $0002
                dc.l    $F8096060, $6030FFE8, $F8096860, $68300000
Offset_0x010254:
                dc.w    $0001
                dc.l    $F8056066, $6033FFF8
Offset_0x01025E:
                dc.w    $0002
                dc.l    $E805406A, $4035FFF4, $F80B406E, $4037FFF4
Offset_0x010270:
                dc.w    $000A
                dc.l    $A805406A, $4035FFF4, $B80B406E, $4037FFF4
                dc.l    $C8056066, $6033FFF8, $D8056066, $6033FFF8
                dc.l    $E8056066, $6033FFF8, $F8056066, $6033FFF8
                dc.l    $08056066, $6033FFF8, $18056066, $6033FFF8
                dc.l    $28056066, $6033FFF8, $38056066, $6033FFF8
;-------------------------------------------------------------------------------      
MCz_Swing_Platforms_Mappings_01: ; Offset_0x0102C2:
                dc.w    Offset_0x0102C8-MCz_Swing_Platforms_Mappings_01
                dc.w    Offset_0x010254-MCz_Swing_Platforms_Mappings_01
                dc.w    Offset_0x01025E-MCz_Swing_Platforms_Mappings_01
Offset_0x0102C8:
                dc.w    $0002                                         
                dc.l    $F80D6058, $602CFFE0, $F80D6858, $682C0000                                                                                                         
;===============================================================================
; Objeto 0x15 - Plataformas tipo pendúlo na Aquatic Ruin, Mystic Cave e 
; [ Término ]   Oil Ocean
;===============================================================================  