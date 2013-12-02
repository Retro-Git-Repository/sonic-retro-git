;===============================================================================
; Objeto 0x1F - Plataformas que desmoronam na Mystic Cave / Oil Ocean
; [ Início ]
;=============================================================================== 
Offset_0x0109C2:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0109D0(PC, D0), D1
                jmp     Offset_0x0109D0(PC, D1)
Offset_0x0109D0:
                dc.w    Offset_0x0109D6-Offset_0x0109D0
                dc.w    Offset_0x010A90-Offset_0x0109D0
                dc.w    Offset_0x010ACA-Offset_0x0109D0
Offset_0x0109D6:
                addq.b  #$02, $0024(A0)
                move.l  #Collapsing_Platforms_Mappings_1F, $0004(A0) ; Offset_0x010ECA
                move.w  #$42B8, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$07, $0038(A0)
                move.b  #$44, $0019(A0)
                lea     (Offset_0x010BD4), A4
                btst    #$00, $0028(A0)
                beq.s   Offset_0x010A14
                lea     (Offset_0x010BDC), A4
Offset_0x010A14:
                move.l  A4, $0034(A0)
                cmpi.b  #$0A, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x010A40
                move.l  #OOz_Collapsing_Platforms_Mappings, $0004(A0) ; Offset_0x011084
                move.w  #$639D, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$40, $0019(A0)
                move.l  #OOz_Collapsing_Platforms_Data, $0034(A0) ; Offset_0x010BE4
Offset_0x010A40:                                      
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x010A68
                move.l  #MCz_Collapsing_Platforms_Mappings, $0004(A0) ; Offset_0x0110C4
                move.w  #$63F4, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$20, $0019(A0)
                move.l  #MCz_Collapsing_Platforms_Data, $0034(A0) ; Offset_0x010BEC
Offset_0x010A68:
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x010A90
                move.l  #ARz_Collapsing_Platforms_Mappings, $0004(A0) ; Offset_0x01111C
                move.w  #$4000, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$20, $0019(A0)
                move.l  #ARz_Collapsing_Platforms_Data, $0034(A0) ; Offset_0x010BF2
Offset_0x010A90:
                tst.b   $003A(A0)
                beq.s   Offset_0x010AA2
                tst.b   $0038(A0)
                beq     Offset_0x010B1E
                subq.b  #$01, $0038(A0)
Offset_0x010AA2:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x010AB2
                move.b  #$01, $003A(A0)
Offset_0x010AB2:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                move.w  #$0010, D3
                move.w  $0008(A0), D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                bra     MarkObjGone                            ; Offset_0x016358
Offset_0x010ACA:
                tst.b   $0038(A0)
                beq.s   Offset_0x010B0E
                tst.b   $003A(A0)
                bne.s   Offset_0x010ADE
                subq.b  #$01, $0038(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x010ADE:
                bsr     Offset_0x010AB2
                subq.b  #$01, $0038(A0)
                bne.s   Offset_0x010B0C
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x010AF2
                lea     ($FFFFB040).w, A1
Offset_0x010AF2:
                btst    #$03, $0022(A1)
                beq.s   Offset_0x010B0C
                bclr    #$03, $0022(A1)
                bclr    #$05, $0022(A1)
                move.b  #$01, $001D(A1)
Offset_0x010B0C:
                rts
Offset_0x010B0E:
                bsr     ObjectFall                             ; Offset_0x016306
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x010B1E:
                addq.b  #$01, $001A(A0)
                bra.s   Collapse_Platform_2                    ; Offset_0x010B28
;===============================================================================
; Objeto 0x1F - Plataformas que desmoronam na Mystic Cave / Oil Ocean
; [ Término ]
;===============================================================================  