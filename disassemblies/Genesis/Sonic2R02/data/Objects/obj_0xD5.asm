;===============================================================================
; Objeto 0xD5 - Elevadores na Casino Night
; [ Início ]
;===============================================================================      
Offset_0x02B636:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02B644(PC, D0), D1
                jmp     Offset_0x02B644(PC, D1)
Offset_0x02B644:
                dc.w    Offset_0x02B648-Offset_0x02B644
                dc.w    Offset_0x02B698-Offset_0x02B644
Offset_0x02B648:
                addq.b  #$02, $0024(A0)
                move.l  #CNz_Elevator_Mappings, $0004(A0)      ; Offset_0x02B776
                move.w  #$4384, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                move.w  $000C(A0), $0032(A0)
                move.w  #$8000, $000E(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$02, D0
                sub.w   D0, $000C(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02B698
                add.w   D0, D0
                add.w   D0, $000C(A0)
Offset_0x02B698:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  $0034(A0), D0
                move.w  Offset_0x02B6CA(PC, D0), D1
                jsr     Offset_0x02B6CA(PC, D1)
                cmpi.w  #$0006, $0034(A0)
                bcc.s   Offset_0x02B6C4
                move.w  #$0010, D1
                move.w  #$0009, D3
                move.w  $0008(A0), D4
                jsr     (Platform_Elevator)                    ; Offset_0x019CA8
Offset_0x02B6C4:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02B6CA:
                dc.w    Offset_0x02B6D2-Offset_0x02B6CA
                dc.w    Offset_0x02B6EC-Offset_0x02B6CA
                dc.w    Offset_0x02B724-Offset_0x02B6CA
                dc.w    Offset_0x02B73E-Offset_0x02B6CA
Offset_0x02B6D2:
                move.b  $0022(A0), D0
                andi.w  #$0018, D0
                beq.s   Offset_0x02B6EA
                move.w  #$00D6, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.w  #$02, $0034(A0)
Offset_0x02B6EA:
                rts
Offset_0x02B6EC:
                moveq   #$08, D1
                move.w  $0032(A0), D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x02B6FA
                neg.w   D1
Offset_0x02B6FA:
                add.w   D1, $0012(A0)
                bne.s   Offset_0x02B722
                addq.w  #$02, $0034(A0)
                move.w  D0, $000C(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$02, D0
                sub.w   D0, $000C(A0)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x02B722
                add.w   D0, D0
                add.w   D0, $000C(A0)
Offset_0x02B722:
                rts
Offset_0x02B724:
                move.b  $0022(A0), D0
                andi.w  #$0018, D0
                bne.s   Offset_0x02B73C
                move.w  #$00D6, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.w  #$02, $0034(A0)
Offset_0x02B73C:
                rts
Offset_0x02B73E:
                moveq   #$08, D1
                move.w  $0032(A0), D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x02B74C
                neg.w   D1
Offset_0x02B74C:
                add.w   D1, $0012(A0)
                bne.s   Offset_0x02B774
                clr.w   $0034(A0)
                move.w  D0, $000C(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$02, D0
                sub.w   D0, $000C(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02B774
                add.w   D0, D0
                add.w   D0, $000C(A0)
Offset_0x02B774:
                rts
;-------------------------------------------------------------------------------
CNz_Elevator_Mappings: ; Offset_0x02B776:
                dc.w    Offset_0x02B778-CNz_Elevator_Mappings
Offset_0x02B778:
                dc.w    $0002
                dc.l    $F8050000, $0000FFF0, $F8050800, $08000000                                                                                                   
;===============================================================================
; Objeto 0xD5 - Elevadores na Casino Night
; [ Término ]
;===============================================================================