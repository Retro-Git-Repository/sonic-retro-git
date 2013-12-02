;===============================================================================
; Objeto 0xC8 - Inimigo Crawl na Casino Night
; [ Início ]
;===============================================================================   
Offset_0x03CFB4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03CFC2(PC, D0), D1
                jmp     Offset_0x03CFC2(PC, D1)
Offset_0x03CFC2:
                dc.w    Offset_0x03CFCA-Offset_0x03CFC2
                dc.w    Offset_0x03CFF2-Offset_0x03CFC2
                dc.w    Offset_0x03D024-Offset_0x03CFC2
                dc.w    Offset_0x03D056-Offset_0x03CFC2
Offset_0x03CFCA:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$0200, $002A(A0)
                moveq   #$20, D0
                btst    #$00, $0001(A0)
                bne.s   Offset_0x03CFE0
                neg.w   D0
Offset_0x03CFE0:
                move.w  D0, $0010(A0)
                move.b  #$0F, $0016(A0)
                move.b  #$10, $0017(A0)
                rts
Offset_0x03CFF2:
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03D014
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x03D1A0
                lea     (Crawl_Animate_Data), A1               ; Offset_0x03D1D4
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D014:
                addq.b  #$02, $0024(A0)
                move.w  #$003B, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D024:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03D034
                bsr     Offset_0x03D1A0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D034:
                move.b  #$02, $0024(A0)
                move.w  #$0200, $002A(A0)
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
                bchg    #00, $0022(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D056:
                move.b  #$D7, $0020(A0)
                bsr     Offset_0x0360FC
                move.w  D2, D4
                addi.w  #$0040, D2
                cmpi.w  #$0080, D2
                bcc     Offset_0x03D122
                addi.w  #$0040, D3
                cmpi.w  #$0080, D3
                bcc     Offset_0x03D122
                bclr    #$03, $0022(A0)
                bne     Offset_0x03D10A
                move.b  $0021(A0), D0
                beq.s   Offset_0x03D0EA
                bclr    #$00, $0021(A0)
                beq.s   Offset_0x03D0B6
                cmpi.b  #$02, $001C(A1)
                bne.s   Offset_0x03D0F0
                btst    #$01, $0022(A1)
                bne.s   Offset_0x03D0B4
                bsr     Offset_0x0360FC
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03D0B0
                subq.w  #$02, D0
Offset_0x03D0B0:
                tst.w   D0
                bne.s   Offset_0x03D116
Offset_0x03D0B4:
                bsr.s   Offset_0x03D12E
Offset_0x03D0B6:
                lea     ($FFFFB040).w, A1
                bclr    #$01, $0021(A0)
                beq.s   Offset_0x03D0E6
                cmpi.b  #$02, $001C(A1)
                bne.s   Offset_0x03D0F0
                btst    #$01, $0022(A1)
                bne.s   Offset_0x03D0E4
                bsr     Offset_0x0360FC
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03D0E0
                subq.w  #$02, D0
Offset_0x03D0E0:
                tst.w   D0
                bne.s   Offset_0x03D116
Offset_0x03D0E4:
                bsr.s   Offset_0x03D12E
Offset_0x03D0E6:
                clr.b   $0021(A0)
Offset_0x03D0EA:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D0F0:
                move.b  #$97, $0020(A0)
                btst    #$01, $002B(A1)
                beq.s   Offset_0x03D104
                move.b  #$17, $0020(A0)
Offset_0x03D104:
                bset    #$03, $0022(A0)
Offset_0x03D10A:
                move.b  #$01, $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D116:
                move.b  #$17, $0020(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D122:
                move.b  $002C(A0), $0024(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03D12E:
                move.b  #$02, $001A(A0)
                btst    #$01, $0022(A1)
                beq.s   Offset_0x03D142
                move.b  #$03, $001A(A0)
Offset_0x03D142:
                move.w  $0008(A0), D1
                move.w  $000C(A0), D2
                sub.w   $0008(A1), D1
                sub.w   $000C(A1), D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                move.b  ($FFFFFE04).w, D1
                andi.w  #$0003, D1
                add.w   D1, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$F900, D1
                asr.l   #$08, D1
                move.w  D1, $0010(A1)
                muls.w  #$F900, D0
                asr.l   #$08, D0
                move.w  D0, $0012(A1)
                bset    #$01, $0022(A1)
                bclr    #$04, $0022(A1)
                bclr    #$05, $0022(A1)
                clr.b   $003C(A1)
                move.w  #Bumper_Sfx, D0         ; $00B4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                rts
                rts
Offset_0x03D1A0:
                bsr     Offset_0x0360FC
                addi.w  #$0040, D2
                cmpi.w  #$0080, D2
                bcc.s   Offset_0x03D1C8
                addi.w  #$0040, D3
                cmpi.w  #$0080, D3
                bcc.s   Offset_0x03D1C8
                move.b  $0024(A0), $002C(A0)
                move.b  #$06, $0024(A0)
                clr.b   $001A(A0)
Offset_0x03D1C8:
                rts
;-------------------------------------------------------------------------------                  
Obj_0xC8_Ptr: ; Offset_0x03D1CA:
                dc.l    Crawl_Mappings                         ; Offset_0x03D1DA
                dc.w    $8340
                dc.b    $04, $03, $10, $D7
;-------------------------------------------------------------------------------  
Crawl_Animate_Data: ; Offset_0x03D1D4:
                dc.w    Offset_0x03D1D6-Crawl_Animate_Data
Offset_0x03D1D6:
                dc.b    $13, $00, $01, $FF
;-------------------------------------------------------------------------------
Crawl_Mappings: ; Offset_0x03D1DA:
                dc.w    Offset_0x03D1E2-Crawl_Mappings
                dc.w    Offset_0x03D1FC-Crawl_Mappings
                dc.w    Offset_0x03D216-Crawl_Mappings
                dc.w    Offset_0x03D230-Crawl_Mappings
Offset_0x03D1E2:
                dc.w    $0003
                dc.l    $F00B2010, $20080000, $F00F2000, $2000FFF0
                dc.l    $00092024, $2012FFE8
Offset_0x03D1FC:
                dc.w    $0003
                dc.l    $F00B2010, $20080004, $F00F2000, $2000FFF0
                dc.l    $00092024, $2012FFE0
Offset_0x03D216:
                dc.w    $0003
                dc.l    $F00B2010, $2008FFE8, $00092024, $2012FFF0
                dc.l    $F00F2000, $2000FFF0
Offset_0x03D230:
                dc.w    $0004
                dc.l    $F00D201C, $200EFFF0, $00092024, $2012FFF8
                dc.l    $00092824, $2812FFE0, $F00F2000, $2000FFF0                                                                                                                                                           
;===============================================================================
; Objeto 0xC8 - Inimigo Crawl na Casino Night
; [ Término ]
;===============================================================================