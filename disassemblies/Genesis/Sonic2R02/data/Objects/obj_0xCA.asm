;===============================================================================
; Objeto 0xCA - Seqüência do final e créditos
; [ Início ]
;===============================================================================     
Offset_0x00A18A:
                addq.w  #$01, $0032(A0)
                cmpi.w  #$0004, ($FFFFF750).w
                beq.s   Offset_0x00A1AE
                cmpi.w  #$0002, ($FFFFF750).w
                bne.s   Offset_0x00A1AE
                st      ($FFFFFE19).w
                move.w  #$0100, ($FFFFFE20).w
                move.b  #$FF, ($FFFFF65F).w
Offset_0x00A1AE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00A1BC(PC, D0), D1
                jmp     Offset_0x00A1BC(PC, D1)
Offset_0x00A1BC:
                dc.w    Offset_0x00A1CC-Offset_0x00A1BC
                dc.w    Offset_0x00A1F4-Offset_0x00A1BC
                dc.w    Offset_0x00A202-Offset_0x00A1BC
                dc.w    Offset_0x00A1F4-Offset_0x00A1BC
                dc.w    Offset_0x00A20A-Offset_0x00A1BC
                dc.w    Offset_0x00A2C2-Offset_0x00A1BC
                dc.w    Offset_0x00A304-Offset_0x00A1BC
                dc.w    Offset_0x00A346-Offset_0x00A1BC
Offset_0x00A1CC:
                moveq   #$04, D0
                move.w  #$0180, D1
                btst    #$06, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x00A1DE
                move.w  #$0100, D1
Offset_0x00A1DE:
                lea     ($FFFFB0C0).w, A1
                move.b  #$C9, (A1)  ; Carrega o objeto 0xC9 - na memória (Carregador de paletas dinâmico)
                move.b  D0, $0028(A1)
                addq.b  #$02, $0024(A0)
                move.w  D1, $003C(A0)
                rts
Offset_0x00A1F4:
                subq.w  #$01, $003C(A0)
                bmi.s   Offset_0x00A1FC
                rts
Offset_0x00A1FC:
                addq.b  #$02, $0024(A0)
                rts
Offset_0x00A202:
                moveq   #$06, D0
                move.w  #$0080, D1
                bra.s   Offset_0x00A1DE
Offset_0x00A20A:
                move.w  $002E(A0), D0
                cmpi.w  #$0010, D0
                bcc.s   Offset_0x00A264
                addq.w  #$04, $002E(A0)
                clr.b   $0024(A0)
                move.l  A0, -(A7)
                move.l  Ending_Movie(PC, D0), A0               ; Offset_0x00A254
                lea     ($FFFF0000), A1
                move.w  #$0328, D0
                jsr     (EnigmaDec)                            ; Offset_0x00177A
                move    #$2700, SR
                lea     ($FFFF0000), A1
                move.l  #$441C0003, D0
                moveq   #$0B, D1
                moveq   #$08, D2
                jsr     (ShowVDPGraphics)                      ; Offset_0x0013CA
                move    #$2300, SR
                move.l  (A7)+, A0
                rts
;-------------------------------------------------------------------------------                
Ending_Movie: ; Offset_0x00A254:
                dc.l    Ending_Movie_Frame_0                   ; Offset_0x0906E0
                dc.l    Ending_Movie_Frame_1                   ; Offset_0x0906F8
                dc.l    Ending_Movie_Frame_2                   ; Offset_0x090722
                dc.l    Ending_Movie_Frame_3                   ; Offset_0x09073C
;-------------------------------------------------------------------------------                
Offset_0x00A264:
                move.w  #$0002, ($FFFFF662).w
                st      ($FFFFF7CC).w
                st      ($FFFFF661).w
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF750).w, D0
                move.w  Offset_0x00A292(PC, D0), D0
                jsr     Offset_0x00A292(PC, D0)
                move.w  #$0080, D1
                bsr     Offset_0x00A1DE
                move.w  #$0040, $003C(A0)
                rts
Offset_0x00A292:
                dc.w    Offset_0x00A298-Offset_0x00A292
                dc.w    Offset_0x00A2A6-Offset_0x00A292
                dc.w    Offset_0x00A2AA-Offset_0x00A292
Offset_0x00A298:
                moveq   #$08, D0
Offset_0x00A29A:
                move.b  #$01, (A1)
                move.b  #$81, $002A(A1)
                rts
Offset_0x00A2A6:
                moveq   #$0C, D0
                bra.s   Offset_0x00A29A
Offset_0x00A2AA:
                moveq   #$0E, D0
                move.b  #$02, (A1)
                move.b  #$81, $002A(A1)
                move.b  #$05, ($FFFFB080).w
                move.w  A1, ($FFFFB0BE).w
                rts
Offset_0x00A2C2:
                subq.w  #$01, $003C(A0)
                bpl.s   Offset_0x00A2D8
                moveq   #$0A, D0
                move.w  #$0080, D1
                bsr     Offset_0x00A1DE
                move.w  #$00C0, $003C(A0)
Offset_0x00A2D8:
                lea     ($FFFFB000).w, A1
                move.b  #$0F, $001C(A1)
                move.w  #$00A0, $0008(A1)
                move.w  #$0050, $000C(A1)
                cmpi.w  #$0002, ($FFFFF750).w
                bne.s   Offset_0x00A302
                move.b  #$00, $001C(A1)
                move.w  #$1000, $0014(A1)
Offset_0x00A302:
                rts
Offset_0x00A304:
                subq.w  #$01, $003C(A0)
                bmi.s   Offset_0x00A31E
                moveq   #$00, D4
                moveq   #$00, D5
                move.w  #$0000, ($FFFFEEB0).w
                move.w  #$0100, ($FFFFEEB2).w
                bra     Bg_Scroll_DEz                          ; Offset_0x00D336
Offset_0x00A31E:
                addq.b  #$02, $0024(A0)
                move.w  #$0100, $003C(A0)
                cmpi.w  #$0004, ($FFFFF750).w
                bne.s   Offset_0x00A344
                move.w  #$0880, $003C(A0)
                btst    #$06, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x00A344
                move.w  #$0660, $003C(A0)
Offset_0x00A344:
                rts
Offset_0x00A346:
                btst    #$06, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x00A35A
                cmpi.w  #$0E40, $0032(A0)
                beq.s   Offset_0x00A378
                bra     Offset_0x00A362
Offset_0x00A35A:
                cmpi.w  #$1140, $0032(A0)
                beq.s   Offset_0x00A378
Offset_0x00A362:
                subq.w  #$01, $003C(A0)
                bne.s   Offset_0x00A374
                lea     (Obj_0xCA_Load_Tornado), A2            ; Offset_0x00AD5E
                jsr     (Load_Sub_Obj)                         ; Offset_0x0361F6
Offset_0x00A374:
                bra     Ending_Load_Clouds                     ; Offset_0x00AB88
Offset_0x00A378:
                addq.b  #$02, $0024(A0)
                st      ($FFFFF660).w
                rts
;===============================================================================
; Objeto 0xCA - Seqüência do final e créditos
; [ Término ]
;===============================================================================  