;===============================================================================
; Objeto 0xBA - Rodas das esteiras na Wing Fortress
; [ Início ]
;===============================================================================  
Offset_0x03B7D6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B7E4(PC, D0), D1
                jmp     Offset_0x03B7E4(PC, D1)
Offset_0x03B7E4:
                dc.w    Offset_0x03B7E8-Offset_0x03B7E4
                dc.w    Offset_0x03B7EC-Offset_0x03B7E4
Offset_0x03B7E8:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x03B7EC:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------  
Obj_0xBA_Ptr: ; Offset_0x03B7F2:
                dc.l    Conveyor_Belt_Wheels_Mappings          ; Offset_0x03B7FC
                dc.w    $C3EA
                dc.b    $04, $04, $10, $00
;-------------------------------------------------------------------------------                
Conveyor_Belt_Wheels_Mappings: ; Offset_0x03B7FC:
                dc.w    Offset_0x03B7FE-Conveyor_Belt_Wheels_Mappings
Offset_0x03B7FE:
                dc.w    $0001
                dc.l    $F00F0000, $0000FFF0                                                                               
;===============================================================================
; Objeto 0xBA - Rodas das esteiras na Wing Fortress
; [ Término ]
;===============================================================================