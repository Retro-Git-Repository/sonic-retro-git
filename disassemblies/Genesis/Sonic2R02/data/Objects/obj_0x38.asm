;===============================================================================
; Objeto 0x38 - Escudo do Sonic / Miles
; [ Início ]
;===============================================================================  
Offset_0x01D884:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01D892(PC, D0), D1
                jmp     Offset_0x01D892(PC, D1)
Offset_0x01D892:
                dc.w    Offset_0x01D896-Offset_0x01D892
                dc.w    Offset_0x01D8BE-Offset_0x01D892
Offset_0x01D896:
                addq.b  #$02, $0024(A0)
                move.l  #Shield_Mappings, $0004(A0)            ; Offset_0x01DB7A
                move.b  #$04, $0001(A0)
                move.b  #$01, $0018(A0)
                move.b  #$18, $0019(A0)
                move.w  #$04BE, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
Offset_0x01D8BE:
                move.w  $003E(A0), A2
                btst    #$01, $002B(A2)
                bne.s   Offset_0x01D908
                btst    #$00, $002B(A2)
                beq.s   Offset_0x01D90A
                move.w  $0008(A2), $0008(A0)
                move.w  $000C(A2), $000C(A0)
                move.b  $0022(A2), $0022(A0)
                andi.w  #$7FFF, $0002(A0)
                tst.w   $0002(A2)
                bpl.s   Offset_0x01D8F6
                ori.w   #$8000, $0002(A0)
Offset_0x01D8F6:
                lea     (Shield_AnimateData), A1               ; Offset_0x01DB6C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01D908:
                rts
Offset_0x01D90A:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;===============================================================================
; Objeto 0x38 - Escudo do Sonic / Miles
; [ Término ]
;===============================================================================  