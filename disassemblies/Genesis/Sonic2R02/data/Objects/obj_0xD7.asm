;===============================================================================
; Objeto 0xD7 - Bumpers azuis na Casino Night
; [ Início ]
;===============================================================================  
Offset_0x02C04E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02C05C(PC, D0), D1
                jmp     Offset_0x02C05C(PC, D1)
Offset_0x02C05C:
                dc.w    Offset_0x02C060-Offset_0x02C05C
                dc.w    Offset_0x02C0B4-Offset_0x02C05C
Offset_0x02C060:
                addq.b  #$02, $0024(A0)
                move.l  #Blue_Bumper_Mappings, $0004(A0)       ; Offset_0x02C238
                move.w  #$4394, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  #$CA, $0020(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02C09E
                move.b  #$01, $0034(A0)
Offset_0x02C09E:
                move.w  $0008(A0), D0
                move.w  D0, D1
                subi.w  #$0060, D0
                move.w  D0, $0030(A0)
                addi.w  #$0060, D1
                move.w  D1, $0032(A0)
Offset_0x02C0B4:
                move.b  $0021(A0), D0
                beq     Offset_0x02C186
                lea     ($FFFFB000).w, A1
                bclr    #$00, $0021(A0)
                beq.s   Offset_0x02C0CA
                bsr.s   Offset_0x02C0E0
Offset_0x02C0CA:
                lea     ($FFFFB040).w, A1
                bclr    #$01, $0021(A0)
                beq.s   Offset_0x02C0D8
                bsr.s   Offset_0x02C0E0
Offset_0x02C0D8:
                clr.b   $0021(A0)
                bra     Offset_0x02C186
Offset_0x02C0E0:
                move.w  $0008(A0), D1
                move.w  $000C(A0), D2
                sub.w   $0008(A1), D1
                sub.w   $000C(A1), D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                addi.b  #$20, D0
                andi.w  #$00C0, D0
                cmpi.w  #$0040, D0
                beq.s   Offset_0x02C11E
                cmpi.w  #$0080, D0
                beq.s   Offset_0x02C13C
                cmpi.w  #$00C0, D0
                beq.s   Offset_0x02C14A
                move.w  #$F800, $0010(A1)
                move.b  #$02, $001C(A0)
                bra.s   Offset_0x02C166
Offset_0x02C11E:
                subi.w  #$0200, $0010(A1)
                tst.w   D1
                bpl.s   Offset_0x02C12E
                addi.w  #$0400, $0010(A1)
Offset_0x02C12E:
                move.w  #$F800, $0012(A1)
                move.b  #$01, $001C(A0)
                bra.s   Offset_0x02C166
Offset_0x02C13C:
                move.w  #$0800, $0010(A1)
                move.b  #$02, $001C(A0)
                bra.s   Offset_0x02C166
Offset_0x02C14A:
                subi.w  #$0200, $0010(A1)
                tst.w   D1
                bpl.s   Offset_0x02C15A
                addi.w  #$0400, $0010(A1)
Offset_0x02C15A:
                move.w  #$0800, $0012(A1)
                move.b  #$01, $001C(A0)
Offset_0x02C166:
                bset    #$01, $0022(A1)
                bclr    #$04, $0022(A1)
                bclr    #$05, $0022(A1)
                clr.b   $003C(A1)
                move.w  #Bumper_Sfx, D0         ; $00B4
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02C186:
                lea     (Blue_Bumper_Animate_Data), A1         ; Offset_0x02C222
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                tst.b   $0028(A0)
                beq     Offset_0x02C21C
                tst.b   $0034(A0)
                beq.s   Offset_0x02C1B8
                move.w  $0008(A0), D0
                subq.w  #$01, D0
                cmp.w   $0030(A0), D0
                bne.s   Offset_0x02C1B2
                move.b  #$00, $0034(A0)
Offset_0x02C1B2:
                move.w  D0, $0008(A0)
                bra.s   Offset_0x02C1CE
Offset_0x02C1B8:
                move.w  $0008(A0), D0
                addq.w  #$01, D0
                cmp.w   $0032(A0), D0
                bne.s   Offset_0x02C1CA
                move.b  #$01, $0034(A0)
Offset_0x02C1CA:
                move.w  D0, $0008(A0)
Offset_0x02C1CE:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x02C1DA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02C1DA:
                move.w  $0030(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bls.s   Offset_0x02C1FE
                move.w  $0032(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x02C204
Offset_0x02C1FE:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02C204:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x02C216
                bclr    #$07, $02(A2, D0)
Offset_0x02C216:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02C21C:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Blue_Bumper_Animate_Data: ; Offset_0x02C222:
                dc.w    Offset_0x02C228-Blue_Bumper_Animate_Data
                dc.w    Offset_0x02C22C-Blue_Bumper_Animate_Data
                dc.w    Offset_0x02C232-Blue_Bumper_Animate_Data
Offset_0x02C228:
                dc.b    $0F, $00, $FF, $00
Offset_0x02C22C:
                dc.b    $03, $01, $00, $01, $FD, $00
Offset_0x02C232:
                dc.b    $03, $02, $00, $02, $FD, $00
;-------------------------------------------------------------------------------
Blue_Bumper_Mappings: ; Offset_0x02C238:
                dc.w    Offset_0x02C23E-Blue_Bumper_Mappings
                dc.w    Offset_0x02C260-Blue_Bumper_Mappings
                dc.w    Offset_0x02C282-Blue_Bumper_Mappings
Offset_0x02C23E:
                dc.w    $0004
                dc.l    $F0090000, $0000FFE8, $F0090800, $08000000
                dc.l    $00091000, $1000FFE8, $00091800, $18000000
Offset_0x02C260:
                dc.w    $0004
                dc.l    $F4090000, $0000FFE8, $F4090800, $08000000
                dc.l    $04091000, $1000FFE8, $04091800, $18000000
Offset_0x02C282:
                dc.w    $0004
                dc.l    $F0090000, $0000FFEC, $F0090800, $08000004
                dc.l    $00091000, $1000FFEC, $00091800, $18000004                                                                                                                                 
;===============================================================================
; Objeto 0xD7 - Bumpers azuis na Casino Night
; [ Término ]
;===============================================================================