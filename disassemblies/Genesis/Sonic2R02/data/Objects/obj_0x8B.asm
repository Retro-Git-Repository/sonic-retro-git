;===============================================================================
; Objeto 0x8B - Muda a paleta entre as turbinas e escadas na Wing Fortress
; [ Início ]
;===============================================================================    
Offset_0x0212D6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0212EA(PC, D0), D1
                jsr     Offset_0x0212EA(PC, D1)
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x0212EA:
                dc.w    Offset_0x0212F6-Offset_0x0212EA
                dc.w    Offset_0x021358-Offset_0x0212EA
Offset_0x0212EE:
                dc.w    $0020, $0040, $0080, $0100
Offset_0x0212F6:
                addq.b  #$02, $0024(A0)
                move.l  #Layer_Switch_Mappings, $0004(A0)      ; Offset_0x01FF16
                move.w  #$06BC, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$05, $0018(A0)
                move.b  $0028(A0), D0
                andi.w  #$0003, D0
                move.b  D0, $001A(A0)
                add.w   D0, D0
                move.w  Offset_0x0212EE(PC, D0), $0032(A0)
                move.w  $0008(A0), D1
                lea     ($FFFFB000).w, A1
                cmp.w   $0008(A1), D1
                bcc.s   Offset_0x021348
                move.b  #$01, $0034(A0)
Offset_0x021348:
                lea     ($FFFFB040).w, A1
                cmp.w   $0008(A1), D1
                bcc.s   Offset_0x021358
                move.b  #$01, $0035(A0)
Offset_0x021358:
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x0213B0
                move.w  $0008(A0), D1
                lea     $0034(A0), A2
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x021370
                lea     ($FFFFB040).w, A1
Offset_0x021370:
                tst.b   (A2)+
                bne.s   Offset_0x0213B2
                cmp.w   $0008(A1), D1
                bhi.s   Offset_0x0213B0
                move.b  #$01, $FFFF(A2)
                move.w  $000C(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs.s   Offset_0x0213B0
                cmp.w   D3, D4
                bcc.s   Offset_0x0213B0
                btst    #$00, $0001(A0)
                bne.s   Offset_0x0213AA
                move.b  #$01, ($FFFFF72E).w
                rts
Offset_0x0213AA:
                move.b  #$00, ($FFFFF72E).w
Offset_0x0213B0:
                rts
Offset_0x0213B2:
                cmp.w   $0008(A1), D1
                bls.s   Offset_0x0213B0
                move.b  #$00, $FFFF(A2)
                move.w  $000C(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs.s   Offset_0x0213B0
                cmp.w   D3, D4
                bcc.s   Offset_0x0213B0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x0213E8
                move.b  #$01, ($FFFFF72E).w
                rts
Offset_0x0213E8:
                move.b  #$00, ($FFFFF72E).w
                rts                                    
;===============================================================================
; Objeto 0x8B - Muda a paleta entre as turbinas e escadas na Wing Fortress
; [ Término ]
;===============================================================================