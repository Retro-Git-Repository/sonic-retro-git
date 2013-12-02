;===============================================================================
; Objeto 0x10 - Miles no Special Stage
; [ Início ]
;===============================================================================    
Offset_0x034238:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x034246(PC, D0), D1
                jmp     Offset_0x034246(PC, D1)
Offset_0x034246:
                dc.w    Offset_0x034250-Offset_0x034246
                dc.w    Offset_0x034352-Offset_0x034246
                dc.w    Offset_0x03443E-Offset_0x034246
                dc.w    Offset_0x034246-Offset_0x034246
                dc.w    Offset_0x034470-Offset_0x034246
Offset_0x034250:
                addq.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.w  D0, $002A(A0)
                move.w  #$0080, D1
                move.w  D1, $002E(A0)
                add.w   ($FFFFF73E).w, D0
                move.w  D0, $0008(A0)
                add.w   ($FFFFF740).w, D1
                move.w  D1, $000C(A0)
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.l  #Miles_In_SS_Mappings, $0004(A0)       ; Offset_0x03458E
                move.w  #$4300, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$02, $0018(A0)
                move.w  #$0080, $0034(A0)
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                beq.s   Offset_0x0342B0
                move.b  #$03, $0018(A0)
                move.w  #$006E, $0034(A0)
Offset_0x0342B0:
                move.w  #$0400, $0032(A0)
                move.b  #$40, $0026(A0)
                move.b  #$01, ($FFFFF7DE).w
                clr.b   $0021(A0)
                clr.b   $0023(A0)
                bsr     Offset_0x034412
                move.l  #$FFFFB180, A1
                move.b  #$63, (A1)          ; Carrega o objeto 0x63 na memória - Sombra do Miles
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0018, $000C(A1)
                move.l  #SS_Objects_Shadow_Mappings, $0004(A1) ; Offset_0x033EEA
                move.w  #$623C, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.l  A0, $0038(A1)
                move.l  #$FFFFB1C0, A1
                move.b  #$88, (A1)          ; Carrega o objeto 0x88 na memória - Rabo do Miles
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  #Miles_Tail_In_SS_Mappings, $0004(A1)  ; Offset_0x0347FA
                move.w  #$4316, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  $0018(A0), $0018(A1)
                subq.b  #$01, $0018(A1)
                move.l  A0, $0038(A1)
                move.l  A1, A0
                move.b  #$01, ($FFFFF7DF).w
                clr.b   $0023(A0)
                move.l  $0038(A0), A0
                rts
Offset_0x034352:
                tst.b   $0025(A0)
                bne.s   Offset_0x0343A8
                bsr     Offset_0x0343BC
                lea     ($FFFFF66A).w, A2
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                beq.s   Offset_0x03436A
                lea     ($FFFFF602).w, A2
Offset_0x03436A:
                bsr     Offset_0x0339E4
                bsr     Offset_0x033A64
                moveq   #$01, D0
                bsr     Offset_0x0338A0
                bsr     Offset_0x033AA2
                bsr     Offset_0x033ADC
                lea     ($FFFFF66B).w, A2
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                beq.s   Offset_0x03438E
                lea     ($FFFFF603).w, A2
Offset_0x03438E:
                bsr     Miles_In_SS_Sub                        ; Offset_0x0335A0
                bsr     Offset_0x0338FC
                lea     (Miles_In_SS_AnimateData), A1          ; Offset_0x03456C
                bsr     Offset_0x03395C
                bsr     Offset_0x033858
                bra     Offset_0x034412
Offset_0x0343A8:
                bsr     Offset_0x03347E
                bsr     Offset_0x0338A0
                bsr     Offset_0x033AA2
                bsr     Offset_0x033ADC
                bra     Offset_0x034412
Offset_0x0343BC:
                tst.b   ($FFFFFE00).w
                bne.s   Offset_0x0343C8
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                beq.s   Offset_0x0343CA
Offset_0x0343C8:
                rts
Offset_0x0343CA:
                move.b  ($FFFFF66A).w, D0
                andi.b  #$7F, D0
                beq.s   Offset_0x0343EC
                moveq   #$00, D0
                moveq   #$03, D1
                lea     ($FFFFDB62).w, A1
Offset_0x0343DC:
                move.l  D0, (A1)
                move.l  D0, (A1)
                dbra    D1, Offset_0x0343DC
                move.w  #$00B4, ($FFFFF702).w
                rts
Offset_0x0343EC:
                tst.w   ($FFFFF702).w
                beq.s   Offset_0x0343F8
                subq.w  #$01, ($FFFFF702).w
                rts
Offset_0x0343F8:
                lea     ($FFFFDB80).w, A1
                move.w  (A1), ($FFFFF66A).w
                rts
;-------------------------------------------------------------------------------                
Offset_0x034402:
                dc.l    $00FF3060, $00FF3800, $00FF4C80, $00FF53C0
;------------------------------------------------------------------------------- 
Offset_0x034412:
                move.b  $0023(A0), D0
                beq.s   Offset_0x034426
                subq.b  #$01, D0
                move.b  D0, $0023(A0)
                andi.b  #$01, D0
                beq.s   Offset_0x034426
                rts
Offset_0x034426:
                jsr     (DisplaySprite)                        ; Offset_0x01647A
                lea     Offset_0x034402(PC), A3
                lea     ($FFFFF7DE).w, A4
                move.w  #$6000, D4
                moveq   #$12, D1
                bra     Miles_In_SS_DynLoad                    ; Offset_0x033534
Offset_0x03443E:
                lea     ($FFFFF66A).w, A2
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                beq.s   Offset_0x03444C
                lea     ($FFFFF602).w, A2
Offset_0x03444C:
                bsr     Offset_0x03368E
                bsr     Offset_0x033662
                bsr     Offset_0x033810
                bsr     Offset_0x0338A0
                bsr     Offset_0x033ADC
                bsr     Offset_0x0336B0
                lea     (Miles_In_SS_AnimateData), A1          ; Offset_0x03456C
                bsr     Offset_0x03395C
                bra.s   Offset_0x034412
Offset_0x034470:
                lea     ($FFFFF66A).w, A2
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                beq.s   Offset_0x03447E
                lea     ($FFFFF602).w, A2
Offset_0x03447E:
                bsr     Offset_0x03368E
                bsr     Offset_0x033662
                bsr     Offset_0x0336B0
                bsr     Offset_0x033810
                bsr     Offset_0x0338A0
                bsr     Offset_0x033ADC
                bsr     Offset_0x0338FC
                lea     (Miles_In_SS_AnimateData), A1          ; Offset_0x03456C
                bsr     Offset_0x03395C
                bra     Offset_0x034412     
;===============================================================================
; Objeto 0x10 - Miles no Special Stage
; [ Término ]
;===============================================================================  