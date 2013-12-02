;===============================================================================
; Objeto 0xCF - Hélice do Tornado na seqüência do final antes dos créditos
; [ Início ]
;===============================================================================  
Offset_0x00A95E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00A96C(PC, D0), D1
                jmp     Offset_0x00A96C(PC, D1)
Offset_0x00A96C:
                dc.w    Offset_0x00A970-Offset_0x00A96C
                dc.w    Offset_0x00A9BC-Offset_0x00A96C
Offset_0x00A970:
                lea     (Obj_0xB3_Ptr), A1                     ; Offset_0x03AF76
                jsr     (ObjectSettings_A1)                    ; Offset_0x036028
                move.l  #Offset_0x00AD9E, $0004(A0)
                move.w  #$8000, $0002(A0)
                move.b  #$03, $0018(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$05, $001A(A0)
                move.b  #$02, $001C(A0)
                move.w  #$010F, D0
                move.w  D0, $0008(A0)
                move.w  D0, $0030(A0)
                move.w  #$015E, D0
                move.w  D0, $000C(A0)
                move.w  D0, $0032(A0)
                rts
Offset_0x00A9BC:
                lea     (Offset_0x00AD7E), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Obj_0xCF_Sub                           ; Offset_0x00A8DC  ( Obj_0xCF.asm )
;===============================================================================
; Objeto 0xCF - Hélice do Tornado na seqüência do final antes dos créditos
; [ Término ]
;===============================================================================  