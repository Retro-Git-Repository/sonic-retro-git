;===============================================================================
; Objeto 0x2F - Obstáculo quebravél no chão na Hill Top
; [ Início ]
;=============================================================================== 
Offset_0x0231E8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0231F6(PC, D0), D1
                jmp     Offset_0x0231F6(PC, D1)
Offset_0x0231F6:
                dc.w    Offset_0x023206-Offset_0x0231F6
                dc.w    Offset_0x023252-Offset_0x0231F6
                dc.w    Offset_0x0233CC-Offset_0x0231F6
;-------------------------------------------------------------------------------  
Offset_0x0231FC:
                dc.b    $24, $00, $20, $02, $18, $04, $10, $06, $08, $08
;-------------------------------------------------------------------------------                  
Offset_0x023206:
                addq.b  #$02, $0024(A0)
                move.l  #Breakable_Floor_Mappings, $0004(A0)   ; Offset_0x0235FC
                move.w  #$C000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$001E, D0
                lea     Offset_0x0231FC(PC, D0), A2
                move.b  (A2)+, $0016(A0)
                move.b  (A2)+, $001A(A0)
                move.b  #$20, $0016(A0)
                bset    #$04, $0001(A0)
Offset_0x023252:
                move.w  ($FFFFF7D0).w, $0038(A0)
                move.b  ($FFFFB01C).w, $0032(A0)
                move.b  ($FFFFB05C).w, $0033(A0)
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x023292
Offset_0x02328C:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x023292:
                cmpi.b  #$18, D0
                bne.s   Offset_0x0232F6
                cmpi.b  #$02, $0032(A0)
                bne.s   Offset_0x0232AE
                tst.b   $0028(A0)
                bmi.s   Offset_0x0232DE
                cmpi.b  #$0E, ($FFFFB03E).w
                beq.s   Offset_0x0232DE
Offset_0x0232AE:
                move.b  #$0C, ($FFFFB03E).w
                move.b  #$0D, ($FFFFB03F).w
                cmpi.b  #$02, $0033(A0)
                bne.s   Offset_0x0232D0
                tst.b   $0028(A0)
                bmi.s   Offset_0x0232DE
                cmpi.b  #$0E, ($FFFFB07E).w
                beq.s   Offset_0x0232DE
Offset_0x0232D0:
                move.b  #$0C, ($FFFFB07E).w
                move.b  #$0D, ($FFFFB07F).w
                bra.s   Offset_0x02328C
Offset_0x0232DE:
                lea     ($FFFFB000).w, A1
                move.b  $0032(A0), D0
                bsr.s   Offset_0x02332C
                lea     ($FFFFB040).w, A1
                move.b  $0033(A0), D0
                bsr.s   Offset_0x02332C
                bra     Offset_0x023392
Offset_0x0232F6:
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x02335E
                cmpi.b  #$02, $0032(A0)
                bne.s   Offset_0x023314
                tst.b   $0028(A0)
                bmi.s   Offset_0x023324
                cmpi.b  #$0E, ($FFFFB03E).w
                beq.s   Offset_0x023324
Offset_0x023314:
                move.b  #$0C, ($FFFFB03E).w
                move.b  #$0D, ($FFFFB03F).w
                bra     Offset_0x02328C
Offset_0x023324:
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x023332
                bra.s   Offset_0x023392
Offset_0x02332C:
                cmpi.b  #$02, D0
                bne.s   Offset_0x02334A
Offset_0x023332:
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
Offset_0x02334A:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                rts
Offset_0x02335E:
                andi.b  #$10, D0
                beq     Offset_0x02328C
                cmpi.b  #$02, $0033(A0)
                bne.s   Offset_0x02337C
                tst.b   $0028(A0)
                bmi.s   Offset_0x02338C
                cmpi.b  #$0E, ($FFFFB07E).w
                beq.s   Offset_0x02338C
Offset_0x02337C:
                move.b  #$0C, ($FFFFB07E).w
                move.b  #$0D, ($FFFFB07F).w
                bra     Offset_0x02328C
Offset_0x02338C:
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x023332
Offset_0x023392:
                move.w  $0038(A0), ($FFFFF7D0).w
                andi.b  #$E7, $0022(A0)
                lea     (Offset_0x0233E6), A4
                moveq   #$00, D0
                move.b  $001A(A0), D0
                addq.b  #$01, $001A(A0)
                move.l  D0, D1
                add.w   D0, D0
                add.w   D0, D0
                lea     $00(A4, D0), A4
                neg.w   D1
                addi.w  #$0009, D1
                move.w  #$0018, D2
                jsr     (Smash_Object)                         ; Offset_0x015D9E
                bsr     Offset_0x0235A8
Offset_0x0233CC:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                tst.b   $0001(A0)
                bpl     Obj_0x2F_0x30_DeleteObject             ; Offset_0x0237AC
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Offset_0x0233E6:
                dc.w    $FF00, $F800, $0100, $F800, $FF20, $F900, $00E0, $F900
                dc.w    $FF40, $FA00, $00C0, $FA00, $FF60, $FB00, $00A0, $FB00
                dc.w    $FF80, $FC00, $0080, $FC00                                    
;===============================================================================
; Objeto 0x2F - Obstáculo quebravél no chão na Hill Top
; [ Término ]
;===============================================================================  