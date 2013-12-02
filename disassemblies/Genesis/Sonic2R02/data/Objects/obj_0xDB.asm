;===============================================================================
; Objeto 0xDB - Sonic / Miles na tela de continue
; [ Início ]
;===============================================================================     
Offset_0x007B06:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x007B1A(PC, D0), D1
                jsr     Offset_0x007B1A(PC, D1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x007B1A:
                dc.w    Offset_0x007B26-Offset_0x007B1A
                dc.w    Offset_0x007B56-Offset_0x007B1A
                dc.w    Offset_0x007B7E-Offset_0x007B1A
                dc.w    Offset_0x007BA6-Offset_0x007B1A
                dc.w    Offset_0x007BD6-Offset_0x007B1A
                dc.w    Offset_0x007C0C-Offset_0x007B1A
Offset_0x007B26:
                addq.b  #$02, $0024(A0)
                move.w  #$009C, $0008(A0)
                move.w  #$019C, $000C(A0)
                move.l  #Sonic_Mappings, $0004(A0)             ; Offset_0x06FBE0
                move.w  #$0780, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$02, $0018(A0)
                move.b  #$20, $001C(A0)
Offset_0x007B56:
                tst.b   ($FFFFF605).w
                bmi.s   Offset_0x007B68
                jsr     (Sonic_Animate)                        ; Offset_0x01B2C2
                jmp     (Load_Sonic_Dynamic_PLC)               ; Offset_0x01B7C4
Offset_0x007B68:
                addq.b  #$02, $0024(A0)
                move.b  #$21, $001C(A0)
                clr.w   $0014(A0)
                move.b  #Spindash_Sfx, D0       ; $E0
                bsr     Play_Sfx                               ; Offset_0x00132C
Offset_0x007B7E:
                cmpi.w  #$0800, $0014(A0)
                bne.s   Offset_0x007B8E
                move.w  #$1000, $0010(A0)
                bra.s   Offset_0x007B94
Offset_0x007B8E:
                addi.w  #$0020, $0014(A0)
Offset_0x007B94:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jsr     (Sonic_Animate)                        ; Offset_0x01B2C2
                jmp     (Load_Sonic_Dynamic_PLC)               ; Offset_0x01B7C4
Offset_0x007BA6:
                addq.b  #$02, $0024(A0)
                move.w  #$00B8, $0008(A0)
                move.w  #$01A0, $000C(A0)
                move.l  #Continue_Counter_Mappings, $0004(A0)  ; Offset_0x007C3A
                move.w  #$0500, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$02, $0018(A0)
                move.b  #$00, $001C(A0)
Offset_0x007BD6:
                tst.b   ($FFFFF605).w
                bmi.s   Offset_0x007BE8
                lea     (Continue_AnimateData), A1             ; Offset_0x007C34
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x007BE8:
                addq.b  #$02, $0024(A0)
                move.l  #Miles_Mappings, $0004(A0)             ; Offset_0x0739E2
                move.w  #$07A0, $0002(A0)
                move.b  #$00, $001C(A0)
                clr.w   $0014(A0)
                move.b  #Spindash_Sfx, D0       ; $E0
                bsr     Play_Sfx                               ; Offset_0x00132C
Offset_0x007C0C:
                cmpi.w  #$0720, $0014(A0)
                bne.s   Offset_0x007C1C
                move.w  #$1000, $0010(A0)
                bra.s   Offset_0x007C22
Offset_0x007C1C:
                addi.w  #$0018, $0014(A0)
Offset_0x007C22:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jsr     (Miles_Animate)                        ; Offset_0x01CD40
                jmp     (Load_Miles_Dynamic_PLC)               ; Offset_0x01D138
;-------------------------------------------------------------------------------
Continue_AnimateData: ; Offset_0x007C34:
                dc.w    Offset_0x007C36-Continue_AnimateData
Offset_0x007C36:
                dc.b    $09, $02, $03, $FF
;-------------------------------------------------------------------------------
Continue_Counter_Mappings: ; Offset_0x007C3A:
                dc.w    Offset_0x007C46-Continue_Counter_Mappings
                dc.w    Offset_0x007C46-Continue_Counter_Mappings
                dc.w    Offset_0x007CA0-Continue_Counter_Mappings
                dc.w    Offset_0x007CAA-Continue_Counter_Mappings
                dc.w    Offset_0x007CB4-Continue_Counter_Mappings
                dc.w    Offset_0x007CBE-Continue_Counter_Mappings
Offset_0x007C46:
                dc.w    $000B
                dc.l    $F8050090, $0048FFC4, $F8050088, $0044FFD4
                dc.l    $F8050084, $0042FFE4, $F8050094, $004AFFF4
                dc.l    $F8010098, $004C0004, $F8050084, $0042000C
                dc.l    $F805009A, $004D001C, $F8050080, $0040002C
                dc.l    $38052020, $2010FFE8, $38052020, $20100008
                dc.l    $360501FC, $00FEFFF8
Offset_0x007CA0:
                dc.w    $0001
                dc.l    $F00F0000, $0000FFF0
Offset_0x007CAA:
                dc.w    $0001
                dc.l    $F00F0010, $0008FFF0
Offset_0x007CB4:
                dc.w    $0001
                dc.l    $00060000, $00000000
Offset_0x007CBE:
                dc.w    $0001
                dc.l    $00060006, $00030000                                                              
;===============================================================================
; Objeto 0xDB - Sonic / Miles na tela de continue
; [ Término ]
;===============================================================================