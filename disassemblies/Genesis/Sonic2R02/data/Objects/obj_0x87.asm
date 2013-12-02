;===============================================================================
; Objeto 0x87 - Mostrador de anéis no Special Stage
; [ Início ]    
;===============================================================================         
Offset_0x007306:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x007314(PC, D0), D1
                jmp     Offset_0x007314(PC, D1)
Offset_0x007314:
                dc.w    Offset_0x00731C-Offset_0x007314
                dc.w    Offset_0x00742E-Offset_0x007314
                dc.w    Offset_0x0074EA-Offset_0x007314
                dc.w    Offset_0x00758E-Offset_0x007314
Offset_0x00731C:
                move.b  #$02, $000A(A0)
                move.l  #SS_Ring_Count_Display_Mappings, $0004(A0) ; Offset_0x007282
                move.w  #$41FA, $0002(A0)
                move.b  #$04, $0001(A0)
                bset    #$06, $0001(A0)
                move.b  #$02, $000F(A0)
                move.w  #$0020, D0
                moveq   #$00, D1
                lea     $0010(A0), A1
                move.w  #$0048, (A1)
                move.w  D0, $0002(A1)
                move.w  D1, $0004(A1)
                move.w  #$00E0, $0006(A1)
                move.w  D0, $0008(A1)
                move.w  D1, $000A(A1)
                move.w  D0, $000E(A1)
                move.w  D0, $0014(A1)
                move.w  D0, $001A(A1)
                move.w  D0, $0020(A1)
                tst.b   ($FFFFFE00).w
                bne.s   Offset_0x0073D8
                cmpi.w  #$0000, ($FFFFFF7A).w
                beq.s   Offset_0x00738E
                subq.b  #$01, $000F(A0)
                move.w  #$0094, (A1)
                rts
Offset_0x00738E:
                bsr     Offset_0x006F30
                bne.s   Offset_0x0073D6
                move.b  #$87, (A1)         ; Nova instância do objeto na memória
                move.b  #$04, $000A(A1)
                move.l  #SS_Ring_Count_Display_Mappings, $0004(A1) ; Offset_0x007282
                move.w  #$41FA, $0002(A1)
                move.b  #$04, $0001(A1)
                bset    #$06, $0001(A1)
                move.b  #$01, $000F(A1)
                lea     $0010(A1), A2
                move.w  #$0080, (A2)
                move.w  D0, $0002(A2)
                move.w  D1, $0004(A2)
                move.w  D0, $0008(A2)
                move.w  D0, $000E(A2)
Offset_0x0073D6:
                rts
Offset_0x0073D8:
                bsr     Offset_0x006F30
                bne.s   Offset_0x0073D6
                move.b  #$87, (A1)         ; Nova instância do objeto na memória
                move.b  #$06, $000A(A1)
                move.l  #SS_Ring_Count_Display_Mappings, $0004(A1) ; Offset_0x007282
                move.w  #$41FA, $0002(A1)
                move.b  #$04, $0001(A1)
                bset    #$06, $0001(A1)
                move.b  #$00, $000F(A1)
                lea     $0010(A1), A2
                move.w  #$002C, D0
                move.w  #$000A, D1
                move.w  D0, $0002(A2)
                move.w  D1, $0004(A2)
                move.w  D0, $0008(A2)
                move.w  D1, $000A(A2)
                move.w  D0, $000E(A2)
                move.w  D1, $0010(A2)
                rts            
Offset_0x00742E:
                moveq   #$00, D0
                moveq   #$00, D3
                moveq   #$00, D5
                lea     $0010(A0), A1
                move.l  A1, A2
                addq.w  #$05, A2
                cmpi.w  #$0002, ($FFFFFF7A).w
                beq.s   Offset_0x007496
                move.b  ($FFFFB03C).w, D0
                beq.s   Offset_0x007452
                addq.w  #$01, D3
                move.b  D0, (A2)
                lea     $0006(A2), A2
Offset_0x007452:
                move.b  ($FFFFB03D).w, D0
                tst.b   D3
                bne.s   Offset_0x00745E
                tst.b   D0
                beq.s   Offset_0x007466
Offset_0x00745E:
                addq.w  #$01, D3
                move.b  D0, (A2)
                lea     $0006(A2), A2
Offset_0x007466:
                addq.w  #$01, D3
                move.b  ($FFFFB03E).w, (A2)
                lea     $0006(A2), A2
                move.w  D3, D4
                subq.w  #$01, D4
                move.w  #$0048, D1
                tst.w   ($FFFFFF7A).w
                beq.s   Offset_0x007482
                addi.w  #$0054, D1
Offset_0x007482:
                move.w  D1, $00(A1, D5)
                addq.w  #$08, D1
                addq.w  #$06, D5
                dbra    D4, Offset_0x007482
                cmpi.w  #$0001, ($FFFFFF7A).w
                beq.s   Offset_0x0074E0
Offset_0x007496:
                moveq   #$00, D0
                moveq   #$00, D4
                move.b  ($FFFFB07C).w, D0
                beq.s   Offset_0x0074A8
                addq.w  #$01, D4
                move.b  D0, (A2)
                lea     $0006(A2), A2
Offset_0x0074A8:
                move.b  ($FFFFB07D).w, D0
                tst.b   D4
                bne.s   Offset_0x0074B4
                tst.b   D0
                beq.s   Offset_0x0074BC
Offset_0x0074B4:
                addq.w  #$01, D4
                move.b  D0, (A2)
                lea     $0006(A2), A2
Offset_0x0074BC:
                move.b  ($FFFFB07E).w, (A2)
                addq.w  #$01, D4
                add.w   D4, D3
                subq.w  #$01, D4
                move.w  #$00E0, D1
                tst.w   ($FFFFFF7A).w
                beq.s   Offset_0x0074D4
                subi.w  #$0044, D1
Offset_0x0074D4:
                move.w  D1, $00(A1, D5)
                addq.w  #$08, D1
                addq.w  #$06, D5
                dbra    D4, Offset_0x0074D4
Offset_0x0074E0:
                move.b  D3, $000F(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0074EA:
                moveq   #$00, D0
                moveq   #$00, D1
                moveq   #$00, D2
                moveq   #$01, D3
                move.b  ($FFFFB03E).w, D0
                add.b   ($FFFFB07E).w, D0
                move.b  ($FFFFB03D).w, D1
                add.b   ($FFFFB07D).w, D1
                move.b  ($FFFFB03C).w, D2
                add.b   ($FFFFB07C).w, D2
                cmpi.b  #$0A, D0
                bcs.s   Offset_0x007516
                addq.w  #$01, D1
                subi.b  #$0A, D0
Offset_0x007516:
                tst.b   D1
                beq.s   Offset_0x007530
                cmpi.b  #$0A, D1
                bcs.s   Offset_0x007526
                addq.b  #$01, D2
                subi.b  #$0A, D1
Offset_0x007526:
                addq.w  #$01, D3
                tst.b   D2
                beq.s   Offset_0x007536
                addq.w  #$01, D3
                bra.s   Offset_0x007536
Offset_0x007530:
                tst.b   D2
                beq.s   Offset_0x007536
                addq.w  #$02, D3
Offset_0x007536:
                lea     $0010(A0), A1
                move.b  D3, $000F(A0)
                cmpi.b  #$02, D3
                blt.s   Offset_0x007568
                beq.s   Offset_0x007576
                move.w  #$0078, (A1)
                move.b  D2, $0005(A1)
                move.w  #$0080, $0006(A1)
                move.b  D1, $000B(A1)
                move.w  #$0088, $000C(A1)
                move.b  D0, $0011(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x007568:
                move.w  #$0080, (A1)
                move.b  D0, $0005(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x007576:
                move.w  #$007C, (A1)
                move.b  D1, $0005(A1)
                move.w  #$0084, $0006(A1)
                move.b  D0, $000B(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00758E:
                move.b  ($FFFFDB93).w, D0
                bne.s   Offset_0x007596
                rts
Offset_0x007596:
                lea     $0010(A0), A1
                moveq   #$00, D2
                move.b  D0, D1
                andi.b  #$F0, D0
                beq.s   Offset_0x0075CC
                addq.w  #$01, D2
                move.w  #$0020, (A1)
                lea     $0006(A1), A1
                subi.b  #$10, D0
                beq.s   Offset_0x0075CC
                addq.w  #$01, D2
                move.w  #$0030, (A1)
                lea     $0006(A1), A1
                subi.b  #$10, D0
                beq.s   Offset_0x0075CC
                addq.w  #$01, D2
                move.w  #$0040, (A1)
                bra.s   Offset_0x0075F4
Offset_0x0075CC:
                andi.b  #$0F, D1
                beq.s   Offset_0x0075F4
                addq.w  #$01, D2
                move.w  #$00B8, (A1)
                lea     $0006(A1), A1
                subq.b  #$01, D1
                beq.s   Offset_0x0075F4
                addq.w  #$01, D2
                move.w  #$00C8, (A1)
                lea     $0006(A1), A1
                subq.b  #$01, D1
                beq.s   Offset_0x0075F4
                addq.w  #$01, D2
                move.w  #$00D8, (A1)
Offset_0x0075F4:
                move.b  D2, $000F(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A                
;===============================================================================
; Objeto 0x87 - Mostrador de anéis no Special Stage
; [ Término ]   
;===============================================================================  