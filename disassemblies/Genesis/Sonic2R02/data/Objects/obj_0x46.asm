;===============================================================================
; Objeto 0x46 - Bola emcima da mola após pressionar o switch a bola ejeta
; [ Início ]    podendo ser usada como veículo na Oil Ocean - Objeto não usado
;===============================================================================  
Offset_0x0248D0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0248DE(PC, D0), D1
                jmp     Offset_0x0248DE(PC, D1)
Offset_0x0248DE:
                dc.w    Offset_0x0248E6-Offset_0x0248DE
                dc.w    Offset_0x0249A8-Offset_0x0248DE
                dc.w    Offset_0x0249F8-Offset_0x0248DE
                dc.w    Offset_0x024AA4-Offset_0x0248DE
Offset_0x0248E6:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x024902
                bclr    #$07, $02(A2, D0)
                bset    #$00, $02(A2, D0)
                bne     Offset_0x024A9E
Offset_0x024902:
                addq.b  #$02, $0024(A0)
                move.b  #$0F, $0016(A0)
                move.b  #$0F, $0017(A0)
                move.l  #Spring_Ball_Mappings, $0004(A0)       ; Offset_0x024B1C
                move.w  #$6354, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.w  $0008(A0), $0034(A0)
                move.w  $000C(A0), $0036(A0)
                move.b  #$10, $0019(A0)
                move.b  #$00, $001A(A0)
                move.w  #$0000, $0014(A0)
                move.b  #$01, $001F(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x0249A4
                move.b  #$46, $0000(A1)    ; Nova instância do objeto na memória
                addq.b  #$06, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0012, $000C(A1)
                move.l  #Spring_Push_Boost_Mappings, $0004(A1) ; Offset_0x0243D4
                move.w  #$43C5, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$04, $0018(A1)
                move.b  #$09, $001A(A1)
                move.l  A0, $003C(A1)
Offset_0x0249A4:
                move.l  A1, $003C(A0)
Offset_0x0249A8:
                btst    #$06, ($FFFFF607).w
                bne.s   Offset_0x0249C2
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$04, D0
                tst.b   $00(A2, D0)
                beq.s   Offset_0x0249EE
Offset_0x0249C2:
                addq.b  #$02, $0024(A0)
                bset    #$01, $0022(A0)
                move.w  #$FD00, $0012(A0)
                move.w  #$0100, $0014(A0)
                move.l  $003C(A0), A1
                move.b  #$01, $0030(A1)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x0249EE
                neg.w   $0014(A0)
Offset_0x0249EE:
                bsr     Offset_0x024ABA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0249F8:
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                btst    #$01, $0022(A0)
                beq.s   Offset_0x024A4E
                addi.w  #$0018, $0012(A0)
                bmi.s   Offset_0x024A4C
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                bcs.s   Offset_0x024A8A
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl     Offset_0x024A4C
                add.w   D1, $000C(A0)
                clr.w   $0012(A0)
                bclr    #$01, $0022(A0)
                move.w  #$0100, $0010(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x024A4C
                neg.w   $0010(A0)
Offset_0x024A4C:
                bra.s   Offset_0x024A66
Offset_0x024A4E:
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                cmpi.w  #$0008, D1
                blt.s   Offset_0x024A62
                bset    #$01, $0022(A0)
                bra.s   Offset_0x024A66
Offset_0x024A62:
                add.w   D1, $000C(A0)
Offset_0x024A66:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                bsr     Offset_0x024ABA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x024A8A:
                move.w  (A7)+, D4
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x024A9E
                bclr    #$07, $02(A2, D0)
Offset_0x024A9E:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x024AA4:
                tst.b   $0030(A0)
                beq.s   Offset_0x024AB4
                subq.b  #$01, $001A(A0)
                bne.s   Offset_0x024AB4
                clr.b   $0030(A0)
Offset_0x024AB4:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x024ABA:
                tst.b   $001A(A0)
                beq.s   Offset_0x024AC8
                move.b  #$00, $001A(A0)
                rts
Offset_0x024AC8:
                move.b  $0014(A0), D0
                beq.s   Offset_0x024AF4
                bmi.s   Offset_0x024AFC
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x024AF4
                neg.b   D0
                addq.b  #$08, D0
                bcs.s   Offset_0x024ADE
                moveq   #$00, D0
Offset_0x024ADE:
                move.b  D0, $001E(A0)
                move.b  $001F(A0), D0
                addq.b  #$01, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x024AF0
                moveq   #$01, D0
Offset_0x024AF0:
                move.b  D0, $001F(A0)
Offset_0x024AF4:
                move.b  $001F(A0), $001A(A0)
                rts
Offset_0x024AFC:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x024AF4
                addq.b  #$08, D0
                bcs.s   Offset_0x024B08
                moveq   #$00, D0
Offset_0x024B08:
                move.b  D0, $001E(A0)
                move.b  $001F(A0), D0
                subq.b  #$01, D0
                bne.s   Offset_0x024B16
                moveq   #$03, D0
Offset_0x024B16:
                move.b  D0, $001F(A0)
                bra.s   Offset_0x024AF4
;-------------------------------------------------------------------------------
Spring_Ball_Mappings: ; Offset_0x024B1C:
                dc.w    Offset_0x024B24-Spring_Ball_Mappings
                dc.w    Offset_0x024B46-Spring_Ball_Mappings
                dc.w    Offset_0x024B68-Spring_Ball_Mappings
                dc.w    Offset_0x024B7A-Spring_Ball_Mappings
Offset_0x024B24:
                dc.w    $0004
                dc.l    $F0050000, $0000FFF0, $F0050004, $00020000
                dc.l    $00051804, $1802FFF0, $00051004, $10020000
Offset_0x024B46:
                dc.w    $0004
                dc.l    $F0050008, $0004FFF0, $F0050808, $08040000
                dc.l    $00051008, $1004FFF0, $00051808, $18040000
Offset_0x024B68:
                dc.w    $0002
                dc.l    $F00D000C, $0006FFF0, $000D180C, $1806FFF0
Offset_0x024B7A:
                dc.w    $0002
                dc.l    $F00D080C, $0806FFF0, $000D100C, $1006FFF0
;===============================================================================
; Objeto 0x46 - Bola emcima da mola após pressionar o switch a bola ejeta
; [ Término ]   podendo ser usada como veículo na Oil Ocean - Objeto não usado
;===============================================================================  