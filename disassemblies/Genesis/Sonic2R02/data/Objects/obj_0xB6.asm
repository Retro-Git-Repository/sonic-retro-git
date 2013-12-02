;===============================================================================
; Objeto 0xB6 - Plataforma Hélice na Wing Fortress
; [ Início ]
;=============================================================================== 
Offset_0x03B232:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B240(PC, D0), D1
                jmp     Offset_0x03B240(PC, D1)
Offset_0x03B240:
                dc.w    Offset_0x03B24A-Offset_0x03B240
                dc.w    Offset_0x03B264-Offset_0x03B240
                dc.w    Offset_0x03B2C2-Offset_0x03B240
                dc.w    Offset_0x03B334-Offset_0x03B240
                dc.w    Offset_0x03B3AC-Offset_0x03B240
Offset_0x03B24A:
                moveq   #$00, D0
                move.b  #$6A, D0
                bsr     ObjectSettings_D0                      ; Offset_0x036020
                move.b  $0028(A0), D0
                andi.b  #$06, D0
                addq.b  #$02, D0
                move.b  D0, $0024(A0)
                rts
Offset_0x03B264:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03B278(PC, D0), D1
                jsr     Offset_0x03B278(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B278:
                dc.w    Offset_0x03B280-Offset_0x03B278
                dc.w    Offset_0x03B288-Offset_0x03B278
                dc.w    Offset_0x03B2A8-Offset_0x03B278
                dc.w    Offset_0x03B2B4-Offset_0x03B278
Offset_0x03B280:
                addq.b  #$02, $0025(A0)
                bra     Offset_0x03B3F0
Offset_0x03B288:
                bsr     Offset_0x03B402
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$F0, D0
                cmp.b   $0028(A0), D0
                beq.s   Offset_0x03B29C
                rts
Offset_0x03B29C:
                addq.b  #$02, $0025(A0)
                clr.b   $001C(A0)
                bra     Load_Helix_Obj                         ; Offset_0x03B432
Offset_0x03B2A8:
                lea     (Platform_Helix_Animate_Data), A1      ; Offset_0x03B49A
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x03B2B4:
                move.b  #$02, $0025(A0)
                move.w  #$00C0, $002A(A0)
                rts
Offset_0x03B2C2:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03B2D6(PC, D0), D1
                jsr     Offset_0x03B2D6(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B2D6:
                dc.w    Offset_0x03B280-Offset_0x03B2D6
                dc.w    Offset_0x03B2DC-Offset_0x03B2D6
                dc.w    Offset_0x03B310-Offset_0x03B2D6
Offset_0x03B2DC:
                bsr     Offset_0x03B402
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03B2E8
                rts
Offset_0x03B2E8:
                addq.b  #$02, $0025(A0)
                move.b  #$20, $002A(A0)
                move.b  #$03, $001C(A0)
                clr.b   $001B(A0)
                clr.b   $001E(A0)
                bsr     Load_Helix_Obj                         ; Offset_0x03B432
                bsr     Offset_0x03B46E
                moveq   #$FFFFFFDC, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03B310:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x03B322
                lea     (Platform_Helix_Animate_Data), A1      ; Offset_0x03B49A
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x03B322:
                move.b  #$02, $0025(A0)
                clr.b   $001A(A0)
                move.w  #$00C0, $002A(A0)
                rts
Offset_0x03B334:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03B348(PC, D0), D1
                jsr     Offset_0x03B348(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B348:
                dc.w    Offset_0x03B350-Offset_0x03B348
                dc.w    Offset_0x03B36C-Offset_0x03B348
                dc.w    Offset_0x03B39A-Offset_0x03B348
                dc.w    Offset_0x03B3A6-Offset_0x03B348
Offset_0x03B350:
                bsr     Offset_0x03B402
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x03B360
                rts
Offset_0x03B360:
                addq.b  #$02, $0025(A0)
                move.w  #$0010, $002A(A0)
                rts
Offset_0x03B36C:
                bsr     Offset_0x03B402
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03B378
                rts
Offset_0x03B378:
                addq.b  #$02, $0025(A0)
                move.b  #$00, $001C(A0)
                bsr     Offset_0x0360FC
                bclr    #$00, $0022(A0)
                tst.w   D0
                bne.s   Offset_0x03B396
                bset    #$00, $0022(A0)
Offset_0x03B396:
                bra     Load_Helix_Obj                         ; Offset_0x03B432
Offset_0x03B39A:
                lea     (Platform_Helix_Animate_Data), A1      ; Offset_0x03B49A
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x03B3A6:
                clr.b   $0025(A0)
                rts
Offset_0x03B3AC:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03B3C0(PC, D0), D1
                jsr     Offset_0x03B3C0(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B3C0:
                dc.w    Offset_0x03B3C8-Offset_0x03B3C0
                dc.w    Offset_0x03B3D6-Offset_0x03B3C0
                dc.w    Offset_0x03B2A8-Offset_0x03B3C0
                dc.w    Offset_0x03B2B4-Offset_0x03B3C0
Offset_0x03B3C8:
                addq.b  #$02, $0025(A0)
                move.b  #$02, $001A(A0)
                bra     Offset_0x03B3F0
Offset_0x03B3D6:
                bsr     Offset_0x03B41A
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03B3E2
                rts
Offset_0x03B3E2:
                addq.b  #$02, $0025(A0)
                move.b  #$04, $001C(A0)
                bra     Load_Helix_Obj                         ; Offset_0x03B432
Offset_0x03B3F0:
                move.b  $0028(A0), D0
                andi.w  #$00F0, D0
                move.b  D0, $0028(A0)
                move.w  D0, $002A(A0)
                rts
Offset_0x03B402:
                move.w  $0008(A0), -(A7)
                move.w  #$0023, D1
                move.w  #$0004, D2
                move.w  #$0004, D3
                move.w  (A7)+, D4
                jmp     (SolidObject)                          ; Offset_0x019686
Offset_0x03B41A:
                move.w  $0008(A0), -(A7)
                move.w  #$000F, D1
                move.w  #$0018, D2
                move.w  #$0018, D3
                move.w  (A7)+, D4
                jmp     (SolidObject)                          ; Offset_0x019686
;-------------------------------------------------------------------------------                
Load_Helix_Obj: ; Offset_0x03B432: ; Usado também pelo objetos 0xB2, 0xB6 e 0xBE
                move.b  $0022(A0), D0
                andi.b  #$02, D0
                beq.s   Offset_0x03B46C
                bclr    #$03, $0022(A0)
                beq.s   Offset_0x03B454
                lea     ($FFFFB000).w, A1
                bclr    #$03, $0022(A1)
                bset    #$01, $0022(A1)
Offset_0x03B454:
                bclr    #$04, $0022(A0)
                beq.s   Offset_0x03B46C
                lea     ($FFFFB040).w, A1
                bclr    #$04, $0022(A1)
                bset    #$01, $0022(A1)
Offset_0x03B46C:
                rts
;-------------------------------------------------------------------------------                 
Offset_0x03B46E:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03B48E
                move.b  #$B7, $0000(A1) ; Carrega o objeto 0xB7 - laser vetical largo não usado no jogo
                move.b  #$72, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
Offset_0x03B48E:
                rts
;-------------------------------------------------------------------------------                 
Obj_0xB6_Ptr: ; Offset_0x03B490:
                dc.l    Platform_Helix_Mappings                ; Offset_0x03B4CE
                dc.w    $A393
                dc.b    $04, $04, $10, $00
;------------------------------------------------------------------------------- 
Platform_Helix_Animate_Data: ; Offset_0x03B49A:
                dc.w    Offset_0x03B4A8-Platform_Helix_Animate_Data
                dc.w    Offset_0x03B4AE-Platform_Helix_Animate_Data
                dc.w    Offset_0x03B4B2-Platform_Helix_Animate_Data
                dc.w    Offset_0x03B4B8-Platform_Helix_Animate_Data
                dc.w    Offset_0x03B4BE-Platform_Helix_Animate_Data
                dc.w    Offset_0x03B4C4-Platform_Helix_Animate_Data
                dc.w    Offset_0x03B4C8-Platform_Helix_Animate_Data
Offset_0x03B4A8:
                dc.b    $03, $01, $02, $FD, $01, $00
Offset_0x03B4AE:
                dc.b    $3F, $02, $FD, $02
Offset_0x03B4B2:
                dc.b    $03, $02, $01, $00, $FA, $00
Offset_0x03B4B8:
                dc.b    $01, $00, $01, $02, $03, $FF
Offset_0x03B4BE:
                dc.b    $03, $01, $00, $FD, $05, $00
Offset_0x03B4C4:
                dc.b    $3F, $00, $FD, $06
Offset_0x03B4C8:
                dc.b    $03, $00, $01, $02, $FA, $00
;-------------------------------------------------------------------------------                
Platform_Helix_Mappings: ; Offset_0x03B4CE:
                dc.w    Offset_0x03B4D6-Platform_Helix_Mappings
                dc.w    Offset_0x03B4E8-Platform_Helix_Mappings
                dc.w    Offset_0x03B4FA-Platform_Helix_Mappings
                dc.w    Offset_0x03B50C-Platform_Helix_Mappings
Offset_0x03B4D6:
                dc.w    $0002
                dc.l    $FC080000, $0000FFE8, $FC080800, $08000000
Offset_0x03B4E8:
                dc.w    $0002
                dc.l    $EC060003, $0001FFF0, $FC061803, $18010000
Offset_0x03B4FA:
                dc.w    $0002
                dc.l    $E8020009, $0004FFFC, $00021009, $1004FFFC
Offset_0x03B50C:
                dc.w    $0002
                dc.l    $EC060803, $08010000, $FC061003, $1001FFF0                                                                                                                            
;===============================================================================
; Objeto 0xB6 - Plataforma Hélice na Wing Fortress
; [ Término ]
;===============================================================================