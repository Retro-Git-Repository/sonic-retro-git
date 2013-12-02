;===============================================================================
; Objeto 0x4A - Inimigo Octus na Oil Ocean
; [ Início ]
;===============================================================================   
Offset_0x02C5F8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02C606(PC, D0), D1
                jmp     Offset_0x02C606(PC, D1)
Offset_0x02C606:
                dc.w    Offset_0x02C642-Offset_0x02C606
                dc.w    Offset_0x02C6AA-Offset_0x02C606
                dc.w    Offset_0x02C62E-Offset_0x02C606
                dc.w    Offset_0x02C60E-Offset_0x02C606
Offset_0x02C60E:
                subq.w  #$01, $002C(A0)
                bmi.s   Offset_0x02C616
                rts
Offset_0x02C616:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Octus_AnimateData), A1                ; Offset_0x02C7D8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02C62E:
                subq.w  #$01, $002C(A0)
                beq     Offset_0x02C63C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02C63C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02C642:
                move.l  #Octus_Mappings, $0004(A0)             ; Offset_0x02C7FA
                move.w  #$2538, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$0A, $0020(A0)
                move.b  #$04, $0018(A0)
                move.b  #$10, $0019(A0)
                move.b  #$0B, $0016(A0)
                move.b  #$08, $0017(A0)
                jsr     (ObjectFall)                           ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x02C6A2
                add.w   D1, $000C(A0)
                move.w  #$0000, $0012(A0)
                addq.b  #$02, $0024(A0)
                move.w  $0008(A0), D0
                sub.w   ($FFFFB008).w, D0
                bpl.s   Offset_0x02C6A2
                bchg    #00, $0022(A0)
Offset_0x02C6A2:
                move.w  $000C(A0), $002A(A0)
                rts
Offset_0x02C6AA:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02C6CA(PC, D0), D1
                jsr     Offset_0x02C6CA(PC, D1)
                lea     (Octus_AnimateData), A1                ; Offset_0x02C7D8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02C6CA:
                dc.w    Offset_0x02C6D4-Offset_0x02C6CA
                dc.w    Offset_0x02C6FA-Offset_0x02C6CA
                dc.w    Offset_0x02C718-Offset_0x02C6CA
                dc.w    Offset_0x02C734-Offset_0x02C6CA
                dc.w    Offset_0x02C742-Offset_0x02C6CA
Offset_0x02C6D4:
                move.w  $0008(A0), D0
                sub.w   ($FFFFB008).w, D0
                cmpi.w  #$0080, D0
                bgt.s   Offset_0x02C6F8
                cmpi.w  #$FF80, D0
                blt.s   Offset_0x02C6F8
                addq.b  #$02, $0025(A0)
                move.b  #$03, $001C(A0)
                move.w  #$0020, $002C(A0)
Offset_0x02C6F8:
                rts
Offset_0x02C6FA:
                subq.w  #$01, $002C(A0)
                bmi.s   Offset_0x02C702
                rts
Offset_0x02C702:
                addq.b  #$02, $0025(A0)
                move.b  #$04, $001C(A0)
                move.w  #$FE00, $0012(A0)
                jmp     (SpeedToPos)                           ; Offset_0x016332
Offset_0x02C718:
                addi.w  #$0010, $0012(A0)
                bpl.s   Offset_0x02C726
                jmp     (SpeedToPos)                           ; Offset_0x016332
Offset_0x02C726:
                addq.b  #$02, $0025(A0)
                move.w  #$003C, $002C(A0)
                bra     Offset_0x02C76C
Offset_0x02C734:
                subq.w  #$01, $002C(A0)
                bmi.s   Offset_0x02C73C
                rts
Offset_0x02C73C:
                addq.b  #$02, $0025(A0)
                rts
Offset_0x02C742:
                addi.w  #$0010, $0012(A0)
                move.w  $000C(A0), D0
                cmp.w   $002A(A0), D0
                bcc.s   Offset_0x02C758
                jmp     (SpeedToPos)                           ; Offset_0x016332
Offset_0x02C758:
                clr.b   $0025(A0)
                clr.b   $001C(A0)
                clr.w   $0012(A0)
                move.b  #$01, $001A(A0)
                rts
Offset_0x02C76C:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02C7D6
                move.b  #$4A, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$06, $0024(A1)
                move.l  #Octus_Mappings, $0004(A1)             ; Offset_0x02C7FA
                move.w  #$2538, $0002(A1)
                move.b  #$04, $0018(A1)
                move.b  #$10, $0019(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  #$000F, $002C(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  $0022(A0), $0022(A1)
                move.b  #$02, $001C(A1)
                move.b  #$98, $0020(A1)
                move.w  #$FE00, $0010(A1)
                btst    #$00, $0001(A1)
                beq.s   Offset_0x02C7D6
                neg.w   $0010(A1)
Offset_0x02C7D6:
                rts
;-------------------------------------------------------------------------------
Octus_AnimateData: ; Offset_0x02C7D8:
                dc.w    Offset_0x02C7E2-Octus_AnimateData
                dc.w    Offset_0x02C7E6-Octus_AnimateData
                dc.w    Offset_0x02C7EC-Octus_AnimateData
                dc.w    Offset_0x02C7F0-Octus_AnimateData
                dc.w    Offset_0x02C7F4-Octus_AnimateData
Offset_0x02C7E2:
                dc.b    $0F, $01, $00, $FF
Offset_0x02C7E6:
                dc.b    $03, $01, $02, $03, $FF, $00
Offset_0x02C7EC:
                dc.b    $02, $05, $06, $FF
Offset_0x02C7F0:
                dc.b    $0F, $04, $FF, $00
Offset_0x02C7F4:
                dc.b    $07, $00, $01, $FD, $01, $00
;-------------------------------------------------------------------------------
Octus_Mappings: ; Offset_0x02C7FA:
                dc.w    Offset_0x02C808-Octus_Mappings
                dc.w    Offset_0x02C81A-Octus_Mappings
                dc.w    Offset_0x02C834-Octus_Mappings
                dc.w    Offset_0x02C84E-Octus_Mappings
                dc.w    Offset_0x02C868-Octus_Mappings
                dc.w    Offset_0x02C88A-Octus_Mappings
                dc.w    Offset_0x02C894-Octus_Mappings
Offset_0x02C808:
                dc.w    $0002
                dc.l    $EB0D0000, $0000FFF0, $FB0D0008, $0004FFF0
Offset_0x02C81A:
                dc.w    $0003
                dc.l    $F00D0000, $0000FFF0, $00090010, $0008FFE8
                dc.l    $00090016, $000B0000
Offset_0x02C834:
                dc.w    $0003
                dc.l    $F00D0000, $0000FFF0, $0009001C, $000EFFE8
                dc.l    $00090022, $00110000
Offset_0x02C84E:
                dc.w    $0003
                dc.l    $F00D0000, $0000FFF0, $00090028, $0014FFE8
                dc.l    $0009002E, $00170000
Offset_0x02C868:
                dc.w    $0004
                dc.l    $F0010034, $001AFFF7, $F00D0000, $0000FFF0
                dc.l    $00090010, $0008FFE8, $00090016, $000B0000
Offset_0x02C88A:
                dc.w    $0001
                dc.l    $F2010036, $001BFFF0
Offset_0x02C894:
                dc.w    $0001
                dc.l    $F2010038, $001CFFF0
;===============================================================================
; Objeto 0x4A - Inimigo Octus na Oil Ocean
; [ Término ]
;===============================================================================  