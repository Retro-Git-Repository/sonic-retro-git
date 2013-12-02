;=============================================================================== 
; Objeto 0x4B - Anel gigante usado no Sonic 1 para acesso ao Special Stage 
; [ Início ]    não usado (Left over)
;===============================================================================  
Offset_0x0121A6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0121B4(PC, D0), D1
                jmp     Offset_0x0121B4(PC, D1)
Offset_0x0121B4:
                dc.w    Offset_0x0121BC-Offset_0x0121B4
                dc.w    Offset_0x01220A-Offset_0x0121B4
                dc.w    Offset_0x012228-Offset_0x0121B4
                dc.w    Offset_0x012266-Offset_0x0121B4
Offset_0x0121BC:
                move.l  #Big_Ring_Mappings, $0004(A0)          ; Offset_0x01238C
                move.w  #$2400, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$40, $0019(A0)
                tst.b   $0001(A0)
                bpl.s   Offset_0x01220A
                cmpi.b  #$06, ($FFFFFF90).w
                beq     Offset_0x012266
                cmpi.w  #$0032, ($FFFFFE20).w
                bcc.s   Offset_0x0121F4
                rts
Offset_0x0121F4:
                addq.b  #$02, $0024(A0)
                move.b  #$02, $0018(A0)
                move.b  #$52, $0020(A0)
                move.w  #$0C40, ($FFFFF7BE).w
Offset_0x01220A:
                move.b  ($FFFFFEA3).w, $001A(A0)
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012228:
                subq.b  #$02, $0024(A0)
                move.b  #$00, $0020(A0)
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne     Offset_0x01225A
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  A0, $003C(A1)
                move.w  ($FFFFB008).w, D0
                cmp.w   $0008(A0), D0
                bcs.s   Offset_0x01225A
                bset    #$00, $0001(A1)
Offset_0x01225A:
                move.w  #$00C3, D0
                jsr     (Play_Sfx_Stereo)                      ; Offset_0x001332
                bra.s   Offset_0x01220A
Offset_0x012266:
                bra     DeleteObject                           ; Offset_0x01646C
;=============================================================================== 
; Objeto 0x4B - Anel gigante usado no Sonic 1 para acesso ao Special Stage   
; [ Término ]   não usado (Left over)
;===============================================================================   