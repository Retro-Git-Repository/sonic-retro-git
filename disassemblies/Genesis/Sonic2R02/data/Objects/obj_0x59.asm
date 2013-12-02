;===============================================================================
; Objeto 0x59 - Checa pelo fim do Special Stage e pode lhe dar uma Esmeralda.
; [ Início ]    Sem este objeto o Special Stage executa infinitamente.
;===============================================================================          
Offset_0x035A0A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x035A18(PC, D0), D1
                jmp     Offset_0x035A18(PC, D1)
Offset_0x035A18:
                dc.w    Offset_0x035A22-Offset_0x035A18
                dc.w    Offset_0x035A6E-Offset_0x035A18
                dc.w    Offset_0x034D8C-Offset_0x035A18
                dc.w    Offset_0x035BAC-Offset_0x035A18
                dc.w    Offset_0x035BBC-Offset_0x035A18
Offset_0x035A22:
                st      ($FFFFDBA0).w
                st      ($FFFFDB87).w
                subq.w  #$01, $002A(A0)
                cmpi.w  #$FFC4, $002A(A0)
                beq.s   Offset_0x035A38
                rts
Offset_0x035A38:
                moveq   #$00, D0
                move.b  ($FFFFFE16).w, D0
                bsr.s   Offset_0x0359C4
                addq.b  #$02, $0024(A0)
                move.l  #SS_Got_Emerald_Map, $0004(A0)         ; Offset_0x035CA8
                move.w  #$6174, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.w  #$0036, $0030(A0)
                move.b  #$40, $0026(A0)
                bsr     Offset_0x034CEC
Offset_0x035A6E:
                bsr     Offset_0x035B3C
                bsr     Offset_0x034B74
                bsr     Offset_0x035A88
                lea     (SS_Got_Emerald_AnimateData), A1       ; Offset_0x035C6C
                bsr     SS_AnimateSprite                       ; Offset_0x034DF0
                bra     J_DisplaySprite_01                     ; Offset_0x036014
Offset_0x035A88:
                move.w  D7, -(A7)
                moveq   #$00, D2
                moveq   #$00, D3
                moveq   #$00, D4
                moveq   #$00, D5
                moveq   #$00, D6
                moveq   #$00, D7
                move.l  ($FFFFDB82).w, A1
                addq.l  #$02, A1
                move.w  $0030(A0), D0
                subq.w  #$01, D0
                add.w   D0, D0
                move.w  D0, D1
                add.w   D0, D0
                add.w   D1, D0
                move.b  $00(A1, D0), D2
                move.b  $01(A1, D0), D3
                move.b  $02(A1, D0), D4
                move.b  $03(A1, D0), D5
                move.w  D5, D6
                swap.w  D5
                move.w  D6, D5
                move.w  D4, D6
                swap.w  D4
                move.w  D6, D4
                bpl.s   Offset_0x035AD0
                cmpi.b  #$48, D3
                bcs.s   Offset_0x035AD0
                ext.w   D3
Offset_0x035AD0:
                move.w  D4, D6
                add.w   D4, D4
                add.w   D6, D4
                lsr.w   #$02, D4
                move.w  D5, D6
                add.w   D5, D5
                add.w   D6, D5
                lsr.w   #$02, D5
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  D4, D1
                muls.w  D5, D0
                asr.l   #$08, D0
                asr.l   #$08, D1
                add.w   D2, D1
                add.w   D3, D0
                move.w  D1, $0008(A0)
                move.w  D0, $000C(A0)
                move.b  D1, $003A(A0)
                move.b  D0, $003B(A0)
                swap.w  D4
                swap.w  D5
                move.l  $0034(A0), A1
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  D4, D6
                lsr.w   #$02, D6
                add.w   D6, D4
                muls.w  D4, D1
                move.w  D5, D6
                asr.w   #$02, D6
                add.w   D6, D5
                muls.w  D5, D0
                asr.l   #$08, D0
                asr.l   #$08, D1
                add.w   D2, D1
                add.w   D3, D0
                move.w  D1, $0008(A1)
                move.w  D0, $000C(A1)
                move.w  (A7)+, D7
                rts
Offset_0x035B3C:
                cmpi.b  #$03, $001C(A0)
                bcs.s   Offset_0x035B8C
                tst.b   $003E(A0)
                bne.s   Offset_0x035B58
                move.w  #Volume_Down, D0        ; $00F9
                jsr     (Play_Music)                           ; Offset_0x00131A
                st      $003E(A0)
Offset_0x035B58:
                cmpi.b  #$06, $001C(A0)
                bcs.s   Offset_0x035B8C
                move.w  ($FFFFFE20).w, D2
                add.w   ($FFFFFED0).w, D2
                cmp.w   ($FFFFDB8C).w, D2
                blt.s   Offset_0x035B8E
                cmpi.b  #$09, $001C(A0)
                bcs.s   Offset_0x035B8C
                move.w  #$0063, $002A(A0)
                move.b  #$08, $0024(A0)
                move.w  #Emerald_Snd, D0        ; $009D
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x035B8C:
                rts
Offset_0x035B8E:
                move.l  #$00000000, ($FFFFDB12).w
                move.b  #$06, $0024(A0)
                move.w  #$004F, $002A(A0)
                move.w  #$0006, D0
                bsr     Offset_0x0357C0
                rts
Offset_0x035BAC:
                subq.w  #$01, $002A(A0)
                bpl     J_DisplaySprite_01                     ; Offset_0x036014
                st      ($FFFFDB86).w
                bra     Offset_0x035C0E
Offset_0x035BBC:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x035BE8
                moveq   #$00, D0
                move.b  ($FFFFFE16).w, D0
                lea     ($FFFFFF92).w, A0
                st      $00(A0, D0)
                st      ($FFFFFF90).w
                addq.b  #$01, ($FFFFFE16).w
                addq.b  #$01, ($FFFFFF91).w
                st      ($FFFFDB86).w
                bsr     Offset_0x035C0E
                move.l  (A7)+, D0
                rts
Offset_0x035BE8:
                addq.b  #$01, $003C(A0)
                moveq   #$00, D0
                moveq   #$00, D2
                move.b  $003B(A0), D2
                move.b  $003C(A0), D0
                lsr.w   #$02, D0
                andi.w  #$0003, D0
                add.b   Offset_0x035C0A(PC, D0), D2
                move.w  D2, $000C(A0)
                bra     J_DisplaySprite_01                     ; Offset_0x036014
Offset_0x035C0A:
                dc.w    $FF00, $0100
;===============================================================================
; Objeto 0x59 - Checa pelo fim do Special Stage e pode lhe dar uma Esmeralda.
; [ Término ]   Sem este objeto o Special Stage executa infinitamente.
;===============================================================================  