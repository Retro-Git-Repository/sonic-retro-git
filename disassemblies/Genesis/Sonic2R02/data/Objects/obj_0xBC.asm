;===============================================================================
; Objeto 0xBC - Turbinas do foguete do Robotnik na Wing Fortress
; [ Início ]
;===============================================================================  
Offset_0x03B84A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B858(PC, D0), D1
                jmp     Offset_0x03B858(PC, D1)
Offset_0x03B858:
                dc.w    Offset_0x03B85C-Offset_0x03B858
                dc.w    Offset_0x03B868-Offset_0x03B858
Offset_0x03B85C:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  $0008(A0), $002C(A0)
                rts
Offset_0x03B868:
                move.w  $002C(A0), D0
                move.w  ($FFFFEEE2).w, D1
                cmpi.w  #$0380, D1
                bcc     J_DeleteObject_01                      ; Offset_0x036344
                add.w   D1, D0
                move.w  D0, $0008(A0)
                bchg    #00, $002A(A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                     
Obj_0xBC_Ptr: ; Offset_0x03B88E:
                dc.l    Ship_Boost_Mappings                    ; Offset_0x03B898
                dc.w    $4465
                dc.b    $04, $04, $10, $00
;-------------------------------------------------------------------------------                
Ship_Boost_Mappings: ; Offset_0x03B898:
                dc.w    Offset_0x03B89A-Ship_Boost_Mappings
Offset_0x03B89A:
                dc.w    $0002
                dc.l    $F00D0000, $0000FFF0, $000D1000, $1000FFF0                                                                                                                                 
;===============================================================================
; Objeto 0xBC - Turbinas do foguete do Robotnik na Wing Fortress
; [ Término ]
;===============================================================================