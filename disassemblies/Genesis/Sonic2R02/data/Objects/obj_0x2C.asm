;===============================================================================
; Objeto 0x2C - Folhas soltas na Aquatic Ruin
; [ Início ]
;=============================================================================== 
Offset_0x025F46:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x025F54(PC, D0), D1
                jmp     Offset_0x025F54(PC, D1)
Offset_0x025F54:
                dc.w    Offset_0x025F5E-Offset_0x025F54
                dc.w    Offset_0x025F94-Offset_0x025F54
                dc.w    Offset_0x0260DA-Offset_0x025F54
Offset_0x025F5A:
                dc.b    $D6, $D4, $D5, $00
Offset_0x025F5E:
                addq.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.b  Offset_0x025F5A(PC, D0), $0020(A0)
                move.l  #Lava_Attributes_Mappings, $0004(A0)   ; Offset_0x020DAA
                move.w  #$8680, $0002(A0)
                move.b  #$84, $0001(A0)
                move.b  #$80, $0019(A0)
                move.b  #$04, $0018(A0)
                move.b  $0028(A0), $001A(A0)
Offset_0x025F94:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x026166
                move.b  $0021(A0), D0
                beq.s   Offset_0x026002
                move.w  $002E(A0), D0
                beq.s   Offset_0x025FBE
                add.b   ($FFFFFE05).w, D0
                andi.w  #$000F, D0
                bne.s   Offset_0x025FDA
Offset_0x025FBE:
                lea     ($FFFFB000).w, A2
                bclr    #$00, $0021(A0)
                beq.s   Offset_0x025FFC
                bsr.s   Offset_0x026008
                tst.w   $002E(A0)
                bne.s   Offset_0x025FFC
                move.w  ($FFFFFE04).w, $002E(A0)
                bra.s   Offset_0x025FFC
Offset_0x025FDA:
                addq.w  #$08, D0
                andi.w  #$000F, D0
                bne.s   Offset_0x025FFC
                lea     ($FFFFB040).w, A2
                bclr    #$01, $0021(A0)
                beq.s   Offset_0x025FFC
                bsr.s   Offset_0x026008
                tst.w   $002E(A0)
                bne.s   Offset_0x025FFC
                move.w  ($FFFFFE04).w, $002E(A0)
Offset_0x025FFC:
                clr.b   $0021(A0)
                rts
Offset_0x026002:
                clr.w   $002E(A0)
                rts
Offset_0x026008:
                move.w  $0010(A2), D0
                bpl.s   Offset_0x026010
                neg.w   D0
Offset_0x026010:
                cmpi.w  #$0200, D0
                bcc.s   Offset_0x026024
                move.w  $0012(A2), D0
                bpl.s   Offset_0x02601E
                neg.w   D0
Offset_0x02601E:
                cmpi.w  #$0200, D0
                bcs.s   Offset_0x026002
Offset_0x026024:
                lea     (Offset_0x0260CA), A3
                moveq   #$03, D6
Offset_0x02602C:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x0260BC
                move.b  #$2C, $0000(A1)
                move.b  #$04, $0024(A1)
                move.w  $0008(A2), $0008(A1)
                move.w  $000C(A2), $000C(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$000F, D0
                subq.w  #$08, D0
                add.w   D0, $0008(A1)
                swap.w  D0
                andi.w  #$000F, D0
                subq.w  #$08, D0
                add.w   D0, $000C(A1)
                move.w  (A3)+, $0010(A1)
                move.w  (A3)+, $0012(A1)
                btst    #$00, $0022(A2)
                beq.s   Offset_0x02607E
                neg.w   $0010(A1)
Offset_0x02607E:
                move.w  $0008(A1), $0030(A1)
                move.w  $000C(A1), $0034(A1)
                andi.b  #$01, D0
                move.b  D0, $001A(A1)
                move.l  #Leaves_Mappings, $0004(A1)            ; Offset_0x02616C
                move.w  #$E410, $0002(A1)
                move.b  #$84, $0001(A1)
                move.b  #$08, $0019(A1)
                move.b  #$01, $0018(A1)
                move.b  #$04, $0038(A1)
                move.b  D1, $0026(A0)
Offset_0x0260BC:
                dbra    D6, Offset_0x02602C
                move.w  #Leaves_Sfx, D0         ; $00E5
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------
Offset_0x0260CA:
                dc.w    $FF80, $FF80, $00C0, $FFC0, $FF40, $0040, $0080, $0080
;-------------------------------------------------------------------------------
Offset_0x0260DA:
                move.b  $0038(A0), D0
                add.b   D0, $0026(A0)
                add.b   ($FFFFFE0F).w, D0
                andi.w  #$001F, D0
                bne.s   Offset_0x0260F8
                add.b   D7, D0
                andi.b  #$01, D0
                beq.s   Offset_0x0260F8
                neg.b   $0038(A0)
Offset_0x0260F8:
                move.l  $0030(A0), D2
                move.l  $0034(A0), D3
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, $0030(A0)
                move.l  D3, $0034(A0)
                swap.w  D2
                andi.w  #$0003, D3
                addq.w  #$04, D3
                add.w   D3, $0012(A0)
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$06, D0
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                asr.w   #$06, D1
                add.w   $0034(A0), D1
                move.w  D1, $000C(A0)
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x026158
                move.b  #$0B, $001E(A0)
                bchg    #01, $001A(A0)
Offset_0x026158:
                tst.b   $0001(A0)
                bpl     Offset_0x026166
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x026166:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------
Leaves_Mappings: ; Offset_0x02616C:
                dc.w    Offset_0x026174-Leaves_Mappings
                dc.w    Offset_0x02617E-Leaves_Mappings
                dc.w    Offset_0x026188-Leaves_Mappings
                dc.w    Offset_0x026192-Leaves_Mappings
Offset_0x026174:
                dc.w    $0001
                dc.l    $FC000000, $0000FFFC
Offset_0x02617E:
                dc.w    $0001
                dc.l    $FC040001, $0000FFF8
Offset_0x026188:
                dc.w    $0001
                dc.l    $FC040003, $0001FFF8
Offset_0x026192:
                dc.w    $0001
                dc.l    $FC040005, $0002FFF8                         
;===============================================================================
; Objeto 0x2C - Folhas soltas na Aquatic Ruin
; [ Término ]
;===============================================================================  