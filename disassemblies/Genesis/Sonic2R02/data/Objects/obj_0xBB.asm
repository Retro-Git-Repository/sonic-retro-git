;===============================================================================
; Objeto 0xBB
; [ Início ]
;===============================================================================   
Offset_0x03B808:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B816(PC, D0), D1
                jmp     Offset_0x03B816(PC, D1)
Offset_0x03B816:
                dc.w    Offset_0x03B81A-Offset_0x03B816
                dc.w    Offset_0x03B81E-Offset_0x03B816
Offset_0x03B81A:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x03B81E:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;------------------------------------------------------------------------------- 
Obj_0xBB_Ptr: ; Offset_0x03B824:
                dc.l    Obj_0xBB_Mappings                      ; Offset_0x03B82E
                dc.w    $23FA
                dc.b    $04, $04, $0C, $09
;-------------------------------------------------------------------------------      
Obj_0xBB_Mappings: ;Offset_0x03B82E:
                dc.w    Offset_0x03B830-Obj_0xBB_Mappings
Offset_0x03B830:
                dc.w    $0003
                dc.l    $C0050000, $0000FFF4, $D0030004, $0002FFFC
                dc.l    $F00B0008, $0004FFF4
;===============================================================================
; Objeto 0xBB
; [ Término ]
;===============================================================================