;===============================================================================
; Objeto 0x3B - Pedra roxa na Green Hill do Sonic 1 não usado (Left over)
; [ Início ]
;===============================================================================   
Offset_0x015C52:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x015C60(PC, D0), D1
                jmp     Offset_0x015C60(PC, D1)
Offset_0x015C60:
                dc.w    Offset_0x015C64-Offset_0x015C60
                dc.w    Offset_0x015C8C-Offset_0x015C60
Offset_0x015C64:
                addq.b  #$02, $0024(A0)
                move.l  #Obj_0x3B_Mappings, $0004(A0)          ; Offset_0x015CB8
                move.w  #$66C0, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$13, $0019(A0)
                move.b  #$04, $0018(A0)
Offset_0x015C8C:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0010, D3
                move.w  $0008(A0), D4
                bsr     SolidObject                            ; Offset_0x019686
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A
;------------------------------------------------------------------------------- 
Obj_0x3B_Mappings: ; Offset_0x015CB8:
                dc.w    Offset_0x015CBA-Obj_0x3B_Mappings
Offset_0x015CBA:
                dc.w    $0002
                dc.l    $F00B0000, $0000FFE8, $F00B000C, $00060000                     
;===============================================================================
; Objeto 0x3B - Pedra roxa na Green Hill do Sonic 1 não usado (Left over)
; [ Término ]
;===============================================================================  