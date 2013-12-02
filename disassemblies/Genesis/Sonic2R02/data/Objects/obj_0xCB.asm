;===============================================================================
; Objeto 0xCB - Nuvens na seqüência do final antes dos créditos
; [ Início ]
;===============================================================================   
Offset_0x00A9CC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00A9DA(PC, D0), D1
                jmp     Offset_0x00A9DA(PC, D1)
Offset_0x00A9DA:
                dc.w    Offset_0x00A9E0-Offset_0x00A9DA
                dc.w    Offset_0x00AA52-Offset_0x00A9DA
                dc.w    Offset_0x00AA66-Offset_0x00A9DA
Offset_0x00A9E0:
                lea     (Obj_0xB3_Ptr), A1                     ; Offset_0x03AF76 
                jsr     (ObjectSettings_A1)                    ; Offset_0x036028
                move.w  $0002(A0), D0
                andi.w  #$1FFF, D0
                ori.w   #$6000, D0
                move.w  D0, $0002(A0)
                move.b  #$30, $0019(A0)
                move.l  ($FFFFF636).w, D0
                ror.l   #$01, D0
                move.l  D0, ($FFFFF636).w
                move.w  D0, D1
                andi.w  #$0003, D0
                move.b  Offset_0x00AA46(PC, D0), $001A(A0)
                add.w   D0, D0
                move.w  Offset_0x00AA4A(PC, D0), $0012(A0)
                tst.b   ($FFFFB134).w
                beq.s   Offset_0x00AA36
                andi.w  #$00FF, D1
                move.w  D1, $000C(A0)
                move.w  #$0150, $0008(A0)
                rts
Offset_0x00AA36:
                andi.w  #$01FF, D1
                move.w  D1, $0008(A0)
                move.w  #$0100, $000C(A0)
                rts
;-------------------------------------------------------------------------------                  
Offset_0x00AA46:
                dc.b    $00, $01, $02, $00
;-------------------------------------------------------------------------------                
Offset_0x00AA4A:
                dc.w    $FD00, $FE00, $FF00, $FD00
;-------------------------------------------------------------------------------
Offset_0x00AA52:
                tst.b   ($FFFFB134).w
                beq.s   Offset_0x00AA66
                addq.b  #$02, $0024(A0)
                move.w  $0012(A0), $0010(A0)
                clr.w   $0012(A0)
Offset_0x00AA66:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                tst.b   ($FFFFB134).w
                beq.s   Offset_0x00AA82
                cmpi.w  #$FFE0, $0008(A0)
                blt     Obj_0xCB_DeleteObject                  ; Offset_0x00AB82 ( Obj_0xCD.asm )
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00AA82:
                tst.w   $000C(A0)
                bmi     Obj_0xCB_DeleteObject                  ; Offset_0x00AB82 ( Obj_0xCD.asm )
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;===============================================================================
; Objeto 0xCB - Nuvens na seqüência do final antes dos créditos
; [ Término ]
;===============================================================================  
