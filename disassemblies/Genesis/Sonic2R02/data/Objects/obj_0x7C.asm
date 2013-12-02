;===============================================================================
; Objeto 0x7C - Estrutura de metal no fundo da Chemical Plant
; [ Início ]
;===============================================================================  
Offset_0x020F0A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020F18(PC, D0), D1
                jmp     Offset_0x020F18(PC, D1)
Offset_0x020F18:
                dc.w    Offset_0x020F1C-Offset_0x020F18
                dc.w    Offset_0x020F40-Offset_0x020F18
Offset_0x020F1C:
                addq.b  #$02, $0024(A0)
                move.l  #Metal_Structure_Mappings, $0004(A0)   ; Offset_0x020F78
                move.w  #$C373, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$10, $0019(A0)
                move.b  #$07, $0018(A0)
Offset_0x020F40:
                move.w  ($FFFFEE00).w, D1
                andi.w  #$03FF, D1
                cmpi.w  #$02E0, D1
                bcc.s   Offset_0x020F76
                asr.w   #$01, D1
                move.w  D1, D0
                asr.w   #$01, D1
                add.w   D1, D0
                neg.w   D0
                move.w  D0, $0008(A0)
                move.w  ($FFFFEE04).w, D1
                asr.w   #$01, D1
                andi.w  #$003F, D1
                neg.w   D1
                addi.w  #$0100, D1
                move.w  D1, $000A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x020F76:
                rts
;-------------------------------------------------------------------------------                
Metal_Structure_Mappings: ; Offset_0x020F78:
                dc.w    Offset_0x020F7A-Metal_Structure_Mappings
Offset_0x020F7A:
                dc.w    $0009
                dc.l    $800FA000, $A000FFF0, $A00FB000, $B000FFF0
                dc.l    $C00FA000, $A000FFF0, $E00FB000, $B000FFF0
                dc.l    $000FA000, $A000FFF0, $200FB000, $B000FFF0
                dc.l    $400FA000, $A000FFF0, $600FB000, $B000FFF0
                dc.l    $7F0FA000, $A000FFF0
;===============================================================================
; Objeto 0x7C - Estrutura de metal no fundo da Chemical Plant
; [ Término ]
;===============================================================================  