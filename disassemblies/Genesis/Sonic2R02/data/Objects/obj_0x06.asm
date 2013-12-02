;===============================================================================
; Objeto 0x06 - Atributo invisível dos espirais na Emerald Hill / Metropolis 
; [ Início ]
;===============================================================================    
Offset_0x0213F6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x021426(PC, D0), D1
                jsr     Offset_0x021426(PC, D1)
                tst.w   ($FFFFFFB8).w
                beq.s   Offset_0x02140C
                rts
Offset_0x02140C:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x021420
                rts
Offset_0x021420:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x021426:
                dc.w    Offset_0x02142C-Offset_0x021426
                dc.w    Offset_0x021444-Offset_0x021426
                dc.w    Offset_0x02173A-Offset_0x021426
Offset_0x02142C:
                addq.b  #$02, $0024(A0)
                move.b  #$D0, $0019(A0)
                tst.b   $0028(A0)
                bpl.s   Offset_0x021444
                addq.b  #$02, $0024(A0)
                bra     Offset_0x02173A
Offset_0x021444:
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                bsr.s   Offset_0x021452
                lea     ($FFFFB040).w, A1
                addq.b  #$01, D6
Offset_0x021452:
                btst    D6, $0022(A0)
                bne     Offset_0x0214F2
                btst    #$01, $0022(A1)
                bne     Offset_0x0214F0
                btst    #$03, $0022(A1)
                bne.s   Offset_0x0214B2
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                tst.w   $0010(A1)
                bmi.s   Offset_0x021488
                cmpi.w  #$FF40, D0
                bgt.s   Offset_0x0214F0
                cmpi.w  #$FF30, D0
                blt.s   Offset_0x0214F0
                bra.s   Offset_0x021494
Offset_0x021488:
                cmpi.w  #$00C0, D0
                blt.s   Offset_0x0214F0
                cmpi.w  #$00D0, D0
                bgt.s   Offset_0x0214F0
Offset_0x021494:
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                subi.w  #$0010, D1
                cmpi.w  #$0030, D1
                bcc.s   Offset_0x0214F0
                tst.b   $002A(A1)
                bne.s   Offset_0x0214F0
                bsr     Offset_0x019D82
                rts
Offset_0x0214B2:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                tst.w   $0010(A1)
                bmi.s   Offset_0x0214CE
                cmpi.w  #$FF50, D0
                bgt.s   Offset_0x0214F0
                cmpi.w  #$FF40, D0
                blt.s   Offset_0x0214F0
                bra.s   Offset_0x0214DA
Offset_0x0214CE:
                cmpi.w  #$00B0, D0
                blt.s   Offset_0x0214F0
                cmpi.w  #$00C0, D0
                bgt.s   Offset_0x0214F0
Offset_0x0214DA:
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                subi.w  #$0010, D1
                cmpi.w  #$0030, D1
                bcc.s   Offset_0x0214F0
                bsr     Offset_0x019D82
Offset_0x0214F0:
                rts
Offset_0x0214F2:
                move.w  $0014(A1), D0
                bpl.s   Offset_0x0214FA
                neg.w   D0
Offset_0x0214FA:
                cmpi.w  #$0600, D0
                bcs.s   Offset_0x02151C
                btst    #$01, $0022(A1)
                bne.s   Offset_0x02151C
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$00D0, D0
                bmi.s   Offset_0x02151C
                cmpi.w  #$01A0, D0
                bcs.s   Offset_0x021534
Offset_0x02151C:
                bclr    #$03, $0022(A1)
                bclr    D6, $0022(A0)
                move.b  #$00, $002C(A1)
                move.b  #$04, $002D(A1)
                rts
Offset_0x021534:
                btst    #$03, $0022(A1)
                beq.s   Offset_0x0214F0
                move.b  Spiral_Data_2(PC, D0), D1              ; Offset_0x02159A
                ext.w   D1
                move.w  $000C(A0), D2
                add.w   D1, D2
                moveq   #$00, D1
                move.b  $0016(A1), D1
                subi.w  #$0013, D1
                sub.w   D1, D2
                move.w  D2, $000C(A1)
                lsr.w   #$03, D0
                andi.w  #$003F, D0
                move.b  Spiral_Data(PC, D0), $0027(A1)         ; Offset_0x021566
                rts
;-------------------------------------------------------------------------------                 
Spiral_Data: ; Offset_0x021566:
                dc.b    $00, $00, $01, $01, $16, $16, $16, $16, $2C, $2C, $2C, $2C, $42, $42, $42, $42
                dc.b    $58, $58, $58, $58, $6E, $6E, $6E, $6E, $84, $84, $84, $84, $9A, $9A, $9A, $9A
                dc.b    $B0, $B0, $B0, $B0, $C6, $C6, $C6, $C6, $DC, $DC, $DC, $DC, $F2, $F2, $F2, $F2
                dc.b    $01, $01, $00, $00
;-------------------------------------------------------------------------------                 
Spiral_Data_2: ; Offset_0x02159A:
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $1F, $1F
                dc.b    $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1E, $1E, $1E
                dc.b    $1E, $1E, $1E, $1E, $1E, $1E, $1D, $1D, $1D, $1D, $1D, $1C, $1C, $1C, $1C, $1B
                dc.b    $1B, $1B, $1B, $1A, $1A, $1A, $19, $19, $19, $18, $18, $18, $17, $17, $16, $16
                dc.b    $15, $15, $14, $14, $13, $12, $12, $11, $10, $10, $0F, $0E, $0E, $0D, $0C, $0C
                dc.b    $0B, $0A, $0A, $09, $08, $08, $07, $06, $06, $05, $04, $04, $03, $02, $02, $01
                dc.b    $00, $FF, $FE, $FE, $FD, $FC, $FC, $FB, $FA, $F9, $F9, $F8, $F7, $F7, $F6, $F6
                dc.b    $F5, $F5, $F4, $F4, $F3, $F2, $F2, $F1, $F1, $F0, $F0, $EF, $EF, $EE, $EE, $ED
                dc.b    $ED, $ED, $EC, $EB, $EB, $EA, $EA, $E9, $E9, $E8, $E8, $E7, $E7, $E6, $E6, $E5
                dc.b    $E5, $E4, $E4, $E4, $E3, $E3, $E2, $E2, $E2, $E1, $E1, $E1, $E0, $E0, $E0, $DF
                dc.b    $DF, $DF, $DF, $DE, $DE, $DE, $DD, $DD, $DD, $DD, $DD, $DD, $DD, $DD, $DC, $DC
                dc.b    $DC, $DC, $DC, $DC, $DC, $DC, $DC, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
                dc.b    $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB, $DB
                dc.b    $DB, $DB, $DB, $DB, $DC, $DC, $DC, $DC, $DC, $DC, $DC, $DD, $DD, $DD, $DD, $DD
                dc.b    $DD, $DD, $DD, $DE, $DE, $DE, $DF, $DF, $DF, $DF, $E0, $E0, $E0, $E1, $E1, $E1
                dc.b    $E2, $E2, $E2, $E3, $E3, $E4, $E4, $E4, $E5, $E5, $E6, $E6, $E7, $E7, $E8, $E8
                dc.b    $E9, $E9, $EA, $EA, $EB, $EB, $EC, $ED, $ED, $EE, $EE, $EF, $F0, $F0, $F1, $F2
                dc.b    $F2, $F3, $F4, $F5, $F5, $F6, $F7, $F8, $F9, $F9, $FA, $FB, $FC, $FD, $FE, $FF
                dc.b    $00, $01, $02, $03, $04, $05, $06, $07, $08, $08, $09, $0A, $0A, $0B, $0C, $0D
                dc.b    $0D, $0E, $0E, $0F, $0F, $10, $10, $11, $11, $12, $12, $13, $13, $14, $14, $15
                dc.b    $15, $16, $16, $17, $17, $18, $18, $18, $19, $19, $19, $19, $1A, $1A, $1A, $1A
                dc.b    $1B, $1B, $1B, $1B, $1C, $1C, $1C, $1C, $1C, $1C, $1D, $1D, $1D, $1D, $1D, $1D
                dc.b    $1D, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F
                dc.b    $1F, $1F, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
                dc.b    $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20
;-------------------------------------------------------------------------------                  
Offset_0x02173A:
                lea     ($FFFFB000).w, A1
                lea     ($FFFFF7B2).w, A2
                moveq   #$03, D6
                bsr.s   Offset_0x021750
                lea     ($FFFFB040).w, A1
                lea     ($FFFFF7B3).w, A2
                addq.b  #$01, D6
Offset_0x021750:
                btst    D6, $0022(A0)
                bne     Offset_0x0217BE
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                cmpi.w  #$FF40, D0
                blt.s   Offset_0x0217BC
                cmpi.w  #$00C0, D0
                bge.s   Offset_0x0217BC
                move.w  $000C(A0), D0
                addi.w  #$003C, D0
                move.w  $000C(A1), D2
                move.b  $0016(A1), D1
                ext.w   D1
                add.w   D2, D1
                addq.w  #$04, D1
                sub.w   D1, D0
                bhi.s   Offset_0x0217BC
                cmpi.w  #$FFF0, D0
                bcs.s   Offset_0x0217BC
                cmpi.b  #$06, $0024(A1)
                bcc.s   Offset_0x0217BC
                add.w   D0, D2
                addq.w  #$03, D2
                move.w  D2, $000C(A1)
                move.b  #$01, $0029(A1)
                bsr     Offset_0x019D82
                move.w  #$0001, $001C(A1)
                move.b  #$00, (A2)
                tst.w   $0014(A1)
                bne.s   Offset_0x0217BC
                move.w  #$0001, $0014(A1)
Offset_0x0217BC:
                rts
Offset_0x0217BE:
                btst    #$01, $0022(A1)
                bne.s   Offset_0x0217F8
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$00C0, D0
                bmi.s   Offset_0x0217DA
                cmpi.w  #$0180, D0
                bcs.s   Offset_0x021812
Offset_0x0217DA:
                bclr    #$03, $0022(A1)
                bclr    D6, $0022(A0)
                move.b  #$00, $002C(A1)
                move.b  #$04, $002D(A1)
                bset    #$01, $0022(A1)
                rts
Offset_0x0217F8:
                move.b  (A2), D0
                addi.b  #$20, D0
                cmpi.b  #$40, D0
                bcc.s   Offset_0x02180A
                asr.w   $0012(A1)
                bra.s   Offset_0x0217DA
Offset_0x02180A:
                move.w  #$0000, $0012(A1)
                bra.s   Offset_0x0217DA
Offset_0x021812:
                btst    #$03, $0022(A1)
                beq.s   Offset_0x0217BC
                move.b  (A2), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$2800, D1
                swap.w  D1
                move.w  $000C(A0), D2
                add.w   D1, D2
                moveq   #$00, D1
                move.b  $0016(A1), D1
                subi.w  #$0013, D1
                sub.w   D1, D2
                move.w  D2, $000C(A1)
                move.b  (A2), D0
                move.b  D0, $0027(A1)
                addq.b  #$04, (A2)
                tst.w   $0014(A1)
                bne.s   Offset_0x021852
                move.w  #$0001, $0014(A1)
Offset_0x021852:
                rts
;===============================================================================
; Objeto 0x06 - Atributo invisível dos espirais na Emerald Hill / Metropolis 
; [ Término ]
;===============================================================================  