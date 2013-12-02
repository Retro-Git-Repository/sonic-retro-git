;===============================================================================
; Objeto 0xBF
; [ Início ]
;===============================================================================   
Offset_0x03BB58:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03BB66(PC, D0), D1
                jmp     Offset_0x03BB66(PC, D1)
Offset_0x03BB66:
                dc.w    Offset_0x03BB6A-Offset_0x03BB66
                dc.w    Offset_0x03BB6E-Offset_0x03BB66
Offset_0x03BB6A:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x03BB6E:
                lea     (Engine_Part_Animate_Data), A1         ; Offset_0x03BB8A
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Obj_0xBF_Ptr: ; Offset_0x03BB80:                
                dc.l    Engine_Part_Mappings                   ; Offset_0x03BB92
                dc.w    $E450
                dc.b    $04, $04, $04, $04
;-------------------------------------------------------------------------------   
Engine_Part_Animate_Data: ; Offset_0x03BB80:
                dc.w    Offset_0x03BB8C-Engine_Part_Animate_Data
Offset_0x03BB8C:
                dc.b    $01, $00, $01, $02, $FF, $00
;-------------------------------------------------------------------------------
Engine_Part_Mappings: ; Offset_0x03BB92:
                dc.w    Offset_0x03BB98-Engine_Part_Mappings
                dc.w    Offset_0x03BBA2-Engine_Part_Mappings
                dc.w    Offset_0x03BBAC-Engine_Part_Mappings
Offset_0x03BB98:
                dc.w    $0001
                dc.l    $F0030000, $0000FFFC
Offset_0x03BBA2:
                dc.w    $0001
                dc.l    $F0030004, $0002FFFC
Offset_0x03BBAC:
                dc.w    $0001
                dc.l    $F0030008, $0004FFFC              
;===============================================================================
; Objeto 0xBF
; [ Término ]
;===============================================================================