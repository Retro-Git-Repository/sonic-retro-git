;===============================================================================
; Objeto 0x50 - Imimigo cavalo marinho (Aquis) na Oil Ocean
; [ Início ]
;=============================================================================== 
Offset_0x02C89E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02C8AC(PC, D0), D1
                jmp     Offset_0x02C8AC(PC, D1)
Offset_0x02C8AC:
                dc.w    Offset_0x02C8B4-Offset_0x02C8AC
                dc.w    Offset_0x02C97A-Offset_0x02C8AC
                dc.w    Offset_0x02C9A6-Offset_0x02C8AC
                dc.w    Offset_0x02C9D4-Offset_0x02C8AC
Offset_0x02C8B4:
                addq.b  #$02, $0024(A0)
                move.l  #Aquis_Mappings, $0004(A0)             ; Offset_0x02CB8A
                move.w  #$2500, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$0A, $0020(A0)
                move.b  #$04, $0018(A0)
                move.b  #$10, $0019(A0)
                move.w  #$FF00, $0010(A0)
                move.b  $0028(A0), D0
                move.b  D0, D1
                andi.w  #$00F0, D1
                lsl.w   #$04, D1
                move.w  D1, $002E(A0)
                move.w  D1, $0030(A0)
                andi.w  #$000F, D0
                lsl.w   #$04, D0
                subq.w  #$01, D0
                move.w  D0, $0032(A0)
                move.w  D0, $0034(A0)
                move.w  $000C(A0), $002A(A0)
                move.w  ($FFFFF646).w, $003A(A0)
                move.b  #$03, $002E(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02C97A
                move.b  #$50, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$000A, $0008(A1)
                addi.w  #$FFFA, $000C(A1)
                move.l  #Aquis_Mappings, $0004(A1)             ; Offset_0x02CB8A
                move.w  #$2500, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  $0022(A0), $0022(A1)
                move.b  #$03, $001C(A1)
                move.l  A1, $0036(A0)
                move.l  A0, $0036(A1)
                bset    #$06, $0022(A0)
Offset_0x02C97A:
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02CB60
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02C99E(PC, D0), D1
                jsr     Offset_0x02C99E(PC, D1)
                bsr     Offset_0x02CB26
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02C99E:
                dc.w    Offset_0x02C9EC-Offset_0x02C99E
                dc.w    Offset_0x02C9FA-Offset_0x02C99E
                dc.w    Offset_0x02CA00-Offset_0x02C99E
                dc.w    Offset_0x02CB20-Offset_0x02C99E
Offset_0x02C9A6:
                move.l  $0036(A0), A1
                tst.b   (A1)
                beq     Obj_0x50_DeleteObject                  ; Offset_0x02CC26
                cmpi.b  #$50, (A1)
                bne     Obj_0x50_DeleteObject                  ; Offset_0x02CC26
                btst    #$07, $0022(A1)
                bne     Obj_0x50_DeleteObject                  ; Offset_0x02CC26
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02CB60
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02C9D4:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Aquis_Animate_Data), A1               ; Offset_0x02CB60
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02C9EC:
                tst.b   $0001(A0)
                bmi.s   Offset_0x02C9F4
                rts
Offset_0x02C9F4:
                addq.b  #$02, $0025(A0)
                rts
Offset_0x02C9FA:
                bsr     Offset_0x02CA98
                rts
Offset_0x02CA00:
                bsr     Offset_0x02CAEA
                bsr     Offset_0x02CA0A
                rts
Offset_0x02CA0A:
                tst.b   $002D(A0)
                bne     Offset_0x02CA96
                st      $002D(A0)
                jsr     (Offset_0x0360FC)
                tst.w   D1
                beq.s   Offset_0x02CA96
                cmpi.w  #$FFF0, D1
                bcc.s   Offset_0x02CA96
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02CA96
                move.b  #$50, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$06, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  #Aquis_Mappings, $0004(A1)             ; Offset_0x02CB8A
                move.w  #$2500, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$98, $0020(A1)
                move.b  #$02, $001C(A1)
                move.w  #$000A, D0
                move.w  #$0010, D1
                move.w  #$FD00, D2
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02CA84
                neg.w   D1
                neg.w   D2
Offset_0x02CA84:
                sub.w   D0, $000C(A1)
                sub.w   D1, $0008(A1)
                move.w  D2, $0010(A1)
                move.w  #$0200, $0012(A1)
Offset_0x02CA96:
                rts
Offset_0x02CA98:
                subq.b  #$01, $003C(A0)
                bmi.s   Offset_0x02CADA
                jsr     (Offset_0x0360FC)
                bclr    #$00, $0022(A0)
                tst.w   D0
                beq.s   Offset_0x02CAB4
                bset    #$00, $0022(A0)
Offset_0x02CAB4:
                move.w  Offset_0x02CAD6(PC, D0), D2
                add.w   D2, $0010(A0)
                move.w  Offset_0x02CAD6(PC, D1), D2
                add.w   D2, $0012(A0)
                move.w  #$0100, D0
                move.w  D0, D1
                jsr     (Offset_0x036140)
                jmp     (SpeedToPos)                           ; Offset_0x016332
;-------------------------------------------------------------------------------                 
Offset_0x02CAD6:
                dc.w    $FFF0, $0010
;-------------------------------------------------------------------------------                 
Offset_0x02CADA:
                addq.b  #$02, $0025(A0)
                move.b  #$20, $003C(A0)
                jmp     (Offset_0x03617A)
Offset_0x02CAEA:
                subq.b  #$01, $003C(A0)
                bmi.s   Offset_0x02CAF2
                rts
Offset_0x02CAF2:
                subq.b  #$01, $002E(A0)
                bmi.s   Offset_0x02CB0E
                subq.b  #$02, $0025(A0)
                move.w  #$FF00, $0012(A0)
                move.b  #$80, $003C(A0)
                clr.b   $002D(A0)
                rts
Offset_0x02CB0E:
                move.b  #$06, $0025(A0)
                move.w  #$FE00, $0010(A0)
                clr.w   $0012(A0)
                rts
Offset_0x02CB20:
                jmp     (SpeedToPos)                           ; Offset_0x016332
Offset_0x02CB26:
                moveq   #$0A, D0
                moveq   #$FFFFFFFA, D1
                move.l  $0036(A0), A1
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  $0022(A0), $0022(A1)
                move.b  $0023(A0), $0023(A1)
                move.b  $0001(A0), $0001(A1)
                btst    #$00, $0022(A1)
                beq.s   Offset_0x02CB56
                neg.w   D0
Offset_0x02CB56:
                add.w   D0, $0008(A1)
                add.w   D1, $000C(A1)
                rts
;-------------------------------------------------------------------------------
Aquis_Animate_Data: ; Offset_0x02CB60:
                dc.w    Offset_0x02CB6C-Aquis_Animate_Data
                dc.w    Offset_0x02CB70-Aquis_Animate_Data
                dc.w    Offset_0x02CB78-Aquis_Animate_Data
                dc.w    Offset_0x02CB7E-Aquis_Animate_Data
                dc.w    Offset_0x02CB82-Aquis_Animate_Data
                dc.w    Offset_0x02CB86-Aquis_Animate_Data
Offset_0x02CB6C:
                dc.b    $0E, $00, $FF, $00
Offset_0x02CB70:
                dc.b    $05, $03, $04, $03, $04, $03, $04, $FF
Offset_0x02CB78:
                dc.b    $03, $05, $06, $07, $06, $FF
Offset_0x02CB7E:
                dc.b    $03, $01, $02, $FF
Offset_0x02CB82:
                dc.b    $01, $05, $FF, $00
Offset_0x02CB86:
                dc.b    $0E, $08, $FF, $00                    
;-------------------------------------------------------------------------------
Aquis_Mappings: ; Offset_0x02CB8A:
                dc.w    Offset_0x02CB9C-Aquis_Mappings
                dc.w    Offset_0x02CBB6-Aquis_Mappings
                dc.w    Offset_0x02CBC0-Aquis_Mappings
                dc.w    Offset_0x02CBCA-Aquis_Mappings
                dc.w    Offset_0x02CBE4-Aquis_Mappings
                dc.w    Offset_0x02CBFE-Aquis_Mappings
                dc.w    Offset_0x02CC08-Aquis_Mappings
                dc.w    Offset_0x02CC12-Aquis_Mappings
                dc.w    Offset_0x02CC1C-Aquis_Mappings
Offset_0x02CB9C:
                dc.w    $0003
                dc.l    $E80D0000, $0000FFF0, $F8090008, $0004FFF8
                dc.l    $0805000E, $0007FFF8
Offset_0x02CBB6:
                dc.w    $0001
                dc.l    $F8050022, $0011FFF8
Offset_0x02CBC0:
                dc.w    $0001
                dc.l    $F8050026, $0013FFF8
Offset_0x02CBCA:
                dc.w    $0003
                dc.l    $E80D0012, $0009FFF0, $F8090008, $0004FFF8
                dc.l    $0805000E, $0007FFF8
Offset_0x02CBE4:
                dc.w    $0003
                dc.l    $E80D001A, $000DFFF0, $F8090008, $0004FFF8
                dc.l    $0805000E, $0007FFF8
Offset_0x02CBFE:
                dc.w    $0001
                dc.l    $F801002A, $0015FFFC
Offset_0x02CC08:
                dc.w    $0001
                dc.l    $F801002C, $0016FFFC
Offset_0x02CC12:
                dc.w    $0001
                dc.l    $F801002E, $0017FFFC
Offset_0x02CC1C:
                dc.w    $0001
                dc.l    $F80D0030, $0018FFF0
;-------------------------------------------------------------------------------
Obj_0x50_DeleteObject: ; Offset_0x02CC26:
                jmp     (DeleteObject)                         ; Offset_0x01646C                
;===============================================================================
; Objeto 0x50 - Imimigo cavalo marinho (Aquis) na Oil Ocean
; [ Término ]
;===============================================================================  