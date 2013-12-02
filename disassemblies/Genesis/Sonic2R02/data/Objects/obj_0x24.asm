;===============================================================================
; Objeto 0x24 - Bolhas de oxigênio na Aquatic Ruin
; [ Início ]
;===============================================================================  
Offset_0x01F810:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01F81E(PC, D0), D1
                jmp     Offset_0x01F81E(PC, D1)
Offset_0x01F81E:
                dc.w    Offset_0x01F82A-Offset_0x01F81E
                dc.w    Offset_0x01F88E-Offset_0x01F81E
                dc.w    Offset_0x01F8A8-Offset_0x01F81E
                dc.w    Offset_0x01F90A-Offset_0x01F81E
                dc.w    Offset_0x01F928-Offset_0x01F81E
                dc.w    Offset_0x01F92E-Offset_0x01F81E
Offset_0x01F82A:
                addq.b  #$02, $0024(A0)
                move.l  #Sonic_Underwater_Mappings, $0004(A0)  ; Offset_0x01FB6C
                move.w  #$855B, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$84, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x01F874
                addq.b  #$08, $0024(A0)
                andi.w  #$007F, D0
                move.b  D0, $0032(A0)
                move.b  D0, $0033(A0)
                move.b  #$06, $001C(A0)
                bra     Offset_0x01F92E
Offset_0x01F874:
                move.b  D0, $001C(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  #$FF78, $0012(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.b  D0, $0026(A0)
Offset_0x01F88E:
                lea     (Oxygen_Bubbles_Animate_Data), A1      ; Offset_0x01FB40
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                cmpi.b  #$06, $001A(A0)
                bne.s   Offset_0x01F8A8
                move.b  #$01, $002E(A0)
Offset_0x01F8A8:
                move.w  ($FFFFF646).w, D0
                cmp.w   $000C(A0), D0
                bcs.s   Offset_0x01F8C0
                move.b  #$06, $0024(A0)
                addq.b  #$03, $001C(A0)
                bra     Offset_0x01F90A
Offset_0x01F8C0:
                move.b  $0026(A0), D0
                addq.b  #$01, $0026(A0)
                andi.w  #$007F, D0
                lea     (Offset_0x01D44C), A1
                move.b  $00(A1, D0), D0
                ext.w   D0
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                tst.b   $002E(A0)
                beq.s   Offset_0x01F8F2
                bsr     Offset_0x01FA76
                cmpi.b  #$06, $0024(A0)
                beq.s   Offset_0x01F90A
Offset_0x01F8F2:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                tst.b   $0001(A0)
                bpl.s   Offset_0x01F904
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01F904:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x01F90A:
                lea     (Oxygen_Bubbles_Animate_Data), A1      ; Offset_0x01FB40
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                tst.b   $0001(A0)
                bpl.s   Offset_0x01F922
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01F922:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x01F928:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x01F92E:
                tst.w   $0036(A0)
                bne.s   Offset_0x01F990
                move.w  ($FFFFF646).w, D0
                cmp.w   $000C(A0), D0
                bcc     Offset_0x01FA3C
                tst.b   $0001(A0)
                bpl     Offset_0x01FA3C
                subq.w  #$01, $0038(A0)
                bpl     Offset_0x01FA30
                move.w  #$0001, $0036(A0)
Offset_0x01F956:
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.w  D0, D1
                andi.w  #$0007, D0
                cmpi.w  #$0006, D0
                bcc.s   Offset_0x01F956
                move.b  D0, $0034(A0)
                andi.w  #$000C, D1
                lea     (Offset_0x01FA64), A1
                adda.w  D1, A1
                move.l  A1, $003C(A0)
                subq.b  #$01, $0032(A0)
                bpl.s   Offset_0x01F98E
                move.b  $0033(A0), $0032(A0)
                bset    #$07, $0036(A0)
Offset_0x01F98E:
                bra.s   Offset_0x01F998
Offset_0x01F990:
                subq.w  #$01, $0038(A0)
                bpl     Offset_0x01FA30
Offset_0x01F998:
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$001F, D0
                move.w  D0, $0038(A0)
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x01FA14
                move.b  $0000(A0), $0000(A1)
                move.w  $0008(A0), $0008(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$000F, D0
                subq.w  #$08, D0
                add.w   D0, $0008(A1)
                move.w  $000C(A0), $000C(A1)
                moveq   #$00, D0
                move.b  $0034(A0), D0
                move.l  $003C(A0), A2
                move.b  $00(A2, D0), $0028(A1)
                btst    #$07, $0036(A0)
                beq.s   Offset_0x01FA14
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$0003, D0
                bne.s   Offset_0x01FA00
                bset    #$06, $0036(A0)
                bne.s   Offset_0x01FA14
                move.b  #$02, $0028(A1)
Offset_0x01FA00:
                tst.b   $0034(A0)
                bne.s   Offset_0x01FA14
                bset    #$06, $0036(A0)
                bne.s   Offset_0x01FA14
                move.b  #$02, $0028(A1)
Offset_0x01FA14:
                subq.b  #$01, $0034(A0)
                bpl.s   Offset_0x01FA30
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$007F, D0
                addi.w  #$0080, D0
                add.w   D0, $0038(A0)
                clr.w   $0036(A0)
Offset_0x01FA30:
                lea     (Oxygen_Bubbles_Animate_Data), A1      ; Offset_0x01FB40
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x01FA3C:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x01F928
                move.w  ($FFFFF646).w, D0
                cmp.w   $000C(A0), D0
                bcs     Offset_0x01FA5E
                rts
Offset_0x01FA5E:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;------------------------------------------------------------------------------- 
Offset_0x01FA64:
                dc.w    $0001, $0000, $0000, $0100, $0000, $0001, $0001, $0000
                dc.w    $0100
;-------------------------------------------------------------------------------                 
Offset_0x01FA76:
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x01FA80
                lea     ($FFFFB040).w, A1
Offset_0x01FA80:
                tst.b   $002A(A1)
                bmi     Offset_0x01FB3E
                move.w  $0008(A1), D0
                move.w  $0008(A0), D1
                subi.w  #$0010, D1
                cmp.w   D0, D1
                bcc     Offset_0x01FB3E
                addi.w  #$0020, D1
                cmp.w   D0, D1
                bcs     Offset_0x01FB3E
                move.w  $000C(A1), D0
                move.w  $000C(A0), D1
                cmp.w   D0, D1
                bcc     Offset_0x01FB3E
                addi.w  #$0010, D1
                cmp.w   D0, D1
                bcs     Offset_0x01FB3E
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                move.w  #Collect_Oxygen_Sfx, D0 ; $00AD
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                clr.w   $0014(A1)
                move.b  #$15, $001C(A1)
                move.w  #$0023, $002E(A1)
                move.b  #$00, $003C(A1)
                bclr    #$05, $0022(A1)
                bclr    #$04, $0022(A1)
                btst    #$02, $0022(A1)
                beq     Offset_0x01FB2C
                cmpi.b  #$01, (A1)
                bne.s   Offset_0x01FB1C
                bclr    #$02, $0022(A1)
                move.b  #$13, $0016(A1)
                move.b  #$09, $0017(A1)
                subq.w  #$05, $000C(A1)
                bra.s   Offset_0x01FB2C
Offset_0x01FB1C:
                move.b  #$0F, $0016(A1)
                move.b  #$09, $0017(A1)
                subq.w  #$01, $000C(A1)
Offset_0x01FB2C:
                cmpi.b  #$06, $0024(A0)
                beq.s   Offset_0x01FB3E
                move.b  #$06, $0024(A0)
                addq.b  #$03, $001C(A0)
Offset_0x01FB3E:
                rts
;-------------------------------------------------------------------------------
Oxygen_Bubbles_Animate_Data: ; Offset_0x01FB40:                
                dc.w    Offset_0x01FB4E-Oxygen_Bubbles_Animate_Data
                dc.w    Offset_0x01FB54-Oxygen_Bubbles_Animate_Data
                dc.w    Offset_0x01FB5A-Oxygen_Bubbles_Animate_Data
                dc.w    Offset_0x01FB62-Oxygen_Bubbles_Animate_Data
                dc.w    Offset_0x01FB62-Oxygen_Bubbles_Animate_Data
                dc.w    Offset_0x01FB64-Oxygen_Bubbles_Animate_Data
                dc.w    Offset_0x01FB68-Oxygen_Bubbles_Animate_Data
Offset_0x01FB4E:
                dc.b    $0E, $00, $01, $02, $FC, $00
Offset_0x01FB54:
                dc.b    $0E, $01, $02, $03, $04, $FC
Offset_0x01FB5A:
                dc.b    $0E, $02, $03, $04, $05, $06, $FC, $00
Offset_0x01FB62:
                dc.b    $04, $FC
Offset_0x01FB64:
                dc.b    $04, $06, $07, $FC
Offset_0x01FB68:
                dc.b    $0F, $0E, $0F, $FF
;===============================================================================
; Objeto 0x24 - Bolhas de oxigênio na Aquatic Ruin
; [ Término ]
;===============================================================================  