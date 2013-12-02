;===============================================================================
; Objeto 0x7A - Plataformas com movimentos horizontais na Chemical Plant,
; [ Início ]    Mystic Cave
;===============================================================================    
Offset_0x0290A0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0290AE(PC, D0), D1
                jmp     Offset_0x0290AE(PC, D1)
Offset_0x0290AE:
                dc.w    Offset_0x0290CC-Offset_0x0290AE
                dc.w    Offset_0x029192-Offset_0x0290AE
                dc.w    Offset_0x0291F0-Offset_0x0290AE
Offset_0x0290B4:
                dc.b    $00, $68, $FF, $98, $00, $00, $01, $A8, $FF, $50, $00, $40, $01, $E8, $FF, $80
                dc.b    $00, $80, $00, $68, $00, $67, $00, $00
Offset_0x0290CC:
                addq.b  #$02, $0024(A0)
                move.l  #Platform_Horizontal_Mappings, $0004(A0) ; Offset_0x02926C
                move.w  #$E418, $0002(A0)
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x0290F4
                move.l  #MCz_Swing_Platforms_Mappings, $0004(A0) ; Offset_0x01023A
                move.w  #$0000, $0002(A0)
Offset_0x0290F4:
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                moveq   #$00, D1
                move.b  $0028(A0), D1
                lea     Offset_0x0290B4(PC, D1), A2
                move.b  (A2)+, D1
                move.l  A0, A1
                bra.s   Offset_0x02912A
Offset_0x02910A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02914E
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
Offset_0x02912A:
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.b  #$18, $0019(A1)
                move.w  $0008(A1), $0030(A1)
Offset_0x02914E:
                dbra    D1, Offset_0x02910A
                move.l  A0, $003C(A1)
                move.l  A1, $003C(A0)
                cmpi.b  #$0C, $0028(A0)
                bne.s   Offset_0x029168
                move.b  #$01, $0036(A0)
Offset_0x029168:
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
Offset_0x029192:
                bsr.s   Offset_0x0291FA
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x0291A0
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0291A0:
                move.w  $0032(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bls.s   Offset_0x0291C4
                move.w  $0034(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x0291CA
Offset_0x0291C4:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0291CA:
                move.l  $003C(A0), A1
                cmpa.l  A0, A1
                beq.s   Offset_0x0291D8
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
Offset_0x0291D8:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x0291EA
                bclr    #$07, $02(A2, D0)
Offset_0x0291EA:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x0291F0:
                bsr.s   Offset_0x0291FA
                bsr.s   Offset_0x029246
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0291FA:
                move.w  $0008(A0), -(A7)
                tst.b   $0036(A0)
                beq.s   Offset_0x02921C
                move.w  $0008(A0), D0
                subq.w  #$01, D0
                cmp.w   $0032(A0), D0
                bne.s   Offset_0x029216
                move.b  #$00, $0036(A0)
Offset_0x029216:
                move.w  D0, $0008(A0)
                bra.s   Offset_0x029232
Offset_0x02921C:
                move.w  $0008(A0), D0
                addq.w  #$01, D0
                cmp.w   $0034(A0), D0
                bne.s   Offset_0x02922E
                move.b  #$01, $0036(A0)
Offset_0x02922E:
                move.w  D0, $0008(A0)
Offset_0x029232:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                move.w  #$0008, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                rts
Offset_0x029246:
                move.l  $003C(A0), A1
                move.w  $0008(A0), D0
                subi.w  #$0018, D0
                move.w  $0008(A1), D2
                addi.w  #$0018, D2
                cmp.w   D0, D2
                bne.s   Offset_0x02926A
                eori.b  #$01, $0036(A0)
                eori.b  #$01, $0036(A1)
Offset_0x02926A:
                rts
;-------------------------------------------------------------------------------
Platform_Horizontal_Mappings: ; Offset_0x02926C:
                dc.w    Offset_0x02926E-Platform_Horizontal_Mappings
Offset_0x02926E:
                dc.w    $0002
                dc.l    $F8090010, $0008FFE8, $F8090810, $08080000
;===============================================================================
; Objeto 0x7A - Plataformas com movimentos horizontais na Chemical Plant,
; [ Término ]   Mystic Cave
;===============================================================================  