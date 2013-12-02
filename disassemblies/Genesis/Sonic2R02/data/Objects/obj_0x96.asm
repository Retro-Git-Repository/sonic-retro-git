;===============================================================================
; Objeto 0x96 - Corpo do inimigo Rexon na Hill Top (Inimigo tipo cobra que atira
; [ Início ]    bolas de fogo no jogador)
;===============================================================================  
Offset_0x036DAC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036DBA(PC, D0), D1
                jmp     Offset_0x036DBA(PC, D1)
Offset_0x036DBA:
                dc.w    Offset_0x036DC2-Offset_0x036DBA
                dc.w    Offset_0x036DDA-Offset_0x036DBA
                dc.w    Offset_0x036E2C-Offset_0x036DBA
                dc.w    Offset_0x036E5E-Offset_0x036DBA
Offset_0x036DC2:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$02, $001A(A0)
                move.w  #$FFE0, $0010(A0)
                move.b  #$80, $002A(A0)
                rts
Offset_0x036DDA:
                bsr     Offset_0x0360FC
                addi.w  #$0060, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x036DEC
                bsr     Load_Rexon_Head_Obj                    ; Offset_0x037052
Offset_0x036DEC:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x036E0E
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0011, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036E0E:
                subq.b  #$01, $002A(A0)
                bpl.s   Offset_0x036E24
                move.b  #$80, $002A(A0)
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
Offset_0x036E24:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                rts
Offset_0x036E2C:
                bsr     Offset_0x0360FC
                addi.w  #$0060, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x036E3E
                bsr     Load_Rexon_Head_Obj                    ; Offset_0x037052
Offset_0x036E3E:
                bsr     Offset_0x036E48
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036E48:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  $0008(A0), D4
                jmp     (SolidObject)                          ; Offset_0x019686
Offset_0x036E5E:
                bsr.s   Offset_0x036E48
                jmp     (MarkObjGone)                          ; Offset_0x016358                                                                                                            
;===============================================================================
; Objeto 0x96 - Corpo do inimigo Rexon na Hill Top (Inimigo tipo cobra que atira
; [ Término ]   bolas de fogo no jogador)
;===============================================================================