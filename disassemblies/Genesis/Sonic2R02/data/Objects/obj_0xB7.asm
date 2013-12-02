;===============================================================================
; Objeto 0xB7 - Laser vertical largo na Wing Fortress não usado no jogo
; [ Início ]
;===============================================================================     
Offset_0x03B51E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B52C(PC, D0), D1
                jmp     Offset_0x03B52C(PC, D1)
Offset_0x03B52C:
                dc.w    Offset_0x03B530-Offset_0x03B52C
                dc.w    Offset_0x03B53C-Offset_0x03B52C
Offset_0x03B530:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$20, $002A(A0)
                rts
Offset_0x03B53C:
                subq.b  #$01, $002A(A0)
                beq     J_DeleteObject_01                      ; Offset_0x036344
                bchg    #00, $002B(A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                  
Obj_0xB7_Ptr: ; Offset_0x03B554:   
                dc.l    Vertical_Large_Laser_Mappings          ; Offset_0x03B55E
                dc.w    $C39F
                dc.b    $04, $04, $18, $A9
;-------------------------------------------------------------------------------                  
Vertical_Large_Laser_Mappings: ; Offset_0x03B55E:
                dc.w    Offset_0x03B560-Vertical_Large_Laser_Mappings
Offset_0x03B560:
                dc.w    $0010
                dc.l    $900B0000, $0000FFE8, $900B0800, $08000000
                dc.l    $B00B0000, $0000FFE8, $B00B0800, $08000000
                dc.l    $D00B0000, $0000FFE8, $D00B0800, $08000000
                dc.l    $F00B0000, $0000FFE8, $F00B0800, $08000000
                dc.l    $100B0000, $0000FFE8, $100B0800, $08000000
                dc.l    $300B0000, $0000FFE8, $300B0800, $08000000
                dc.l    $500B0000, $0000FFE8, $500B0800, $08000000
                dc.l    $700B0000, $0000FFE8, $700B0800, $08000000                                                   
;===============================================================================
; Objeto 0xB7 - Laser vertical largo na Wing Fortress não usado no jogo
; [ Término ]
;===============================================================================