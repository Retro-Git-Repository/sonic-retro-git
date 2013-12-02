;===============================================================================
; Objeto 0x88 - Rabo do Miles no Special Stage
; [ Início ]
;===============================================================================    
Offset_0x0344A8:                
                move.l  $0038(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  $0001(A1), $0001(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $001C(A1), $001C(A0)
                move.b  $0018(A1), D0
                subq.b  #$01, D0
                move.b  D0, $0018(A0)
                cmpi.b  #$03, $001C(A0)
                bcc.s   Offset_0x0344EC
                lea     (Miles_Tail_In_SS_AnimateData), A1     ; Offset_0x0347D6
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Offset_0x0344FA
Offset_0x0344EC:
                rts
;-------------------------------------------------------------------------------                
Offset_0x0344EE:
                dc.l    $00FF55C0, $00FF5C60, $00FF63C0
;-------------------------------------------------------------------------------
Offset_0x0344FA:
                move.l  $0038(A0), A1
                move.b  $0023(A1), D0
                beq.s   Offset_0x03450C
                andi.b  #$01, D0
                beq.s   Offset_0x03450C
                rts
Offset_0x03450C:
                jsr     (DisplaySprite)                        ; Offset_0x01647A
                moveq   #$00, D0
                move.b  $001A(A0), D0
                cmp.b   ($FFFFF7DF).w, D0
                beq.s   Offset_0x03456A
                move.b  D0, ($FFFFF7DF).w
                moveq   #$00, D6
                cmpi.b  #$07, D0
                blt.s   Offset_0x034534
                addq.w  #$04, D6
                cmpi.b  #$0E, D0
                blt.s   Offset_0x034534
                addq.w  #$04, D6
Offset_0x034534:
                move.l  Offset_0x0344EE(PC, D6), D6
                addi.w  #$0024, D0
                add.w   D0, D0
                lea     (Miles_In_SS_Dyn_Script), A2           ; Offset_0x034052
                adda.w  $00(A2, D0), A2
                move.w  #$62C0, D2
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.w   #$01, D1
                add.l   D6, D1
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x00140A
Offset_0x03456A:
                rts
;-------------------------------------------------------------------------------
Miles_In_SS_AnimateData: ; Offset_0x03456C:
                dc.w    Offset_0x034574-Miles_In_SS_AnimateData    
                dc.w    Offset_0x03457A-Miles_In_SS_AnimateData
                dc.w    Offset_0x034584-Miles_In_SS_AnimateData
                dc.w    Offset_0x03458A-Miles_In_SS_AnimateData
Offset_0x034574:
                dc.b    $03, $00, $01, $02, $03, $FF
Offset_0x03457A:
                dc.b    $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $FF
Offset_0x034584:
                dc.b    $03, $0C, $0D, $0E, $0F, $FF
Offset_0x03458A:
                dc.b    $01, $10, $11, $FF
;-------------------------------------------------------------------------------
Miles_In_SS_Mappings:  ; Offset_0x03458E:
                dc.w    Offset_0x0345B2-Miles_In_SS_Mappings
                dc.w    Offset_0x0345CC-Miles_In_SS_Mappings
                dc.w    Offset_0x0345EE-Miles_In_SS_Mappings
                dc.w    Offset_0x034610-Miles_In_SS_Mappings
                dc.w    Offset_0x03463A-Miles_In_SS_Mappings
                dc.w    Offset_0x034654-Miles_In_SS_Mappings
                dc.w    Offset_0x034676-Miles_In_SS_Mappings
                dc.w    Offset_0x0346A0-Miles_In_SS_Mappings
                dc.w    Offset_0x0346C2-Miles_In_SS_Mappings
                dc.w    Offset_0x0346E4-Miles_In_SS_Mappings
                dc.w    Offset_0x03470E-Miles_In_SS_Mappings
                dc.w    Offset_0x034738-Miles_In_SS_Mappings
                dc.w    Offset_0x03475A-Miles_In_SS_Mappings
                dc.w    Offset_0x03476C-Miles_In_SS_Mappings
                dc.w    Offset_0x034786-Miles_In_SS_Mappings
                dc.w    Offset_0x034798-Miles_In_SS_Mappings
                dc.w    Offset_0x0347B2-Miles_In_SS_Mappings
                dc.w    Offset_0x0347C4-Miles_In_SS_Mappings
Offset_0x0345B2:
                dc.w    $0003
                dc.l    $E80A8000, $8000FFF4, $00098009, $8004FFF4
                dc.l    $1000800F, $8007FFF4
Offset_0x0345CC:
                dc.w    $0004
                dc.l    $E80C8000, $8000FFF0, $F0098004, $8002FFF3
                dc.l    $000C800A, $8005FFF0, $0805800E, $8007FFF8
Offset_0x0345EE:
                dc.w    $0004
                dc.l    $E80C8000, $8000FFF0, $F0098004, $8002FFF3
                dc.l    $000C800A, $8005FFF0, $0805800E, $8007FFF8
Offset_0x034610:
                dc.w    $0005
                dc.l    $E80C8800, $8800FFF0, $F0098804, $8802FFF5
                dc.l    $000C800A, $8005FFF0, $0805800E, $8007FFF8
                dc.l    $10008012, $80090008
Offset_0x03463A:
                dc.w    $0003
                dc.l    $E1058000, $80000000, $F10D8004, $8002FFF8
                dc.l    $010D800C, $8006FFEC
Offset_0x034654:
                dc.w    $0004
                dc.l    $E1018000, $80000000, $F10D8002, $8001FFF7
                dc.l    $010A800A, $8005FFEF, $01018013, $80090007
Offset_0x034676:
                dc.w    $0005
                dc.l    $E8008000, $80000000, $EC088001, $8000FFF8
                dc.l    $F40D8004, $8002FFF0, $F400800C, $80060010
                dc.l    $0409800D, $8006FFF0
Offset_0x0346A0:
                dc.w    $0004
                dc.l    $E9008000, $80000001, $F10F8001, $8000FFF0
                dc.l    $F9008011, $80080010, $11048012, $8009FFF0
Offset_0x0346C2:
                dc.w    $0004
                dc.l    $E2058000, $80000000, $F20C8004, $8002FFF8
                dc.l    $FA078008, $8004FFF0, $FA098010, $80080000
Offset_0x0346E4:
                dc.w    $0005
                dc.l    $E8008000, $80000000, $F00D8001, $8000FFF0
                dc.l    $F8008009, $80040010, $000D800A, $8005FFF0
                dc.l    $10048012, $8009FFF0
Offset_0x03470E:
                dc.w    $0005
                dc.l    $E8008000, $80000000, $F00E8001, $8000FFF0
                dc.l    $F800800D, $80060010, $080C800E, $8007FFE8
                dc.l    $10048012, $8009FFF0
Offset_0x034738:
                dc.w    $0004
                dc.l    $E8008000, $80000000, $F00E8001, $8000FFF0
                dc.l    $F800800D, $80060010, $080D800E, $8007FFE8
Offset_0x03475A:
                dc.w    $0002
                dc.l    $F80A8000, $8000FFEC, $F0078009, $80040004
Offset_0x03476C:
                dc.w    $0003
                dc.l    $F8058000, $8000FFEC, $08008004, $8002FFF4
                dc.l    $F00B8005, $8002FFFC
Offset_0x034786:
                dc.w    $0002
                dc.l    $F7018000, $8000FFEC, $F00F8002, $8001FFF4
Offset_0x034798:
                dc.w    $0003
                dc.l    $F8028000, $8000FFEC, $F0028003, $8001FFF4
                dc.l    $F00B8006, $8003FFFC
Offset_0x0347B2:
                dc.w    $0002
                dc.l    $F0078000, $8000FFF0, $F0078800, $88000000
Offset_0x0347C4:
                dc.w    $0002
                dc.l    $F0078000, $8000FFF0, $F0078800, $88000000    
;-------------------------------------------------------------------------------
Miles_Tail_In_SS_AnimateData: ; Offset_0x0347D6:
                dc.w    Offset_0x0347DC-Miles_Tail_In_SS_AnimateData   
                dc.w    Offset_0x0347E6-Miles_Tail_In_SS_AnimateData
                dc.w    Offset_0x0347F0-Miles_Tail_In_SS_AnimateData
Offset_0x0347DC:
                dc.b    $03, $00, $01, $02, $03, $04, $05, $06, $FF, $00
Offset_0x0347E6:
                dc.b    $03, $07, $08, $09, $0A, $0B, $0C, $0D, $FF, $00
Offset_0x0347F0:
                dc.b    $03, $0E, $0F, $10, $11, $12, $13, $14, $FF, $00
;-------------------------------------------------------------------------------
Miles_Tail_In_SS_Mappings: ; Offset_0x0347FA:
                dc.w    Offset_0x034824-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x03482E-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x034838-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x034842-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x03484C-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x034856-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x034860-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x03486A-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x034874-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x03487E-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x034888-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x034892-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x03489C-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348A6-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348B0-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348BA-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348C4-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348CE-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348D8-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348E2-Miles_Tail_In_SS_Mappings
                dc.w    Offset_0x0348EC-Miles_Tail_In_SS_Mappings
Offset_0x034824:
                dc.w    $0001
                dc.l    $FA068000, $8000FFFA
Offset_0x03482E:
                dc.w    $0001
                dc.l    $000A8000, $8000FFF8
Offset_0x034838:
                dc.w    $0001
                dc.l    $08098000, $8000FFF8
Offset_0x034842:
                dc.w    $0001
                dc.l    $FF068000, $8000FFF7
Offset_0x03484C:
                dc.w    $0001
                dc.l    $F7078000, $8000FFF5
Offset_0x034856:
                dc.w    $0001
                dc.l    $F70A8000, $8000FFF0
Offset_0x034860:
                dc.w    $0001
                dc.l    $F70A8000, $8000FFF0
Offset_0x03486A:
                dc.w    $0001
                dc.l    $000A8000, $8000FFF4
Offset_0x034874:
                dc.w    $0001
                dc.l    $08098000, $8000FFF3
Offset_0x03487E:
                dc.w    $0001
                dc.l    $00068000, $8000FFF1
Offset_0x034888:
                dc.w    $0001
                dc.l    $F8078000, $8000FFF4
Offset_0x034892:
                dc.w    $0001
                dc.l    $F80B8000, $8000FFF2
Offset_0x03489C:
                dc.w    $0001
                dc.l    $F80A8000, $8000FFF3
Offset_0x0348A6:
                dc.w    $0001
                dc.l    $F80A8000, $8000FFF4
Offset_0x0348B0:
                dc.w    $0001
                dc.l    $FC098000, $8000FFEA
Offset_0x0348BA:
                dc.w    $0001
                dc.l    $F80A8000, $8000FFED
Offset_0x0348C4:
                dc.w    $0001
                dc.l    $F8068000, $8000FFED
Offset_0x0348CE:
                dc.w    $0001
                dc.l    $F7098000, $8000FFED
Offset_0x0348D8:
                dc.w    $0001
                dc.l    $F50D8000, $8000FFE5
Offset_0x0348E2:
                dc.w    $0001
                dc.l    $F00A8000, $8000FFED
Offset_0x0348EC:
                dc.w    $0001
                dc.l    $F00A8000, $8000FFED                                                           
;===============================================================================
; Objeto 0x88 - Rabo do Miles no Special Stage 
; [ Término ]
;===============================================================================