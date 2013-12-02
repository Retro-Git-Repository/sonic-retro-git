;===============================================================================
; Objeto 0x22 - Atirador de setas na Aquatic Ruin
; [ Início ]
;===============================================================================
Offset_0x0254F6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x025504(PC, D0), D1
                jmp     Offset_0x025504(PC, D1)
Offset_0x025504:
                dc.w    Offset_0x02550E-Offset_0x025504
                dc.w    Offset_0x025544-Offset_0x025504
                dc.w    Offset_0x025592-Offset_0x025504
                dc.w    Offset_0x0255E8-Offset_0x025504
                dc.w    Offset_0x02562C-Offset_0x025504
Offset_0x02550E:
                addq.b  #$02, $0024(A0)
                move.l  #Arrow_Shooter_Mappings, $0004(A0)     ; Offset_0x02567C
                move.w  #$0417, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $001A(A0)
                andi.b  #$0F, $0028(A0)
Offset_0x025544:
                cmpi.b  #$02, $001C(A0)
                beq.s   Offset_0x02556A
                moveq   #$00, D2
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x02557C
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x02557C
                tst.b   D2
                bne.s   Offset_0x025566
                tst.b   $001C(A0)
                beq.s   Offset_0x025566
                moveq   #$02, D2
Offset_0x025566:
                move.b  D2, $001C(A0)
Offset_0x02556A:
                lea     (Arrow_Shooter_Animate_Data), A1       ; Offset_0x025664
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02557C:
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x025588
                neg.w   D0
Offset_0x025588:
                cmpi.w  #$0040, D0
                bcc.s   Offset_0x025590
                moveq   #$01, D2
Offset_0x025590:
                rts
Offset_0x025592:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x0255D2
                move.b  $0000(A0), $0000(A1)
                addq.b  #$06, $0024(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  $0022(A0), $0022(A1)
                move.w  #$00DB, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0255D2:
                subq.b  #$02, $0024(A0)
                lea     (Arrow_Shooter_Animate_Data), A1       ; Offset_0x025664
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0255E8:
                addq.b  #$02, $0024(A0)
                move.b  #$08, $0016(A0)
                move.b  #$10, $0017(A0)
                move.b  #$04, $0018(A0)
                move.b  #$9B, $0020(A0)
                move.b  #$08, $0019(A0)
                move.b  #$00, $001A(A0)
                move.w  #$0400, $0010(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x025622
                neg.w   $0010(A0)
Offset_0x025622:
                move.w  #Lava_Sfx, D0           ; $00AE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02562C:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                btst    #$00, $0022(A0)
                bne.s   Offset_0x025652
                moveq   #$FFFFFFF8, D3
                bsr     Object_HitWall_Left                    ; Offset_0x01F016
                tst.w   D1
                bmi     Offset_0x02564C
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02564C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x025652:
                moveq   #$08, D3
                bsr     Object_HitWall_Right                   ; Offset_0x01EE90
                tst.w   D1
                bmi     Offset_0x02564C
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Arrow_Shooter_Animate_Data: ; Offset_0x025664:
                dc.w    Offset_0x02566A-Arrow_Shooter_Animate_Data
                dc.w    Offset_0x02566E-Arrow_Shooter_Animate_Data
                dc.w    Offset_0x025672-Arrow_Shooter_Animate_Data
Offset_0x02566A:
                dc.b    $1F, $01, $FF, $00
Offset_0x02566E:
                dc.b    $03, $01, $02, $FF
Offset_0x025672:
                dc.b    $07, $03, $04, $FC, $04, $03, $01, $FD, $00, $00
;-------------------------------------------------------------------------------   
Arrow_Shooter_Mappings: ; Offset_0x02567C:
                dc.w    Offset_0x025686-Arrow_Shooter_Mappings
                dc.w    Offset_0x025690-Arrow_Shooter_Mappings
                dc.w    Offset_0x0256A2-Arrow_Shooter_Mappings
                dc.w    Offset_0x0256BC-Arrow_Shooter_Mappings
                dc.w    Offset_0x0256CE-Arrow_Shooter_Mappings
Offset_0x025686:
                dc.w    $0001
                dc.l    $FC0C2000, $2000FFF0
Offset_0x025690:
                dc.w    $0002
                dc.l    $F8092004, $2002FFF0, $F801200B, $20050008
Offset_0x0256A2:
                dc.w    $0003
                dc.l    $FC00000A, $0005FFFC, $F8092004, $2002FFF0
                dc.l    $F801200B, $20050008
Offset_0x0256BC:
                dc.w    $0002
                dc.l    $F8092004, $2002FFF0, $F801200D, $20060008
Offset_0x0256CE:
                dc.w    $0002
                dc.l    $F8092004, $2002FFF0, $F801200F, $20070008
;===============================================================================
; Objeto 0x22 - Atirador de setas na Aquatic Ruin
; [ Término ]
;===============================================================================  