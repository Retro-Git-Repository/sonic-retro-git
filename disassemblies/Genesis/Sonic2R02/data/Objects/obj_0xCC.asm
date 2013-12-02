;===============================================================================
; Objeto 0xCC - Tornado na seqüeência do final antes dos Créditos
; [ Início ]
;===============================================================================  
Offset_0x00A382:
                jsr     (Tornado_Load_Sonic_Or_Miles)          ; Offset_0x03ABA6
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00A396(PC, D0), D1
                jmp     Offset_0x00A396(PC, D1)
Offset_0x00A396:
                dc.w    Offset_0x00A39A-Offset_0x00A396
                dc.w    Offset_0x00A418-Offset_0x00A396
Offset_0x00A39A:
                lea     (Obj_0xB2_Ptr), A1                     ; Offset_0x03AC1A
                jsr     (ObjectSettings_A1)                    ; Offset_0x036028
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x00A3BA
                move.b  #$04, $001A(A0)
                move.b  #$01, $001C(A0)
Offset_0x00A3BA:
                move.w  #$FFF0, $0008(A0)
                move.w  #$00C0, $000C(A0)
                move.w  #$0100, $0010(A0)
                move.w  #$FF80, $0012(A0)
                move.b  #$14, $0035(A0)
                move.b  #$03, $0018(A0)
                move.w  #$0004, ($FFFFF662).w
                move.l  A0, -(A7)
                lea     (Ending_Mappings), A0                  ; Offset_0x09076E
                cmpi.w  #$0004, ($FFFFF750).w
                bne.s   Offset_0x00A3FA
                lea     (Ending_Mappings_1), A0                ; Offset_0x0907C0
Offset_0x00A3FA:
                lea     ($FFFF0000), A1
                move.w  #$8156, D0
                jsr     (EnigmaDec)                            ; Offset_0x00177A
                move.l  (A7)+, A0
                move.w  #$0C00, ($FFFFFB40).w
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00A418:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x00A42C(PC, D0), D1
                jsr     Offset_0x00A42C(PC, D1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A  
Offset_0x00A42C:
                dc.w    Offset_0x00A438-Offset_0x00A42C
                dc.w    Offset_0x00A47E-Offset_0x00A42C
                dc.w    Offset_0x00A56E-Offset_0x00A42C
                dc.w    Offset_0x00A68E-Offset_0x00A42C
                dc.w    Offset_0x00A7AA-Offset_0x00A42C
                dc.w    Offset_0x00A80A-Offset_0x00A42C
Offset_0x00A438:
                cmpi.w  #$00A0, $0008(A0)
                beq.s   Offset_0x00A452
                jsr     (SpeedToPos)                           ; Offset_0x016332
Offset_0x00A446:
                lea     (Tornado_Animate_Data), A1             ; Offset_0x03AC2E
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x00A452:
                addq.b  #$02, $0025(A0)
                move.w  #$0480, $003C(A0)
                btst    #$06, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x00A46A
                move.w  #$03D0, $003C(A0)
Offset_0x00A46A:
                move.w  #$0040, $0032(A0)
                st      ($FFFFB134).w
                clr.w   $0010(A0)
                clr.w   $0012(A0)
                bra.s   Offset_0x00A446
Offset_0x00A47E:
                bsr     Ending_Load_Flickies                   ; Offset_0x00ABA8
                bsr     Offset_0x00A4EC
                subq.w  #$01, $003C(A0)
                bmi.s   Offset_0x00A48E
                bra.s   Offset_0x00A446
Offset_0x00A48E:
                addq.b  #$02, $0025(A0)
                move.w  #$0002, $003C(A0)
                clr.w   $0032(A0)
                clr.b   $001A(A0)
                cmpi.w  #$0002, ($FFFFF750).w
                beq.s   Offset_0x00A4BC
                move.b  #$07, $001A(A0)
                cmpi.w  #$0004, ($FFFFF750).w
                bne.s   Offset_0x00A4BC
                move.b  #$18, $001A(A0)
Offset_0x00A4BC:
                clr.b   $001C(A0)
                clr.b   $001B(A0)
                clr.b   $001E(A0)
                move.l  #Offset_0x00AD9E, $0004(A0)
                move.w  #$0000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                subi.w  #$0014, $0008(A0)
                addi.w  #$0014, $000C(A0)
                bra     Offset_0x00A554
Offset_0x00A4EC:
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF750).w, D0
                move.w  Offset_0x00A4FC(PC, D0), D0
                jmp     Offset_0x00A4FC(PC, D0)
Offset_0x00A4FC:
                dc.w    Offset_0x00A502-Offset_0x00A4FC
                dc.w    Offset_0x00A524-Offset_0x00A4FC
                dc.w    Offset_0x00A54A-Offset_0x00A4FC
Offset_0x00A502:
                move.w  $000C(A0), D0
                subi.w  #$001C, D0
Offset_0x00A50A:
                move.w  D0, $000C(A1)
                move.w  $0008(A0), $0008(A1)
                move.l  #$01000505, $001A(A1)
                move.w  #$0100, $001E(A1)
                rts
Offset_0x00A524:
                tst.w   $0032(A0)
                beq.s   Offset_0x00A53C
                subq.w  #$01, $0032(A0)
                addi.l  #$00008000, $0008(A1)
                addq.w  #$01, $000C(A1)
                rts
Offset_0x00A53C:
                move.w  #$00C0, $0008(A1)
                move.w  #$0090, $000C(A1)
                rts
Offset_0x00A54A:
                move.w  $000C(A0), D0
                subi.w  #$0018, D0
                bra.s   Offset_0x00A50A
Offset_0x00A554:
                tst.b   ($FFFFFE19).w
                bne     Offset_0x00A344                                      
Offset_0x00A55C:                             
                lea     ($FFFFB000).w, A1
                move.w  #$0200, $0008(A1)
                move.w  #$0000, $000C(A1)
                rts
Offset_0x00A56E:
                bsr.s   Offset_0x00A554
                subq.w  #$01, $003C(A0)
                bpl.s   Offset_0x00A5AE
                move.w  #$0002, $003C(A0)
                move.w  $0032(A0), D0
                cmpi.w  #$001C, D0
                bcc.s   Offset_0x00A5B0
                addq.w  #$01, $0032(A0)
                move.w  ($FFFFF750).w, D1
                move.w  Offset_0x00A5C4(PC, D1), D1
                lea     Offset_0x00A5C4(PC, D1), A1
                move.b  $00(A1, D0), $001A(A0)
                add.w   D0, D0
                add.w   D0, D0
                move.l  Offset_0x00A61E(PC, D0), D1
                move.w  D1, $000C(A0)
                swap.w  D1
                move.w  D1, $0008(A0)
Offset_0x00A5AE:
                rts
Offset_0x00A5B0:
                addq.b  #$02, $0025(A0)
                move.w  #$0060, $003C(A0)
                clr.b   $0031(A0)
                clr.w   $0032(A0)
                rts  
Offset_0x00A5C4:
                dc.w    Offset_0x00A5CA-Offset_0x00A5C4
                dc.w    Offset_0x00A5E6-Offset_0x00A5C4
                dc.w    Offset_0x00A602-Offset_0x00A5C4
Offset_0x00A5CA:
                dc.b    $07, $07, $07, $07, $08, $08, $08, $08, $08, $08, $08, $09, $09, $09, $0A, $0A
                dc.b    $0A, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B
Offset_0x00A5E6:
                dc.b    $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $03, $03
                dc.b    $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
Offset_0x00A602:
                dc.b    $18, $18, $18, $18, $19, $19, $19, $19, $19, $19, $19, $09, $09, $09, $0A, $0A
                dc.b    $0A, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0B
;-------------------------------------------------------------------------------                  
Offset_0x00A61E:
                dc.l    $00A00070, $00B00070, $00B60071, $00BC0072
                dc.l    $00C40074, $00C80075, $00CA0076, $00CC0077
                dc.l    $00CE0078, $00D00079, $00D2007A, $00D4007B
                dc.l    $00D6007C, $00D9007E, $00DC0081, $00DE0084
                dc.l    $00E10087, $00E4008B, $00E7008F, $00EC0094
                dc.l    $00F00099, $00F5009D, $00F900A4, $010000AC
                dc.l    $010800B8, $011200C4, $011F00D3, $012C00FA
;-------------------------------------------------------------------------------  
Offset_0x00A68E:
                subq.w  #$01, $003C(A0)
                bmi.s   Offset_0x00A6E8
                tst.b   ($FFFFFE19).w
                beq.s   Offset_0x00A6D2
                subq.b  #$01, $0031(A0)
                bpl.s   Offset_0x00A6D2
                addq.b  #$03, $0031(A0)
                move.w  $0032(A0), D0
                addq.w  #$04, $0032(A0)
                cmpi.w  #$0078, D0
                bcc.s   Offset_0x00A6D2
                cmpi.w  #$000C, D0
                bcs.s   Offset_0x00A6D4
                bsr     Offset_0x00A55C
                move.l  Offset_0x00A732(PC, D0), D1
                move.w  D1, $000C(A0)
                swap.w  D1
                move.w  D1, $0008(A0)
                lsr.w   #$02, D0
                move.b  Offset_0x00A714(PC, D0), $001A(A0)
Offset_0x00A6D2:
                rts
Offset_0x00A6D4:
                move.l  Offset_0x00A732(PC, D0), D0
                lea     ($FFFFB000).w, A1
                move.w  D0, $000C(A1)
                swap.w  D0
                move.w  D0, $0008(A1)
                rts
Offset_0x00A6E8:
                addq.b  #$02, $0025(A0)
                clr.w   $003C(A0)
                clr.w   $0032(A0)
                lea     (Obj_0xCC_Load_Tornado_Helix), A2      ; Offset_0x00AD6A
                jsr     (Load_Sub_Obj)                         ; Offset_0x0361F6
                tst.b   ($FFFFFE19).w
                bne     Offset_0x00A344
                lea     (Obj_0xCC_Load_Sonic_Miles), A2        ; Offset_0x00AD66
                jmp     (Load_Sub_Obj)                         ; Offset_0x0361F6
;-------------------------------------------------------------------------------                  
Offset_0x00A714:
                dc.b    $12, $12, $12, $12, $12, $12, $12, $13, $13, $13, $13, $13, $13, $14, $14, $14
                dc.b    $14, $15, $15, $15, $16, $16, $16, $16, $16, $16, $16, $16, $16, $00
;-------------------------------------------------------------------------------                  
Offset_0x00A732:       
                dc.l    $00C00090, $00B00091, $00A80092, $009B0096
                dc.l    $00990098, $00980099, $0099009A, $009B009C
                dc.l    $009F009E, $00A400A0, $00AC00A2, $00B700A5
                dc.l    $00C400A8, $00D300AB, $00DE00AE, $00E800B0
                dc.l    $00EF00B2, $00F400B5, $00F900B8, $00FC00BB
                dc.l    $00FE00BE, $00FF00C0, $010000C2, $010100C5
                dc.l    $010200C8, $010200CC, $010100D1, $00FD00D7
                dc.l    $00F900DE, $00F90118
;-------------------------------------------------------------------------------                  
Offset_0x00A7AA:
                bsr     Offset_0x00A55C
                subq.w  #$01, $003C(A0)
                bpl.s   Offset_0x00A7D8
                move.w  #$0002, $003C(A0)
                move.w  $0032(A0), D0
                cmpi.w  #$001C, D0
                bcc.s   Offset_0x00A7DA
                addq.w  #$04, $0032(A0)
                lea     Offset_0x00A7EE(PC, D0), A1
                move.w  (A1)+, D0
                add.w   D0, ($FFFFE000).w
                move.w  (A1)+, D0
                add.w   D0, ($FFFFF616).w
Offset_0x00A7D8:
                rts
Offset_0x00A7DA:
                addq.b  #$02, $0025(A0)
                bset    #$03, $0022(A0)
                clr.b   $0031(A0)
                clr.w   $0032(A0)
                rts
;-------------------------------------------------------------------------------                  
Offset_0x00A7EE:
                dc.w    $FFC6, $0088, $FFF4, $0022, $FFF8, $0010, $FFFC, $0008
                dc.w    $FFFE, $0004, $FFFF, $0002, $FFFF, $0002
;-------------------------------------------------------------------------------                  
Offset_0x00A80A:
                tst.b   ($FFFFFE19).w
                beq     Offset_0x00A344
                move.b  #$17, $001A(A0)
                subq.b  #$01, $0031(A0)
                bpl.s   Offset_0x00A83E
                addq.b  #$03, $0031(A0)
                move.w  $0032(A0), D0
                cmpi.w  #$0020, D0
                bcc.s   Offset_0x00A83E
                addq.w  #$04, $0032(A0)
                move.l  Offset_0x00A840(PC, D0), D1
                move.w  D1, $000C(A0)
                swap.w  D1
                move.w  D1, $0008(A0)
Offset_0x00A83E:
                rts
;-------------------------------------------------------------------------------                  
Offset_0x00A840:
                dc.l    $00600088, $00500068, $00440046, $003C0036
                dc.l    $0036002A, $00330024, $00310020, $0030001E                
;===============================================================================
; Objeto 0xCC - Tornado na seqüeência do final antes dos Créditos
; [ Término ]
;===============================================================================  