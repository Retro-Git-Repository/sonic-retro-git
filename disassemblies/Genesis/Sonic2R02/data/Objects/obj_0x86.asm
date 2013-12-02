;===============================================================================
; Objeto 0x86 - Flippers - Casino Night
; [ Início ]
;===============================================================================    
Offset_0x02ADA8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02ADBC(PC, D0), D1
                jsr     Offset_0x02ADBC(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02ADBC:   
                dc.w    Offset_0x02ADC2-Offset_0x02ADBC
                dc.w    Offset_0x02AE00-Offset_0x02ADBC
                dc.w    Offset_0x02AF84-Offset_0x02ADBC                
Offset_0x02ADC2:
                addq.b  #$02, $0024(A0)
                move.l  #Flippers_Mappings, $0004(A0)          ; Offset_0x02B0D6
                move.w  #$43B2, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$18, $0019(A0)
                move.b  #$04, $0018(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x02AE00
                addq.b  #$02, $0024(A0)
                move.b  #$02, $001C(A0)
                bra     Offset_0x02AF84
Offset_0x02AE00:
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x02AE78
                lea     (Offset_0x02B03E), A2
                move.b  $001A(A0), D0
                beq.s   Offset_0x02AE22
                lea     (Offset_0x02B062), A2
                subq.b  #$01, D0
                beq.s   Offset_0x02AE22
                lea     (Offset_0x02B086), A2
Offset_0x02AE22:
                move.w  #$0023, D1
                move.w  #$0006, D2
                move.w  $0008(A0), D4
                jsr     (SolidObject_3)                        ; Offset_0x01973E
                lea     $0036(A0), A3
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF602).w, D5
                moveq   #$03, D6
                bsr.s   Offset_0x02AE7A
                addq.w  #$01, A3
                lea     ($FFFFB040).w, A1
                move.w  ($FFFFF606).w, D5
                moveq   #$04, D6
                bsr.s   Offset_0x02AE7A
                tst.b   $0038(A0)
                beq.s   Offset_0x02AE6C
                clr.b   $0038(A0)
                bsr     Offset_0x02AF00
                subq.w  #$01, A3
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                bsr     Offset_0x02AF00
Offset_0x02AE6C:
                lea     (Flippers_Animate_Data), A1            ; Offset_0x02B0AA
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x02AE78:
                rts
Offset_0x02AE7A:
                move.b  (A3), D0
                bne.s   Offset_0x02AEAC
                btst    D6, $0022(A0)
                beq.s   Offset_0x02AE78
                move.b  #$01, $002A(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                bset    #$02, $0022(A1)
                bne.s   Offset_0x02AEA8
                addq.w  #$05, $000C(A1)
Offset_0x02AEA8:
                addq.b  #$01, (A3)
                rts
Offset_0x02AEAC:
                andi.w  #$0070, D5
                bne.s   Offset_0x02AEF8
                btst    D6, $0022(A0)
                bne.s   Offset_0x02AEC4
                move.b  #$00, $002A(A1)
                move.b  #$00, (A3)
                rts
Offset_0x02AEC4:
                moveq   #$00, D1
                move.b  $001A(A0), D1
                subq.w  #$01, D1
                bset    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x02AEE2
                neg.w   D1
                bclr    #$00, $0022(A1)
Offset_0x02AEE2:
                add.w   D1, $0008(A1)
                lsl.w   #$08, D1
                move.w  D1, $0010(A1)
                move.w  D1, $0014(A1)
                move.w  #$0000, $0012(A1)
                rts
Offset_0x02AEF8:
                move.b  #$01, $0038(A0)
                rts
Offset_0x02AF00:
                bclr    D6, $0022(A0)
                beq     Offset_0x02AE78
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02AF1A
                neg.w   D0
Offset_0x02AF1A:
                addi.w  #$0023, D0
                move.w  D0, D2
                cmpi.w  #$0040, D2
                bcs.s   Offset_0x02AF2A
                move.w  #$0040, D2
Offset_0x02AF2A:
                lsl.w   #$05, D2
                addi.w  #$0800, D2
                neg.w   D2
                asr.w   #$02, D0
                addi.w  #$0040, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  D2, D0
                muls.w  D2, D1
                asr.l   #$08, D0
                asr.l   #$08, D1
                move.w  D0, $0012(A1)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02AF54
                neg.w   D1
Offset_0x02AF54:
                move.w  D1, $0010(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                move.b  #$00, $002A(A1)
                move.b  #$01, $001C(A0)
                move.b  #$00, (A3)
                move.w  #$00E3, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02AF84:
                move.w  #$0013, D1
                move.w  #$0018, D2
                move.w  #$0019, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    #$05, $0022(A0)
                beq.s   Offset_0x02AFAE
                bsr.s   Offset_0x02AFD4
Offset_0x02AFAE:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    #$06, $0022(A0)
                beq.s   Offset_0x02AFC8
                bsr.s   Offset_0x02AFD4
Offset_0x02AFC8:
                lea     (Flippers_Animate_Data), A1            ; Offset_0x02B0AA
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x02AFD4:
                move.w  #$0300, $001C(A0)
                move.w  #$F000, $0010(A1)
                addq.w  #$08, $0008(A1)
                bset    #$00, $0022(A1)
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x02B00A
                bclr    #$00, $0022(A1)
                subi.w  #$0010, $0008(A1)
                neg.w   $0010(A1)
                move.w  #$0400, $001C(A0)
Offset_0x02B00A:
                move.w  #$000F, $002E(A1)
                move.w  $0010(A1), $0014(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                bset    #$02, $0022(A1)
                bne.s   Offset_0x02B034
                addq.w  #$05, $000C(A1)
Offset_0x02B034:
                move.w  #$00E3, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------  
Offset_0x02B03E:
                dc.b    $07, $07, $07, $07, $07, $07, $07, $08, $09, $0A, $0B, $0A, $09, $08, $07, $06
                dc.b    $05, $04, $03, $02, $01, $00, $FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8, $F7, $F6
                dc.b    $F5, $F4, $F3, $F2
;-------------------------------------------------------------------------------                  
Offset_0x02B062:
                dc.b    $06, $06, $06, $06, $06, $06, $07, $08, $09, $09, $09, $09, $09, $09, $08, $08
                dc.b    $08, $08, $08, $08, $07, $07, $07, $07, $06, $06, $06, $06, $05, $05, $04, $04
                dc.b    $04, $04, $04, $04
;-------------------------------------------------------------------------------                  
Offset_0x02B086:
                dc.b    $05, $05, $05, $05, $05, $06, $07, $08, $09, $0A, $0B, $0B, $0C, $0C, $0D, $0D
                dc.b    $0E, $0E, $0F, $0F, $10, $10, $11, $11, $12, $12, $11, $11, $10, $10, $10, $10
                dc.b    $10, $10, $10, $10
;-------------------------------------------------------------------------------                                                                               
Flippers_Animate_Data: ; Offset_0x02B0AA:
                dc.w    Offset_0x02B0B4-Flippers_Animate_Data
                dc.w    Offset_0x02B0B8-Flippers_Animate_Data
                dc.w    Offset_0x02B0BE-Flippers_Animate_Data
                dc.w    Offset_0x02B0C2-Flippers_Animate_Data
                dc.w    Offset_0x02B0CC-Flippers_Animate_Data
Offset_0x02B0B4:
                dc.b    $0F, $00, $FF, $00
Offset_0x02B0B8:
                dc.b    $03, $01, $02, $01, $FD, $00
Offset_0x02B0BE:
                dc.b    $0F, $04, $FF, $00
Offset_0x02B0C2:
                dc.b    $00, $05, $04, $03, $03, $03, $03, $FD, $02, $00
Offset_0x02B0CC:
                dc.b    $00, $03, $04, $05, $05, $05, $05, $FD, $02, $00
;-------------------------------------------------------------------------------                
Flippers_Mappings: ; Offset_0x02B0D6:
                dc.w    Offset_0x02B0E2-Flippers_Mappings
                dc.w    Offset_0x02B0FC-Flippers_Mappings
                dc.w    Offset_0x02B10E-Flippers_Mappings
                dc.w    Offset_0x02B128-Flippers_Mappings
                dc.w    Offset_0x02B142-Flippers_Mappings
                dc.w    Offset_0x02B164-Flippers_Mappings
Offset_0x02B0E2:
                dc.w    $0003
                dc.l    $F70B000C, $0006FFE7, $FE010018, $000CFFFF
                dc.l    $0105001A, $000D0007
Offset_0x02B0FC:
                dc.w    $0002
                dc.l    $F80D0000, $0000FFE8, $F8050008, $00040008
Offset_0x02B10E:
                dc.w    $0003
                dc.l    $E90B100C, $1006FFE7, $F2011018, $100CFFFF
                dc.l    $EF05101A, $100D0007
Offset_0x02B128:
                dc.w    $0003
                dc.l    $E7090024, $0012FFF1, $F709002A, $0015FFEF
                dc.l    $07050030, $0018FFEF
Offset_0x02B142:
                dc.w    $0004
                dc.l    $E803001E, $000FFFF8, $E803081E, $080F0000
                dc.l    $08010022, $0011FFF8, $08010822, $08110000
Offset_0x02B164:
                dc.w    $0003
                dc.l    $E7090824, $0812FFF7, $F709082A, $0815FFF9
                dc.l    $07050830, $08180001                                                                                                                                                                                                                                    
;===============================================================================
; Objeto 0x86 - Flippers - Casino Night
; [ Término ]
;===============================================================================