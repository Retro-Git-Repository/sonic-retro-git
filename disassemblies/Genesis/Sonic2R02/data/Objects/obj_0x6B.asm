;===============================================================================
; Objeto 0x6B - Plataformas na Metropolis / Blocos na Chemical Plant
; [ Início ]
;===============================================================================     
Offset_0x027B1A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x027B28(PC, D0), D1
                jmp     Offset_0x027B28(PC, D1)
Offset_0x027B28:
                dc.w    Offset_0x027B34-Offset_0x027B28
                dc.w    Offset_0x027BBE-Offset_0x027B28
Offset_0x027B2C:
                dc.b    $20, $0C, $01, $00, $10, $10, $00, $00
Offset_0x027B34:
                addq.b  #$02, $0024(A0)
                move.l  #Mz_Platform_Mappings, $0004(A0)       ; Offset_0x026CD4
                move.w  #$6000, $0002(A0)
                cmpi.b  #$0D, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x027B5C
                move.l  #CPz_Block_Mappings, $0004(A0)         ; Offset_0x027DC2
                move.w  #$6418, $0002(A0)
Offset_0x027B5C:
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$02, D0
                andi.w  #$001C, D0
                lea     Offset_0x027B2C(PC, D0), A2
                move.b  (A2)+, $0019(A0)
                move.b  (A2)+, $0016(A0)
                move.b  (A2)+, $001A(A0)
                move.w  $0008(A0), $0034(A0)
                move.w  $000C(A0), $0030(A0)
                move.b  $0022(A0), $002E(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                subq.w  #$08, D0
                bcs.s   Offset_0x027BBE
                lsl.w   #$02, D0
                lea     ($FFFFFE8A).w, A2
                lea     $00(A2, D0), A2
                tst.w   (A2)
                bpl.s   Offset_0x027BBE
                bchg    #00, $002E(A0)
Offset_0x027BBE:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                add.w   D0, D0
                move.w  Offset_0x027C02(PC, D0), D1
                jsr     Offset_0x027C02(PC, D1)
                move.w  (A7)+, D4
                tst.b   $0001(A0)
                bpl.s   Offset_0x027BF8
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
Offset_0x027BF8:
                move.w  $0034(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x027C02:
                dc.w    Offset_0x027C1A-Offset_0x027C02
                dc.w    Offset_0x027C1C-Offset_0x027C02
                dc.w    Offset_0x027C28-Offset_0x027C02
                dc.w    Offset_0x027C4A-Offset_0x027C02
                dc.w    Offset_0x027C56-Offset_0x027C02
                dc.w    Offset_0x027C78-Offset_0x027C02
                dc.w    Offset_0x027C96-Offset_0x027C02
                dc.w    Offset_0x027CC2-Offset_0x027C02
                dc.w    Offset_0x027D02-Offset_0x027C02
                dc.w    Offset_0x027D14-Offset_0x027C02
                dc.w    Offset_0x027D24-Offset_0x027C02
                dc.w    Offset_0x027D34-Offset_0x027C02
Offset_0x027C1A:
                rts
Offset_0x027C1C:
                move.w  #$0040, D1
                moveq   #$00, D0
                move.b  ($FFFFFE68).w, D0
                bra.s   Offset_0x027C32
Offset_0x027C28:
                move.w  #$0080, D1
                moveq   #$00, D0
                move.b  ($FFFFFE7C).w, D0
Offset_0x027C32:
                btst    #$00, $0022(A0)
                beq.s   Offset_0x027C3E
                neg.w   D0
                add.w   D1, D0
Offset_0x027C3E:
                move.w  $0034(A0), D1
                sub.w   D0, D1
                move.w  D1, $0008(A0)
                rts
Offset_0x027C4A:
                move.w  #$0040, D1
                moveq   #$00, D0
                move.b  ($FFFFFE68).w, D0
                bra.s   Offset_0x027C60
Offset_0x027C56:
                move.w  #$0080, D1
                moveq   #$00, D0
                move.b  ($FFFFFE7C).w, D0
Offset_0x027C60:
                btst    #$00, $0022(A0)
                beq.s   Offset_0x027C6C
                neg.w   D0
                add.w   D1, D0
Offset_0x027C6C:
                move.w  $0030(A0), D1
                sub.w   D0, D1
                move.w  D1, $000C(A0)
                rts
Offset_0x027C78:
                move.b  ($FFFFFE60).w, D0
                lsr.w   #$01, D0
                add.w   $0030(A0), D0
                move.w  D0, $000C(A0)
                move.b  $0022(A0), D1
                andi.b  #$18, D1
                beq.s   Offset_0x027C94
                addq.b  #$01, $0028(A0)
Offset_0x027C94:
                rts
Offset_0x027C96:
                move.l  $000C(A0), D3
                move.w  $0012(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D3, $000C(A0)
                addq.w  #$08, $0012(A0)
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x027CC0
                move.b  #$00, $0028(A0)
Offset_0x027CC0:
                rts
Offset_0x027CC2:
                tst.b   $0038(A0)
                bne.s   Offset_0x027CD8
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x027D00
                move.b  #$08, $0038(A0)
Offset_0x027CD8:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                andi.w  #$07FF, $000C(A0)
                cmpi.w  #$02A8, $0012(A0)
                bne.s   Offset_0x027CF0
                neg.b   $0038(A0)
Offset_0x027CF0:
                move.b  $0038(A0), D1
                ext.w   D1
                add.w   D1, $0012(A0)
                bne.s   Offset_0x027D00
                clr.b   $0028(A0)
Offset_0x027D00:
                rts
Offset_0x027D02:
                move.w  #$0010, D1
                moveq   #$00, D0
                move.b  ($FFFFFE88).w, D0
                lsr.w   #$01, D0
                move.w  ($FFFFFE8A).w, D3
                bra.s   Offset_0x027D42
Offset_0x027D14:
                move.w  #$0030, D1
                moveq   #$00, D0
                move.b  ($FFFFFE8C).w, D0
                move.w  ($FFFFFE8E).w, D3
                bra.s   Offset_0x027D42
Offset_0x027D24:
                move.w  #$0050, D1
                moveq   #$00, D0
                move.b  ($FFFFFE90).w, D0
                move.w  ($FFFFFE92).w, D3
                bra.s   Offset_0x027D42
Offset_0x027D34:
                move.w  #$0070, D1
                moveq   #$00, D0
                move.b  ($FFFFFE94).w, D0
                move.w  ($FFFFFE96).w, D3
Offset_0x027D42:
                tst.w   D3
                bne.s   Offset_0x027D50
                addq.b  #$01, $002E(A0)
                andi.b  #$03, $002E(A0)
Offset_0x027D50:
                move.b  $002E(A0), D2
                andi.b  #$03, D2
                bne.s   Offset_0x027D70
                sub.w   D1, D0
                add.w   $0034(A0), D0
                move.w  D0, $0008(A0)
                neg.w   D1
                add.w   $0030(A0), D1
                move.w  D1, $000C(A0)
                rts
Offset_0x027D70:
                subq.b  #$01, D2
                bne.s   Offset_0x027D8E
                subq.w  #$01, D1
                sub.w   D1, D0
                neg.w   D0
                add.w   $0030(A0), D0
                move.w  D0, $000C(A0)
                addq.w  #$01, D1
                add.w   $0034(A0), D1
                move.w  D1, $0008(A0)
                rts
Offset_0x027D8E:
                subq.b  #$01, D2
                bne.s   Offset_0x027DAC
                subq.w  #$01, D1
                sub.w   D1, D0
                neg.w   D0
                add.w   $0034(A0), D0
                move.w  D0, $0008(A0)
                addq.w  #$01, D1
                add.w   $0030(A0), D1
                move.w  D1, $000C(A0)
                rts
Offset_0x027DAC:
                sub.w   D1, D0
                add.w   $0030(A0), D0
                move.w  D0, $000C(A0)
                neg.w   D1
                add.w   $0034(A0), D1
                move.w  D1, $0008(A0)
                rts
;-------------------------------------------------------------------------------
CPz_Block_Mappings: ; Offset_0x027DC2:
                dc.w    Offset_0x027DC4-CPz_Block_Mappings
Offset_0x027DC4:
                dc.w    $0001
                dc.l    $F00F0000, $0000FFF0
;===============================================================================
; Objeto 0x6B - Plataformas na Metropolis / Blocos na Chemical Plant
; [ Término ]
;===============================================================================  