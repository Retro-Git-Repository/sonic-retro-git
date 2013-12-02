;===============================================================================
; Objeto 0x8F -> Parede que oculta o Grounder na Aquatic Ruin
; [ Início ]     carregado a partir do objeto 0x8D / 0x8E
;===============================================================================  
Offset_0x0365C4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0365D2(PC, D0), D1
                jmp     Offset_0x0365D2(PC, D1)
Offset_0x0365D2:
                dc.w    Offset_0x0365D8-Offset_0x0365D2
                dc.w    Offset_0x0365E2-Offset_0x0365D2
                dc.w    Offset_0x03665E-Offset_0x0365D2
Offset_0x0365D8:
                bsr     ObjectSettings                         ; Offset_0x03601A
                clr.w   $0002(A0)
                rts
Offset_0x0365E2:
                move.w  $002C(A0), A1
                tst.b   $002B(A1)
                bne.s   Offset_0x0365F2
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0365F2:
                addq.b  #$02, $0024(A0)
                move.w  $002E(A0), D0
                move.b  Offset_0x03660C(PC, D0), $0010(A0)
                move.b  Offset_0x03660C+$01(PC, D0), $0012(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03660C:
                dc.b    $01, $FE, $01, $FF, $FF, $FE, $FF, $FF  
;===============================================================================
; Objeto 0x8F -> Parede que oculta o Grounder na Aquatic Ruin
; [ Término ]    carregado a partir do objeto 0x8D / 0x8E
;===============================================================================
