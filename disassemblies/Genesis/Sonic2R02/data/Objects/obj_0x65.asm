;===============================================================================
; Objeto 0x65 - Plataformas sobre engrenagens na Metropolis 
; [ Início ]
;===============================================================================   
Offset_0x0268E6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0268F4(PC, D0), D1
                jmp     Offset_0x0268F4(PC, D1)
Offset_0x0268F4:
                dc.w    Offset_0x02690C-Offset_0x0268F4
                dc.w    Offset_0x026A26-Offset_0x0268F4
                dc.w    Offset_0x026CAE-Offset_0x0268F4
                dc.w    Offset_0x026CCE-Offset_0x0268F4
Offset_0x0268FC:
                dc.b    $40, $0C, $80, $01, $20, $0C, $40, $03, $10, $10, $20, $00, $40, $0C, $80, $07
Offset_0x02690C:
                addq.b  #$02, $0024(A0)
                move.l  #Mz_Platform_Mappings, $0004(A0)       ; Offset_0x026CD4
                move.w  #$6000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$02, D0
                andi.w  #$001C, D0
                lea     Offset_0x0268FC(PC, D0), A3
                move.b  (A3)+, $0019(A0)
                move.b  (A3)+, $0016(A0)
                lsr.w   #$02, D0
                move.b  D0, $001A(A0)
                cmpi.b  #$01, D0
                bne.s   Offset_0x02695A
                bset    #$07, $0022(A0)
Offset_0x02695A:
                cmpi.b  #$02, D0
                bne.s   Offset_0x026976
                addq.b  #$04, $0024(A0)
                move.l  #Mini_Gear_Mappings, $0004(A0)         ; Offset_0x026D10
                move.w  #$655F, $0002(A0)
                bra     Offset_0x026CCE
Offset_0x026976:
                move.w  $0008(A0), $0034(A0)
                move.w  $000C(A0), $0030(A0)
                moveq   #$00, D0
                move.b  (A3)+, D0
                move.w  D0, $003C(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                bpl     Offset_0x026A20
                andi.b  #$0F, D0
                move.b  D0, $003E(A0)
                move.b  (A3), $0028(A0)
                cmpi.b  #$07, (A3)
                bne.s   Offset_0x0269AC
                move.w  $003C(A0), $003A(A0)
Offset_0x0269AC:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x026A0E
                move.b  $0000(A0), $0000(A1)
                addq.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$FFB4, $0008(A1)
                addi.w  #$0014, $000C(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x0269EA
                subi.w  #$FFE8, $0008(A1)
                bset    #$00, $0001(A1)
Offset_0x0269EA:
                move.l  #Mini_Gear_Mappings, $0004(A1)         ; Offset_0x026D10
                move.w  #$655F, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$04, $0018(A1)
                move.l  A0, $003C(A1)
Offset_0x026A0E:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x026A20
                bclr    #$07, $02(A2, D0)
Offset_0x026A20:
                andi.b  #$0F, $0028(A0)
Offset_0x026A26:
                move.w  $0008(A0), $002E(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                add.w   D0, D0
                move.w  Offset_0x026A88(PC, D0), D1
                jsr     Offset_0x026A88(PC, D1)
                move.w  $002E(A0), D4
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addq.w  #$05, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  $0034(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x026A70
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x026A70:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x026A82
                bclr    #$07, $02(A2, D0)
Offset_0x026A82:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x026A88:
                dc.w    Offset_0x026A98-Offset_0x026A88
                dc.w    Offset_0x026AAE-Offset_0x026A88
                dc.w    Offset_0x026B3E-Offset_0x026A88
                dc.w    Offset_0x026B9E-Offset_0x026A88
                dc.w    Offset_0x026C46-Offset_0x026A88
                dc.w    Offset_0x026C54-Offset_0x026A88
                dc.w    Offset_0x026A9A-Offset_0x026A88
                dc.w    Offset_0x026B1E-Offset_0x026A88
Offset_0x026A98:
                rts
Offset_0x026A9A:
                tst.b   $0038(A0)
                bne.s   Offset_0x026AAC
                subq.w  #$01, $0036(A0)
                bne.s   Offset_0x026ADA
                move.b  #$01, $0038(A0)
Offset_0x026AAC:
                bra.s   Offset_0x026ACC
Offset_0x026AAE:
                tst.b   $0038(A0)
                bne.s   Offset_0x026ACC
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  $003E(A0), D0
                btst    #$00, $00(A2, D0)
                beq.s   Offset_0x026ADA
                move.b  #$01, $0038(A0)
Offset_0x026ACC:
                move.w  $003C(A0), D0
                cmp.w   $003A(A0), D0
                beq.s   Offset_0x026AFC
                addq.w  #$02, $003A(A0)
Offset_0x026ADA:
                move.w  $003A(A0), D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x026AEC
                neg.w   D0
                addi.w  #$0080, D0
Offset_0x026AEC:
                move.w  $0034(A0), D1
                sub.w   D0, D1
                move.w  D1, $0008(A0)
                move.w  D1, $002E(A0)
                rts
Offset_0x026AFC:
                addq.b  #$01, $0028(A0)
                move.w  #$00B4, $0036(A0)
                clr.b   $0038(A0)
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x026ADA
                bset    #$00, $02(A2, D0)
                bra.s   Offset_0x026ADA
Offset_0x026B1E:
                tst.b   $0038(A0)
                bne.s   Offset_0x026B3C
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  $003E(A0), D0
                btst    #$00, $00(A2, D0)
                beq.s   Offset_0x026B5A
                move.b  #$01, $0038(A0)
Offset_0x026B3C:
                bra.s   Offset_0x026B50
Offset_0x026B3E:
                tst.b   $0038(A0)
                bne.s   Offset_0x026B50
                subq.w  #$01, $0036(A0)
                bne.s   Offset_0x026B5A
                move.b  #$01, $0038(A0)
Offset_0x026B50:
                tst.w   $003A(A0)
                beq.s   Offset_0x026B7C
                subq.w  #$02, $003A(A0)
Offset_0x026B5A:
                move.w  $003A(A0), D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x026B6C
                neg.w   D0
                addi.w  #$0080, D0
Offset_0x026B6C:
                move.w  $0034(A0), D1
                sub.w   D0, D1
                move.w  D1, $0008(A0)
                move.w  D1, $002E(A0)
                rts
Offset_0x026B7C:
                subq.b  #$01, $0028(A0)
                move.w  #$00B4, $0036(A0)
                clr.b   $0038(A0)
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x026B5A
                bclr    #$00, $02(A2, D0)
                bra.s   Offset_0x026B5A
Offset_0x026B9E:
                move.w  $0034(A0), D4
                move.w  D4, D5
                btst    #$00, $0022(A0)
                bne.s   Offset_0x026BB6
                subi.w  #$0020, D4
                addi.w  #$0060, D5
                bra.s   Offset_0x026BBE
Offset_0x026BB6:
                subi.w  #$00A0, D4
                subi.w  #$0020, D5
Offset_0x026BBE:
                move.w  $000C(A0), D2
                move.w  D2, D3
                subi.w  #$0010, D2
                addi.w  #$0040, D3
                moveq   #$00, D1
                move.w  ($FFFFB008).w, D0
                cmp.w   D4, D0
                bcs.s   Offset_0x026BE8
                cmp.w   D5, D0
                bcc.s   Offset_0x026BE8
                move.w  ($FFFFB00C).w, D0
                cmp.w   D2, D0
                bcs.s   Offset_0x026BE8
                cmp.w   D3, D0
                bcc.s   Offset_0x026BE8
                moveq   #$01, D1
Offset_0x026BE8:
                move.w  ($FFFFB048).w, D0
                cmp.w   D4, D0
                bcs.s   Offset_0x026C02
                cmp.w   D5, D0
                bcc.s   Offset_0x026C02
                move.w  ($FFFFB04C).w, D0
                cmp.w   D2, D0
                bcs.s   Offset_0x026C02
                cmp.w   D3, D0
                bcc.s   Offset_0x026C02
                moveq   #$01, D1
Offset_0x026C02:
                tst.b   D1
                beq.s   Offset_0x026C18
                move.w  $003C(A0), D0
                cmp.w   $003A(A0), D0
                beq.s   Offset_0x026C44
                addi.w  #$0010, $003A(A0)
                bra.s   Offset_0x026C24
Offset_0x026C18:
                tst.w   $003A(A0)
                beq.s   Offset_0x026C24
                subi.w  #$0010, $003A(A0)
Offset_0x026C24:
                move.w  $003A(A0), D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x026C36
                neg.w   D0
                addi.w  #$0040, D0
Offset_0x026C36:
                move.w  $0034(A0), D1
                sub.w   D0, D1
                move.w  D1, $0008(A0)
                move.w  D1, $002E(A0)
Offset_0x026C44:
                rts
Offset_0x026C46:
                btst    #$03, $0022(A0)
                beq.s   Offset_0x026C52
                addq.b  #$01, $0028(A0)
Offset_0x026C52:
                rts
Offset_0x026C54:
                tst.b   $0038(A0)
                bne.s   Offset_0x026C8E
                addq.w  #$02, $0008(A0)
                cmpi.b  #$05, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x026C7E
                cmpi.w  #$1CC0, $0008(A0)
                beq.s   Offset_0x026C76
                cmpi.w  #$2940, $0008(A0)
                bne.s   Offset_0x026CA0
Offset_0x026C76:
                move.b  #$00, $0028(A0)
                bra.s   Offset_0x026CA0
Offset_0x026C7E:
                cmpi.w  #$1BC0, $0008(A0)
                bne.s   Offset_0x026CA0
                move.b  #$01, $0038(A0)
                bra.s   Offset_0x026CA0
Offset_0x026C8E:
                subq.w  #$02, $0008(A0)
                cmpi.w  #$1880, $0008(A0)
                bne.s   Offset_0x026CA0
                move.b  #$00, $0038(A0)
Offset_0x026CA0:
                move.w  $0008(A0), $0034(A0)
                move.w  $0008(A0), ($FFFFF7B0).w
                rts
Offset_0x026CAE:
                move.l  $003C(A0), A1
                move.w  $003A(A1), D0
Offset_0x026CB6:                
                andi.w  #$0007, D0
                move.b  Offset_0x026CC6(PC, D0), $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Offset_0x026CC6:
                dc.b    $00, $00, $02, $02, $02, $01, $01, $01
;-------------------------------------------------------------------------------                
Offset_0x026CCE:
                move.w  ($FFFFF7B0).w, D0
                bra.s   Offset_0x026CB6
;-------------------------------------------------------------------------------                
Mz_Platform_Mappings: ; Offset_0x026CD4:
                dc.w    Platform_Over_Gear_Mappings-Mz_Platform_Mappings ; Offset_0x026CDC
                dc.w    Automatic_Platform_Mappings-Mz_Platform_Mappings ; Offset_0x026CFE
                dc.w    Platform_Over_Gear_Mappings-Mz_Platform_Mappings ; Offset_0x026CDC
                dc.w    Platform_Over_Gear_Mappings-Mz_Platform_Mappings ; Offset_0x026CDC
Platform_Over_Gear_Mappings: ; Offset_0x026CDC:
                dc.w    $0004
                dc.l    $F40E004B, $0025FFC0, $F40E004B, $0025FFE0
                dc.l    $F40E004B, $00250000, $F40E004B, $00250020
Automatic_Platform_Mappings: ; Offset_0x026CFE:
                dc.w    $0002
                dc.l    $F40E0039, $001CFFE0, $F40E0839, $081C0000
;-------------------------------------------------------------------------------
Mini_Gear_Mappings: ; Offset_0x026D10:
                dc.w    Offset_0x026D16-Mini_Gear_Mappings
                dc.w    Offset_0x026D28-Mini_Gear_Mappings
                dc.w    Offset_0x026D3A-Mini_Gear_Mappings
Offset_0x026D16:
                dc.w    $0002
                dc.l    $F4060000, $0000FFF0, $F4060800, $08000000
Offset_0x026D28:
                dc.w    $0002
                dc.l    $F4060006, $0003FFF0, $F4061806, $18030000
Offset_0x026D3A:
                dc.w    $0002
                dc.l    $F4061006, $1003FFF0, $F4060806, $08030000                            
;===============================================================================
; Objeto 0x65 - Plataformas sobre engrenagens na Metropolis 
; [ Término ]
;===============================================================================  