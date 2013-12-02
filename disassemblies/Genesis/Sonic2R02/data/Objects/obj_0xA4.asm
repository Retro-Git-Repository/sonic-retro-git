;===============================================================================
; Objeto 0xA4 - Inimigo Asteron na Metropolis
; [ Início ]
;===============================================================================    
Offset_0x0384F4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038502(PC, D0), D1
                jmp     Offset_0x038502(PC, D1)
Offset_0x038502:
                dc.w    Offset_0x03850A-Offset_0x038502
                dc.w    Offset_0x03850E-Offset_0x038502
                dc.w    Offset_0x038536-Offset_0x038502
                dc.w    Offset_0x03858A-Offset_0x038502
Offset_0x03850A:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x03850E:
                bsr     Offset_0x0360FC
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcc.s   Offset_0x038526
                addi.w  #$0040, D3
                cmpi.w  #$0080, D3
                bcs.s   Offset_0x03852C
Offset_0x038526:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03852C:
                addq.b  #$02, $0024(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x038536:
                bsr     Offset_0x0360FC
                tst.w   D2
                bpl.s   Offset_0x038540
                neg.w   D2
Offset_0x038540:
                cmpi.w  #$0010, D2
                bcs.s   Offset_0x038556
                cmpi.w  #$0060, D2
                bcc.s   Offset_0x038556
                move.w  Offset_0x038578(PC, D0), $0010(A0)
                bsr     Offset_0x03857C
Offset_0x038556:
                tst.w   D3
                bpl.s   Offset_0x03855C
                neg.w   D3
Offset_0x03855C:
                cmpi.w  #$0010, D3
                bcs.s   Offset_0x038572
                cmpi.w  #$0060, D3
                bcc.s   Offset_0x038572
                move.w  Offset_0x038578(PC, D1), $0012(A0)
                bsr     Offset_0x03857C
Offset_0x038572:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x038578:
                dc.w    $FFC0, $0040
Offset_0x03857C:
                move.b  #$06, $0024(A0)
                move.b  #$40, $002A(A0)
                rts
Offset_0x03858A:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0385A8
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Asteron_Animate_Data), A1             ; Offset_0x0385F6
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0385A8:
                move.b  #$27, $0000(A0)
                move.b  #$02, $0024(A0)
                bsr     Offset_0x0385BE
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0385BE:
                move.b  #$30, D2
                moveq   #$04, D6
                lea     (Offset_0x0385CE), A2
                bra     Enemy_Weapon                           ; Offset_0x036240
;-------------------------------------------------------------------------------                   
Offset_0x0385CE:
                dc.b    $00, $F8, $00, $FC, $02, $00, $08, $FC, $03, $FF, $03, $01, $08, $08, $03, $03
                dc.b    $04, $01, $F8, $08, $FD, $03, $04, $00, $F8, $FC, $FD, $FF, $03, $00  
;-------------------------------------------------------------------------------
Obj_0xA4_Ptr: ; Offset_0x0385EC:
                dc.l    Asteron_Mappings                       ; Offset_0x0385FC
                dc.w    $8368
                dc.b    $04, $04, $10, $0B            
;-------------------------------------------------------------------------------
Asteron_Animate_Data: ; Offset_0x0385F6:
                dc.w    Offset_0x0385F8-Asteron_Animate_Data
Offset_0x0385F8:
                dc.b    $01, $00, $01, $FF       
;-------------------------------------------------------------------------------
Asteron_Mappings: ; Offset_0x0385FC:
                dc.w    Offset_0x038606-Asteron_Mappings
                dc.w    Offset_0x038618-Asteron_Mappings
                dc.w    Offset_0x038632-Asteron_Mappings
                dc.w    Offset_0x03863C-Asteron_Mappings
                dc.w    Offset_0x038646-Asteron_Mappings
Offset_0x038606:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0, $F0070800, $08000000
Offset_0x038618:
                dc.w    $0003
                dc.l    $FD00200E, $2007FFFC, $F0070000, $0000FFF0
                dc.l    $F0070800, $08000000
Offset_0x038632:
                dc.w    $0001
                dc.l    $F8010008, $0004FFFC
Offset_0x03863C:
                dc.w    $0001
                dc.l    $FC04000A, $0005FFF8
Offset_0x038646:
                dc.w    $0001
                dc.l    $F801000C, $0006FFFC                         
;===============================================================================
; Objeto 0xA4 - Inimigo Asteron na Metropolis
; [ Término ]
;===============================================================================  