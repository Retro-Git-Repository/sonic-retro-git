;===============================================================================
; Objeto 0x83 - Três plataformas girando na Aquatic Ruin
; [ Início ]
;===============================================================================   
Offset_0x02A198:
                btst    #$06, $0001(A0)
                bne     Offset_0x02A1B0
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02A1BA(PC, D0), D1
                jmp     Offset_0x02A1BA(PC, D1)
Offset_0x02A1B0:
                move.w  #$0280, D0
                jmp     (DisplaySprite_Param)                  ; Offset_0x0164B6
Offset_0x02A1BA:
                dc.w    Offset_0x02A1C0-Offset_0x02A1BA
                dc.w    Offset_0x02A2C4-Offset_0x02A1BA
                dc.w    Offset_0x02A402-Offset_0x02A1BA
Offset_0x02A1C0:
                addq.b  #$02, $0024(A0)
                move.l  #ARz_Swing_Platforms_Mappings, $0004(A0) ; Offset_0x010202
                move.w  #$0000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$20, $0019(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  $0028(A0), D1
                move.b  D1, D0
                andi.w  #$000F, D1
                andi.b  #$F0, D0
                ext.w   D0
                asl.w   #$03, D0
                move.w  D0, $002E(A0)
                move.b  $0022(A0), D0
                ror.b   #$02, D0
                andi.b  #$C0, D0
                move.b  D0, $0026(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02A27E
                move.b  $0000(A0), $0000(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                bset    #$06, $0001(A1)
                move.b  #$40, $000E(A1)
                moveq   #$08, D1
                move.b  D1, $000F(A1)
                subq.w  #$01, D1
                lea     $0010(A1), A2
Offset_0x02A252:
                addq.w  #$04, A2
                move.w  #$0001, (A2)+
                dbra    D1, Offset_0x02A252
                move.b  #$01, $000B(A1)
                move.b  #$40, $0014(A1)
                bset    #$04, $0001(A1)
                move.l  A1, $0034(A0)
                bsr.s   Offset_0x02A280
                move.l  A1, $0038(A0)
                bsr.s   Offset_0x02A280
                move.l  A1, $003C(A0)
Offset_0x02A27E:
                bra.s   Offset_0x02A2C4
Offset_0x02A280:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02A2C2
                addq.b  #$04, $0024(A1)
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.b  #$20, $0019(A1)
                move.w  $0008(A0), $0030(A1)
                move.w  $000C(A0), $0032(A1)
                move.w  $0008(A0), $002C(A1)
Offset_0x02A2C2:
                rts
Offset_0x02A2C4:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  $002E(A0), D0
                add.w   D0, $0026(A0)
                move.w  $0032(A0), D2
                move.w  $0030(A0), D3
                moveq   #$00, D6
                move.l  $0034(A0), A1
                lea     $0010(A1), A2
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                move.l  D0, D4
                move.l  D1, D5
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, $0008(A1)
                move.w  D4, $000C(A1)
                move.l  D0, D4
                move.l  D1, D5
                add.l   D0, D4
                add.l   D1, D5
                moveq   #$01, D6
                bsr     Offset_0x02A3E2
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, $0008(A0)
                move.w  D4, $000C(A0)
                move.b  $0026(A0), D0
                addi.b  #$55, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                move.l  D0, D4
                move.l  D1, D5
                moveq   #$02, D6
                bsr     Offset_0x02A3E2
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.l  $0038(A0), A1
                move.w  D5, $0008(A1)
                move.w  D4, $000C(A1)
                move.b  $0026(A0), D0
                subi.b  #$55, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                move.l  D0, D4
                move.l  D1, D5
                moveq   #$02, D6
                bsr     Offset_0x02A3E2
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.l  $003C(A0), A1
                move.w  D5, $0008(A1)
                move.w  D4, $000C(A1)
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x02A3B8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02A3B8:
                move.w  $0030(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x02A3D2
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02A3D2:
                move.l  $0034(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02A3E2:
                movem.l D4/D5, -(A7)
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, (A2)+
                move.w  D4, (A2)+
                movem.l (A7)+, D4/D5
                add.l   D0, D4
                add.l   D1, D5
                addq.w  #$02, A2
                dbra    D6, Offset_0x02A3E2
                rts
Offset_0x02A402:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  $002C(A0), D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                move.w  $0008(A0), $002C(A0)
                move.w  $0030(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
;===============================================================================
; Objeto 0x83 - Três plataformas girando na Aquatic Ruin
; [ Término ]
;===============================================================================