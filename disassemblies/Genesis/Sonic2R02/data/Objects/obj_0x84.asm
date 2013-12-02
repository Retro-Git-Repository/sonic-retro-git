;===============================================================================
; Objeto 0x84 - Auto Spin - Hill Top, Hidden Palace, Casino Night
; [ Início ]
;===============================================================================   
Offset_0x02109E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0210B2(PC, D0), D1
                jsr     Offset_0x0210B2(PC, D1)
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x0210B2:
                dc.w    Offset_0x0210B8-Offset_0x0210B2
                dc.w    Offset_0x021168-Offset_0x0210B2
                dc.w    Offset_0x02123A-Offset_0x0210B2
Offset_0x0210B8:
                addq.b  #$02, $0024(A0)
                move.l  #Layer_Switch_Mappings, $0004(A0)      ; Offset_0x01FF16
                move.w  #$06BC, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$05, $0018(A0)
                move.b  $0028(A0), D0
                btst    #$02, D0
                beq.s   Offset_0x021134
                addq.b  #$02, $0024(A0)
                andi.w  #$0007, D0
                move.b  D0, $001A(A0)
                andi.w  #$0003, D0
                add.w   D0, D0
                move.w  Offset_0x02112C(PC, D0), $0032(A0)
                move.w  $000C(A0), D1
                lea     ($FFFFB000).w, A1
                cmp.w   $000C(A1), D1
                bcc.s   Offset_0x021118
                move.b  #$01, $0034(A0)
Offset_0x021118:
                lea     ($FFFFB040).w, A1
                cmp.w   $000C(A1), D1
                bcc.s   Offset_0x021128
                move.b  #$01, $0035(A0)
Offset_0x021128:
                bra     Offset_0x02123A
Offset_0x02112C:
                dc.w    $0020, $0040, $0080, $0100
Offset_0x021134:
                andi.w  #$0003, D0
                move.b  D0, $001A(A0)
                add.w   D0, D0
                move.w  Offset_0x02112C(PC, D0), $0032(A0)
                move.w  $0008(A0), D1
                lea     ($FFFFB000).w, A1
                cmp.w   $0008(A1), D1
                bcc.s   Offset_0x021158
                move.b  #$01, $0034(A0)
Offset_0x021158:
                lea     ($FFFFB040).w, A1
                cmp.w   $0008(A1), D1
                bcc.s   Offset_0x021168
                move.b  #$01, $0035(A0)
Offset_0x021168:
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x0211C8
                move.w  $0008(A0), D1
                lea     $0034(A0), A2
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x021188
                lea     ($FFFFB040).w, A1
                cmpi.w  #$0004, ($FFFFF708).w
                beq.s   Offset_0x0211C8
Offset_0x021188:
                tst.b   (A2)+
                bne.s   Offset_0x0211CA
                cmp.w   $0008(A1), D1
                bhi.s   Offset_0x0211C8
                move.b  #$01, $FFFF(A2)
                move.w  $000C(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs.s   Offset_0x0211C8
                cmp.w   D3, D4
                bcc.s   Offset_0x0211C8
                btst    #$00, $0001(A0)
                bne.s   Offset_0x0211C2
                move.b  #$01, $0039(A1)
                bra.s   Offset_0x021208
Offset_0x0211C2:
                move.b  #$00, $0039(A1)
Offset_0x0211C8:
                rts
Offset_0x0211CA:
                cmp.w   $0008(A1), D1
                bls.s   Offset_0x0211C8
                move.b  #$00, $FFFF(A2)
                move.w  $000C(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs.s   Offset_0x0211C8
                cmp.w   D3, D4
                bcc.s   Offset_0x0211C8
                btst    #$00, $0001(A0)
                beq.s   Offset_0x021200
                move.b  #$01, $0039(A1)
                bra.s   Offset_0x021208
Offset_0x021200:
                move.b  #$00, $0039(A1)
                rts
Offset_0x021208:  ; Usado também pelo Objeto 0x02 - Miles
                btst    #$02, $0022(A1)
                beq.s   Offset_0x021212
                rts
Offset_0x021212:
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                addq.w  #$05, $000C(A1)
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                rts
Offset_0x02123A:
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x021294
                move.w  $000C(A0), D1
                lea     $0034(A0), A2
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x021252
                lea     ($FFFFB040).w, A1
Offset_0x021252:
                tst.b   (A2)+
                bne.s   Offset_0x021296
                cmp.w   $000C(A1), D1
                bhi.s   Offset_0x021294
                move.b  #$01, $FFFF(A2)
                move.w  $0008(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $0008(A1), D4
                cmp.w   D2, D4
                bcs.s   Offset_0x021294
                cmp.w   D3, D4
                bcc.s   Offset_0x021294
                btst    #$00, $0001(A0)
                bne.s   Offset_0x02128E
                move.b  #$01, $0039(A1)
                bra     Offset_0x021208
Offset_0x02128E:
                move.b  #$00, $0039(A1)
Offset_0x021294:
                rts
Offset_0x021296:
                cmp.w   $000C(A1), D1
                bls.s   Offset_0x021294
                move.b  #$00, $FFFF(A2)
                move.w  $0008(A0), D2
                move.w  D2, D3
                move.w  $0032(A0), D4
                sub.w   D4, D2
                add.w   D4, D3
                move.w  $0008(A1), D4
                cmp.w   D2, D4
                bcs.s   Offset_0x021294
                cmp.w   D3, D4
                bcc.s   Offset_0x021294
                btst    #$00, $0001(A0)
                beq.s   Offset_0x0212CE
                move.b  #$01, $0039(A1)
                bra     Offset_0x021208
Offset_0x0212CE:
                move.b  #$00, $0039(A1)
                rts                          
;===============================================================================
; Objeto 0x84 - Auto Spin - Hill Top, Hidden Palace, Casino Night
; [ Término ]
;===============================================================================