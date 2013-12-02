;===============================================================================
; Objeto 0x95 - Inimigo Sol na Hill Top (Possui 4 Bolas de fogo girando em 
; [ Início ]    torno de si e atira no jogador ao se aproximar)
;===============================================================================  
Offset_0x036B6C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036B7A(PC, D0), D1
                jmp     Offset_0x036B7A(PC, D1)
Offset_0x036B7A:
                dc.w    Offset_0x036B84-Offset_0x036B7A
                dc.w    Offset_0x036C4E-Offset_0x036B7A
                dc.w    Offset_0x036C9C-Offset_0x036B7A
                dc.w    Offset_0x036CBA-Offset_0x036B7A
                dc.w    Offset_0x036D3C-Offset_0x036B7A
Offset_0x036B84:
                move.l  #Sol_Mappings, $0004(A0)               ; Offset_0x036D70
                move.w  #$0000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$0B, $0020(A0)
                move.b  #$0C, $0019(A0)
                move.w  #$FFC0, $0010(A0)
                moveq   #$00, D2
                lea     $0037(A0), A2
                move.l  A2, A3
                addq.w  #$01, A2
                moveq   #$03, D1
Offset_0x036BC2:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x036C20
                addq.b  #$01, (A3)
                move.w  A1, D5
                subi.w  #$B000, D5
                lsr.w   #$06, D5
                andi.w  #$007F, D5
                move.b  D5, (A2)+
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.b  #$06, $0024(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.b  #$08, $0019(A1)
                move.b  #$03, $001A(A1)
                move.b  #$98, $0020(A1)
                move.b  D2, $0026(A1)
                addi.b  #$40, D2
                move.l  A0, $003C(A1)
                dbra    D1, Offset_0x036BC2
Offset_0x036C20:
                moveq   #$01, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x036C2C
                neg.w   D0
Offset_0x036C2C:
                move.b  D0, $0036(A0)
                move.b  $0028(A0), $0024(A0)
                addq.b  #$02, $0024(A0)
                move.w  #$FFC0, $0010(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x036C4C
                neg.w   $0010(A0)
Offset_0x036C4C:
                rts
Offset_0x036C4E:
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                bcc.s   Offset_0x036C5A
                neg.w   D0
Offset_0x036C5A:
                cmpi.w  #$00A0, D0
                bcc.s   Offset_0x036C7E
                move.w  ($FFFFB00C).w, D0
                sub.w   $000C(A0), D0
                bcc.s   Offset_0x036C6C
                neg.w   D0
Offset_0x036C6C:
                cmpi.w  #$0050, D0
                bcc.s   Offset_0x036C7E
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x036C7E
                move.b  #$01, $001C(A0)
Offset_0x036C7E:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Sol_Animate_Data), A1                 ; Offset_0x036D5C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                andi.b  #$03, $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036C9C:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Sol_Animate_Data_01), A1              ; Offset_0x036D6A
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                andi.b  #$03, $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036CBA:
                lea     (Sol_Animate_Data_01), A1              ; Offset_0x036D6A
                jsr     (AnimateSprite)                        ; Offset_0x0164CA                 
                move.l  $003C(A0), A1
                cmpi.b  #$95, $0000(A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                cmpi.b  #$02, $001A(A1)
                bne.s   Offset_0x036D10
                cmpi.b  #$40, $0026(A0)
                bne.s   Offset_0x036D10
                addq.b  #$02, $0024(A0)
                move.b  #$00, $001C(A0)
                subq.b  #$01, $0037(A1)
                bne.s   Offset_0x036CF8
                addq.b  #$02, $0024(A1)
Offset_0x036CF8:
                move.w  #$FE00, $0010(A0)
                btst    #$00, $0022(A1)
                beq.s   Offset_0x036D0A
                neg.w   $0010(A0)
Offset_0x036D0A:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x036D10:
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$04, D1
                add.w   $0008(A1), D1
                move.w  D1, $0008(A0)
                asr.w   #$04, D0
                add.w   $000C(A1), D0
                move.w  D0, $000C(A0)
                move.b  $0036(A1), D0
                add.b   D0, $0026(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x036D3C:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                tst.b   $0001(A0)
                bpl     J_DeleteObject_01                      ; Offset_0x036344
                lea     (Sol_Animate_Data_01), A1              ; Offset_0x036D6A
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Sol_Animate_Data: ; Offset_0x036D5C:
                dc.w    Offset_0x036D60-Sol_Animate_Data
                dc.w    Offset_0x036D64-Sol_Animate_Data
Offset_0x036D60:
                dc.b    $0F, $00, $FF, $00
Offset_0x036D64:
                dc.b    $0F, $01, $02, $FE, $01, $00
;------------------------------------------------------------------------------- 
Sol_Animate_Data_01: ; Offset_0x036D6A:
                dc.w    Offset_0x036D6C-Sol_Animate_Data_01
Offset_0x036D6C:
                dc.b    $05, $03, $04, $FF
;-------------------------------------------------------------------------------
Sol_Mappings: ; Offset_0x036D70:
                dc.w    Offset_0x036D7A-Sol_Mappings
                dc.w    Offset_0x036D84-Sol_Mappings
                dc.w    Offset_0x036D8E-Sol_Mappings
                dc.w    Offset_0x036D98-Sol_Mappings
                dc.w    Offset_0x036DA2-Sol_Mappings
Offset_0x036D7A:
                dc.w    $0001
                dc.l    $F80503DE, $01EFFFF8
Offset_0x036D84:
                dc.w    $0001
                dc.l    $F80503DE, $01EFFFF8
Offset_0x036D8E:
                dc.w    $0001
                dc.l    $F80503DE, $01EFFFF8
Offset_0x036D98:
                dc.w    $0001
                dc.l    $F80583AE, $81D7FFF8
Offset_0x036DA2:
                dc.w    $0001
                dc.l    $F8058BAE, $89D7FFF8                                                                                        
;===============================================================================
; Objeto 0x95 - Inimigo Sol na Hill Top (Possui 4 Bolas de fogo girando em
; [ Término ]    torno de si e atira no jogador ao se aproximar)
;===============================================================================