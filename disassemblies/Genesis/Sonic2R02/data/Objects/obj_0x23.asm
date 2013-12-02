;===============================================================================
; Objeto 0x23 - Pilar que solta a parte debaixo na Aquatic Ruin
; [ Início ]
;===============================================================================     
Offset_0x0256E0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0256EE(PC, D0), D1
                jmp     Offset_0x0256EE(PC, D1)
Offset_0x0256EE:
                dc.w    Offset_0x0256F2-Offset_0x0256EE
                dc.w    Offset_0x02577A-Offset_0x0256EE
Offset_0x0256F2:
                addq.b  #$02, $0024(A0)
                move.l  #Pillar_Mappings, $0004(A0)            ; Offset_0x025844
                move.w  #$2000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$20, $0016(A0)
                move.b  #$04, $0018(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02577A
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                addq.b  #$02, $0024(A1)
                addq.b  #$02, $0025(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $0008(A0), $0030(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0030, $000C(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$10, $0016(A1)
                move.b  #$04, $0018(A1)
                move.b  #$01, $001A(A1)
Offset_0x02577A:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x0257A4
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0257A4:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0257B2(PC, D0), D1
                jmp     Offset_0x0257B2(PC, D1)
Offset_0x0257B2:
                dc.w    Offset_0x0257E8-Offset_0x0257B2
                dc.w    Offset_0x0257BA-Offset_0x0257B2
                dc.w    Offset_0x0257EA-Offset_0x0257B2
                dc.w    Offset_0x025814-Offset_0x0257B2
Offset_0x0257BA:
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x0257E8
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x0257CA
                lea     ($FFFFB040).w, A1
Offset_0x0257CA:
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x0257D6
                neg.w   D0
Offset_0x0257D6:
                cmpi.w  #$0080, D0
                bcc.s   Offset_0x0257E8
                move.b  #$04, $0025(A0)
                move.w  #$0008, $0034(A0)
Offset_0x0257E8:
                rts
Offset_0x0257EA:
                move.w  $0034(A0), D0
                subq.w  #$01, D0
                bcc.s   Offset_0x0257F8
                addq.b  #$02, $0025(A0)
                rts
Offset_0x0257F8:
                move.w  D0, $0034(A0)
                move.b  Offset_0x02580C(PC, D0), D0
                ext.w   D0
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                rts
Offset_0x02580C:
                dc.b    $00, $01, $FF, $01, $00, $FF, $00, $01
Offset_0x025814:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0038, $0012(A0)
                bsr     ObjHitFloor                            ; Offset_0x01ED8A
                tst.w   D1
                bpl     Offset_0x025842
                add.w   D1, $000C(A0)
                clr.w   $0012(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  #$02, $001A(A0)
                clr.b   $0025(A0)
Offset_0x025842:
                rts
;-------------------------------------------------------------------------------
Pillar_Mappings: ; Offset_0x025844:
                dc.w    Offset_0x02584A-Pillar_Mappings
                dc.w    Offset_0x02587C-Pillar_Mappings
                dc.w    Offset_0x025896-Pillar_Mappings
Offset_0x02584A:
                dc.w    $0006
                dc.l    $E005005D, $002EFFE0, $E005085D, $082E0010
                dc.l    $E00D0061, $0030FFF0, $F00D0069, $0034FFF0
                dc.l    $000D0069, $0034FFF0, $100D0071, $0038FFF0
Offset_0x02587C:
                dc.w    $0003
                dc.l    $F00D0069, $0034FFF0, $000D0079, $003CFFF0
                dc.l    $10040081, $0040FFF0
Offset_0x025896:
                dc.w    $0004
                dc.l    $090D208B, $2045FFF0, $F00D0069, $0034FFF0
                dc.l    $000D0079, $003CFFF0, $10040081, $0040FFF0                     
;===============================================================================
; Objeto 0x23 - Pilar que solta a parte debaixo na Aquatic Ruin
; [ Término ]
;===============================================================================  