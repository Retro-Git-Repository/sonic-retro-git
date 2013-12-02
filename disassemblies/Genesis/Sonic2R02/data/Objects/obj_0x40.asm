;===============================================================================
; Objeto 0x40 - Molas tipo sanfona na Aquatic Ruin, Chemical Plant, Mystic Cave
; [ Início ]
;===============================================================================   
Offset_0x02619C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0261B0(PC, D0), D1
                jsr     Offset_0x0261B0(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0261B0:
                dc.w    Offset_0x0261BA-Offset_0x0261B0
                dc.w    Offset_0x0261F8-Offset_0x0261B0
;-------------------------------------------------------------------------------                 
Offset_0x0261B4:
                dc.w    $FC00, $F600, $F800
;-------------------------------------------------------------------------------                 
Offset_0x0261BA:
                addq.b  #$02, $0024(A0)
                move.l  #Diagonal_Spring_Mappings, $0004(A0)   ; Offset_0x02642C
                move.w  #$0440, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$1C, $0019(A0)
                move.b  #$04, $0018(A0)
                bset    #$07, $0022(A0)
                move.b  $0028(A0), D0
                andi.w  #$0002, D0
                move.w  Offset_0x0261B4(PC, D0), $0030(A0)
Offset_0x0261F8:
                lea     (Diagonal_Spring_Animate_Data), A1     ; Offset_0x02641E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                move.w  #$0027, D1
                move.w  #$0008, D2
                move.w  $0008(A0), D4
                lea     Offset_0x0263CE(PC), A2
                tst.b   $001A(A0)
                beq.s   Offset_0x02621E
                lea     Offset_0x0263F6(PC), A2
Offset_0x02621E:
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                jsr     (SolidObject_3_A1)                     ; Offset_0x019754
                btst    #$03, $0022(A0)
                beq.s   Offset_0x026238
                bsr.s   Offset_0x026254
Offset_0x026238:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                jsr     (SolidObject_3_A1)                     ; Offset_0x019754
                btst    #$04, $0022(A0)
                beq.s   Offset_0x026252
                bsr.s   Offset_0x026254
Offset_0x026252:
                rts
Offset_0x026254:
                btst    #$00, $0022(A0)
                bne.s   Offset_0x02626C
                move.w  $0008(A0), D0
                subi.w  #$0010, D0
                cmp.w   $0008(A1), D0
                bcs.s   Offset_0x02627C
                rts
Offset_0x02626C:
                move.w  $0008(A0), D0
                addi.w  #$0010, D0
                cmp.w   $0008(A1), D0
                bcc.s   Offset_0x02627C
                rts
Offset_0x02627C:
                cmpi.b  #$01, $001C(A0)
                beq.s   Offset_0x02628C
                move.w  #$0100, $001C(A0)
                rts
Offset_0x02628C:
                tst.b   $001A(A0)
                beq.s   Offset_0x026294
                rts
Offset_0x026294:
                move.w  $0008(A0), D0
                subi.w  #$001C, D0
                sub.w   $0008(A1), D0
                neg.w   D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x0262B0
                not.w   D0
                addi.w  #$0027, D0
Offset_0x0262B0:
                tst.w   D0
                bpl.s   Offset_0x0262B6
                moveq   #$00, D0
Offset_0x0262B6:
                lea     (Offset_0x026386), A3
                move.b  $00(A3, D0), D0
                move.w  #$FC00, $0012(A1)
                sub.b   D0, $0012(A1)
                bset    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x0262E0
                bclr    #$00, $0022(A1)
                neg.b   D0
Offset_0x0262E0:
                move.w  $0010(A1), D1
                bpl.s   Offset_0x0262E8
                neg.w   D1
Offset_0x0262E8:
                cmpi.w  #$0400, D1
                bcs.s   Offset_0x0262F2
                sub.b   D0, $0010(A1)
Offset_0x0262F2:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$10, $001C(A1)
                move.b  #$02, $0024(A1)
                move.b  #$00, $0039(A1)
                move.b  $0028(A0), D0
                btst    #$00, D0
                beq.s   Offset_0x026354
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$01, $002C(A1)
                move.b  #$08, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x026344
                move.b  #$03, $002C(A1)
Offset_0x026344:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x026354
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x026354:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x02636A
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x02636A:
                cmpi.b  #$08, D0
                bne.s   Offset_0x02637C
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x02637C:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------  
Offset_0x026386:
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01
                dc.b    $01, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02
                dc.b    $03, $03, $03, $03, $03, $03, $04, $04, $00, $00, $00, $00, $00, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00
;-------------------------------------------------------------------------------  
Offset_0x0263CE:
                dc.b    $08, $08, $08, $08, $08, $08, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $10, $10
                dc.b    $11, $12, $13, $14, $14, $15, $15, $16, $17, $18, $18, $18, $18, $18, $18, $18
                dc.b    $18, $18, $18, $18, $18, $18, $18, $18
;-------------------------------------------------------------------------------  
Offset_0x0263F6:
                dc.b    $08, $08, $08, $08, $08, $08, $08, $09, $0A, $0B, $0C, $0C, $0C, $0C, $0D, $0D
                dc.b    $0D, $0D, $0D, $0D, $0E, $0E, $0F, $0F, $10, $10, $10, $10, $0F, $0F, $0E, $0E
                dc.b    $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D
;------------------------------------------------------------------------------- 
Diagonal_Spring_Animate_Data: ; Offset_0x02641E:     
                dc.w    Offset_0x026422-Diagonal_Spring_Animate_Data
                dc.w    Offset_0x026426-Diagonal_Spring_Animate_Data
Offset_0x026422:
                dc.b    $0F, $00, $FF, $00
Offset_0x026426:
                dc.b    $03, $01, $00, $FD, $00, $00
;-------------------------------------------------------------------------------                 
Diagonal_Spring_Mappings: ; Offset_0x02642C:
                dc.w    Offset_0x026430-Diagonal_Spring_Mappings
                dc.w    Offset_0x026442-Diagonal_Spring_Mappings
Offset_0x026430:
                dc.w    $0002
                dc.l    $E8090000, $0000FFE4, $E80D0006, $0003FFFC
Offset_0x026442:
                dc.w    $0002
                dc.l    $E809000E, $0007FFE4, $E80D0014, $000AFFFC                     
;===============================================================================
; Objeto 0x40 - Molas tipo sanfona na Aquatic Ruin, Chemical Plant, Mystic Cave
; [ Término ]
;===============================================================================  