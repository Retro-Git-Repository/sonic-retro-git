;===============================================================================
; Objeto 0x73 - Anéis girando, Sonic consegue andar em cima
; [ Início ]                                                                        
;===============================================================================    
Offset_0x028738:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x028746(PC, D0), D1
                jmp     Offset_0x028746(PC, D1)
Offset_0x028746:
                dc.w    Offset_0x02874C-Offset_0x028746
                dc.w    Offset_0x02883E-Offset_0x028746
                dc.w    Offset_0x0288EC-Offset_0x028746
Offset_0x02874C:
                addq.b  #$02, $0024(A0)
                move.l  #Rotating_Rings_Mappings, $0004(A0)    ; Offset_0x02890E
                move.w  #$26BC, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$08, $0019(A0)
                move.w  $0008(A0), $003A(A0)
                move.w  $000C(A0), $0038(A0)
                move.b  #$00, $0020(A0)
                bset    #$07, $0022(A0)
                move.b  $0028(A0), D1
                andi.b  #$F0, D1
                ext.w   D1
                asl.w   #$03, D1
                move.w  D1, $003E(A0)
                move.b  $0022(A0), D0
                ror.b   #$02, D0
                andi.b  #$C0, D0
                move.b  D0, $0026(A0)
                lea     $0029(A0), A2
                move.b  $0028(A0), D1
                andi.w  #$0007, D1
                move.b  #$00, (A2)+
                move.w  D1, D3
                lsl.w   #$04, D3
                move.b  D3, $003C(A0)
                subq.w  #$01, D1
                bcs.s   Offset_0x028830
                btst    #$03, $0028(A0)
                beq.s   Offset_0x0287D4
                subq.w  #$01, D1
                bcs.s   Offset_0x028830
Offset_0x0287D4:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x028830
                addq.b  #$01, $0029(A0)
                move.w  A1, D5
                subi.w  #$B000, D5
                lsr.w   #$06, D5
                andi.w  #$007F, D5
                move.b  D5, (A2)+
                move.b  #$04, $0024(A1)
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  $0018(A0), $0018(A1)
                move.b  $0019(A0), $0019(A1)
                move.b  $0020(A0), $0020(A1)
                move.b  $0022(A0), $0022(A1)
                subi.b  #$10, D3
                move.b  D3, $003C(A1)
                dbra    D1, Offset_0x0287D4
Offset_0x028830:
                move.w  A0, D5
                subi.w  #$B000, D5
                lsr.w   #$06, D5
                andi.w  #$007F, D5
                move.b  D5, (A2)+
Offset_0x02883E:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x02885E
                move.w  #$0008, D1
                move.w  #$0008, D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                bra     Offset_0x0288B0
Offset_0x02885E:
                move.w  $003E(A0), D0
                add.w   D0, $0026(A0)
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  $0038(A0), D2
                move.w  $003A(A0), D3
                lea     $0029(A0), A2
                moveq   #$00, D6
                move.b  (A2)+, D6
Offset_0x028880:
                moveq   #$00, D4
                move.b  (A2)+, D4
                lsl.w   #$06, D4
                addi.l  #$FFFFB000, D4
                move.l  D4, A1
                moveq   #$00, D4
                move.b  $003C(A1), D4
                move.l  D4, D5
                muls.w  D0, D4
                asr.l   #$08, D4
                muls.w  D1, D5
                asr.l   #$08, D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D4, $000C(A1)
                move.w  D5, $0008(A1)
                dbra    D6, Offset_0x028880
                rts
Offset_0x0288B0:
                move.w  $003A(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x0288CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0288CA:
                moveq   #$00, D2
                lea     $0029(A0), A2
                move.b  (A2)+, D2
Offset_0x0288D2:
                moveq   #$00, D0
                move.b  (A2)+, D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                dbra    D2, Offset_0x0288D2
                rts
Offset_0x0288EC:
                move.w  #$0008, D1
                move.w  #$0008, D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0036(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  $0008(A0), $0036(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Rotating_Rings_Mappings: ; Offset_0x02890E:
                dc.w    Offset_0x028910-Rotating_Rings_Mappings
Offset_0x028910:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
;===============================================================================
; Objeto 0x73 - Anéis girando, Sonic consegue andar em cima
; [ Término ]
;===============================================================================  