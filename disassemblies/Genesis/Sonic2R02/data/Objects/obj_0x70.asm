;===============================================================================
; Objeto 0x70 - Engrenagens na Metropolis
; [ Início ]
;=============================================================================== 
Offset_0x02833A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x028348(PC, D0), D1
                jmp     Offset_0x028348(PC, D1)
Offset_0x028348:
                dc.w    Offset_0x02834C-Offset_0x028348
                dc.w    Offset_0x0283D0-Offset_0x028348
Offset_0x02834C:
                moveq   #$07, D1
                moveq   #$00, D4
                lea     (Offset_0x0284A6), A2
                move.l  A0, A1
                move.w  $0008(A0), D2
                move.w  $000C(A0), D3
                bset    #$07, $0022(A0)
                bra.s   Offset_0x028370
Offset_0x028368:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0283CC
Offset_0x028370:
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                addq.b  #$02, $0024(A1)
                move.l  #Rotating_Gears_Mappings, $0004(A1)    ; Offset_0x028506   
                move.w  #$6378, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.b  #$10, $0019(A1)
                move.w  D2, $0032(A1)
                move.w  D3, $0030(A1)
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D2, D0
                move.w  D0, $0008(A1)
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D3, D0
                move.w  D0, $000C(A1)
                move.b  (A2)+, $001A(A1)
                move.w  D4, $0034(A1)
                addq.w  #$03, D4
                move.b  $0022(A0), $0022(A1)
Offset_0x0283CC:
                dbra    D1, Offset_0x028368
Offset_0x0283D0:
                move.w  $0008(A0), -(A7)
                move.b  ($FFFFFE05).w, D0
                move.b  D0, D1
                andi.w  #$000F, D0
                bne.s   Offset_0x028448
                move.w  $0036(A0), D1
                btst    #$00, $0022(A0)
                beq.s   Offset_0x028402
                subi.w  #$0018, D1
                bcc.s   Offset_0x028420
                moveq   #$48, D1
                subq.w  #$03, $0034(A0)
                bcc.s   Offset_0x028420
                move.w  #$0015, $0034(A0)
                bra.s   Offset_0x028420
Offset_0x028402:
                addi.w  #$0018, D1
                cmpi.w  #$0060, D1
                bcs.s   Offset_0x028420
                moveq   #$00, D1
                addq.w  #$03, $0034(A0)
                cmpi.w  #$0018, $0034(A0)
                bcs.s   Offset_0x028420
                move.w  #$0000, $0034(A0)
Offset_0x028420:
                move.w  D1, $0036(A0)
                add.w   $0034(A0), D1
                lea     Offset_0x0284A6(PC, D1), A1
                move.b  (A1)+, D0
                ext.w   D0
                add.w   $0032(A0), D0
                move.w  D0, $0008(A0)
                move.b  (A1)+, D0
                ext.w   D0
                add.w   $0030(A0), D0
                move.w  D0, $000C(A0)
                move.b  (A1)+, $001A(A0)
Offset_0x028448:
                move.b  $001A(A0), D0
                add.w   D0, D0
                andi.w  #$001E, D0
                moveq   #$00, D1
                moveq   #$00, D2
                move.b  Offset_0x028486(PC, D0), D1
                move.b  Offset_0x028486+$01(PC, D0), D2
                move.w  D2, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  $0032(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x028480
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x028480:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------                
Offset_0x028486:
                dc.b    $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $0C
                dc.b    $10, $08, $10, $0C, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10
;-------------------------------------------------------------------------------
Offset_0x0284A6:
                dc.b    $00, $B8, $00, $32, $CE, $04, $48, $00, $08, $32, $32, $0C, $00, $48, $10, $CE
                dc.b    $32, $14, $B8, $00, $18, $CE, $CE, $1C, $0D, $B8, $01, $3F, $DA, $05, $48, $0C
                dc.b    $09, $27, $3C, $0D, $F3, $48, $11, $C1, $26, $15, $B8, $F4, $19, $D9, $C4, $1D
                dc.b    $19, $BC, $02, $46, $E9, $06, $46, $17, $0A, $19, $44, $0E, $E7, $44, $12, $BA
                dc.b    $17, $16, $BA, $E9, $1A, $E7, $BC, $1E, $27, $C4, $03, $48, $F4, $07, $3F, $26
                dc.b    $0B, $0D, $48, $0F, $D9, $3C, $13, $B8, $0C, $17, $C1, $DA, $1B, $F3, $B8, $1F
;-------------------------------------------------------------------------------
Rotating_Gears_Mappings: ; Offset_0x028506:                
                dc.w    Offset_0x028546-Rotating_Gears_Mappings
                dc.w    Offset_0x028558-Rotating_Gears_Mappings
                dc.w    Offset_0x028562-Rotating_Gears_Mappings
                dc.w    Offset_0x02856C-Rotating_Gears_Mappings
                dc.w    Offset_0x028576-Rotating_Gears_Mappings
                dc.w    Offset_0x028580-Rotating_Gears_Mappings
                dc.w    Offset_0x02858A-Rotating_Gears_Mappings
                dc.w    Offset_0x028594-Rotating_Gears_Mappings
                dc.w    Offset_0x02859E-Rotating_Gears_Mappings
                dc.w    Offset_0x0285B0-Rotating_Gears_Mappings
                dc.w    Offset_0x0285BA-Rotating_Gears_Mappings
                dc.w    Offset_0x0285C4-Rotating_Gears_Mappings
                dc.w    Offset_0x0285CE-Rotating_Gears_Mappings
                dc.w    Offset_0x0285D8-Rotating_Gears_Mappings
                dc.w    Offset_0x0285E2-Rotating_Gears_Mappings
                dc.w    Offset_0x0285EC-Rotating_Gears_Mappings
                dc.w    Offset_0x0285F6-Rotating_Gears_Mappings
                dc.w    Offset_0x028608-Rotating_Gears_Mappings
                dc.w    Offset_0x028612-Rotating_Gears_Mappings
                dc.w    Offset_0x02861C-Rotating_Gears_Mappings
                dc.w    Offset_0x028626-Rotating_Gears_Mappings
                dc.w    Offset_0x028630-Rotating_Gears_Mappings
                dc.w    Offset_0x02863A-Rotating_Gears_Mappings
                dc.w    Offset_0x028644-Rotating_Gears_Mappings
                dc.w    Offset_0x02864E-Rotating_Gears_Mappings
                dc.w    Offset_0x028660-Rotating_Gears_Mappings
                dc.w    Offset_0x02866A-Rotating_Gears_Mappings
                dc.w    Offset_0x028674-Rotating_Gears_Mappings
                dc.w    Offset_0x02867E-Rotating_Gears_Mappings
                dc.w    Offset_0x028688-Rotating_Gears_Mappings
                dc.w    Offset_0x028692-Rotating_Gears_Mappings
                dc.w    Offset_0x02869C-Rotating_Gears_Mappings
Offset_0x028546:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0, $F0070800, $08000000
Offset_0x028558:
                dc.w    $0001
                dc.l    $F00B0808, $0804FFF4
Offset_0x028562:
                dc.w    $0001
                dc.l    $F00F0814, $080AFFF0
Offset_0x02856C:
                dc.w    $0001
                dc.l    $F00F0824, $0812FFF0
Offset_0x028576:
                dc.w    $0001
                dc.l    $F00F0834, $081AFFF0
Offset_0x028580:
                dc.w    $0001
                dc.l    $F00F0844, $0822FFF0
Offset_0x02858A:
                dc.w    $0001
                dc.l    $F00F0854, $082AFFF0
Offset_0x028594:
                dc.w    $0001
                dc.l    $F40E0864, $0832FFF0
Offset_0x02859E:
                dc.w    $0002
                dc.l    $F00D0870, $0838FFF0, $000D1870, $1838FFF0
Offset_0x0285B0:
                dc.w    $0001
                dc.l    $F40E1864, $1832FFF0
Offset_0x0285BA:
                dc.w    $0001
                dc.l    $F00F1854, $182AFFF0
Offset_0x0285C4:
                dc.w    $0001
                dc.l    $F00F1844, $1822FFF0
Offset_0x0285CE:
                dc.w    $0001
                dc.l    $F00F1834, $181AFFF0
Offset_0x0285D8:
                dc.w    $0001
                dc.l    $F00F1824, $1812FFF0
Offset_0x0285E2:
                dc.w    $0001
                dc.l    $F00F1814, $180AFFF0
Offset_0x0285EC:
                dc.w    $0001
                dc.l    $F00B1808, $1804FFF4
Offset_0x0285F6:
                dc.w    $0002
                dc.l    $F0071000, $1000FFF0, $F0071800, $18000000
Offset_0x028608:
                dc.w    $0001
                dc.l    $F00B1008, $1004FFF4
Offset_0x028612:
                dc.w    $0001
                dc.l    $F00F1014, $100AFFF0
Offset_0x02861C:
                dc.w    $0001
                dc.l    $F00F1024, $1012FFF0
Offset_0x028626:
                dc.w    $0001
                dc.l    $F00F1034, $101AFFF0
Offset_0x028630:
                dc.w    $0001
                dc.l    $F00F1044, $1022FFF0
Offset_0x02863A:
                dc.w    $0001
                dc.l    $F00F1054, $102AFFF0
Offset_0x028644:
                dc.w    $0001
                dc.l    $F40E1064, $1032FFF0
Offset_0x02864E:
                dc.w    $0002
                dc.l    $F00D0070, $0038FFF0, $000D1070, $1038FFF0
Offset_0x028660:
                dc.w    $0001
                dc.l    $F40E0064, $0032FFF0
Offset_0x02866A:
                dc.w    $0001
                dc.l    $F00F0054, $002AFFF0
Offset_0x028674:
                dc.w    $0001
                dc.l    $F00F0044, $0022FFF0
Offset_0x02867E:
                dc.w    $0001
                dc.l    $F00F0034, $001AFFF0
Offset_0x028688:
                dc.w    $0001
                dc.l    $F00F0024, $0012FFF0
Offset_0x028692:
                dc.w    $0001
                dc.l    $F00F0014, $000AFFF0
Offset_0x02869C:
                dc.w    $0001
                dc.l    $F00B0008, $0004FFF4        
;===============================================================================
; Objeto 0x70 - Engrenagens na Metropolis
; [ Término ]
;===============================================================================  