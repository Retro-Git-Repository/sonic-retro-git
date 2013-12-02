;===============================================================================
; Objeto 0x3E - Container de animais nas fases que contém chefe
; [ Início ]
;===============================================================================      
Offset_0x03EF50:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03EF5E(PC, D0), D1
                jmp     Offset_0x03EF5E(PC, D1)
Offset_0x03EF5E:
                dc.w    Offset_0x03EF7E-Offset_0x03EF5E
                dc.w    Offset_0x03EFE6-Offset_0x03EF5E
                dc.w    Offset_0x03F0C2-Offset_0x03EF5E
                dc.w    Offset_0x03F0FC-Offset_0x03EF5E
                dc.w    Offset_0x03F11C-Offset_0x03EF5E
                dc.w    Offset_0x03F17A-Offset_0x03EF5E
Offset_0x03EF6A:
                dc.b    $00, $02, $20, $04, $00, $28, $04, $10, $05, $04, $18, $06, $08, $03, $05, $00
                dc.b    $08, $20, $04, $00
Offset_0x03EF7E:
                move.l  A0, A1
                lea     $0038(A0), A3
                lea     Offset_0x03EF6A(PC), A2
                moveq   #$03, D1
                bra.s   Offset_0x03EF96
Offset_0x03EF8C:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03EFE0
                move.w  A1, (A3)+
Offset_0x03EF96:
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $000C(A0), $0030(A1)
                move.l  #Egg_Prison_Mappings, $0004(A1)        ; Offset_0x03F1AC
                move.w  #$2680, $0002(A1)
                move.b  #$84, $0001(A1)
                moveq   #$00, D0
                move.b  (A2)+, D0
                sub.w   D0, $000C(A1)
                move.w  $000C(A1), $0030(A1)
                move.b  (A2)+, $0024(A1)
                move.b  (A2)+, $0019(A1)
                move.b  (A2)+, $0018(A1)
                move.b  (A2)+, $001A(A1)
Offset_0x03EFE0:
                dbra    D1, Offset_0x03EF8C
                rts
Offset_0x03EFE6:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03F01C(PC, D0), D1
                jsr     Offset_0x03F01C(PC, D1)
                move.w  #$002B, D1
                move.w  #$0018, D2
                move.w  #$0018, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                lea     (Egg_Prison_Animate_Data), A1          ; Offset_0x03F19C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03F01C:
                dc.w    Offset_0x03F022-Offset_0x03F01C
                dc.w    Offset_0x03F06A-Offset_0x03F01C
                dc.w    Offset_0x03F0C0-Offset_0x03F01C
Offset_0x03F022:
                move.w  $0038(A0), A1
                tst.w   $0032(A1)
                beq.s   Offset_0x03F068
                move.w  $003A(A0), A2
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03F04E
                move.b  #$27, $0000(A1)
                addq.b  #$02, $0024(A1)
                move.w  $0008(A2), $0008(A1)
                move.w  $000C(A2), $000C(A1)
Offset_0x03F04E:
                move.w  #$FC00, $0012(A2)
                move.w  #$0800, $0010(A2)
                addq.b  #$02, $0025(A2)
                move.w  #$001D, $0034(A0)
                addq.b  #$02, $0025(A0)
Offset_0x03F068:
                rts
Offset_0x03F06A:
                subq.w  #$01, $0034(A0)
                bpl.s   Offset_0x03F0C0
                move.b  #$01, $001C(A0)
                moveq   #$07, D6
                move.w  #$009A, D5
                moveq   #$FFFFFFE4, D4
Offset_0x03F07E:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03F0AE
                move.b  #$28, $0000(A1)       ; Carrega o objeto 0x28 - Flickies
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                add.w   D4, $0008(A1)
                move.b  #$01, $0038(A1)
                addq.w  #$07, D4
                move.w  D5, $0036(A1)
                subq.w  #$08, D5
                dbra    D6, Offset_0x03F07E
Offset_0x03F0AE:
                move.w  $003C(A0), A2
                move.w  #$00B4, $001E(A2)
                addq.b  #$02, $0025(A2)
                addq.b  #$02, $0025(A0)
Offset_0x03F0C0:
                rts
Offset_0x03F0C2:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  $0030(A0), $000C(A0)
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x03F0F6
                addq.w  #$08, $000C(A0)
                clr.b   ($FFFFFE1E).w
                move.w  #$0001, $0032(A0)
Offset_0x03F0F6:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03F0FC:
                tst.b   $0025(A0)
                beq.s   Offset_0x03F110
                tst.b   $0001(A0)
                bpl     Offset_0x03F116
                jsr     (ObjectFall)                           ; Offset_0x016306
Offset_0x03F110:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03F116:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x03F11C:
                tst.b   $0025(A0)
                beq.s   Offset_0x03F178
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$07, D0
                bne.s   Offset_0x03F168
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03F168
                move.b  #$28, $0000(A1)       ; Carrega o objeto 0x28 - Flickies
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$001F, D0
                subq.w  #$06, D0
                tst.w   D1
                bpl.s   Offset_0x03F158
                neg.w   D0
Offset_0x03F158:
                add.w   D0, $0008(A1)
                move.b  #$01, $0038(A1)
                move.w  #$000C, $0036(A1)
Offset_0x03F168:
                subq.w  #$01, $001E(A0)
                bne.s   Offset_0x03F178
                addq.b  #$02, $0024(A0)
                move.w  #$00B4, $001E(A0)
Offset_0x03F178:
                rts
Offset_0x03F17A:
                moveq   #$6F, D0
                moveq   #$28, D1
                lea     ($FFFFB400).w, A1
Offset_0x03F182:
                cmp.b   (A1), D1
                beq.s   Offset_0x03F19A
                lea     $0040(A1), A1
                dbra    D0, Offset_0x03F182
                jsr     (Load_Level_Results)                   ; Offset_0x0193C0
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x03F19A:
                rts
;-------------------------------------------------------------------------------
Egg_Prison_Animate_Data: ; Offset_0x03F19C:
                dc.w    Offset_0x03F1A0-Egg_Prison_Animate_Data
                dc.w    Offset_0x03F1A4-Egg_Prison_Animate_Data
Offset_0x03F1A0:
                dc.b    $0F, $00, $FF, $00
Offset_0x03F1A4:
                dc.b    $03, $00, $01, $02, $03, $FE, $01, $00
;-------------------------------------------------------------------------------                 
Egg_Prison_Mappings: ; Offset_0x03F1AC:
                dc.w    Offset_0x03F1B8-Egg_Prison_Mappings
                dc.w    Offset_0x03F1F2-Egg_Prison_Mappings
                dc.w    Offset_0x03F234-Egg_Prison_Mappings
                dc.w    Offset_0x03F276-Egg_Prison_Mappings
                dc.w    Offset_0x03F2A0-Egg_Prison_Mappings
                dc.w    Offset_0x03F2B2-Egg_Prison_Mappings
Offset_0x03F1B8:
                dc.w    $0007
                dc.l    $E00D0000, $0000FFE0, $E00D0800, $08000000
                dc.l    $F00A0008, $0004FFE0, $F0060011, $0008FFF8
                dc.l    $F00A0808, $08040008, $080E0017, $000BFFE0
                dc.l    $080E0817, $080B0000
Offset_0x03F1F2:
                dc.w    $0007
                dc.l    $E00D0000, $0000FFE0, $E00D0800, $08000000
                dc.l    $080E0017, $000BFFE0, $080E0817, $080B0000
                dc.l    $E8060011, $0008FFF8, $F80A0008, $0004FFE0
                dc.l    $F80A0808, $08040008
                
                dc.l    $F0060023, $0011FFF8              ; Mapeamento não usado   
Offset_0x03F234:
                dc.w    $0007
                dc.l    $E00D0000, $0000FFE0, $E00D0800, $08000000
                dc.l    $080E0017, $000BFFE0, $080E0817, $080B0000
                dc.l    $E0060011, $0008FFF8, $000A0008, $0004FFE0
                dc.l    $000A0808, $08040008
                
                dc.l    $F0060023, $0011FFF8              ; Mapeamento não usado   
Offset_0x03F276:
                dc.w    $0005
                dc.l    $E00D0000, $0000FFE0, $E00D0800, $08000000
                dc.l    $F0060023, $0011FFF8, $080E0017, $000BFFE0
                dc.l    $080E0817, $080B0000
Offset_0x03F2A0:
                dc.w    $0002
                dc.l    $F8050029, $0014FFF0, $F8050829, $08140000
Offset_0x03F2B2:
                dc.w    $0001
                dc.l    $F805002D, $0016FFF8
;===============================================================================
; Objeto 0x3E - Container de animais nas fases que contém chefe
; [ Término ]
;===============================================================================  