;===============================================================================
; Objeto 0xB9 - Laser no início da Wing Fortress (Danifica o Tornado no início
; [ Iníco ]     da fase)
;===============================================================================   
Offset_0x03B73E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B74C(PC, D0), D1
                jmp     Offset_0x03B74C(PC, D1)
Offset_0x03B74C:
                dc.w    Offset_0x03B752-Offset_0x03B74C
                dc.w    Offset_0x03B756-Offset_0x03B74C
                dc.w    Offset_0x03B776-Offset_0x03B74C
Offset_0x03B752:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x03B756:
                tst.b   $0001(A0)
                bmi.s   Offset_0x03B760
                bra     Offset_0x03B780
Offset_0x03B760:
                addq.b  #$02, $0024(A0)
                move.w  #$F000, $0010(A0)
                moveq   #$FFFFFFEF, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                bra     Offset_0x03B780
Offset_0x03B776:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bra     Offset_0x03B780
Offset_0x03B780:
                move.w  $0008(A0), D0
                move.w  ($FFFFEE00).w, D1
                subi.w  #$0040, D1
                cmp.w   D1, D0
                blt     J_DeleteObject_01                      ; Offset_0x036344
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
Obj_0xB9_Ptr: ; Offset_0x03B798:
                dc.l    Laser_Mappings                         ; Offset_0x03B7A2
                dc.w    $C3C3
                dc.b    $04, $01, $60, $00
;-------------------------------------------------------------------------------
Laser_Mappings: ; Offset_0x03B7A2:
                dc.w    Offset_0x03B7A4-Laser_Mappings
Offset_0x03B7A4:
                dc.w    $0006
                dc.l    $F8010000, $0000FFB8, $F80D0002, $0001FFC0
                dc.l    $F80D0002, $0001FFE0, $F80D0002, $00010000
                dc.l    $F80D0002, $00010020, $F8010800, $08000040                                                 
;===============================================================================
; Objeto 0xB9 - Laser no início da Wing Fortress (Danifica o Tornado no início
; [ Término ]   da fase)
;===============================================================================