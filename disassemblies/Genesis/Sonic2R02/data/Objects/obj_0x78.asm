;===============================================================================
; Objeto 0x78 - Plataformas que giram em torno de si mesmo / Plataformas que 
; [ Início ]    sobem ou descem quando tocadas na Chemical Plant / Escadas
;===============================================================================    
Offset_0x028EDC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x028EF4(PC, D0), D1
                jsr     Offset_0x028EF4(PC, D1)
                move.w  $0030(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x028EF4:                
                dc.w    Offset_0x028EFA-Offset_0x028EF4
                dc.w    Offset_0x028F82-Offset_0x028EF4
                dc.w    Offset_0x028F96-Offset_0x028EF4
Offset_0x028EFA:
                addq.b  #$02, $0024(A0)
                moveq   #$34, D3
                moveq   #$02, D4
                btst    #$00, $0022(A0)
                beq.s   Offset_0x028F0E
                moveq   #$3A, D3
                moveq   #$FFFFFFFE, D4
Offset_0x028F0E:
                move.w  $0008(A0), D2
                move.l  A0, A1
                moveq   #$03, D1
                bra.s   Offset_0x028F28
Offset_0x028F18:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x028F82
                move.b  #$04, $0024(A1)
Offset_0x028F28:
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  #CPz_Block_Mappings, $0004(A1)         ; Offset_0x027DC2
                move.w  #$6418, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$10, $0019(A1)
                move.b  $0028(A0), $0028(A1)
                move.w  D2, $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $0008(A0), $0030(A1)
                move.w  $000C(A1), $0032(A1)
                addi.w  #$0020, D2
                move.b  D3, $002F(A1)
                move.l  A0, $003C(A1)
                add.b   D4, D3
                dbra    D1, Offset_0x028F18
Offset_0x028F82:
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$0007, D0
                add.w   D0, D0
                move.w  Offset_0x028FD0(PC, D0), D1
                jsr     Offset_0x028FD0(PC, D1)
Offset_0x028F96:
                move.l  $003C(A0), A2
                moveq   #$00, D0
                move.b  $002F(A0), D0
                move.w  $00(A2, D0), D0
                add.w   $0032(A0), D0
                move.w  D0, $000C(A0)
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                swap.w  D6
                or.b    D6, $002E(A2)
                rts
Offset_0x028FD0:
                dc.w    Offset_0x028FE0-Offset_0x028FD0
                dc.w    Offset_0x02904C-Offset_0x028FD0
                dc.w    Offset_0x029004-Offset_0x028FD0
                dc.w    Offset_0x02904C-Offset_0x028FD0
                dc.w    Offset_0x028FE0-Offset_0x028FD0
                dc.w    Offset_0x029076-Offset_0x028FD0
                dc.w    Offset_0x029004-Offset_0x028FD0
                dc.w    Offset_0x029076-Offset_0x028FD0
Offset_0x028FE0:
                tst.w   $002C(A0)
                bne.s   Offset_0x028FF8
                move.b  $002E(A0), D0
                andi.b  #$30, D0
                beq.s   Offset_0x028FF6
                move.w  #$001E, $002C(A0)
Offset_0x028FF6:
                rts
Offset_0x028FF8:
                subq.w  #$01, $002C(A0)
                bne.s   Offset_0x028FF6
                addq.b  #$01, $0028(A0)
                rts
Offset_0x029004:
                tst.w   $002C(A0)
                bne.s   Offset_0x02901C
                move.b  $002E(A0), D0
                andi.b  #$0C, D0
                beq.s   Offset_0x02901A
                move.w  #$003C, $002C(A0)
Offset_0x02901A:
                rts
Offset_0x02901C:
                subq.w  #$01, $002C(A0)
                bne.s   Offset_0x029028
                addq.b  #$01, $0028(A0)
                rts
Offset_0x029028:
                lea     $0034(A0), A1
                move.w  $002C(A0), D0
                lsr.b   #$02, D0
                andi.b  #$01, D0
                move.w  D0, (A1)+
                eori.b  #$01, D0
                move.w  D0, (A1)+
                eori.b  #$01, D0
                move.w  D0, (A1)+
                eori.b  #$01, D0
                move.w  D0, (A1)+
                rts
Offset_0x02904C:
                lea     $0034(A0), A1
                cmpi.w  #$0080, (A1)
                beq.s   Offset_0x029074
                addq.w  #$01, (A1)
                moveq   #$00, D1
                move.w  (A1)+, D1
                swap.w  D1
                lsr.l   #$01, D1
                move.l  D1, D2
                lsr.l   #$01, D1
                move.l  D1, D3
                add.l   D2, D3
                swap.w  D1
                swap.w  D2
                swap.w  D3
                move.w  D3, (A1)+
                move.w  D2, (A1)+
                move.w  D1, (A1)+
Offset_0x029074:
                rts
Offset_0x029076:
                lea     $0034(A0), A1
                cmpi.w  #$FF80, (A1)
                beq.s   Offset_0x02909E
                subq.w  #$01, (A1)
                moveq   #$00, D1
                move.w  (A1)+, D1
                swap.w  D1
                asr.l   #$01, D1
                move.l  D1, D2
                asr.l   #$01, D1
                move.l  D1, D3
                add.l   D2, D3
                swap.w  D1
                swap.w  D2
                swap.w  D3
                move.w  D3, (A1)+
                move.w  D2, (A1)+
                move.w  D1, (A1)+
Offset_0x02909E:
                rts
;===============================================================================
; Objeto 0x78 - Plataformas que giram em torno de si mesmo / Plataformas que
; [ Término ]     sobem ou descem quando tocadas na Chemical Plant / Escadas
;===============================================================================  