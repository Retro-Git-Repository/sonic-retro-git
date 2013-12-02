;===============================================================================
; Objeto 0x68 - Bloco com harpão na Metropolis
; [ Início ]
;===============================================================================    
Offset_0x027376:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x027384(PC, D0), D1
                jmp     Offset_0x027384(PC, D1)
Offset_0x027384:
                dc.w    Offset_0x02738A-Offset_0x027384
                dc.w    Offset_0x027430-Offset_0x027384
                dc.w    Offset_0x02744C-Offset_0x027384
Offset_0x02738A:
                addq.b  #$02, $0024(A0)
                move.l  #Block_Harpon_Mappings, $0004(A0)      ; Offset_0x02753C
                move.w  #$6414, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02742A
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                addq.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $0008(A1), $0030(A1)
                move.w  $000C(A1), $0032(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  #$241C, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$04, $0018(A1)
                move.w  ($FFFFFE04).w, D0
                lsr.w   #$06, D0
                move.w  D0, D1
                andi.w  #$0001, D0
                move.w  D0, $0036(A1)
                lsr.w   #$01, D1
                add.b   $0028(A0), D1
                andi.w  #$0003, D1
                move.b  D1, $0025(A1)
                move.b  D1, $001A(A1)
                lea     (Offset_0x027538), A2
                move.b  $00(A2, D1), $0020(A1)
Offset_0x02742A:
                move.b  #$04, $001A(A0)
Offset_0x027430:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02744C:
                bsr     Offset_0x0274B6
                moveq   #$00, D0
                move.b  $0025(A0), D0
                add.w   D0, D0
                move.w  Offset_0x02746A(PC, D0), D1
                jsr     Offset_0x02746A(PC, D1)
                move.w  $0030(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x02746A:
                dc.w    Offset_0x027472-Offset_0x02746A
                dc.w    Offset_0x027484-Offset_0x02746A
                dc.w    Offset_0x027494-Offset_0x02746A
                dc.w    Offset_0x0274A4-Offset_0x02746A
Offset_0x027472:
                moveq   #$00, D0
                move.b  $0034(A0), D0
                neg.w   D0
                add.w   $0032(A0), D0
                move.w  D0, $000C(A0)
                rts
Offset_0x027484:
                moveq   #$00, D0
                move.b  $0034(A0), D0
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                rts
Offset_0x027494:
                moveq   #$00, D0
                move.b  $0034(A0), D0
                add.w   $0032(A0), D0
                move.w  D0, $000C(A0)
                rts
Offset_0x0274A4:
                moveq   #$00, D0
                move.b  $0034(A0), D0
                neg.w   D0
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                rts
Offset_0x0274B6:
                tst.w   $0038(A0)
                beq.s   Offset_0x0274DA
                move.b  ($FFFFFE05).w, D0
                andi.b  #$3F, D0
                bne.s   Offset_0x027536
                clr.w   $0038(A0)
                tst.b   $0001(A0)
                bpl.s   Offset_0x0274DA
                move.w  #Spike_Moving_Sfx, D0   ; $00B6
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0274DA:
                tst.w   $0036(A0)
                beq.s   Offset_0x027516
                subi.w  #$0800, $0034(A0)
                bcc.s   Offset_0x027536
                move.w  #$0000, $0034(A0)
                move.w  #$0000, $0036(A0)
                move.w  #$0001, $0038(A0)
                addq.b  #$01, $0025(A0)
                andi.b  #$03, $0025(A0)
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.b  D0, $001A(A0)
                move.b  Offset_0x027538(PC, D0), $0020(A0)
                rts
Offset_0x027516:
                addi.w  #$0800, $0034(A0)
                cmpi.w  #$2000, $0034(A0)
                bcs.s   Offset_0x027536
                move.w  #$2000, $0034(A0)
                move.w  #$0001, $0036(A0)
                move.w  #$0001, $0038(A0)
Offset_0x027536:
                rts
;-------------------------------------------------------------------------------                
Offset_0x027538:
                dc.b    $84, $A6, $84, $A6
;-------------------------------------------------------------------------------
Block_Harpon_Mappings: ; Offset_0x02753C:
                dc.w    Offset_0x027546-Block_Harpon_Mappings
                dc.w    Offset_0x027550-Block_Harpon_Mappings
                dc.w    Offset_0x02755A-Block_Harpon_Mappings
                dc.w    Offset_0x027564-Block_Harpon_Mappings
                dc.w    Offset_0x02756E-Block_Harpon_Mappings
Offset_0x027546:
                dc.w    $0001
                dc.l    $F0031000, $1000FFFC
Offset_0x027550:
                dc.w    $0001
                dc.l    $FC0C0004, $0002FFF0
Offset_0x02755A:
                dc.w    $0001
                dc.l    $F0030000, $0000FFFC
Offset_0x027564:
                dc.w    $0001
                dc.l    $FC0C0804, $0802FFF0
Offset_0x02756E:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0, $F0070800, $08000000
;===============================================================================
; Objeto 0x68 - Bloco com harpão na Metropolis
; [ Término ]
;===============================================================================  