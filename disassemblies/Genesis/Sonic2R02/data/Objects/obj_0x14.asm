;===============================================================================
; Objeto 0x14 - Inimigo gangorra na Hill Top
; [ Início ]
;===============================================================================      
Offset_0x021854:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02186C(PC, D0), D1
                jsr     Offset_0x02186C(PC, D1)
                move.w  $0030(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x02186C:
                dc.w    Offset_0x021878-Offset_0x02186C
                dc.w    Offset_0x0218EA-Offset_0x02186C
                dc.w    Offset_0x0219A6-Offset_0x02186C
                dc.w    Offset_0x0219D4-Offset_0x02186C
                dc.w    Offset_0x021A30-Offset_0x02186C
                dc.w    Offset_0x021AC8-Offset_0x02186C
Offset_0x021878:
                addq.b  #$02, $0024(A0)
                move.l  #See_Saw_Mappings, $0004(A0)           ; Offset_0x021C2A
                move.w  #$03C6, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$30, $0019(A0)
                move.w  $0008(A0), $0030(A0)
                tst.b   $0028(A0)
                bne.s   Offset_0x0218D6
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0218D6
                move.b  #$14, $0000(A1)    ; Nova instância do objeto na memória
                addq.b  #$06, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  $0022(A0), $0022(A1)
                move.l  A0, $003C(A1)
Offset_0x0218D6:
                btst    #$00, $0022(A0)
                beq.s   Offset_0x0218E4
                move.b  #$02, $001A(A0)
Offset_0x0218E4:
                move.b  $001A(A0), $003A(A0)
Offset_0x0218EA:
                move.b  $003A(A0), D1
                btst    #$03, $0022(A0)
                beq.s   Offset_0x021944
                moveq   #$02, D1
                lea     ($FFFFB000).w, A1
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x02190A
                neg.w   D0
                moveq   #$00, D1
Offset_0x02190A:
                cmpi.w  #$0008, D0
                bcc.s   Offset_0x021912
                moveq   #$01, D1
Offset_0x021912:
                btst    #$04, $0022(A0)
                beq.s   Offset_0x02197C
                moveq   #$02, D2
                lea     ($FFFFB040).w, A1
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x02192E
                neg.w   D0
                moveq   #$00, D2
Offset_0x02192E:
                cmpi.w  #$0008, D0
                bcc.s   Offset_0x021936
                moveq   #$01, D2
Offset_0x021936:
                add.w   D2, D1
                cmpi.w  #$0003, D1
                bne.s   Offset_0x021940
                addq.w  #$01, D1
Offset_0x021940:
                lsr.w   #$01, D1
                bra.s   Offset_0x02197C
Offset_0x021944:
                btst    #$04, $0022(A0)
                beq.s   Offset_0x02196A
                moveq   #$02, D1
                lea     ($FFFFB040).w, A1
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x021960
                neg.w   D0
                moveq   #$00, D1
Offset_0x021960:
                cmpi.w  #$0008, D0
                bcc.s   Offset_0x02197C
                moveq   #$01, D1
                bra.s   Offset_0x02197C
Offset_0x02196A:
                move.w  ($FFFFB012).w, D0
                move.w  ($FFFFB052).w, D2
                cmp.w   D0, D2
                blt.s   Offset_0x021978
                move.w  D2, D0
Offset_0x021978:
                move.w  D0, $0038(A0)
Offset_0x02197C:
                bsr     Offset_0x0219A8
                lea     (Offset_0x021BC8), A2
                btst    #$00, $001A(A0)
                beq.s   Offset_0x021994
                lea     (Offset_0x021BFA), A2
Offset_0x021994:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$08, D3
                move.w  (A7)+, D4
                bra     Platform_Object_2                      ; Offset_0x019BF8
Offset_0x0219A6:
                rts
Offset_0x0219A8:
                move.b  $001A(A0), D0
                cmp.b   D1, D0
                beq.s   Offset_0x0219D2
                bcc.s   Offset_0x0219B4
                addq.b  #$02, D0
Offset_0x0219B4:
                subq.b  #$01, D0
                move.b  D0, $001A(A0)
                move.b  D1, $003A(A0)
                bclr    #$00, $0001(A0)
                btst    #$01, $001A(A0)
                beq.s   Offset_0x0219D2
                bset    #$00, $0001(A0)
Offset_0x0219D2:
                rts
Offset_0x0219D4:
                addq.b  #$02, $0024(A0)
                move.l  #Sew_Saw_Badnick_Mappings, $0004(A0)   ; Offset_0x021CB6
                move.w  #$03DE, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$8B, $0020(A0)
                move.b  #$0C, $0019(A0)
                move.w  $0008(A0), $0030(A0)
                addi.w  #$0028, $0008(A0)
                addi.w  #$0010, $000C(A0)
                move.w  $000C(A0), $0034(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x021A30
                subi.w  #$0050, $0008(A0)
                move.b  #$02, $003A(A0)
Offset_0x021A30:
                bsr     Offset_0x021BA0
                move.l  $003C(A0), A1
                moveq   #$00, D0
                move.b  $003A(A0), D0
                sub.b   $003A(A1), D0
                beq.s   Offset_0x021A8A
                bcc.s   Offset_0x021A48
                neg.b   D0
Offset_0x021A48:
                move.w  #$F7E8, D1
                move.w  #$FEEC, D2
                cmpi.b  #$01, D0
                beq.s   Offset_0x021A6E
                move.w  #$F510, D1
                move.w  #$FF34, D2
                cmpi.w  #$0A00, $0038(A1)
                blt.s   Offset_0x021A6E
                move.w  #$F200, D1
                move.w  #$FF60, D2
Offset_0x021A6E:
                move.w  D1, $0012(A0)
                move.w  D2, $0010(A0)
                move.w  $0008(A0), D0
                sub.w   $0030(A0), D0
                bcc.s   Offset_0x021A84
                neg.w   $0010(A0)
Offset_0x021A84:
                addq.b  #$02, $0024(A0)
                bra.s   Offset_0x021AC8
Offset_0x021A8A:
                lea     (Offset_0x021B96), A2
                moveq   #$00, D0
                move.b  $001A(A1), D0
                move.w  #$0028, D2
                move.w  $0008(A0), D1
                sub.w   $0030(A0), D1
                bcc.s   Offset_0x021AA8
                neg.w   D2
                addq.w  #$02, D0
Offset_0x021AA8:
                add.w   D0, D0
                move.w  $0034(A0), D1
                add.w   $00(A2, D0), D1
                move.w  D1, $000C(A0)
                add.w   $0030(A0), D2
                move.w  D2, $0008(A0)
                clr.w   $000E(A0)
                clr.w   $000A(A0)
                rts
Offset_0x021AC8:
                bsr     Offset_0x021BA0
                tst.w   $0012(A0)
                bpl.s   Offset_0x021AEE
                jsr     (ObjectFall)                           ; Offset_0x016306
                move.w  $0034(A0), D0
                subi.w  #$002F, D0
                cmp.w   $000C(A0), D0
                bgt.s   Offset_0x021AEC
                jsr     (ObjectFall)                           ; Offset_0x016306
Offset_0x021AEC:
                rts
Offset_0x021AEE:
                jsr     (ObjectFall)                           ; Offset_0x016306
                move.l  $003C(A0), A1
                lea     (Offset_0x021B96), A2
                moveq   #$00, D0
                move.b  $001A(A1), D0
                move.w  $0008(A0), D1
                sub.w   $0030(A0), D1
                bcc.s   Offset_0x021B10
                addq.w  #$02, D0
Offset_0x021B10:
                add.w   D0, D0
                move.w  $0034(A0), D1
                add.w   $00(A2, D0), D1
                cmp.w   $000C(A0), D1
                bgt.s   Offset_0x021B64
                move.l  $003C(A0), A1
                moveq   #$02, D1
                tst.w   $0010(A0)
                bmi.s   Offset_0x021B2E
                moveq   #$00, D1
Offset_0x021B2E:
                move.b  D1, $003A(A1)
                move.b  D1, $003A(A0)
                cmp.b   $001A(A1), D1
                beq.s   Offset_0x021B58
                lea     ($FFFFB000).w, A2
                bclr    #$03, $0022(A1)
                beq.s   Offset_0x021B4A
                bsr.s   Offset_0x021B66
Offset_0x021B4A:
                lea     ($FFFFB040).w, A2
                bclr    #$04, $0022(A1)
                beq.s   Offset_0x021B58
                bsr.s   Offset_0x021B66
Offset_0x021B58:
                clr.w   $0010(A0)
                clr.w   $0012(A0)
                subq.b  #$02, $0024(A0)
Offset_0x021B64:
                rts
Offset_0x021B66:
                move.w  $0012(A0), $0012(A2)
                neg.w   $0012(A2)
                bset    #$01, $0022(A2)
                bclr    #$03, $0022(A2)
                clr.b   $003C(A2)
                move.b  #$10, $001C(A2)
                move.b  #$02, $0024(A2)
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------   
Offset_0x021B96:
                dc.w    $FFF8, $FFE4, $FFD1, $FFE4, $FFF8
;-------------------------------------------------------------------------------   
Offset_0x021BA0:
                move.b  ($FFFFFE05).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x021BB0
                bchg    #05, $0002(A0)
Offset_0x021BB0:
                andi.b  #$FE, $0001(A0)
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                bcs.s   Offset_0x021BC6
                ori.b   #$01, $0001(A0)
Offset_0x021BC6:
                rts
;-------------------------------------------------------------------------------                   
Offset_0x021BC8:
                dc.b    $14, $14, $16, $18, $1A, $1C, $1A, $18, $16, $14, $13, $12, $11, $10, $0F, $0E
                dc.b    $0D, $0C, $0B, $0A, $09, $08, $07, $06, $05, $04, $03, $02, $01, $00, $FF, $FE
                dc.b    $FD, $FC, $FB, $FA, $F9, $F8, $F7, $F6, $F5, $F4, $F3, $F2, $F2, $F2, $F2, $F2
                dc.b    $F2, $00
;-------------------------------------------------------------------------------                   
Offset_0x021BFA:
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
;-------------------------------------------------------------------------------  
See_Saw_Mappings: ; Offset_0x021C2A:
                dc.w    Offset_0x021C32-See_Saw_Mappings
                dc.w    Offset_0x021C74-See_Saw_Mappings
                dc.w    Offset_0x021C32-See_Saw_Mappings
                dc.w    Offset_0x021C74-See_Saw_Mappings
Offset_0x021C32:
                dc.w    $0008
                dc.l    $FC054014, $400AFFF8, $0C012012, $2009FFFC
                dc.l    $E4054006, $4003FFD0, $EC05400A, $4005FFE0
                dc.l    $F405400A, $4005FFF0, $FC05400A, $40050000
                dc.l    $0405400A, $40050010, $0C05400E, $40070020
Offset_0x021C74:
                dc.w    $0008
                dc.l    $FC054014, $400AFFF8, $0C012012, $2009FFFC
                dc.l    $F4054000, $4000FFD0, $F4054002, $4001FFE0
                dc.l    $F4054002, $4001FFF0, $F4054002, $40010000
                dc.l    $F4054002, $40010010, $F4054800, $48000020
;-------------------------------------------------------------------------------
Sew_Saw_Badnick_Mappings: ; Offset_0x021CB6:
                dc.w    Offset_0x021CBA-Sew_Saw_Badnick_Mappings
                dc.w    Offset_0x021CC4-Sew_Saw_Badnick_Mappings
Offset_0x021CBA:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x021CC4:
                dc.w    $0001
                dc.l    $F8052000, $2000FFF8                
;===============================================================================
; Objeto 0x14 - Inimigo gangorra na Hill Top
; [ Término ]
;===============================================================================  