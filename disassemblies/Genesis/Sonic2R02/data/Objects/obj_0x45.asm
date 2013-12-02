;===============================================================================
; Objeto 0x45 - Mola empurre para obter impulso na Oil Ocean
; [ Início ]
;===============================================================================  
Offset_0x023FAA:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x023FBE(PC, D0), D1
                jsr     Offset_0x023FBE(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x023FBE:
                dc.w    Offset_0x023FC4-Offset_0x023FBE
                dc.w    Offset_0x02403C-Offset_0x023FBE
                dc.w    Offset_0x024132-Offset_0x023FBE
Offset_0x023FC4:
                addq.b  #$02, $0024(A0)
                move.l  #Spring_Push_Boost_Mappings, $0004(A0) ; Offset_0x0243D4   
                move.w  #$43C5, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                move.b  $0028(A0), D0
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                move.w  Offset_0x023FFA(PC, D0), D0
                jmp     Offset_0x023FFA(PC, D0)
Offset_0x023FFA:
                dc.w    Offset_0x024022-Offset_0x023FFA
                dc.w    Offset_0x023FFE-Offset_0x023FFA
Offset_0x023FFE:
                move.b  #$04, $0024(A0)
                move.b  #$01, $001C(A0)
                move.b  #$0A, $001A(A0)
                move.w  #$43C5, $0002(A0)
                move.b  #$14, $0019(A0)
                move.w  $0008(A0), $0034(A0)
Offset_0x024022:
                move.b  $0028(A0), D0
                andi.w  #$0002, D0
                move.w  Offset_0x024038(PC, D0), $0030(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                rts
Offset_0x024038:
                dc.w    $F000, $F600
Offset_0x02403C:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x024052
                tst.b   $0032(A0)
                beq.s   Offset_0x02405E
                subq.b  #$01, $0032(A0)
                bra.s   Offset_0x02405E
Offset_0x024052:
                cmpi.b  #$09, $0032(A0)
                beq.s   Offset_0x02407E
                addq.b  #$01, $0032(A0)
Offset_0x02405E:
                moveq   #$00, D3
                move.b  $0032(A0), D3
                move.b  D3, $001A(A0)
                add.w   D3, D3
                move.w  #$001B, D1
                move.w  #$0014, D2
                move.w  $0008(A0), D4
                jsr     (Offset_0x0197EE)
                rts
Offset_0x02407E:
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                bsr.s   Offset_0x02408C
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
Offset_0x02408C:
                bclr    D6, $0022(A0)
                beq     Offset_0x024130
                move.w  $0030(A0), $0012(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$10, $001C(A1)
                move.b  #$02, $0024(A1)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x0240BE
                move.w  #$0000, $0010(A1)
Offset_0x0240BE:
                btst    #$00, D0
                beq.s   Offset_0x0240FE
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$00, $002C(A1)
                move.b  #$04, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x0240EE
                move.b  #$01, $002C(A1)
Offset_0x0240EE:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x0240FE
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x0240FE:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x024114
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x024114:
                cmpi.b  #$08, D0
                bne.s   Offset_0x024126
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x024126:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x024130:
                rts
Offset_0x024132:
                move.b  #$00, $0036(A0)
                move.w  #$001F, D1
                move.w  #$000C, D2
                move.w  #$000D, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                cmpi.w  #$0001, D4
                bne.s   Offset_0x02417A
                move.b  $0022(A0), D1
                move.w  $0008(A0), D2
                sub.w   $0008(A1), D2
                bcs.s   Offset_0x024170
                eori.b  #$01, D1
Offset_0x024170:
                andi.b  #$01, D1
                bne.s   Offset_0x02417A
                bsr     Offset_0x0241F8
Offset_0x02417A:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                cmpi.w  #$0001, D4
                bne.s   Offset_0x0241AA
                move.b  $0022(A0), D1
                move.w  $0008(A0), D2
                sub.w   $0008(A1), D2
                bcs.s   Offset_0x0241A2
                eori.b  #$01, D1
Offset_0x0241A2:
                andi.b  #$01, D1
                bne.s   Offset_0x0241AA
                bsr.s   Offset_0x0241F8
Offset_0x0241AA:
                tst.b   $0036(A0)
                bne.s   Offset_0x0241F6
                move.w  $0034(A0), D0
                cmp.w   $0008(A0), D0
                beq.s   Offset_0x0241F6
                bcc.s   Offset_0x0241D8
                subq.b  #$04, $001A(A0)
                subq.w  #$04, $0008(A0)
                cmp.w   $0008(A0), D0
                bcs.s   Offset_0x0241F2
                move.b  #$0A, $001A(A0)
                move.w  $0034(A0), $0008(A0)
                bra.s   Offset_0x0241F2
Offset_0x0241D8:
                subq.b  #$04, $001A(A0)
                addq.w  #$04, $0008(A0)
                cmp.w   $0008(A0), D0
                bcc.s   Offset_0x0241F2
                move.b  #$0A, $001A(A0)
                move.w  $0034(A0), $0008(A0)
Offset_0x0241F2:
                bsr     Offset_0x02428C
Offset_0x0241F6:
                rts
Offset_0x0241F8:
                btst    #$00, $0022(A0)
                beq.s   Offset_0x024234
                btst    #$00, $0022(A1)
                bne     Offset_0x02428A
                tst.w   D0
                bne     Offset_0x02421A
                tst.w   $0014(A1)
                beq.s   Offset_0x02428A
                bpl.s   Offset_0x024284
                bra.s   Offset_0x02428A
Offset_0x02421A:
                move.w  $0034(A0), D0
                addi.w  #$0012, D0
                cmp.w   $0008(A0), D0
                beq.s   Offset_0x024284
                addq.w  #$01, $0008(A0)
                moveq   #$01, D0
                move.w  #$0040, D1
                bra.s   Offset_0x024262
Offset_0x024234:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x02428A
                tst.w   D0
                bne     Offset_0x02424A
                tst.w   $0014(A1)
                bmi.s   Offset_0x024284
                bra.s   Offset_0x02428A
Offset_0x02424A:
                move.w  $0034(A0), D0
                subi.w  #$0012, D0
                cmp.w   $0008(A0), D0
                beq.s   Offset_0x024284
                subq.w  #$01, $0008(A0)
                moveq   #$FFFFFFFF, D0
                move.w  #$FFC0, D1
Offset_0x024262:
                add.w   D0, $0008(A1)
                move.w  D1, $0014(A1)
                move.w  #$0000, $0010(A1)
                move.w  $0034(A0), D0
                sub.w   $0008(A0), D0
                bcc.s   Offset_0x02427C
                neg.w   D0
Offset_0x02427C:
                addi.w  #$000A, D0
                move.b  D0, $001A(A0)
Offset_0x024284:
                move.b  #$01, $0036(A0)
Offset_0x02428A:
                rts
Offset_0x02428C:
                move.b  $0022(A0), D0
                andi.b  #$60, D0
                beq     Offset_0x02438A
                lea     ($FFFFB000).w, A1
                moveq   #$05, D6
                bsr.s   Offset_0x0242A6
                lea     ($FFFFB040).w, A1
                moveq   #$06, D6
Offset_0x0242A6:
                bclr    D6, $0022(A0)
                beq     Offset_0x02438A
                move.w  $0034(A0), D0
                sub.w   $0008(A0), D0
                bcc.s   Offset_0x0242BA
                neg.w   D0
Offset_0x0242BA:
                addi.w  #$000A, D0
                lsl.w   #$07, D0
                neg.w   D0
                move.w  D0, $0010(A1)
                subq.w  #$04, $0008(A1)
                bset    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x0242E6
                bclr    #$00, $0022(A1)
                addq.w  #$08, $0008(A1)
                neg.w   $0010(A1)
Offset_0x0242E6:
                move.w  #$000F, $002E(A1)
                move.w  $0010(A1), $0014(A1)
                btst    #$02, $0022(A1)
                bne.s   Offset_0x024300
                move.b  #$00, $001C(A1)
Offset_0x024300:
                move.b  $0028(A0), D0
                bpl.s   Offset_0x02430C
                move.w  #$0000, $0012(A1)
Offset_0x02430C:
                btst    #$00, D0
                beq.s   Offset_0x02434C
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$01, $002C(A1)
                move.b  #$08, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x02433C
                move.b  #$03, $002C(A1)
Offset_0x02433C:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x02434C
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x02434C:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x024362
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x024362:
                cmpi.b  #$08, D0
                bne.s   Offset_0x024374
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x024374:
                bclr    #$05, $0022(A1)
                move.b  #$01, $001D(A1)
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02438A:
                rts
;-------------------------------------------------------------------------------
Unused_Obj_Conf: ; Offset_0x02438C:
                dc.w    Unused_Obj_Conf_01-Unused_Obj_Conf     ; Offset_0x024390
                dc.w    Unused_Obj_Conf_02-Unused_Obj_Conf     ; Offset_0x0243B2
Unused_Obj_Conf_01: ; Offset_0x024390:
                dc.b    $00, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $09, $09, $09, $09, $09
                dc.b    $09, $09, $08, $07, $06, $05, $04, $03, $02, $01, $00, $00, $00, $00, $00, $00
                dc.b    $00, $FF
Unused_Obj_Conf_02: ; Offset_0x0243B2:
                dc.b    $00, $0A, $0B, $0C, $0D, $0E, $0F, $10, $11, $12, $13, $13, $13, $13, $13, $13
                dc.b    $13, $13, $12, $11, $10, $0F, $0E, $0D, $0C, $0B, $0A, $0A, $0A, $0A, $0A, $0A
                dc.b    $0A, $FF
;-------------------------------------------------------------------------------                    
Spring_Push_Boost_Mappings: ; Offset_0x0243D4:                 
                dc.w    Offset_0x02440E-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024438-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024462-Spring_Push_Boost_Mappings
                dc.w    Offset_0x02448C-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0244B6-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0244E0-Spring_Push_Boost_Mappings
                dc.w    Offset_0x02450A-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024534-Spring_Push_Boost_Mappings
                dc.w    Offset_0x02455E-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024588-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0245B2-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0245DC-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024606-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024630-Spring_Push_Boost_Mappings
                dc.w    Offset_0x02465A-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024684-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0246AE-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0246D8-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024702-Spring_Push_Boost_Mappings
                dc.w    Offset_0x02472C-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024756-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024780-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0247AA-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0247D4-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0247FE-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024828-Spring_Push_Boost_Mappings
                dc.w    Offset_0x024852-Spring_Push_Boost_Mappings
                dc.w    Offset_0x02487C-Spring_Push_Boost_Mappings
                dc.w    Offset_0x0248A6-Spring_Push_Boost_Mappings
Offset_0x02440E:
                dc.w    $0005
                dc.l    $EC0C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $04081007, $1003FFF4, $FC08300A, $3005FFF4
                dc.l    $F404100D, $1006FFF8
Offset_0x024438:
                dc.w    $0005
                dc.l    $EE0C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $04081007, $1003FFF4, $FC08300A, $3005FFF4
                dc.l    $F604100D, $1006FFF8
Offset_0x024462:
                dc.w    $0005
                dc.l    $F00C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $04081007, $1003FFF4, $FE08300A, $3005FFF4
                dc.l    $F804100D, $1006FFF8
Offset_0x02448C:
                dc.w    $0005
                dc.l    $F20C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $06081007, $1003FFF4, $0008300A, $3005FFF4
                dc.l    $FA04100D, $1006FFF8
Offset_0x0244B6:
                dc.w    $0005
                dc.l    $F40C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $06081007, $1003FFF4, $0008300A, $3005FFF4
                dc.l    $FC04100D, $1006FFF8
Offset_0x0244E0:
                dc.w    $0005
                dc.l    $F60C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $06081007, $1003FFF4, $0208300A, $3005FFF4
                dc.l    $FE04100D, $1006FFF8
Offset_0x02450A:
                dc.w    $0005
                dc.l    $F80C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $08081007, $1003FFF4, $0408300A, $3005FFF4
                dc.l    $0004100D, $1006FFF8
Offset_0x024534:
                dc.w    $0005
                dc.l    $FA0C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $08081007, $1003FFF4, $0408300A, $3005FFF4
                dc.l    $0204100D, $1006FFF8
Offset_0x02455E:
                dc.w    $0005
                dc.l    $FC0C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $08081007, $1003FFF4, $0608300A, $3005FFF4
                dc.l    $0404100D, $1006FFF8
Offset_0x024588:
                dc.w    $0005
                dc.l    $FE0C3000, $3000FFF0, $0C083004, $3002FFF4
                dc.l    $0A081007, $1003FFF4, $0808300A, $3005FFF4
                dc.l    $0604100D, $1006FFF8
Offset_0x0245B2:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFEC
                dc.l    $F4020016, $000BFFF4, $F4022019, $200CFFFC
                dc.l    $F801001C, $000E0004
Offset_0x0245DC:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFED
                dc.l    $F4020016, $000BFFF5, $F4022019, $200CFFFD
                dc.l    $F801001C, $000E0004
Offset_0x024606:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFEE
                dc.l    $F4020016, $000BFFF6, $F4022019, $200CFFFE
                dc.l    $F801001C, $000E0004
Offset_0x024630:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFEF
                dc.l    $F4020016, $000BFFF7, $F4022019, $200CFFFF
                dc.l    $F801001C, $000E0004
Offset_0x02465A:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF0
                dc.l    $F4020016, $000BFFF8, $F4022019, $200CFFFE
                dc.l    $F801001C, $000E0004
Offset_0x024684:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF1
                dc.l    $F4020016, $000BFFF9, $F4022019, $200CFFFF
                dc.l    $F801001C, $000E0004
Offset_0x0246AE:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF2
                dc.l    $F4020016, $000BFFF8, $F4022019, $200CFFFE
                dc.l    $F801001C, $000E0004
Offset_0x0246D8:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF3
                dc.l    $F4020016, $000BFFF9, $F4022019, $200CFFFF
                dc.l    $F801001C, $000E0004
Offset_0x024702:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF4
                dc.l    $F4020016, $000BFFFA, $F4022019, $200C0000
                dc.l    $F801001C, $000E0004
Offset_0x02472C:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF5
                dc.l    $F4020016, $000BFFFB, $F4022019, $200C0001
                dc.l    $F801001C, $000E0004
Offset_0x024756:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF6
                dc.l    $F4020016, $000BFFFC, $F4022019, $200C0000
                dc.l    $F801001C, $000E0004
Offset_0x024780:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF7
                dc.l    $F4020016, $000BFFFD, $F4022019, $200C0001
                dc.l    $F801001C, $000E0004
Offset_0x0247AA:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF8
                dc.l    $F4020016, $000BFFFC, $F4022019, $200C0000
                dc.l    $F801001C, $000E0004
Offset_0x0247D4:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFF9
                dc.l    $F4020016, $000BFFFD, $F4022019, $200C0001
                dc.l    $F801001C, $000E0004
Offset_0x0247FE:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFFA
                dc.l    $F4020016, $000BFFFE, $F4022019, $200C0002
                dc.l    $F801001C, $000E0004
Offset_0x024828:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFFB
                dc.l    $F4020016, $000BFFFF, $F4022019, $200C0003
                dc.l    $F801001C, $000E0004
Offset_0x024852:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFFC
                dc.l    $F4020016, $000B0000, $F4022019, $200C0002
                dc.l    $F801001C, $000E0004
Offset_0x02487C:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFFD
                dc.l    $F4020016, $000B0001, $F4022019, $200C0003
                dc.l    $F801001C, $000E0004
Offset_0x0248A6:
                dc.w    $0005
                dc.l    $F003200F, $2007000C, $F4022013, $2009FFFE
                dc.l    $F4020016, $000B0000, $F4022019, $200C0002
                dc.l    $F801001C, $000E0004
;===============================================================================
; Objeto 0x45 - Mola empurre para obter impulso na Oil Ocean
; [ Término ]
;===============================================================================  