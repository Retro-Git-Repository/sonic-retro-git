;===============================================================================
; Objeto 0x58 - Explosões dos chefes sendo derrotados
; [ Início ]
;===============================================================================   
Offset_0x02D03A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02D048(PC, D0), D1
                jmp     Offset_0x02D048(PC, D1)
Offset_0x02D048:
                dc.w    Offset_0x02D04C-Offset_0x02D048
                dc.w    Offset_0x02D094-Offset_0x02D048
Offset_0x02D04C:
                addq.b  #$02, $0024(A0)
                move.l  #Boss_Explosions_Mappings, $0004(A0)   ; Offset_0x02D0BA
                move.w  #$8580, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$00, $0018(A0)
                move.b  #$00, $0020(A0)
                move.b  #$0C, $0019(A0)
                move.b  #$07, $001E(A0)
                move.b  #$00, $001A(A0)
                move.w  #Explosion_Sfx, D0      ; $00C4
                jmp     (Play_Sfx)                             ; Offset_0x00132C
                rts
Offset_0x02D094:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02D0AE
                move.b  #$07, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$07, $001A(A0)
                beq     Offset_0x02D0B4
Offset_0x02D0AE:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02D0B4:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------                
Boss_Explosions_Mappings: ; Offset_0x02D0BA:
                dc.w    Offset_0x02D0C8-Boss_Explosions_Mappings
                dc.w    Offset_0x02D0D2-Boss_Explosions_Mappings
                dc.w    Offset_0x02D0DC-Boss_Explosions_Mappings
                dc.w    Offset_0x02D0E6-Boss_Explosions_Mappings
                dc.w    Offset_0x02D0F0-Boss_Explosions_Mappings
                dc.w    Offset_0x02D0FA-Boss_Explosions_Mappings
                dc.w    Offset_0x02D104-Boss_Explosions_Mappings
Offset_0x02D0C8:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x02D0D2:
                dc.w    $0001
                dc.l    $F00F0004, $0002FFF0
Offset_0x02D0DC:
                dc.w    $0001
                dc.l    $F00F0014, $000AFFF0
Offset_0x02D0E6:
                dc.w    $0001
                dc.l    $F00F0024, $0012FFF0
Offset_0x02D0F0:
                dc.w    $0001
                dc.l    $F00F0034, $001AFFF0
Offset_0x02D0FA:
                dc.w    $0001
                dc.l    $F00F0044, $0022FFF0
Offset_0x02D104:
                dc.w    $0001
                dc.l    $F00F0054, $002AFFF0
;===============================================================================
; Objeto 0x58 - Explosões dos chefes sendo derrotados
; [ Término ]
;===============================================================================  