;===============================================================================
; Objeto 0x6D - Harpões no chão na Metropolis
; [ Início ]
;===============================================================================  
Offset_0x027580:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02758E(PC, D0), D1
                jmp     Offset_0x02758E(PC, D1)
Offset_0x02758E:
                dc.w    Offset_0x027592-Offset_0x02758E
                dc.w    Offset_0x0275CE-Offset_0x02758E
Offset_0x027592:
                addq.b  #$02, $0024(A0)
                move.l  #Block_Harpon_Mappings, $0004(A0)      ; Offset_0x02753C
                move.w  #$241C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0019(A0)
                move.b  #$04, $0018(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  #$84, $0020(A0)
Offset_0x0275CE:
                bsr     Offset_0x0275EC
                moveq   #$00, D0
                move.b  $0034(A0), D0
                neg.w   D0
                add.w   $0032(A0), D0
                move.w  D0, $000C(A0)
                move.w  $0030(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x0275EC:
                tst.w   $003A(A0)
                beq.s   Offset_0x0275F8
                subq.w  #$01, $003A(A0)
                rts
Offset_0x0275F8:
                tst.w   $0038(A0)
                beq.s   Offset_0x027610
                move.b  ($FFFFFE05).w, D0
                sub.b   $0028(A0), D0
                andi.b  #$7F, D0
                bne.s   Offset_0x027652
                clr.w   $0038(A0)
Offset_0x027610:
                tst.w   $0036(A0)
                beq.s   Offset_0x027632
                subi.w  #$0400, $0034(A0)
                bcc.s   Offset_0x027652
                move.w  #$0000, $0034(A0)
                move.w  #$0000, $0036(A0)
                move.w  #$0001, $0038(A0)
                rts
Offset_0x027632:
                addi.w  #$0400, $0034(A0)
                cmpi.w  #$2000, $0034(A0)
                bcs.s   Offset_0x027652
                move.w  #$2000, $0034(A0)
                move.w  #$0001, $0036(A0)
                move.w  #$0003, $003A(A0)
Offset_0x027652:
                rts
;===============================================================================
; Objeto 0x6D - Harpões no chão na Metropolis
; [ Término ]
;===============================================================================  