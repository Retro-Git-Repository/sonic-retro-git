;===============================================================================
; Objeto 0x0A - Objeto de controle do Sonic / Miles embaixo da água
; [ Início ]
;===============================================================================      
Offset_0x01D2AC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01D2BA(PC, D0), D1
                jmp     Offset_0x01D2BA(PC, D1)
Offset_0x01D2BA:
                dc.w    Offset_0x01D2CC-Offset_0x01D2BA
                dc.w    Offset_0x01D324-Offset_0x01D2BA
                dc.w    Offset_0x01D330-Offset_0x01D2BA
                dc.w    Offset_0x01D3A6-Offset_0x01D2BA
                dc.w    Offset_0x01D3BA-Offset_0x01D2BA
                dc.w    Offset_0x01D592-Offset_0x01D2BA
                dc.w    Offset_0x01D3C0-Offset_0x01D2BA
                dc.w    Offset_0x01D39A-Offset_0x01D2BA
                dc.w    Offset_0x01D3BA-Offset_0x01D2BA
Offset_0x01D2CC:
                addq.b  #$02, $0024(A0)
                move.l  #Sonic_Underwater_Mappings, $0004(A0)  ; Offset_0x01FB6C
                tst.b   $003F(A0)
                beq.s   Offset_0x01D2E6
                move.l  #Miles_Underwater_Mappings, $0004(A0)  ; Offset_0x01FB8E
Offset_0x01D2E6:
                move.w  #$855B, $0002(A0)
                move.b  #$84, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x01D314
                addq.b  #$08, $0024(A0)
                andi.w  #$007F, D0
                move.b  D0, $0033(A0)
                bra     Offset_0x01D592
Offset_0x01D314:
                move.b  D0, $001C(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  #$FF78, $0012(A0)
Offset_0x01D324:
                lea     (Bubbles_Animate_Data), A1             ; Offset_0x01D7EC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x01D330:
                move.w  ($FFFFF646).w, D0
                cmp.w   $000C(A0), D0
                bcs.s   Offset_0x01D356
                move.b  #$06, $0024(A0)
                addq.b  #$07, $001C(A0)
                cmpi.b  #$0D, $001C(A0)
                beq.s   Offset_0x01D3A6
                bcs.s   Offset_0x01D3A6
                move.b  #$0D, $001C(A0)
                bra.s   Offset_0x01D3A6
Offset_0x01D356:
                tst.b   ($FFFFF7C7).w
                beq.s   Offset_0x01D360
                addq.w  #$04, $0030(A0)
Offset_0x01D360:
                move.b  $0026(A0), D0
                addq.b  #$01, $0026(A0)
                andi.w  #$007F, D0
                lea     (Offset_0x01D44C), A1
                move.b  $00(A1, D0), D0
                ext.w   D0
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                bsr.s   Offset_0x01D400
                jsr     (SpeedToPos)                           ; Offset_0x016332
                tst.b   $0001(A0)
                bpl.s   Offset_0x01D394
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01D394:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x01D39A:
                move.l  $003C(A0), A2
                cmpi.b  #$0C, $0028(A2)
                bhi.s   Offset_0x01D3BA
Offset_0x01D3A6:
                bsr.s   Offset_0x01D400
                lea     (Bubbles_Animate_Data), A1             ; Offset_0x01D7EC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01D3BA:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x01D3C0:
                move.l  $003C(A0), A2
                cmpi.b  #$0C, $0028(A2)
                bhi.s   Offset_0x01D3FA
                subq.w  #$01, $0038(A0)
                bne.s   Offset_0x01D3DE
                move.b  #$0E, $0024(A0)
                addq.b  #$07, $001C(A0)
                bra.s   Offset_0x01D3A6
Offset_0x01D3DE:
                lea     (Bubbles_Animate_Data), A1             ; Offset_0x01D7EC
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bsr     Offset_0x01D54C
                tst.b   $0001(A0)
                bpl.s   Offset_0x01D3FA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01D3FA:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x01D400:
                tst.w   $0038(A0)
                beq.s   Offset_0x01D44A
                subq.w  #$01, $0038(A0)
                bne.s   Offset_0x01D44A
                cmpi.b  #$07, $001C(A0)
                bcc.s   Offset_0x01D44A
                move.w  #$000F, $0038(A0)
                clr.w   $0012(A0)
                move.b  #$80, $0001(A0)
                move.w  $0008(A0), D0
                sub.w   ($FFFFEE00).w, D0
                addi.w  #$0080, D0
                move.w  D0, $0008(A0)
                move.w  $000C(A0), D0
                sub.w   ($FFFFEE04).w, D0
                addi.w  #$0080, D0
                move.w  D0, $000A(A0)
                move.b  #$0C, $0024(A0)
Offset_0x01D44A:
                rts
;-------------------------------------------------------------------------------  
Offset_0x01D44C:
                dc.b    $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02
                dc.b    $02, $02, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $02
                dc.b    $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00
                dc.b    $00, $FF, $FF, $FF, $FF, $FF, $FE, $FE, $FE, $FE, $FE, $FD, $FD, $FD, $FD, $FD
                dc.b    $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FD
                dc.b    $FD, $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF
                dc.b    $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02
                dc.b    $02, $02, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
                dc.b    $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $02
                dc.b    $02, $02, $02, $02, $02, $02, $01, $01, $01, $01, $01, $00, $00, $00, $00, $00
                dc.b    $00, $FF, $FF, $FF, $FF, $FF, $FE, $FE, $FE, $FE, $FE, $FD, $FD, $FD, $FD, $FD
                dc.b    $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC
                dc.b    $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FC, $FD
                dc.b    $FD, $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF
;-------------------------------------------------------------------------------  
Offset_0x01D54C:
                moveq   #$00, D1
                move.b  $001A(A0), D1
                cmpi.b  #$08, D1
                bcs.s   Offset_0x01D590
                cmpi.b  #$0E, D1
                bcc.s   Offset_0x01D590
                cmp.b   $002E(A0), D1
                beq.s   Offset_0x01D590
                move.b  D1, $002E(A0)
                subq.w  #$08, D1
                move.w  D1, D0
                add.w   D1, D1
                add.w   D0, D1
                lsl.w   #$06, D1
                addi.l  #Oxygen_Numbers_Spr, D1                ; Offset_0x07AF80
                move.w  #$9380, D2
                tst.b   $003F(A0)
                beq.s   Offset_0x01D586
                move.w  #$9180, D2
Offset_0x01D586:
                move.w  #$0060, D3
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x00140A
Offset_0x01D590:
                rts
Offset_0x01D592:
                move.l  $003C(A0), A2
                tst.w   $002C(A0)
                bne     Offset_0x01D694
                cmpi.b  #$06, $0024(A2)
                bcc     Offset_0x01D7A8
                btst    #$06, $0022(A2)
                beq     Offset_0x01D7A8
                subq.w  #$01, $0038(A0)
                bpl     Offset_0x01D6B8
                move.w  #$003B, $0038(A0)
                move.w  #$0001, $0036(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$0001, D0
                move.b  D0, $0034(A0)
                moveq   #$00, D0
                move.b  $0028(A2), D0
                cmpi.w  #$0019, D0
                beq.s   Offset_0x01D618
                cmpi.w  #$0014, D0
                beq.s   Offset_0x01D618
                cmpi.w  #$000F, D0
                beq.s   Offset_0x01D618
                cmpi.w  #$000C, D0
                bhi.s   Offset_0x01D628
                bne.s   Offset_0x01D604
                tst.b   $003F(A0)
                bne.s   Offset_0x01D604
                move.w  #Panic_Snd, D0          ; $009F
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x01D604:
                subq.b  #$01, $0032(A0)
                bpl.s   Offset_0x01D628
                move.b  $0033(A0), $0032(A0)
                bset    #$07, $0036(A0)
                bra.s   Offset_0x01D628
Offset_0x01D618:
                tst.b   $003F(A0)
                bne.s   Offset_0x01D628
                move.w  #Underwater_Sfx, D0     ; $00C2
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x01D628:
                subq.b  #$01, $0028(A2)
                bcc     Offset_0x01D6B6
                move.b  #$81, $002A(A2)
                move.w  #Drowning_Sfx, D0       ; $00B2
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.b  #$0A, $0034(A0)
                move.w  #$0001, $0036(A0)
                move.w  #$0078, $002C(A0)
                move.l  A2, A1
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                move.l  A0, -(A7)
                move.l  A2, A0
                bsr     Sonic_ResetOnFloor                     ; Offset_0x01B01E
                move.b  #$17, $001C(A0)
                bset    #$01, $0022(A0)
                bset    #$07, $0002(A0)
                move.w  #$0000, $0012(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0014(A0)
                move.l  (A7)+, A0
                cmpa.w  #$B000, A2
                bne.s   Offset_0x01D692
                move.b  #$01, ($FFFFEEDC).w
Offset_0x01D692:
                rts
Offset_0x01D694:
                subq.w  #$01, $002C(A0)
                bne.s   Offset_0x01D6A2
                move.b  #$06, $0024(A2)
                rts
Offset_0x01D6A2:
                move.l  A0, -(A7)
                move.l  A2, A0
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0010, $0012(A0)
                move.l  (A7)+, A0
                bra.s   Offset_0x01D6B8
Offset_0x01D6B6:
                bra.s   Offset_0x01D6C8
Offset_0x01D6B8:
                tst.w   $0036(A0)
                beq     Offset_0x01D7A8
                subq.w  #$01, $003A(A0)
                bpl     Offset_0x01D7A8
Offset_0x01D6C8:
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$000F, D0
                addq.w  #$08, D0
                move.w  D0, $003A(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x01D7A8
                move.b  $0000(A0), $0000(A1)
                move.w  $0008(A2), $0008(A1)
                moveq   #$06, D0
                btst    #$00, $0022(A2)
                beq.s   Offset_0x01D700
                neg.w   D0
                move.b  #$40, $0026(A1)
Offset_0x01D700:
                add.w   D0, $0008(A1)
                move.w  $000C(A2), $000C(A1)
                move.l  $003C(A0), $003C(A1)
                move.b  #$06, $0028(A1)
                tst.w   $002C(A0)
                beq     Offset_0x01D752
                andi.w  #$0007, $003A(A0)
                addi.w  #$0000, $003A(A0)
                move.w  $000C(A2), D0
                subi.w  #$000C, D0
                move.w  D0, $000C(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.b  D0, $0026(A1)
                move.w  ($FFFFFE04).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x01D79E
                move.b  #$0E, $0028(A1)
                bra.s   Offset_0x01D79E
Offset_0x01D752:
                btst    #$07, $0036(A0)
                beq.s   Offset_0x01D79E
                moveq   #$00, D2
                move.b  $0028(A2), D2
                cmpi.b  #$0C, D2
                bcc.s   Offset_0x01D79E
                lsr.w   #$01, D2
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$0003, D0
                bne.s   Offset_0x01D786
                bset    #$06, $0036(A0)
                bne.s   Offset_0x01D79E
                move.b  D2, $0028(A1)
                move.w  #$001C, $0038(A1)
Offset_0x01D786:
                tst.b   $0034(A0)
                bne.s   Offset_0x01D79E
                bset    #$06, $0036(A0)
                bne.s   Offset_0x01D79E
                move.b  D2, $0028(A1)
                move.w  #$001C, $0038(A1)
Offset_0x01D79E:
                subq.b  #$01, $0034(A0)
                bpl.s   Offset_0x01D7A8
                clr.w   $0036(A0)
Offset_0x01D7A8:
                rts   
;===============================================================================
; Objeto 0x0A - Objeto de controle do Sonic / Miles embaixo da água
; [ Término ]
;===============================================================================  