;===============================================================================
; Objeto 0xB5 - Hélice Horizontal na Wing Fortress
; [ Início ]
;===============================================================================    
Offset_0x03B054:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B062(PC, D0), D1
                jmp     Offset_0x03B062(PC, D1)
Offset_0x03B062:
                dc.w    Offset_0x03B068-Offset_0x03B062
                dc.w    Offset_0x03B080-Offset_0x03B062
                dc.w    Offset_0x03B0A6-Offset_0x03B062
Offset_0x03B068:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$04, $001C(A0)
                move.b  $0028(A0), D0
                subi.b  #$64, D0
                move.b  D0, $0024(A0)
                rts
Offset_0x03B080:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03B0A0(PC, D0), D1
                jsr     Offset_0x03B0A0(PC, D1)
                lea     (Horizontal_Helix_Animate_Data), A1    ; Offset_0x03B14A
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B0A0:
                dc.w    Offset_0x03B0A2-Offset_0x03B0A0
Offset_0x03B0A2:
                bra     Offset_0x03B0B8
Offset_0x03B0A6:
                lea     (Horizontal_Helix_Animate_Data), A1    ; Offset_0x03B14A
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B0B8:                
                cmpi.b  #$04, $001C(A0)
                bne.s   Offset_0x03B13E
                lea     ($FFFFB000).w, A1
                bsr     Offset_0x03B0CC
                lea     ($FFFFB040).w, A1
Offset_0x03B0CC:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$0040, D0
                cmpi.w  #$0080, D0
                bcc.s   Offset_0x03B13E
                moveq   #$00, D1
                move.b  ($FFFFFE74).w, D1
                add.w   $000C(A1), D1
                addi.w  #$0060, D1
                sub.w   $000C(A0), D1
                bcs.s   Offset_0x03B13E
                cmpi.w  #$0090, D1
                bcc.s   Offset_0x03B13E
                subi.w  #$0060, D1
                bcs.s   Offset_0x03B102
                not.w   D1
                add.w   D1, D1
Offset_0x03B102:
                addi.w  #$0060, D1
                neg.w   D1
                asr.w   #$04, D1
                add.w   D1, $000C(A1)
                bset    #$01, $0022(A1)
                move.w  #$0000, $0012(A1)
                move.w  #$0001, $0014(A1)
                tst.b   $0027(A1)
                bne.s   Offset_0x03B13E
                move.b  #$01, $0027(A1)
                move.b  #$0F, $001C(A1)
                move.b  #$7F, $002C(A1)
                move.b  #$08, $002D(A1)
Offset_0x03B13E:
                rts
;-------------------------------------------------------------------------------                
Obj_0xB5_Ptr: ; Offset_0x03B140:
                dc.l    Horizontal_Helix_Mappings              ; Offset_0x03B1AA 
                dc.w    $A3CD
                dc.b    $04, $04, $40, $00
;-------------------------------------------------------------------------------
Horizontal_Helix_Animate_Data: ; Offset_0x03B14A:
                dc.w    Offset_0x03B15E-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B168-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B170-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B178-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B17E-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B186-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B18C-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B194-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B19C-Horizontal_Helix_Animate_Data
                dc.w    Offset_0x03B1A6-Horizontal_Helix_Animate_Data
Offset_0x03B15E:
                dc.b    $07, $00, $01, $02, $03, $04, $05, $FD, $01, $00
Offset_0x03B168:
                dc.b    $04, $00, $01, $02, $03, $04, $FD, $02
Offset_0x03B170:
                dc.b    $03, $05, $00, $01, $02, $FD, $03, $00
Offset_0x03B178:
                dc.b    $02, $03, $04, $05, $FD, $04
Offset_0x03B17E:
                dc.b    $01, $00, $01, $02, $03, $04, $05, $FF
Offset_0x03B186:
                dc.b    $02, $05, $04, $03, $FD, $06
Offset_0x03B18C:
                dc.b    $03, $02, $01, $00, $05, $FD, $07, $00
Offset_0x03B194:
                dc.b    $04, $04, $03, $02, $01, $00, $FD, $08
Offset_0x03B19C:
                dc.b    $07, $05, $04, $03, $02, $01, $00, $FD, $09, $00
Offset_0x03B1A6:
                dc.b    $7E, $00, $FF, $00
;-------------------------------------------------------------------------------   
Horizontal_Helix_Mappings: ; Offset_0x03B1AA:
                dc.w    Offset_0x03B1B6-Horizontal_Helix_Mappings
                dc.w    Offset_0x03B1D8-Horizontal_Helix_Mappings
                dc.w    Offset_0x03B1EA-Horizontal_Helix_Mappings
                dc.w    Offset_0x03B1FC-Horizontal_Helix_Mappings
                dc.w    Offset_0x03B20E-Horizontal_Helix_Mappings
                dc.w    Offset_0x03B220-Horizontal_Helix_Mappings
Offset_0x03B1B6:
                dc.w    $0004
                dc.l    $FC0C0000, $0000FFC0, $FC080004, $0002FFE0
                dc.l    $FC080007, $00030008, $FC0C000A, $00050020
Offset_0x03B1D8:
                dc.w    $0002
                dc.l    $FC0C000E, $0007FFD8, $FC0C0012, $00090008
Offset_0x03B1EA:
                dc.w    $0002
                dc.l    $FC080016, $000BFFE8, $FC040019, $000C0008
Offset_0x03B1FC:
                dc.w    $0002
                dc.l    $FC04001B, $000DFFF0, $FC04081B, $080D0000
Offset_0x03B20E:
                dc.w    $0002
                dc.l    $FC040819, $080CFFE8, $FC080816, $080B0000
Offset_0x03B220:
                dc.w    $0002
                dc.l    $FC0C0812, $0809FFD8, $FC0C080E, $08070008                                                                                                                            
;===============================================================================
; Objeto 0xB5 - Hélice Horizontal na Wing Fortress
; [ Término ]
;===============================================================================