;===============================================================================
; Objeto 0xC3 - Fumaça saindo do Tornado ao ser atingido pelo laser no início da
; [ Início ]    Wing Fortress
;===============================================================================   
Offset_0x03C09E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03C0AC(PC, D0), D1
                jmp     Offset_0x03C0AC(PC, D1)
Offset_0x03C0AC:
                dc.w    Offset_0x03C0B0-Offset_0x03C0AC
                dc.w    Offset_0x03C0E0-Offset_0x03C0AC
Offset_0x03C0B0:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$07, $001E(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.w  ($FFFFF636).w, D0
                andi.w  #$001C, D0
                sub.w   D0, $0008(A0)
                addi.w  #$0010, $000C(A0)
                move.w  #$FF00, $0012(A0)
                move.w  #$FF00, $0010(A0)
                rts
Offset_0x03C0E0:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x03C100
                move.b  #$07, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$05, $001A(A0)
                beq     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x03C100:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Obj_0xC4_Ptr: ; Offset_0x03C106:
                dc.l    Object_Hit_Mappings                    ; Offset_0x021062
                dc.w    $05A4
                dc.b    $04, $05, $0C, $00                                                                 
;===============================================================================
; Objeto 0xC3 - Fumaça saindo do Tornado ao ser atingido pelo laser no início da
; [ Término ]   Wing Fortress
;===============================================================================