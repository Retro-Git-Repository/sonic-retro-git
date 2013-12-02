;===============================================================================
; Objeto 0x5C - Piranha (Masher) na Emerald Hill
; [ Início ]
;===============================================================================    
Offset_0x02CF4C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02CF60(PC, D0), D1
                jsr     Offset_0x02CF60(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02CF60:
                dc.w    Offset_0x02CF64-Offset_0x02CF60
                dc.w    Offset_0x02CFA0-Offset_0x02CF60
Offset_0x02CF64:
                addq.b  #$02, $0024(A0)
                move.l  #Masher_Mappings, $0004(A0)            ; Offset_0x02D002
                move.w  #$0414, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$09, $0020(A0)
                move.b  #$10, $0019(A0)
                move.w  #$FC00, $0012(A0)
                move.w  $000C(A0), $0030(A0)
Offset_0x02CFA0:
                lea     (Masher_Animate_Data), A1              ; Offset_0x02CFF0
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                move.w  $0030(A0), D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x02CFCC
                move.w  D0, $000C(A0)
                move.w  #$FB00, $0012(A0)
Offset_0x02CFCC:
                move.b  #$01, $001C(A0)
                subi.w  #$00C0, D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x02CFEE
                move.b  #$00, $001C(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x02CFEE
                move.b  #$02, $001C(A0)
Offset_0x02CFEE:
                rts
;-------------------------------------------------------------------------------                   
Masher_Animate_Data: ; Offset_0x02CFF0:
                dc.w    Offset_0x02CFF6-Masher_Animate_Data
                dc.w    Offset_0x02CFFA-Masher_Animate_Data
                dc.w    Offset_0x02CFFE-Masher_Animate_Data
Offset_0x02CFF6:
                dc.b    $07, $00, $01, $FF
Offset_0x02CFFA:
                dc.b    $03, $00, $01, $FF
Offset_0x02CFFE:
                dc.b    $07, $00, $FF, $00
;-------------------------------------------------------------------------------
Masher_Mappings: ; Offset_0x02D002:
                dc.w    Offset_0x02D006-Masher_Mappings
                dc.w    Offset_0x02D020-Masher_Mappings
Offset_0x02D006:
                dc.w    $0003
                dc.l    $F0050000, $0000FFF4, $F0010004, $00020004
                dc.l    $0009000A, $0005FFF4
Offset_0x02D020:
                dc.w    $0003
                dc.l    $F0050000, $0000FFF4, $F0050006, $00030002
                dc.l    $00090010, $0008FFF4
;===============================================================================
; Objeto 0x5C - Piranha (Masher) na Emerald Hill
; [ Término ]
;===============================================================================  