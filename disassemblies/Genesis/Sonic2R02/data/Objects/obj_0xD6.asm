;===============================================================================
; Objeto 0xD6 -> Acionadores dos caça níqueis e pontos extras na Casino Night
; [ Início ]
;===============================================================================    
Offset_0x02B78A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02B798(PC, D0), D1
                jmp     Offset_0x02B798(PC, D1)
Offset_0x02B798:
                dc.w    Offset_0x02B79C-Offset_0x02B798
                dc.w    Offset_0x02B7C6-Offset_0x02B798
Offset_0x02B79C:
                addq.b  #$02, $0024(A0)
                move.l  #Slot_Machine_Starter_Mappings, $0004(A0) ; Offset_0x02BAF0 
                move.w  #$0388, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$18, $0019(A0)
                move.b  #$01, $0018(A0)
Offset_0x02B7C6:
                move.w  #$0023, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  $0008(A0), D4
                lea     $0030(A0), A2
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Offset_0x02B80C
                movem.l (A7)+, D1-D4
                lea     $0034(A0), A2
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                bsr     Offset_0x02B80C
                lea     (Slot_Machine_Starter_Animate_Data), A1 ; Offset_0x02BAE4
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02B80C:
                move.w  (A2), D0
                move.w  Offset_0x02B816(PC, D0), D0
                jmp     Offset_0x02B816(PC, D0)
Offset_0x02B816:                
                dc.w    Offset_0x02B81C-Offset_0x02B816
                dc.w    Offset_0x02BA2A-Offset_0x02B816
                dc.w    Offset_0x02BAD0-Offset_0x02B816
Offset_0x02B81C:
                tst.b   $002A(A1)
                bne     Offset_0x02B8AA
                tst.b   $0028(A0)
                beq.s   Offset_0x02B830
                tst.w   ($FFFFFF4C).w
                bne.s   Offset_0x02B8AA
Offset_0x02B830:
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                tst.w   D4
                bpl.s   Offset_0x02B8AA
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                move.w  #$0000, $0014(A1)
                move.b  #$81, $002A(A1)
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                move.b  #$01, $001C(A0)
                addq.w  #$02, (A2)+
                move.w  #$0078, (A2)
                move.w  A1, $003E(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x02B8AA
                cmpi.b  #$18, ($FFFFFF4E).w
                bne.s   Offset_0x02B8AA
                move.b  #$08, ($FFFFFF4E).w
                clr.w   $002E(A0)
                move.w  #$FFFF, ($FFFFFF4C).w
                move.w  #$FFFF, $002A(A0)
Offset_0x02B8AA:
                rts
Offset_0x02B8AC:
                move.w  ($FFFFFF52).w, D0
                bpl     Offset_0x02B97A
                tst.w   $002A(A0)
                bpl.s   Offset_0x02B8C0
                move.w  #$0064, $002A(A0)
Offset_0x02B8C0:
                tst.w   $002A(A0)
                beq     Offset_0x02B96C
                btst    #$00, ($FFFFFE05).w
                beq     Offset_0x02B974
                cmpi.w  #$0010, $002C(A0)
                bcc     Offset_0x02B974
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x02B974
                move.b  #$D3, $0000(A1) ; Carrega o objeto 0xD3 - Bolas com espinho
                move.l  #Spikeball_Mappings, $0004(A1)         ; Offset_0x02B520
                move.w  #$0380, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$04, $0018(A1)
                move.w  #$001E, $003C(A1)
                move.w  $002E(A0), $002E(A1)
                addi.w  #$0090, $002E(A0)
                move.w  $0008(A0), $0038(A1)
                move.w  $000C(A0), $003A(A1)
                move.w  $002E(A1), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$01, D1
                add.w   $0038(A1), D1
                move.w  D1, $0030(A1)
                move.w  D1, $0008(A1)
                asr.w   #$01, D0
                add.w   $003A(A1), D0
                move.w  D0, $0034(A1)
                move.w  D0, $000C(A1)
                lea     $002C(A0), A2
                move.l  A2, $002A(A1)
                move.w  $003E(A0), $003E(A1)
                addq.w  #$01, $002C(A0)
                subq.w  #$01, $002A(A0)
Offset_0x02B96C:
                tst.w   $002C(A0)
                beq     Offset_0x02BA60
Offset_0x02B974:
                addq.w  #$01, ($FFFFFF72).w
                rts
Offset_0x02B97A:
                beq     Offset_0x02BA22
                btst    #$00, ($FFFFFE05).w
                beq     Offset_0x02BA28
                cmpi.w  #$0010, $002C(A0)
                bcc     Offset_0x02BA28
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x02BA28
                move.b  #$DC, $0000(A1)   ; Carrega o objeto 0xDC - Anéis 
                move.l  #Rings_Mappings, $0004(A1)             ; Offset_0x012328
                move.w  #$26BC, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$08, $0019(A1)
                move.w  #$001A, $003C(A1)
                move.w  $002E(A0), $002E(A1)
                addi.w  #$0089, $002E(A0)
                move.w  $0008(A0), $0038(A1)
                move.w  $000C(A0), $003A(A1)
                move.w  $002E(A1), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$01, D1
                add.w   $0038(A1), D1
                move.w  D1, $0030(A1)
                move.w  D1, $0008(A1)
                asr.w   #$01, D0
                add.w   $003A(A1), D0
                move.w  D0, $0034(A1)
                move.w  D0, $000C(A1)
                lea     $002C(A0), A2
                move.l  A2, $002A(A1)
                move.w  $003E(A0), $003E(A1)
                addq.w  #$01, $002C(A0)
                subq.w  #$01, ($FFFFFF52).w
Offset_0x02BA22:
                tst.w   $002C(A0)
                beq.s   Offset_0x02BA60
Offset_0x02BA28:
                rts
Offset_0x02BA2A:
                tst.b   $0001(A0)
                bpl.s   Offset_0x02BA60
                tst.b   $0028(A0)
                beq.s   Offset_0x02BA5A
                move.w  A1, $003E(A0)
                cmpi.b  #$18, ($FFFFFF4E).w
                beq     Offset_0x02B8AC
                move.b  ($FFFFFE0F).w, D0
                andi.w  #$000F, D0
                bne.s   Offset_0x02BA58
                move.w  #$00C0, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02BA58:
                rts
Offset_0x02BA5A:
                subq.w  #$01, $0002(A2)
                bpl.s   Offset_0x02BA90
Offset_0x02BA60:
                move.w  #$0000, $002C(A0)
                move.b  #$00, $001C(A0)
                move.b  #$00, $002A(A1)
                bclr    D6, $0022(A0)
                bclr    #$03, $0022(A1)
                bset    #$01, $0022(A1)
                move.w  #$0400, $0012(A1)
                addq.w  #$02, (A2)+
                move.w  #$001E, (A2)
                rts
Offset_0x02BA90:
                move.w  $0002(A2), D0
                andi.w  #$000F, D0
                bne.s   Offset_0x02BACE
                move.w  #$00C0, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                moveq   #$0A, D0
                move.w  A1, A3
                jsr     (Add_Points)                           ; Offset_0x040A98
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02BACE
                move.b  #$29, $0000(A1) ; Carrega o objeto 0x29 - Pontos dos inimigos
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$00, $001A(A1)
Offset_0x02BACE:
                rts
Offset_0x02BAD0:
                subq.w  #$01, $0002(A2)
                bpl.s   Offset_0x02BAE2
                clr.w   (A2)
                tst.b   $0028(A0)
                beq.s   Offset_0x02BAE2
                clr.w   ($FFFFFF4C).w
Offset_0x02BAE2:
                rts
;-------------------------------------------------------------------------------
Slot_Machine_Starter_Animate_Data: ; Offset_0x02BAE4:
                dc.w    Offset_0x02BAE8-Slot_Machine_Starter_Animate_Data
                dc.w    Offset_0x02BAEC-Slot_Machine_Starter_Animate_Data
Offset_0x02BAE8:
                dc.b    $0F, $00, $FF, $00
Offset_0x02BAEC:
                dc.b    $01, $01, $00, $FF
;-------------------------------------------------------------------------------    
Slot_Machine_Starter_Mappings: ; Offset_0x02BAF0:
                dc.w    Offset_0x02BAF4-Slot_Machine_Starter_Mappings
                dc.w    Offset_0x02BB26-Slot_Machine_Starter_Mappings
Offset_0x02BAF4:
                dc.w    $0006
                dc.l    $EC090000, $0000FFE8, $EC090800, $08000000
                dc.l    $FC090000, $0000FFE8, $FC090800, $08000000
                dc.l    $0C090000, $0000FFE8, $0C090800, $08000000
Offset_0x02BB26:
                dc.w    $0006
                dc.l    $EC092006, $2003FFE8, $EC092806, $28030000
                dc.l    $FC092006, $2003FFE8, $FC092806, $28030000
                dc.l    $0C092006, $2003FFE8, $0C092806, $28030000
;===============================================================================
; Objeto 0xD6 -> Acionadores dos caça níqueis e pontos extras na Casino Night
; [ Término ]
;===============================================================================
