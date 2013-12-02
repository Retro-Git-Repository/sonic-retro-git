;===============================================================================
; Objeto 0x09 - Sonic no Special Stage
; [ Início ]
;===============================================================================   
Offset_0x033348:
                bsr     Offset_0x033364
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03335A(PC, D0), D1
                jmp     Offset_0x03335A(PC, D1)
Offset_0x03335A:
                dc.w    Offset_0x033378-Offset_0x03335A
                dc.w    Offset_0x033432-Offset_0x03335A
                dc.w    Offset_0x03360A-Offset_0x03335A
                dc.w    Offset_0x03335A-Offset_0x03335A
                dc.w    Offset_0x033634-Offset_0x03335A
Offset_0x033364:
                lea     ($FFFFDB82).w, A1
                moveq   #$0E, D0
Offset_0x03336A:
                move.w  $FFFC(A1), -(A1)
                dbra    D0, Offset_0x03336A
                move.w  ($FFFFF602).w, -(A1)
                rts
Offset_0x033378:
                move.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.l  D0, $002A(A0)
                move.w  #$0080, D1
                move.w  D1, $002E(A0)
                move.w  D0, $0030(A0)
                add.w   ($FFFFF73E).w, D0
                move.w  D0, $0008(A0)
                add.w   ($FFFFF740).w, D1
                move.w  D1, $000C(A0)
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.l  #Sonic_In_SS_Mappings, $0004(A0)       ; Offset_0x033C6A ( 0bj_0x63.asm )
                move.w  #$22E5, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.w  #$006E, $0034(A0)
                clr.b   ($FFFFF742).w
                move.w  #$0400, $0032(A0)
                move.b  #$40, $0026(A0)
                move.b  #$01, ($FFFFF766).w
                clr.b   $0037(A0)
                bclr    #$06, $0022(A0)
                clr.b   $0021(A0)
                clr.b   $0023(A0)
                move.l  #$FFFFB140, A1
                move.b  #$63, (A1)          ; Carrega o objeto 0x63 na memória - Sombra do Sonic
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0018, $000C(A1)
                move.l  #SS_Objects_Shadow_Mappings, $0004(A1) ; Offset_0x033EEA
                move.w  #$623C, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.l  A0, $0038(A1)
                bra     Offset_0x03350C
Offset_0x033432:
                tst.b   $0025(A0)
                bne.s   Offset_0x03346A
                lea     ($FFFFF602).w, A2
                bsr     Offset_0x0339E4
                bsr     Offset_0x033A64
                bsr     Offset_0x0338A0
                bsr     Offset_0x033AA2
                bsr     Offset_0x033ADC
                bsr     Offset_0x03359C
                bsr     Offset_0x0338FC
                lea     (Sonic_In_SS_AnimateData), A1          ; Offset_0x033C3C ( 0bj_0x63.asm )
                bsr     Offset_0x03395C
                bsr     Offset_0x033858
                bra     Offset_0x03350C
Offset_0x03346A:
                bsr     Offset_0x03347E
                bsr     Offset_0x0338A0
                bsr     Offset_0x033AA2
                bsr     Offset_0x033ADC
                bra     Offset_0x03350C
Offset_0x03347E:
                moveq   #$00, D0
                move.b  $0036(A0), D0
                addq.b  #$08, D0
                move.b  D0, $0036(A0)
                bne.s   Offset_0x033498
                move.b  #$00, $0025(A0)
                move.b  #$1E, $0023(A0)
Offset_0x033498:
                add.b   $0026(A0), D0
                andi.b  #$FC, $0001(A0)
                subi.b  #$10, D0
                lsr.b   #$05, D0
                add.w   D0, D0
                move.b  Offset_0x0334EC(PC, D0), $001A(A0)
                move.b  Offset_0x0334EC+$01(PC, D0), D0
                or.b    D0, $0001(A0)
                move.b  $0036(A0), D0
                subq.b  #$08, D0
                bne.s   Offset_0x0334EA
                move.b  D0, $0021(A0)
                cmpa.l  #$FFFFB000, A0
                bne.s   Offset_0x0334D4
                tst.w   ($FFFFFE20).w
                beq.s   Offset_0x0334EA
                bra.s   Offset_0x0334DA
Offset_0x0334D4:
                tst.w   ($FFFFFED0).w
                beq.s   Offset_0x0334EA
Offset_0x0334DA:
                jsr     (Offset_0x006F30)
                bne.s   Offset_0x0334EA
                move.l  A0, $0038(A1)
                move.b  #$5B, (A1)
Offset_0x0334EA:
                rts
;-------------------------------------------------------------------------------                      
Offset_0x0334EC:            
                dc.b    $04, $01, $00, $00, $04, $00, $0C, $00, $04, $02, $00, $02, $04, $03, $0C, $01
;-------------------------------------------------------------------------------                  
Offset_0x0334FC:                 
                dc.l    $00FF0000, $00FF0B00, $00FF2480, $00FF2E20
;-------------------------------------------------------------------------------                      
Offset_0x03350C:
                move.b  $0023(A0), D0
                beq.s   Offset_0x033520
                subq.b  #$01, D0
                move.b  D0, $0023(A0)
                andi.b  #$01, D0
                beq.s   Offset_0x033520
                rts
Offset_0x033520:
                jsr     (DisplaySprite)                        ; Offset_0x01647A
                lea     Offset_0x0334FC(PC), A3
                lea     ($FFFFF766).w, A4
                move.w  #$5CA0, D4
                moveq   #$00, D1  
Miles_In_SS_DynLoad ; Offset_0x033534:                                  
                moveq   #$00, D0
                move.b  $001A(A0), D0
                cmp.b   (A4), D0
                beq.s   Offset_0x03359A
                move.b  D0, (A4)
                moveq   #$00, D6
                cmpi.b  #$04, D0
                blt.s   Offset_0x03355A
                addq.w  #$04, D6
                cmpi.b  #$0C, D0
                blt.s   Offset_0x03355A
                addq.w  #$04, D6
                cmpi.b  #$10, D0
                blt.s   Offset_0x03355A
                addq.b  #$04, D6
Offset_0x03355A:
                move.l  $00(A3, D6), D6
                add.w   D1, D0
                add.w   D0, D0
                lea     (Sonic_In_SS_Dyn_Script), A2           ; Offset_0x034052
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x03359A
Offset_0x033572:
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.w   #$01, D1
                add.l   D6, D1
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x00140A
                dbra    D5, Offset_0x033572
Offset_0x03359A:
                rts
Offset_0x03359C:
                lea     ($FFFFF603).w, A2
Miles_In_SS_Sub: ; Offset_0x0335A0:                
                move.b  (A2), D0
                andi.b  #$70, D0
                beq     Offset_0x033608
                move.w  #$0780, D2
                moveq   #$00, D0
                move.b  $0026(A0), D0
                addi.b  #$80, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  D2, D1
                asr.l   #$08, D1
                add.w   D1, $0010(A0)
                muls.w  D2, D0
                asr.l   #$07, D0
                add.w   D0, $0012(A0)
                bset    #$02, $0022(A0)
                move.b  #$04, $0024(A0)
                move.b  #$03, $001C(A0)
                moveq   #$00, D0
                move.b  D0, $001E(A0)
                move.b  D0, $001B(A0)
                move.b  D0, $0021(A0)
                tst.b   ($FFFFFE00).w
                bne.s   Offset_0x0335FA
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                bne.s   Offset_0x0335FE
Offset_0x0335FA:
                not.b   ($FFFFF742).w
Offset_0x0335FE:
                move.w  #Jump_Sfx, D0           ; $00A0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x033608:
                rts
Offset_0x03360A:
                lea     ($FFFFF602).w, A2
                bsr     Offset_0x03368E
                bsr     Offset_0x033662
                bsr     Offset_0x0336B0
                bsr     Offset_0x033810
                bsr     Offset_0x0338A0
                bsr     Offset_0x033ADC
                lea     (Sonic_In_SS_AnimateData), A1          ; Offset_0x033C3C ( 0bj_0x63.asm )
                bsr     Offset_0x03395C
                bra     Offset_0x03350C
Offset_0x033634:
                lea     ($FFFFF602).w, A2
                bsr     Offset_0x03368E
                bsr     Offset_0x033662
                bsr     Offset_0x0336B0
                bsr     Offset_0x033810
                bsr     Offset_0x0338A0
                bsr     Offset_0x033ADC
                bsr     Offset_0x0338FC
                lea     (Sonic_In_SS_AnimateData), A1          ; Offset_0x033C3C ( 0bj_0x63.asm )
                bsr     Offset_0x03395C
                bra     Offset_0x03350C
Offset_0x033662:
                move.l  $002A(A0), D2
                move.l  $002E(A0), D3
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A0), D0
                addi.w  #$00A8, $0012(A0)
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, $002A(A0)
                move.l  D3, $002E(A0)
                rts
Offset_0x03368E:
                move.b  (A2), D0
                btst    #$02, D0
                bne.s   Offset_0x0336A0
                btst    #$03, D0
                bne     Offset_0x0336A8
                rts
Offset_0x0336A0:
                subi.w  #$0040, $0010(A0)
                rts
Offset_0x0336A8:
                addi.w  #$0040, $0010(A0)
                rts
Offset_0x0336B0:
                moveq   #$00, D2
                moveq   #$00, D3
                move.w  $002E(A0), D2
                bmi.s   Offset_0x033710
                move.w  $002A(A0), D3
                bmi.s   Offset_0x0336EC
                cmp.w   D2, D3
                bcs.s   Offset_0x0336DC
                bne.s   Offset_0x0336D2
                tst.w   D3
                bne.s   Offset_0x0336D2
                move.b  #$40, $0026(A0)
                rts
Offset_0x0336D2:
                lsl.l   #$05, D2
                divu.w  D3, D2
                move.b  D2, $0026(A0)
                rts
Offset_0x0336DC:
                lsl.l   #$05, D3
                divu.w  D2, D3
                subi.w  #$0040, D3
                neg.w   D3
                move.b  D3, $0026(A0)
                rts
Offset_0x0336EC:
                neg.w   D3
                cmp.w   D2, D3
                bcc.s   Offset_0x033700
                lsl.l   #$05, D3
                divu.w  D2, D3
                addi.w  #$0040, D3
                move.b  D3, $0026(A0)
                rts
Offset_0x033700:
                lsl.l   #$05, D2
                divu.w  D3, D2
                subi.w  #$0080, D2
                neg.w   D2
                move.b  D2, $0026(A0)
                rts
Offset_0x033710:
                neg.w   D2
                move.w  $002A(A0), D3
                bpl.s   Offset_0x03373C
                neg.w   D3
                cmp.w   D2, D3
                bcs.s   Offset_0x03372C
                lsl.l   #$05, D2
                divu.w  D3, D2
                addi.w  #$0080, D2
                move.b  D2, $0026(A0)
                rts
Offset_0x03372C:
                lsl.l   #$05, D3
                divu.w  D2, D3
                subi.w  #$00C0, D3
                neg.w   D3
                move.b  D3, $0026(A0)
                rts
Offset_0x03373C:
                cmp.w   D2, D3
                bcc.s   Offset_0x03374E
                lsl.l   #$05, D3
                divu.w  D2, D3
                addi.w  #$00C0, D3
                move.b  D3, $0026(A0)
                rts
Offset_0x03374E:
                lsl.l   #$05, D2
                divu.w  D3, D2
                subi.w  #$0100, D2
                neg.w   D2
                move.b  D2, $0026(A0)
                rts
Obj_0x63_Offset_0x03375E:                
                moveq   #$00, D6
                moveq   #$00, D0
                move.w  $002A(A1), D0
                bpl.s   Offset_0x03376C
                st      D6
                neg.w   D0
Offset_0x03376C:
                lsl.l   #$07, D0
                divu.w  $0034(A1), D0
                move.b  Offset_0x03378E(PC, D0), D0
                tst.b   D6
                bne.s   Offset_0x033780
                subi.b  #$80, D0
                neg.b   D0
Offset_0x033780:
                tst.w   $002E(A1)
                bpl.s   Offset_0x033788
                neg.b   D0
Offset_0x033788:
                move.b  D0, $0026(A0)
                rts
Offset_0x03378E:
                dc.b    $40, $40, $40, $40, $41, $41, $41, $42, $42, $42, $43, $43, $43, $44, $44, $44
                dc.b    $45, $45, $45, $46, $46, $46, $47, $47, $47, $48, $48, $48, $48, $49, $49, $49
                dc.b    $4A, $4A, $4A, $4B, $4B, $4B, $4C, $4C, $4C, $4D, $4D, $4D, $4E, $4E, $4E, $4F
                dc.b    $4F, $50, $50, $50, $51, $51, $51, $52, $52, $52, $53, $53, $53, $54, $54, $54
                dc.b    $55, $55, $56, $56, $56, $57, $57, $57, $58, $58, $59, $59, $59, $5A, $5A, $5B
                dc.b    $5B, $5B, $5C, $5C, $5D, $5D, $5E, $5E, $5E, $5F, $5F, $60, $60, $61, $61, $62
                dc.b    $62, $63, $63, $64, $64, $65, $65, $66, $66, $67, $67, $68, $68, $69, $6A, $6A
                dc.b    $6B, $6C, $6C, $6D, $6E, $6E, $6F, $70, $71, $72, $73, $74, $75, $77, $78, $7A
                dc.b    $80, $00
Offset_0x033810:
                move.w  $002E(A0), D0
                ble.s   Offset_0x033856
                muls.w  D0, D0
                move.w  $002A(A0), D1
                muls.w  D1, D1
                add.w   D1, D0
                move.w  $0034(A0), D1
                mulu.w  D1, D1
                cmp.l   D1, D0
                bcs.s   Offset_0x033856
                move.b  #$02, $0024(A0)
                bclr    #$02, $0022(A0)
                moveq   #$00, D0
                move.w  D0, $0010(A0)
                move.w  D0, $0012(A0)
                move.w  D0, $0014(A0)
                move.b  D0, $0037(A0)
                bset    #$06, $0022(A0)
                bsr     Offset_0x033AA2
                bsr     Offset_0x033ADC
Offset_0x033856:
                rts
Offset_0x033858:
                tst.b   $0021(A0)
                beq.s   Offset_0x03389E
                clr.b   $0021(A0)
                tst.b   $0023(A0)
                bne.s   Offset_0x03389E
                clr.b   $0014(A0)
                cmpa.l  #$FFFFB000, A0
                bne.s   Offset_0x033880
                st      ($FFFFF742).w
                tst.w   ($FFFFFE20).w
                beq.s   Offset_0x033894
                bra.s   Offset_0x03388A
Offset_0x033880:
                clr.b   ($FFFFF742).w
                tst.w   ($FFFFFED0).w
                beq.s   Offset_0x033894
Offset_0x03388A:
                move.w  #Ring_Lost_Sfx, D0      ; $00C6
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x033894:
                move.b  #$02, $0025(A0)
                clr.b   $0036(A0)
Offset_0x03389E:
                rts
Offset_0x0338A0:
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                bne.s   Offset_0x0338EA
                move.w  $0034(A0), D0
                cmpa.l  #$FFFFB000, A0
                bne.s   Offset_0x0338BA
                tst.b   ($FFFFF742).w
                beq.s   Offset_0x0338CA
                bra.s   Offset_0x0338C0
Offset_0x0338BA:
                tst.b   ($FFFFF742).w
                bne.s   Offset_0x0338CA
Offset_0x0338C0:
                cmpi.w  #$0080, D0
                beq.s   Offset_0x0338EA
                addq.w  #$01, D0
                bra.s   Offset_0x0338D2
Offset_0x0338CA:
                cmpi.w  #$006E, D0
                beq.s   Offset_0x0338EA
                subq.w  #$01, D0
Offset_0x0338D2:
                move.w  D0, $0034(A0)
                cmpi.w  #$0077, D0
                bcc.s   Offset_0x0338E4
                move.b  #$03, $0018(A0)
                rts
Offset_0x0338E4:
                move.b  #$02, $0018(A0)
Offset_0x0338EA:
                rts
;-------------------------------------------------------------------------------
Offset_0x0338EC:
                dc.b    $01, $01, $00, $00, $01, $00, $02, $00, $01, $02, $00, $02, $01, $03, $02, $01
;-------------------------------------------------------------------------------
Offset_0x0338FC:
                btst    #$02, $0022(A0)
                beq.s   Offset_0x033912
                move.b  #$03, $001C(A0)
                andi.b  #$FC, $0022(A0)
                rts
Offset_0x033912:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                subi.b  #$10, D0
                lsr.b   #$05, D0
                move.b  D0, D1
                add.w   D0, D0
                move.b  Offset_0x0338EC(PC, D0), D2
                cmp.b   $001C(A0), D2
                bne.s   Offset_0x033932
                cmp.b   $003F(A0), D1
                beq.s   Offset_0x03395A
Offset_0x033932:
                move.b  D1, $003F(A0)
                move.b  D2, $001C(A0)
                move.b  Offset_0x0338EC+$01(PC, D0), D0
                andi.b  #$FC, $0022(A0)
                or.b    D0, $0022(A0)
                cmpi.b  #$01, D1
                beq.s   Offset_0x033954
                cmpi.b  #$05, D1
                bne.s   Offset_0x03395A
Offset_0x033954:
                move.w  #$0400, $0032(A0)
Offset_0x03395A:
                rts
;-------------------------------------------------------------------------------                
Offset_0x03395C:
                moveq   #$00, D0
                move.b  $001C(A0), D0
                cmp.b   $001D(A0), D0
                beq.s   Offset_0x033978
                move.b  #$00, $001B(A0)
                move.b  D0, $001D(A0)
                move.b  #$00, $001E(A0)
Offset_0x033978:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x0339E2
                add.w   D0, D0
                adda.w  $00(A1, D0), A1
                move.b  ($FFFFDB21).w, D0
                lsr.b   #$01, D0
                move.b  D0, $001E(A0)
                cmpi.b  #$00, $001C(A0)
                bne.s   Offset_0x0339AE
                subq.b  #$01, $0033(A0)
                bgt.s   Offset_0x0339AE
                bchg    #00, $0022(A0)
                bchg    #00, $0001(A0)
                move.b  $0032(A0), $0033(A0)
Offset_0x0339AE:
                moveq   #$00, D1
                move.b  $001B(A0), D1
                move.b  $01(A1, D1), D0
                bpl.s   Offset_0x0339C4
                move.b  #$00, $001B(A0)
                move.b  $0001(A1), D0
Offset_0x0339C4:
                andi.b  #$7F, D0
                move.b  D0, $001A(A0)
                move.b  $0022(A0), D1
                andi.b  #$03, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                addq.b  #$01, $001B(A0)
Offset_0x0339E2:
                rts                
;-------------------------------------------------------------------------------  
Offset_0x0339E4:
                move.w  $0014(A0), D2
                move.b  (A2), D0
                btst    #$02, D0
                bne.s   Offset_0x033A36
                btst    #$03, D0
                bne     Offset_0x033A46
                bset    #$06, $0022(A0)
                bne.s   Offset_0x033A06
                move.b  #$1E, $0037(A0)
Offset_0x033A06:
                move.b  $0026(A0), D0
                bmi.s   Offset_0x033A1E
                subi.b  #$38, D0
                cmpi.b  #$10, D0
                bcc.s   Offset_0x033A1E
                move.w  D2, D1
                asr.w   #$03, D1
                sub.w   D1, D2
                bra.s   Offset_0x033A24
Offset_0x033A1E:
                move.w  D2, D1
                asr.w   #$03, D1
                sub.w   D1, D2
Offset_0x033A24:
                move.w  D2, $0014(A0)
                move.b  $0037(A0), D0
                beq.s   Offset_0x033A34
                subq.b  #$01, D0
                move.b  D0, $0037(A0)
Offset_0x033A34:
                rts
Offset_0x033A36:
                addi.w  #$0060, D2
                cmpi.w  #$0600, D2
                ble.s   Offset_0x033A54
                move.w  #$0600, D2
                bra.s   Offset_0x033A54
Offset_0x033A46:
                subi.w  #$0060, D2
                cmpi.w  #$FA00, D2
                bge.s   Offset_0x033A54
                move.w  #$FA00, D2
Offset_0x033A54:
                move.w  D2, $0014(A0)
                bclr    #$06, $0022(A0)
                clr.b   $0037(A0)
                rts                
;-------------------------------------------------------------------------------  
Offset_0x033A64:
                tst.b   $0037(A0)
                bne.s   Offset_0x033A7E
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0050, D1
                asr.l   #$08, D1
                add.w   D1, $0014(A0)
Offset_0x033A7E:
                move.b  $0026(A0), D0
                bpl.s   Offset_0x033AA0
                addq.b  #$04, D0
                cmpi.b  #$88, D0
                bcs.s   Offset_0x033AA0
                move.w  $0014(A0), D0
                bpl.s   Offset_0x033A94
                neg.w   D0
Offset_0x033A94:
                cmpi.w  #$0100, D0
                bcc.s   Offset_0x033AA0
                move.b  #$08, $0024(A0)
Offset_0x033AA0:
                rts              
;-------------------------------------------------------------------------------  
Offset_0x033AA2:
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  $0014(A0), D2
                bpl.s   Offset_0x033AB6
                neg.w   D2
                lsr.w   #$08, D2
                sub.b   D2, $0026(A0)
                bra.s   Offset_0x033ABC
Offset_0x033AB6:
                lsr.w   #$08, D2
                add.b   D2, $0026(A0)
Offset_0x033ABC:
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  $0034(A0), D1
                asr.l   #$08, D1
                move.w  D1, $002A(A0)
                muls.w  $0034(A0), D0
                asr.l   #$08, D0
                move.w  D0, $002E(A0)
                rts
;-------------------------------------------------------------------------------   
Offset_0x033ADC:
                move.w  $002A(A0), D0
                muls.w  #$00CC, D0
                asr.l   #$08, D0
                add.w   ($FFFFF73E).w, D0
                move.w  D0, $0008(A0)
                move.w  $002E(A0), D0
                add.w   ($FFFFF740).w, D0
                move.w  D0, $000C(A0)
                rts
;===============================================================================
; Objeto 0x09 - Sonic no Special Stage
; [ Término ]
;===============================================================================  