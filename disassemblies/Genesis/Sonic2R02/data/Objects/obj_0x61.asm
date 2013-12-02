;===============================================================================
; Objeto 0x61 - Bombas no Special Stage
; [ Início ]
;===============================================================================  
Offset_0x0348F6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x034904(PC, D0), D1
                jmp     Offset_0x034904(PC, D1)
Offset_0x034904:
                dc.w    Offset_0x03490C-Offset_0x034904
                dc.w    Offset_0x03494C-Offset_0x034904
                dc.w    Offset_0x034D8C-Offset_0x034904
                dc.w    Offset_0x0349B0-Offset_0x034904
Offset_0x03490C:
                addq.b  #$02, $0024(A0)
                move.w  #$007F, $0008(A0)
                move.w  #$0058, $000C(A0)
                move.l  #SS_Bombs_Mappings, $0004(A0)          ; Offset_0x035F60
                move.w  #$238A, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$02, $0020(A0)
                move.b  #$FF, ($FFFFDB4D).w
                tst.b   $0026(A0)
                bmi.s   Offset_0x03494C
                bsr     Offset_0x034CEC
Offset_0x03494C:
                bsr     Offset_0x034B74
                bsr     Offset_0x034BEC
                lea     (SS_Bombs_Animate_Data), A1            ; Offset_0x035F1C
                bsr     SS_AnimateSprite                       ; Offset_0x034DF0
                tst.b   $0001(A0)
                bpl.s   Offset_0x03496C
                bsr     Offset_0x03496E
                bra     J_DisplaySprite_01                     ; Offset_0x036014
Offset_0x03496C:
                rts
Offset_0x03496E:
                move.w  #$0008, D6
                bsr     Offset_0x034AEA
                bcc.s   Offset_0x0349AE
                move.b  #$01, $0021(A1)
                move.w  #Break_Wall_Sfx, D0     ; $00CB
                jsr     (Play_Sfx_Stereo)                      ; Offset_0x001332
                move.b  #$06, $0024(A0)
                move.b  #$00, $001B(A0)
                move.b  #$00, $001E(A0)
                move.l  $0034(A0), D0
                beq.s   Offset_0x0349AE
                move.l  #$00000000, $0034(A0)
                move.l  D0, A1
                st      $002A(A1)
Offset_0x0349AE:
                rts
Offset_0x0349B0:
                move.b  #$0A, $001C(A0)
                move.w  #$42B5, $0002(A0)
                bsr     Offset_0x0349D8
                bsr     Offset_0x034B74
                bsr     Offset_0x034BEC
                lea     (SS_Bombs_Animate_Data), A1            ; Offset_0x035F1C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     J_DisplaySprite_01                     ; Offset_0x036014              
;===============================================================================
; Objeto 0x61 - Bombas no Special Stage
; [ Término ]
;===============================================================================  