;===============================================================================
; Objeto 0x48 - Canhões na Oil Ocean
; [ Início ]
;===============================================================================                
Offset_0x0250B2:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0250D8(PC, D0), D1
                jsr     Offset_0x0250D8(PC, D1)
                move.b  $002C(A0), D0
                add.b   $0036(A0), D0
                beq     Offset_0x0250D2
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0250D2:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0250D8:
                dc.w    Offset_0x0250EC-Offset_0x0250D8
                dc.w    Offset_0x02513E-Offset_0x0250D8
;-------------------------------------------------------------------------------                  
Offset_0x0250DC:
                dc.b    $04, $00, $06, $07, $07, $00, $05, $07, $05, $00, $04, $07, $06, $00, $07, $07
;-------------------------------------------------------------------------------                  
Offset_0x0250EC:
                addq.b  #$02, $0024(A0)
                move.l  #Cannon_Mappings, $0004(A0)            ; Offset_0x025376
                move.w  #$6368, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x025116
                addq.w  #$04, D0
Offset_0x025116:
                add.w   D0, D0
                move.b  Offset_0x0250DC(PC, D0), $0001(A0)
                move.b  Offset_0x0250DC+$01(PC, D0), $003F(A0)
                beq.s   Offset_0x02512C
                move.b  #$01, $003E(A0)
Offset_0x02512C:
                move.b  $003F(A0), $001A(A0)
                move.b  #$28, $0019(A0)
                move.b  #$01, $0018(A0)
Offset_0x02513E:
                lea     ($FFFFB000).w, A1
                lea     $002C(A0), A4
                moveq   #$2C, D2
                bsr.s   Offset_0x025154
                lea     ($FFFFB040).w, A1
                lea     $0036(A0), A4
                moveq   #$36, D2
Offset_0x025154:
                moveq   #$00, D0
                move.b  (A4), D0
                move.w  Offset_0x025160(PC, D0), D0
                jmp     Offset_0x025160(PC, D0)
Offset_0x025160:                
                dc.w    Offset_0x025168-Offset_0x025160
                dc.w    Offset_0x02523E-Offset_0x025160
                dc.w    Offset_0x0252EC-Offset_0x025160
                dc.w    Offset_0x02536A-Offset_0x025160
Offset_0x025168:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x02523C
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$0010, D0
                cmpi.w  #$0020, D0
                bcc     Offset_0x02523C
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                addi.w  #$0010, D1
                cmpi.w  #$0020, D1
                bcc     Offset_0x02523C
                cmpa.w  #$B040, A1
                bne.s   Offset_0x0251A8
                cmpi.w  #$0004, ($FFFFF708).w
                beq     Offset_0x02523C
Offset_0x0251A8:
                cmpi.b  #$06, $0024(A1)
                bcc     Offset_0x02523C
                tst.w   ($FFFFFE08).w
                bne     Offset_0x02523C
                btst    #$03, $0022(A1)
                beq.s   Offset_0x0251D8
                moveq   #$00, D0
                move.b  $003D(A1), D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A3
                move.b  #$00, $00(A3, D2)
Offset_0x0251D8:
                move.w  A0, D0
                subi.w  #$B000, D0
                lsr.w   #$06, D0
                andi.w  #$007F, D0
                move.b  D0, $003D(A1)
                addq.b  #$02, (A4)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$81, $002A(A1)
                move.b  #$02, $001C(A1)
                move.w  #$1000, $0014(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                bclr    #$05, $0022(A0)
                bclr    #$05, $0022(A1)
                bset    #$01, $0022(A1)
                bset    #$03, $0022(A1)
                move.b  $003F(A0), $001A(A0)
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02523C:
                rts
Offset_0x02523E:
                tst.b   $003E(A0)
                bne.s   Offset_0x025266
                cmpi.b  #$07, $001A(A0)
                beq.s   Offset_0x025280
                subq.w  #$01, $001E(A0)
                bpl.s   Offset_0x025264
                move.w  #$0007, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$07, $001A(A0)
                beq.s   Offset_0x025280
Offset_0x025264:
                rts
Offset_0x025266:
                tst.b   $001A(A0)
                beq.s   Offset_0x025280
                subq.w  #$01, $001E(A0)
                bpl.s   Offset_0x025264
                move.w  #$0007, $001E(A0)
                subq.b  #$01, $001A(A0)
                beq.s   Offset_0x025280
                rts
Offset_0x025280:
                addq.b  #$02, (A4)
                move.b  $0028(A0), D0
                addq.b  #$01, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x025292
                subq.b  #$02, D0
Offset_0x025292:
                andi.w  #$0003, D0
                add.w   D0, D0
                add.w   D0, D0
                move.w  Offset_0x0252DC(PC, D0), $0010(A1)
                move.w  Offset_0x0252DC+$02(PC, D0), $0012(A1)
                move.w  #$0003, $001E(A0)
                tst.b   $0028(A0)
                bpl.s   Offset_0x0252DA
                move.b  #$00, $002A(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$00, $003C(A1)
                move.b  #$02, $0024(A1)
                move.b  #$06, (A4)
                move.w  #$0007, $003C(A0)
Offset_0x0252DA:
                rts
;-------------------------------------------------------------------------------                  
Offset_0x0252DC:
                dc.w    $0000, $F000, $1000, $0000, $0000, $1000, $F000, $0000
;-------------------------------------------------------------------------------  
Offset_0x0252EC:
                tst.b   $0001(A1)
                bmi.s   Offset_0x02530A
                move.b  #$00, $002A(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$00, (A4)
                rts
Offset_0x02530A:
                cmpi.b  #$02, $002C(A0)
                beq.s   Offset_0x025344
                cmpi.b  #$02, $0036(A0)
                beq.s   Offset_0x025344
                subq.w  #$01, $001E(A0)
                bpl.s   Offset_0x025344
                move.w  #$0001, $001E(A0)
                tst.b   $003E(A0)
                beq.s   Offset_0x02533A
                cmpi.b  #$07, $001A(A0)
                beq.s   Offset_0x025344
                addq.b  #$01, $001A(A0)
                bra.s   Offset_0x025344
Offset_0x02533A:
                tst.b   $001A(A0)
                beq.s   Offset_0x025344
                subq.b  #$01, $001A(A0)
Offset_0x025344:
                move.l  $0008(A1), D2
                move.l  $000C(A1), D3
                move.w  $0010(A1), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A1), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, $0008(A1)
                move.l  D3, $000C(A1)
                rts
Offset_0x02536A:
                subq.w  #$01, $003C(A0)
                bpl.s   Offset_0x025374
                move.b  #$00, (A4)
Offset_0x025374:
                rts
;-------------------------------------------------------------------------------
Cannon_Mappings: ; Offset_0x025376:
                dc.w    Offset_0x025386-Cannon_Mappings
                dc.w    Offset_0x0253C8-Cannon_Mappings
                dc.w    Offset_0x0253FA-Cannon_Mappings
                dc.w    Offset_0x02541C-Cannon_Mappings
                dc.w    Offset_0x02543E-Cannon_Mappings
                dc.w    Offset_0x025460-Cannon_Mappings
                dc.w    Offset_0x025482-Cannon_Mappings
                dc.w    Offset_0x0254B4-Cannon_Mappings
Offset_0x025386:
                dc.w    $0008
                dc.l    $D8040000, $0000FFF0, $D8040800, $08000000
                dc.l    $E0040002, $0001FFF0, $E0040802, $08010000
                dc.l    $E80A0011, $0008FFE8, $E80A0811, $08080000
                dc.l    $000A1008, $1004FFE8, $000A1808, $18040000
Offset_0x0253C8:
                dc.w    $0006
                dc.l    $E0040000, $0000FFF0, $E0040800, $08000000
                dc.l    $E80A0011, $0008FFE8, $E80A0811, $08080000
                dc.l    $000A1008, $1004FFE8, $000A1808, $18040000
Offset_0x0253FA:
                dc.w    $0004
                dc.l    $E80A0011, $0008FFE8, $E80A0811, $08080000
                dc.l    $000A1008, $1004FFE8, $000A1808, $18040000
Offset_0x02541C:
                dc.w    $0004
                dc.l    $E80A001A, $000DFFE8, $E80A1823, $18110000
                dc.l    $000A0023, $0011FFE8, $000A181A, $180D0000
Offset_0x02543E:
                dc.w    $0004
                dc.l    $E80A1023, $1011FFE8, $E80A081A, $080D0000
                dc.l    $000A101A, $100DFFE8, $000A0823, $08110000
Offset_0x025460:
                dc.w    $0004
                dc.l    $E80A0008, $0004FFE8, $E80A102C, $10160000
                dc.l    $000A1008, $1004FFE8, $000A002C, $00160000
Offset_0x025482:
                dc.w    $0006
                dc.l    $E80A0008, $0004FFE8, $E80A102C, $10160000
                dc.l    $000A1008, $1004FFE8, $000A002C, $00160000
                dc.l    $F0010006, $00030018, $00011006, $10030018
Offset_0x0254B4:
                dc.w    $0008
                dc.l    $E80A0008, $0004FFE8, $E80A102C, $10160000
                dc.l    $000A1008, $1004FFE8, $000A002C, $00160000
                dc.l    $F0010004, $00020018, $00011004, $10020018
                dc.l    $F0010006, $00030020, $00011006, $10030020
;===============================================================================
; Objeto 0x48 - Canhões na Oil Ocean
; [ Término ]
;===============================================================================  