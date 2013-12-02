;===============================================================================
; Objeto 0x7D - Bonus oculto no final das fases no Sonic 1 não usado no Sonic 2 
; [ Início ] 
;===============================================================================  
Offset_0x01F5A4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01F5B2(PC, D0), D1
                jmp     Offset_0x01F5B2(PC, D1)
Offset_0x01F5B2:
                dc.w    Offset_0x01F5B6-Offset_0x01F5B2
                dc.w    Offset_0x01F65C-Offset_0x01F5B2
Offset_0x01F5B6:
                moveq   #$10, D2
                move.w  D2, D3
                add.w   D3, D3
                lea     ($FFFFB000).w, A1
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                add.w   D2, D0
                cmp.w   D3, D0
                bcc.s   Offset_0x01F63A
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                add.w   D2, D1
                cmp.w   D3, D1
                bcc.s   Offset_0x01F63A
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x01F63A
                tst.b   ($FFFFF7CD).w
                bne.s   Offset_0x01F63A
                addq.b  #$02, $0024(A0)
                move.l  #Hidden_Bonus_Mappings, $0004(A0)      ; Offset_0x01F680
                move.w  #$84B6, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$00, $0018(A0)
                move.b  #$10, $0019(A0)
                move.b  $0028(A0), $001A(A0)
                move.w  #$0077, $0030(A0)
                move.w  #Hidden_Bonus_Sfx, D0   ; $00C9
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                moveq   #$00, D0
                move.b  $0028(A0), D0
                add.w   D0, D0
                move.w  Hidden_Bonus_Points(PC, D0), D0        ; Offset_0x01F654
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
Offset_0x01F63A:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x01F64E
                rts
Offset_0x01F64E:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------                 
Hidden_Bonus_Points: ; Offset_0x01F654:
                dc.w    $0000, $03E8, $0064, $0001
;-------------------------------------------------------------------------------  
Offset_0x01F65C:
                subq.w  #$01, $0030(A0)
                bmi.s   Offset_0x01F67A
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x01F67A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01F67A:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------   
Hidden_Bonus_Mappings: ; Offset_0x01F680:
                dc.w    Offset_0x01F688-Hidden_Bonus_Mappings
                dc.w    Offset_0x01F68A-Hidden_Bonus_Mappings
                dc.w    Offset_0x01F694-Hidden_Bonus_Mappings
                dc.w    Offset_0x01F69E-Hidden_Bonus_Mappings
Offset_0x01F688:
                dc.w    $0000
Offset_0x01F68A:
                dc.w    $0001
                dc.l    $F40E0000, $0000FFF0
Offset_0x01F694:
                dc.w    $0001
                dc.l    $F40E000C, $0006FFF0
Offset_0x01F69E:
                dc.w    $0001
                dc.l    $F40E0018, $000CFFF0
;===============================================================================
; Objeto 0x7D - Bonus oculto no final das fases no Sonic 1 não usado no Sonic 2
; [ Término ] 
;===============================================================================  