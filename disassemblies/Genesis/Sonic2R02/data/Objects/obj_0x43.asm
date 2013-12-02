;===============================================================================
; Objeto 0x43 - Bola gigante com espinhos na Oil Ocean
; [ Início ]
;===============================================================================        
Offset_0x023D02:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x023D10(PC, D0), D1
                jmp     Offset_0x023D10(PC, D1)
Offset_0x023D10:
                dc.w    Offset_0x023D28-Offset_0x023D10
                dc.w    Offset_0x023DD0-Offset_0x023D10
                dc.w    Offset_0x023E22-Offset_0x023D10
Offset_0x023D16:
                dc.b    $00, $68
                dc.w    $0000, $0000
                dc.b    $01, $E8
                dc.w    $FFE8, $0018
                dc.b    $01, $A8
                dc.w    $FFA8, $FFD8
Offset_0x023D28:
                addq.b  #$02, $0024(A0)
                move.w  #$C30C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                moveq   #$00, D1
                move.b  $0028(A0), D1
                lea     Offset_0x023D16(PC, D1), A2
                move.b  (A2)+, D1
                move.l  A0, A1
                bra.s   Offset_0x023D6E
Offset_0x023D48:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x023D9A
                move.b  $0000(A0), $0000(A1)
                move.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$01, $0036(A1)
Offset_0x023D6E:
                move.l  #Giant_Spikeball_Mappings, $0004(A1)   ; Offset_0x023EA6
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.b  #$18, $0019(A1)
                move.b  #$A5, $0020(A1)
                move.w  $0008(A1), $0030(A1)
Offset_0x023D9A:
                dbra    D1, Offset_0x023D48
                move.l  A0, $003C(A1)
                move.l  A1, $003C(A0)
                moveq   #$00, D1
                move.b  (A2)+, D1
                move.w  $0030(A0), D0
                sub.w   D1, D0
                move.w  D0, $0032(A0)
                move.w  D0, $0032(A1)
                add.w   D1, D0
                add.w   D1, D0
                move.w  D0, $0034(A0)
                move.w  D0, $0034(A1)
                move.w  (A2)+, D0
                add.w   D0, $0008(A0)
                move.w  (A2)+, D0
                add.w   D0, $0008(A1)
Offset_0x023DD0:
                bsr.s   Offset_0x023E2C
                move.w  $0032(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bls.s   Offset_0x023DF6
                move.w  $0034(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x023DFC
Offset_0x023DF6:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x023DFC:
                move.l  $003C(A0), A1
                cmpa.l  A0, A1
                beq.s   Offset_0x023E0A
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
Offset_0x023E0A:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x023E1C
                bclr    #$07, $02(A2, D0)
Offset_0x023E1C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x023E22:
                bsr.s   Offset_0x023E2C
                bsr.s   Offset_0x023E76
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x023E2C:
                tst.b   $0036(A0)
                bne.s   Offset_0x023E54
                move.w  $0008(A0), D1
                subq.w  #$01, D1
                cmp.w   $0032(A0), D1
                bne.s   Offset_0x023E4E
                move.b  #$01, $0036(A0)
                move.w  #Metal_Colision_Sfx, D0 ; $00D5
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x023E4E:
                move.w  D1, $0008(A0)
                rts
Offset_0x023E54:
                move.w  $0008(A0), D1
                addq.w  #$01, D1
                cmp.w   $0034(A0), D1
                bne.s   Offset_0x023E70
                move.b  #$00, $0036(A0)
                move.w  #Metal_Colision_Sfx, D0 ; $00D5
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x023E70:
                move.w  D1, $0008(A0)
                rts
Offset_0x023E76:
                move.l  $003C(A0), A1
                move.w  $0008(A0), D0
                subi.w  #$0018, D0
                move.w  $0008(A1), D2
                addi.w  #$0018, D2
                cmp.w   D0, D2
                bne.s   Offset_0x023EA4
                eori.b  #$01, $0036(A0)
                eori.b  #$01, $0036(A1)
                move.w  #Metal_Colision_Sfx, D0 ; $00D5
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x023EA4:
                rts
;-------------------------------------------------------------------------------
Giant_Spikeball_Mappings: ; Offset_0x023EA6:
                dc.w    Offset_0x023EA8-Giant_Spikeball_Mappings
Offset_0x023EA8:
                dc.w    $0006
                dc.l    $E0050000, $0000FFE8, $D80F0004, $0002FFF8
                dc.l    $F8090014, $000AFFE8, $F809001A, $000D0000
                dc.l    $10051000, $1000FFE8, $080F1004, $1002FFF8
;===============================================================================
; Objeto 0x43 - Bola gigante com espinhos na Oil Ocean
; [ Término ]
;===============================================================================  