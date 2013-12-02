;===============================================================================
; Objeto 0x30 - Objeto desconhecido
; [ Início ]
;===============================================================================    
Offset_0x0237B2:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0237C0(PC, D0), D1
                jmp     Offset_0x0237C0(PC, D1)
Offset_0x0237C0:
                dc.w    Offset_0x0237CE-Offset_0x0237C0
                dc.w    Offset_0x02381C-Offset_0x0237C0
;-------------------------------------------------------------------------------                  
Offset_0x0237C4:
                dc.b    $C0, $00, $C0, $00, $C0, $00, $E0, $00, $C0, $00
;-------------------------------------------------------------------------------                  
Offset_0x0237CE:
                addq.b  #$02, $0024(A0)
                move.w  $000C(A0), $0032(A0)
                move.w  $0008(A0), $0030(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.b  Offset_0x0237C4(PC, D0), $0019(A0)
                cmpi.b  #$06, D0
                bcs.s   Offset_0x02381C
                bne.s   Offset_0x0237FC
                cmpi.w  #$0380, ($FFFFEE04).w
                bcc.s   Offset_0x02381C
                bra.s   Offset_0x023804
Offset_0x0237FC:
                cmpi.w  #$0380, ($FFFFEE04).w
                bcs.s   Offset_0x02381C
Offset_0x023804:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x023816
                bclr    #$07, $02(A2, D0)
Offset_0x023816:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02381C:
                move.w  $0032(A0), D0
                add.w   ($FFFFEEE4).w, D0
                move.w  D0, $000C(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.w  Offset_0x023840(PC, D0), D1
                jsr     Offset_0x023840(PC, D1)
                tst.b   ($FFFFEEBC).w
                beq     Obj_0x30_MarkObjGone_3                 ; Offset_0x0239BC
                rts
Offset_0x023840:
                dc.w    Offset_0x02384A-Offset_0x023840
                dc.w    Offset_0x02384A-Offset_0x023840
                dc.w    Offset_0x023866-Offset_0x023840
                dc.w    Offset_0x0238B4-Offset_0x023840
                dc.w    Offset_0x0238D2-Offset_0x023840
Offset_0x02384A:
                move.w  #$00CB, D1
                move.w  #$0080, D2
                move.w  #$0081, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject_2)                        ; Offset_0x0196E6
                jmp     (_Offset_0x019E5E)
Offset_0x023866:
                move.w  #$00CB, D1
                move.w  #$0078, D2
                move.w  #$0079, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject_2)                        ; Offset_0x0196E6
                jsr     (_Offset_0x019E5E)
Offset_0x023882:
                btst    #$03, $0022(A0)
                beq.s   Offset_0x02389A
                move.l  A0, -(A7)
                move.l  A0, A1
                lea     ($FFFFB000).w, A0
                jsr     (Offset_0x03F5CA)
                move.l  (A7)+, A0
Offset_0x02389A:
                btst    #$04, $0022(A0)
                beq.s   Offset_0x0238B2
                move.l  A0, -(A7)
                move.l  A0, A1
                lea     ($FFFFB040).w, A0
                jsr     (Offset_0x03F5CA)
                move.l  (A7)+, A0
Offset_0x0238B2:
                rts
Offset_0x0238B4:
                move.w  #$00EB, D1
                move.w  #$0078, D2
                move.w  #$0079, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject_2)                        ; Offset_0x0196E6
                jsr     (_Offset_0x019E5E)
                bra.s   Offset_0x023882
Offset_0x0238D2:
                move.w  #$00CB, D1
                move.w  #$002E, D2
                move.w  $0008(A0), D4
                lea     (Offset_0x0238F0), A2
                jsr     (SolidObject_3)                        ; Offset_0x01973E
                jmp     (_Offset_0x019E5E)
;-------------------------------------------------------------------------------                  
Offset_0x0238F0:
                dc.b    $30, $30, $30, $30, $30, $30, $30, $30, $2F, $2F, $2E, $2E, $2D, $2D, $2C, $2C
                dc.b    $2B, $2B, $2A, $2A, $29, $29, $28, $28, $27, $27, $26, $26, $25, $25, $24, $24
                dc.b    $23, $23, $22, $22, $21, $21, $20, $20, $1F, $1F, $1E, $1E, $1D, $1D, $1C, $1C
                dc.b    $1B, $1B, $1A, $1A, $19, $19, $18, $18, $17, $17, $16, $16, $15, $15, $14, $14
                dc.b    $13, $13, $12, $12, $11, $11, $10, $10, $0F, $0F, $0E, $0E, $0D, $0D, $0C, $0C
                dc.b    $0B, $0B, $0A, $0A, $09, $09, $08, $08, $07, $07, $06, $06, $05, $05, $04, $04
                dc.b    $03, $03, $02, $02, $01, $01, $00, $00, $FF, $FF, $FE, $FE, $FD, $FD, $FC, $FC
                dc.b    $FB, $FB, $FA, $FA, $F9, $F9, $F8, $F8, $F7, $F7, $F6, $F6, $F5, $F5, $F4, $F4
                dc.b    $F3, $F3, $F2, $F2, $F1, $F1, $F0, $F0, $EF, $EF, $EE, $EE, $ED, $ED, $EC, $EC
                dc.b    $EB, $EB, $EA, $EA, $E9, $E9, $E8, $E8, $E7, $E7, $E6, $E6, $E5, $E5, $E4, $E4
                dc.b    $E3, $E3, $E2, $E2, $E1, $E1, $E0, $E0, $DF, $DF, $DE, $DE, $DD, $DD, $DC, $DC
                dc.b    $DB, $DB, $DA, $DA, $D9, $D9, $D8, $D8, $D7, $D7, $D6, $D6, $D5, $D5, $D4, $D4
                dc.b    $D3, $D3, $D2, $D2, $D1, $D1, $D0, $D0, $D0, $D0, $D0, $D0  
;-------------------------------------------------------------------------------
Obj_0x30_MarkObjGone_3: ;  Offset_0x0239BC:
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4                                                    
;===============================================================================
; Objeto 0x30 - Objeto desconhecido 
; [ Término ]
;===============================================================================  