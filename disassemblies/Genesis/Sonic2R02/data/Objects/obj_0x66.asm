;===============================================================================
; Objeto 0x66 - Objeto para as molas triangulares nas paredes da Metropolis
; [ Início ]
;=============================================================================== 
Offset_0x026D4C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x026D5A(PC, D0), D1
                jmp     Offset_0x026D5A(PC, D1)
Offset_0x026D5A:
                dc.w    Offset_0x026D5E-Offset_0x026D5A
                dc.w    Offset_0x026DA4-Offset_0x026D5A
Offset_0x026D5E:
                addq.b  #$02, $0024(A0)
                move.l  #Springs_Wall_Mappings, $0004(A0)      ; Offset_0x026F20
                move.w  #$8680, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$08, $0019(A0)
                move.b  #$04, $0018(A0)
                move.b  #$40, $0016(A0)
                move.b  $0028(A0), D0
                lsr.b   #$04, D0
                andi.b  #$07, D0
                move.b  D0, $001A(A0)
                beq.s   Offset_0x026DA4
                move.b  #$80, $0016(A0)
Offset_0x026DA4:
                move.w  #$0013, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                cmpi.b  #$01, D4
                bne.s   Offset_0x026DEE
                btst    #$01, $0022(A1)
                beq.s   Offset_0x026DEE
                move.b  $0022(A0), D1
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcs.s   Offset_0x026DE6
                eori.b  #$01, D1
Offset_0x026DE6:
                andi.b  #$01, D1
                bne.s   Offset_0x026DEE
                bsr.s   Offset_0x026E42
Offset_0x026DEE:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                cmpi.b  #$01, D4
                bne.s   Offset_0x026E26
                btst    #$01, $0022(A1)
                beq.s   Offset_0x026E26
                move.b  $0022(A0), D1
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcs.s   Offset_0x026E1E
                eori.b  #$01, D1
Offset_0x026E1E:
                andi.b  #$01, D1
                bne.s   Offset_0x026E26
                bsr.s   Offset_0x026E42
Offset_0x026E26:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x026E3C
                rts
Offset_0x026E3C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x026E42:
                cmpi.b  #$04, $0024(A1)
                bcs.s   Offset_0x026E4C
                rts
Offset_0x026E4C:
                move.w  $0030(A0), $0010(A1)
                move.w  #$F800, $0010(A1)
                move.w  #$F800, $0012(A1)
                bset    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x026E76
                bclr    #$00, $0022(A1)
                neg.w   $0010(A1)
Offset_0x026E76:
                move.w  #$000F, $002E(A1)
                move.w  $0010(A1), $0014(A1)
                btst    #$02, $0022(A1)
                bne.s   Offset_0x026E90
                move.b  #$00, $001C(A1)
Offset_0x026E90:
                move.b  $0028(A0), D0
                bpl.s   Offset_0x026E9C
                move.w  #$0000, $0012(A1)
Offset_0x026E9C:
                btst    #$00, D0
                beq.s   Offset_0x026EDC
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$01, $002C(A1)
                move.b  #$08, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x026ECC
                move.b  #$03, $002C(A1)
Offset_0x026ECC:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x026EDC
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x026EDC:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x026EF2
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x026EF2:
                cmpi.b  #$08, D0
                bne.s   Offset_0x026F04
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x026F04:
                bclr    #$05, $0022(A0)
                bclr    #$06, $0022(A0)
                bclr    #$05, $0022(A1)
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------                
Springs_Wall_Mappings: ; Offset_0x026F20:
                dc.w    Offset_0x026F24-Springs_Wall_Mappings
                dc.w    Offset_0x026F36-Springs_Wall_Mappings
Offset_0x026F24:
                dc.w    $0002
                dc.l    $C0050034, $001AFFF8, $30050034, $001AFFF8
Offset_0x026F36:
                dc.w    $0002
                dc.l    $80050034, $001AFFF8, $70050034, $001AFFF8
;===============================================================================
; Objeto 0x66 - Objeto para as molas triangulares nas paredes da Metropolis
; [ Término ]
;===============================================================================  