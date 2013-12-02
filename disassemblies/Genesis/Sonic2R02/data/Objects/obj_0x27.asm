;===============================================================================
; Objeto 0x27 - Rotina de resposta ao toque nos objetos das fases
; [ Início ]
;===============================================================================    
Offset_0x020FC4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020FD2(PC, D0), D1
                jmp     Offset_0x020FD2(PC, D1)
Offset_0x020FD2:
                dc.w    Offset_0x020FD8-Offset_0x020FD2
                dc.w    Offset_0x020FFC-Offset_0x020FD2
                dc.w    Offset_0x021042-Offset_0x020FD2
Offset_0x020FD8:
                addq.b  #$02, $0024(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x020FFC
                move.b  #$28, $0000(A1)       ; Carrega o objeto 0x28 - Flickies
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $003E(A0), $003E(A1)
Offset_0x020FFC:
                addq.b  #$02, $0024(A0)
                move.l  #Object_Hit_Mappings, $0004(A0)        ; Offset_0x021062
                move.w  #$05A4, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$01, $0018(A0)
                move.b  #$00, $0020(A0)
                move.b  #$0C, $0019(A0)
                move.b  #$03, $001E(A0)
                move.b  #$00, $001A(A0)
                move.w  #Object_Hit_Sfx, D0     ; $00C1
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x021042:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02105C
                move.b  #$07, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$05, $001A(A0)
                beq     J_DeleteObject                         ; Offset_0x0213F0
Offset_0x02105C:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
Object_Hit_Mappings: ; Offset_0x021062:
                dc.w    Offset_0x02106C-Object_Hit_Mappings
                dc.w    Offset_0x021076-Object_Hit_Mappings
                dc.w    Offset_0x021080-Object_Hit_Mappings
                dc.w    Offset_0x02108A-Object_Hit_Mappings
                dc.w    Offset_0x021094-Object_Hit_Mappings
Offset_0x02106C:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x021076:
                dc.w    $0001
                dc.l    $F00F2004, $2002FFF0
Offset_0x021080:
                dc.w    $0001
                dc.l    $F00F2014, $200AFFF0
Offset_0x02108A:
                dc.w    $0001
                dc.l    $F00F2024, $2012FFF0
Offset_0x021094:
                dc.w    $0001
                dc.l    $F00F2034, $201AFFF0
;===============================================================================
; Objeto 0x27 - Rotina de resposta ao toque nos objetos das fases
; [ Término ]
;===============================================================================  