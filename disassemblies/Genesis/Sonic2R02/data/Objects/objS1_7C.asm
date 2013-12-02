;=============================================================================== 
; Objeto 0x7C - Flash do anel gigante usado no Sonic 1 para acesso ao 
; [ Início ]    Special Stage não usado (Left over)
;===============================================================================  
Offset_0x01226A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x012278(PC, D0), D1
                jmp     Offset_0x012278(PC, D1)
Offset_0x012278:
                dc.w    Offset_0x01227E-Offset_0x012278
                dc.w    Offset_0x0122AC-Offset_0x012278
                dc.w    Offset_0x01231C-Offset_0x012278
Offset_0x01227E:
                addq.b  #$02, $0024(A0)
                move.l  #Big_Ring_Flash_Mappings, $0004(A0)    ; Offset_0x01248C
                move.w  #$2462, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$00, $0018(A0)
                move.b  #$20, $0019(A0)
                move.b  #$FF, $001A(A0)
Offset_0x0122AC:
                bsr.s   Offset_0x0122C6
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0122C6:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x01230C
                move.b  #$01, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$08, $001A(A0)
                bcc.s   Offset_0x01230E
                cmpi.b  #$03, $001A(A0)
                bne.s   Offset_0x01230C
                move.l  $003C(A0), A1
                move.b  #$06, $0024(A1)
                move.b  #$1C, ($FFFFB01C).w
                move.b  #$01, ($FFFFF7CD).w
                lea     ($FFFFB000).w, A1
                bclr    #$01, $002B(A1)
                bclr    #$00, $002B(A1)
Offset_0x01230C:
                rts
Offset_0x01230E:
                addq.b  #$02, $0024(A0)
                move.w  #$0000, ($FFFFB000).w
                addq.l  #$04, A7
                rts
Offset_0x01231C:
                bra     DeleteObject                           ; Offset_0x01646C
;=============================================================================== 
; Objeto 0x7C - Flash do anel gigante usado no Sonic 1 para acesso ao 
; [ Término ]   Special Stage não usado (Left over)
;===============================================================================  