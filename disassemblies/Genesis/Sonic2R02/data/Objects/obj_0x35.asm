;===============================================================================
; Objeto 0x35 - Invencibilidade do Sonic / Miles
; [ Início ]
;===============================================================================   
Offset_0x01D910:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x01D91E(PC, D0), D1
                jmp     Offset_0x01D91E(PC, D1)
Offset_0x01D91E:
                dc.w    Offset_0x01D936-Offset_0x01D91E
                dc.w    Offset_0x01D99E-Offset_0x01D91E
                dc.w    Offset_0x01DA12-Offset_0x01D91E
Offset_0x01D924:
                dc.l    Offset_0x01DB22
                dc.w    $000B
                dc.l    Offset_0x01DB38
                dc.w    $160D
                dc.l    Offset_0x01DB52
                dc.w    $2C0D
Offset_0x01D936:
                moveq   #$00, D2
                lea     Offset_0x01D91E(PC), A2
                lea     (A0), A1
                moveq   #$03, D1
Offset_0x01D940:
                move.b  $0000(A0), $0000(A1)
                move.b  #$04, $000A(A1)
                move.l  #Invicibility_Stars_Mappings, $0004(A1) ; Offset_0x01DC52
                move.w  #$04DE, $0002(A1)
                bsr     Modify_A1_SpriteAttr_2P                ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                bset    #$06, $0001(A1)
                move.b  #$10, $000E(A1)
                move.b  #$02, $000F(A1)
                move.w  $003E(A0), $003E(A1)
                move.b  D2, $0036(A1)
                addq.w  #$01, D2
                move.l  (A2)+, $0030(A1)
                move.w  (A2)+, $0034(A1)
                lea     $0040(A1), A1
                dbra    D1, Offset_0x01D940
                move.b  #$02, $000A(A0)
                move.b  #$04, $0034(A0)
Offset_0x01D99E:
                move.w  $003E(A0), A1
                btst    #$01, $002B(A1)
                beq     DeleteObject                           ; Offset_0x01646C
                move.w  $0008(A1), D0
                move.w  D0, $0008(A0)
                move.w  $000C(A1), D1
                move.w  D1, $000C(A0)
                lea     $0010(A0), A2
                lea     Offset_0x01DB14(PC), A3
                moveq   #$00, D5
Offset_0x01D9C6:
                move.w  $0038(A0), D2
                move.b  $00(A3, D2), D5
                bpl.s   Offset_0x01D9D6
                clr.w   $0038(A0)
                bra.s   Offset_0x01D9C6
Offset_0x01D9D6:
                addq.w  #$01, $0038(A0)
                lea     Offset_0x01DAD4(PC), A6
                move.b  $0034(A0), D6
                jsr     Offset_0x01DABE(PC)
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  D5, (A2)+
                addi.w  #$0020, D6
                jsr     Offset_0x01DABE(PC)
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  D5, (A2)+
                moveq   #$12, D0
                btst    #$00, $0022(A1)
                beq.s   Offset_0x01DA06
                neg.w   D0
Offset_0x01DA06:
                add.b   D0, $0034(A0)
                move.w  #$0080, D0
                bra     DisplaySprite_Param                    ; Offset_0x0164B6
Offset_0x01DA12:
                move.w  $003E(A0), A1
                btst    #$01, $002B(A1)
                beq     DeleteObject                           ; Offset_0x01646C
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                beq.s   Offset_0x01DA36
                lea     ($FFFFEED2).w, A5
                lea     ($FFFFE500).w, A6
                tst.b   $003F(A0)
                beq.s   Offset_0x01DA3E
Offset_0x01DA36:
                lea     ($FFFFEED6).w, A5
                lea     ($FFFFE600).w, A6
Offset_0x01DA3E:
                move.b  $0036(A0), D1
                lsl.b   #$02, D1
                move.w  D1, D2
                add.w   D1, D1
                add.w   D2, D1
                move.w  (A5), D0
                sub.b   D1, D0
                lea     $00(A6, D0), A2
                move.w  (A2)+, D0
                move.w  (A2)+, D1
                move.w  D0, $0008(A0)
                move.w  D1, $000C(A0)
                lea     $0010(A0), A2
                move.l  $0030(A0), A3
Offset_0x01DA66:
                move.w  $0038(A0), D2
                move.b  $00(A3, D2), D5
                bpl.s   Offset_0x01DA76
                clr.w   $0038(A0)
                bra.s   Offset_0x01DA66
Offset_0x01DA76:
                swap.w  D5
                add.b   $0035(A0), D2
                move.b  $00(A3, D2), D5
                addq.w  #$01, $0038(A0)
                lea     Offset_0x01DAD4(PC), A6
                move.b  $0034(A0), D6
                jsr     Offset_0x01DABE(PC)
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  D5, (A2)+
                addi.w  #$0020, D6
                swap.w  D5
                jsr     Offset_0x01DABE(PC)
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  D5, (A2)+
                moveq   #$02, D0
                btst    #$00, $0022(A1)
                beq.s   Offset_0x01DAB2
                neg.w   D0
Offset_0x01DAB2:
                add.b   D0, $0034(A0)
                move.w  #$0080, D0
                bra     DisplaySprite_Param                    ; Offset_0x0164B6
Offset_0x01DABE:                
                andi.w  #$003E, D6
                move.b  $00(A6, D6), D2
                move.b  $01(A6, D6), D3
                ext.w   D2
                ext.w   D3
                add.w   D0, D2
                add.w   D1, D3
                rts
;-------------------------------------------------------------------------------                
Offset_0x01DAD4:
                dc.b    $0F, $00, $0F, $03, $0E, $06, $0D, $08, $0B, $0B, $08, $0D, $06, $0E, $03, $0F
                dc.b    $00, $10, $FC, $0F, $F9, $0E, $F7, $0D, $F4, $0B, $F2, $08, $F1, $06, $F0, $03
                dc.b    $F0, $00, $F0, $FC, $F1, $F9, $F2, $F7, $F4, $F4, $F7, $F2, $F9, $F1, $FC, $F0
                dc.b    $FF, $F0, $03, $F0, $06, $F1, $08, $F2, $0B, $F4, $0D, $F7, $0E, $F9, $0F, $FC
;-------------------------------------------------------------------------------                
Offset_0x01DB14:                                      
                dc.b    $08, $05, $07, $06, $06, $07, $05, $08, $06, $07, $07, $06, $FF, $00
;-------------------------------------------------------------------------------                
Offset_0x01DB22:
                dc.b    $08, $07, $06, $05, $04, $03, $04, $05, $06, $07, $FF, $03, $04, $05, $06, $07
                dc.b    $08, $07, $06, $05, $04, $00
;-------------------------------------------------------------------------------                
Offset_0x01DB38:
                dc.b    $08, $07, $06, $05, $04, $03, $02, $03, $04, $05, $06, $07, $FF, $02, $03, $04
                dc.b    $05, $06, $07, $08, $07, $06, $05, $04, $03, $00
;-------------------------------------------------------------------------------                
Offset_0x01DB52:
                dc.b    $07, $06, $05, $04, $03, $02, $01, $02, $03, $04, $05, $06, $FF, $01, $02, $03
                dc.b    $04, $05, $06, $07, $06, $05, $04, $03, $02, $00
;===============================================================================
; Objeto 0x35 - Invencibilidade do Sonic / Miles
; [ Término ]
;===============================================================================  