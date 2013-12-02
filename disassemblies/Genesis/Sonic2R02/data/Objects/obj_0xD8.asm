;===============================================================================
; Objeto 0xD8 - Bumper verde na Casino Night muda para amarelo e vermelho 
; [ Início ]    ao tocar depois some
;===============================================================================
Offset_0x02C2A4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02C2B2(PC, D0), D1
                jmp     Offset_0x02C2B2(PC, D1)
Offset_0x02C2B2:
                dc.w    Offset_0x02C2B8-Offset_0x02C2B2
                dc.w    Offset_0x02C2F6-Offset_0x02C2B2
                dc.w    Offset_0x02C484-Offset_0x02C2B2
Offset_0x02C2B8:
                addq.b  #$02, $0024(A0)
                move.l  #Green_Bumper_Mappings, $0004(A0)      ; Offset_0x02C4D0
                move.w  #$43E6, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  #$D7, $0020(A0)
                move.b  $0028(A0), D0
                rol.b   #$02, D0
                andi.b  #$03, D0
                move.b  D0, $001C(A0)
Offset_0x02C2F6:
                move.b  $0021(A0), D0
                bne     Offset_0x02C304
                tst.w   $0030(A0)
                beq.s   Offset_0x02C33A
Offset_0x02C304:
                lea     $0030(A0), A4
                tst.b   (A4)
                beq.s   Offset_0x02C310
                subq.b  #$01, (A4)
                bra.s   Offset_0x02C31E
Offset_0x02C310:
                lea     ($FFFFB000).w, A1
                bclr    #$00, $0021(A0)
                beq.s   Offset_0x02C31E
                bsr.s   Offset_0x02C34C
Offset_0x02C31E:
                addq.w  #$01, A4
                tst.b   (A4)
                beq.s   Offset_0x02C328
                subq.b  #$01, (A4)
                bra.s   Offset_0x02C336
Offset_0x02C328:
                lea     ($FFFFB040).w, A1
                bclr    #$01, $0021(A0)
                beq.s   Offset_0x02C336
                bsr.s   Offset_0x02C34C
Offset_0x02C336:
                clr.b   $0021(A0)
Offset_0x02C33A:
                lea     (Green_Bumper_Animate_Data), A1        ; Offset_0x02C4A6
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02C34C:
                move.b  $001A(A0), D0
                subq.b  #$03, D0
                beq.s   Offset_0x02C35A
                bcc.s   Offset_0x02C378
                addq.b  #$03, D0
                bne.s   Offset_0x02C378
Offset_0x02C35A:
                move.b  #$03, $001C(A0)
                move.w  #$F900, $0012(A1)
                move.w  $000C(A0), D2
                sub.w   $000C(A1), D2
                bpl.s   Offset_0x02C374
                neg.w   $0012(A1)
Offset_0x02C374:
                bra     Offset_0x02C404
Offset_0x02C378:
                subq.b  #$01, D0
                bne.s   Offset_0x02C3EA
                move.b  #$04, $001C(A0)
                move.w  #$0020, D3
                btst    #$00, $0022(A0)
                bne.s   Offset_0x02C392
                move.w  #$0060, D3
Offset_0x02C392:
                move.w  $0010(A1), D1
                move.w  $0012(A1), D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                sub.w   D3, D0
                move.w  D0, D1
                bpl.s   Offset_0x02C3A8
                neg.w   D1
Offset_0x02C3A8:
                neg.w   D0
                add.w   D3, D0
                cmpi.b  #$40, D1
                bcc.s   Offset_0x02C3BC
                cmpi.b  #$38, D1
                bcs.s   Offset_0x02C3CE
                move.w  D3, D0
                bra.s   Offset_0x02C3CE
Offset_0x02C3BC:
                subi.w  #$0080, D1
                neg.w   D1
                cmpi.b  #$38, D1
                bcs.s   Offset_0x02C3CE
                move.w  D3, D0
                addi.w  #$0080, D0
Offset_0x02C3CE:
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$F900, D1
                asr.l   #$08, D1
                move.w  D1, $0010(A1)
                muls.w  #$F900, D0
                asr.l   #$08, D0
                move.w  D0, $0012(A1)
                bra.s   Offset_0x02C404
Offset_0x02C3EA:
                move.b  #$05, $001C(A0)
                move.w  #$F900, $0010(A1)
                move.w  $0008(A0), D2
                sub.w   $0008(A1), D2
                bpl.s   Offset_0x02C404
                neg.w   $0010(A1)
Offset_0x02C404:
                bset    #$01, $0022(A1)
                bclr    #$04, $0022(A1)
                bclr    #$05, $0022(A1)
                clr.b   $003C(A1)
                move.w  #$00D8, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.w  A1, A3
                moveq   #$04, D3
                moveq   #$01, D0
                subi.w  #$2000, $0002(A0)
                bcc.s   Offset_0x02C45A
                addi.w  #$2000, $0002(A0)
                move.b  #$04, $0024(A0)
                lea     ($FFFFE700).w, A1
                move.b  $0028(A0), D1
                andi.w  #$003F, D1
                lea     $00(A1, D1), A1
                addq.b  #$01, (A1)
                cmpi.b  #$03, (A1)
                bcs.s   Offset_0x02C45A
                moveq   #$02, D3
                moveq   #$32, D0
Offset_0x02C45A:
                jsr     (Add_Points)                           ; Offset_0x040A98
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02C47E
                move.b  #$29, $0000(A1) ; Carrega o objeto 0x29 - Ponto dos inimigos
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  D3, $001A(A1)
Offset_0x02C47E:
                move.b  #$04, (A4)
                rts
Offset_0x02C484:
                lea     (Green_Bumper_Animate_Data), A1        ; Offset_0x02C4A6
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                cmpi.b  #$03, $001C(A0)
                bcs     Offset_0x02C4A0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02C4A0:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------
Green_Bumper_Animate_Data: ; Offset_0x02C4A6:
                dc.w    Offset_0x02C4B2-Green_Bumper_Animate_Data
                dc.w    Offset_0x02C4B6-Green_Bumper_Animate_Data
                dc.w    Offset_0x02C4BA-Green_Bumper_Animate_Data
                dc.w    Offset_0x02C4BE-Green_Bumper_Animate_Data
                dc.w    Offset_0x02C4C4-Green_Bumper_Animate_Data
                dc.w    Offset_0x02C4CA-Green_Bumper_Animate_Data
Offset_0x02C4B2:
                dc.b    $0F, $00, $FF, $00
Offset_0x02C4B6:
                dc.b    $0F, $01, $FF, $00
Offset_0x02C4BA:
                dc.b    $0F, $02, $FF, $00
Offset_0x02C4BE:
                dc.b    $03, $03, $00, $03, $FD, $00
Offset_0x02C4C4:
                dc.b    $03, $04, $01, $04, $FD, $01
Offset_0x02C4CA:
                dc.b    $03, $05, $02, $05, $FD, $02
;-------------------------------------------------------------------------------  
Green_Bumper_Mappings: ; Offset_0x02C4D0:
                dc.w    Offset_0x02C4DC-Green_Bumper_Mappings
                dc.w    Offset_0x02C4E6-Green_Bumper_Mappings
                dc.w    Offset_0x02C4F0-Green_Bumper_Mappings
                dc.w    Offset_0x02C4FA-Green_Bumper_Mappings
                dc.w    Offset_0x02C504-Green_Bumper_Mappings
                dc.w    Offset_0x02C50E-Green_Bumper_Mappings
Offset_0x02C4DC:
                dc.w    $0001
                dc.l    $F80D0000, $0000FFF0
Offset_0x02C4E6:
                dc.w    $0001
                dc.l    $F00B0008, $0004FFF4
Offset_0x02C4F0:
                dc.w    $0001
                dc.l    $F0070014, $000AFFF8
Offset_0x02C4FA:
                dc.w    $0001
                dc.l    $FA0D0000, $0000FFF0
Offset_0x02C504:
                dc.w    $0001
                dc.l    $F20B0008, $0004FFF2
Offset_0x02C50E:
                dc.w    $0001
                dc.l    $F0070014, $000AFFF6                                                                                
;===============================================================================
; Objeto 0xD8 - Bumper verde na Casino Night muda para amarelo e vermelho 
; [ Término ]   ao tocar depois some
;===============================================================================