;===============================================================================
; Objeto 0x1A - Plataformas que desmoronam na Hidden Palace / Oil Ocean
; [ Início ]
;===============================================================================   
Offset_0x010874:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x010882(PC, D0), D1
                jmp     Offset_0x010882(PC, D1)
Offset_0x010882:
                dc.w    Offset_0x010888-Offset_0x010882
                dc.w    Offset_0x010934-Offset_0x010882
                dc.w    Offset_0x01096E-Offset_0x010882
Offset_0x010888:
                addq.b  #$02, $0024(A0)
                move.l  #Collapsing_Platforms_Mappings_1A, $0004(A0) ; Offset_0x010C2A
                move.w  #$4000, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$07, $0038(A0)
                move.b  $0028(A0), $001A(A0)
                move.l  #Offset_0x010BAE, $0034(A0)
                cmpi.b  #$08, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x0108F0
                move.l  #HPz_Collapsing_Platforms_Mappings, $0004(A0) ; Offset_0x010FDA
                move.w  #$434A, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$30, $0019(A0)
                move.l  #Offset_0x010FAA, $003C(A0)
                move.l  #Offset_0x010BC8, $0034(A0)
                bra.s   Offset_0x010934
Offset_0x0108F0:
                cmpi.b  #$0A, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x01091A
                move.l  #OOz_Collapsing_Platforms_Mappings, $0004(A0) ; Offset_0x0011084
                move.w  #$639D, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$40, $0019(A0)
                move.l  #Offset_0x010F9A, $003C(A0)
                bra.s   Offset_0x010934
Offset_0x01091A:
                move.l  #Offset_0x010BFA, $003C(A0)
                move.b  #$34, $0019(A0)
                move.b  #$38, $0016(A0)
                bset    #$04, $0001(A0)
Offset_0x010934:
                tst.b   $003A(A0)
                beq.s   Offset_0x010946
                tst.b   $0038(A0)
                beq     Collapse_Platform                      ; Offset_0x010B24
                subq.b  #$01, $0038(A0)
Offset_0x010946:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x010956
                move.b  #$01, $003A(A0)
Offset_0x010956:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                move.l  $003C(A0), A2
                move.w  $0008(A0), D4
                jsr     (Platform_Object_2)                    ; Offset_0x019BF8
                bra     MarkObjGone                            ; Offset_0x016358
Offset_0x01096E:
                tst.b   $0038(A0)
                beq.s   Offset_0x0109B2
                tst.b   $003A(A0)
                bne.s   Offset_0x010982
                subq.b  #$01, $0038(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x010982:
                bsr     Offset_0x010956
                subq.b  #$01, $0038(A0)
                bne.s   Offset_0x0109B0
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x010996
                lea     ($FFFFB040).w, A1
Offset_0x010996:
                btst    #$03, $0022(A1)
                beq.s   Offset_0x0109B0
                bclr    #$03, $0022(A1)
                bclr    #$05, $0022(A1)
                move.b  #$01, $001D(A1)
Offset_0x0109B0:
                rts
Offset_0x0109B2:
                bsr     ObjectFall                             ; Offset_0x016306
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A
;===============================================================================
; Objeto 0x1A - Plataformas que desmoronam na Hidden Palace / Oil Ocean
; [ Término ]
;===============================================================================  