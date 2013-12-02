;===============================================================================
; Objeto 0x2B - Pilar que sobe quando se aproxima e pode ser destruído na 
; [ Início ]    Aquatic Ruin 
;===============================================================================   
Offset_0x0258B8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0258C6(PC, D0), D1
                jmp     Offset_0x0258C6(PC, D1)
Offset_0x0258C6:
                dc.w    Offset_0x0258CC-Offset_0x0258C6
                dc.w    Offset_0x0258FC-Offset_0x0258C6
                dc.w    Offset_0x0259F2-Offset_0x0258C6
Offset_0x0258CC:
                addq.b  #$02, $0024(A0)
                move.l  #Raising_Pillar_Mappings, $0004(A0)    ; Offset_0x025AD8    
                move.w  #$2000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$18, $0016(A0)
                move.b  #$04, $0018(A0)
Offset_0x0258FC:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x02598C
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne     Offset_0x025932
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x025932:
                lea     (Offset_0x025A26), A4
                lea     (Offset_0x025A18), A2
                addq.b  #$07, $001A(A0)
                bsr     Offset_0x025A5E
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                bsr.s   Offset_0x02595A
                lea     ($FFFFB040).w, A1
                addq.b  #$01, D6
                bsr.s   Offset_0x02595A
                bra     Offset_0x0259F2
Offset_0x02595A:
                bclr    D6, $0022(A0)
                beq.s   Offset_0x02598A
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
Offset_0x02598A:
                rts
Offset_0x02598C:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02599A(PC, D0), D1
                jmp     Offset_0x02599A(PC, D1)
Offset_0x02599A:
                dc.w    Offset_0x0259A0-Offset_0x02599A
                dc.w    Offset_0x0259CA-Offset_0x02599A
                dc.w    Offset_0x0259C8-Offset_0x02599A
Offset_0x0259A0:
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x0259C8
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x0259B0
                lea     ($FFFFB040).w, A1
Offset_0x0259B0:
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x0259BC
                neg.w   D0
Offset_0x0259BC:
                cmpi.w  #$0040, D0
                bcc.s   Offset_0x0259C8
                move.b  #$02, $0025(A0)
Offset_0x0259C8:
                rts
Offset_0x0259CA:
                subq.w  #$01, $0034(A0)
                bcc.s   Offset_0x0259F0
                move.w  #$0003, $0034(A0)
                subq.w  #$04, $000C(A0)
                addq.b  #$04, $0016(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$06, $001A(A0)
                bne.s   Offset_0x0259F0
                move.b  #$04, $0025(A0)
Offset_0x0259F0:
                rts
Offset_0x0259F2:
                tst.b   $003F(A0)
                beq.s   Offset_0x0259FE
                subq.b  #$01, $003F(A0)
                bra.s   Offset_0x025A0A
Offset_0x0259FE:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
Offset_0x025A0A:
                tst.b   $0001(A0)
                bpl     Obj_0x2B_DeleteObject                  ; Offset_0x025F40
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                  
Offset_0x025A18:
                dc.b    $00, $00, $00, $00, $04, $04, $08, $08, $0C, $0C, $10, $10, $14, $14
;-------------------------------------------------------------------------------                  
Offset_0x025A26:
                dc.w    $FE00, $FE00, $0200, $FE00, $FE40, $FE40, $01C0, $FE40
                dc.w    $FE80, $FE80, $0180, $FE80, $FEC0, $FEC0, $0140, $FEC0
                dc.w    $FF00, $FF00, $0100, $FF00, $FF40, $FF40, $00C0, $FF40
                dc.w    $FF80, $FF80, $0080, $FF80
;-------------------------------------------------------------------------------  
Offset_0x025A5E:
                moveq   #$00, D0
                move.b  $001A(A0), D0
                add.w   D0, D0
                move.l  $0004(A0), A3
                adda.w  $00(A3, D0), A3
                move.w  (A3)+, D1
                subq.w  #$01, D1
                bset    #$05, $0001(A0)
                move.b  $0000(A0), D4
                move.b  $0001(A0), D5
                move.l  A0, A1
                bra.s   Offset_0x025A8E
Offset_0x025A84:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x025ACE
                addq.w  #$08, A3
Offset_0x025A8E:
                move.b  #$04, $0024(A1)
                move.b  D4, $0000(A1)
                move.l  A3, $0004(A1)
                move.b  D5, $0001(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  $0018(A0), $0018(A1)
                move.b  $0019(A0), $0019(A1)
                move.w  (A4)+, $0010(A1)
                move.w  (A4)+, $0012(A1)
                move.b  (A2)+, $003F(A1)
                dbra    D1, Offset_0x025A84
Offset_0x025ACE:
                move.w  #Break_Wall_Sfx, D0     ; $00CB
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------
Raising_Pillar_Mappings: ; Offset_0x025AD8:            
                dc.w    Offset_0x025AF4-Raising_Pillar_Mappings
                dc.w    Offset_0x025B26-Raising_Pillar_Mappings
                dc.w    Offset_0x025B60-Raising_Pillar_Mappings
                dc.w    Offset_0x025B9A-Raising_Pillar_Mappings
                dc.w    Offset_0x025BDC-Raising_Pillar_Mappings
                dc.w    Offset_0x025C1E-Raising_Pillar_Mappings
                dc.w    Offset_0x025C68-Raising_Pillar_Mappings
                dc.w    Offset_0x025CB2-Raising_Pillar_Mappings
                dc.w    Offset_0x025CF4-Raising_Pillar_Mappings
                dc.w    Offset_0x025D46-Raising_Pillar_Mappings
                dc.w    Offset_0x025D98-Raising_Pillar_Mappings
                dc.w    Offset_0x025DFA-Raising_Pillar_Mappings
                dc.w    Offset_0x025E5C-Raising_Pillar_Mappings
                dc.w    Offset_0x025ECE-Raising_Pillar_Mappings
Offset_0x025AF4:
                dc.w    $0006
                dc.l    $100D208B, $2045FFF0, $E805005D, $002EFFE0
                dc.l    $E805085D, $082E0010, $E80D0061, $0030FFF0
                dc.l    $F80D0069, $0034FFF0, $080D0083, $0041FFF0
Offset_0x025B26:
                dc.w    $0007
                dc.l    $140D208B, $2045FFF0, $E405005D, $002EFFE0
                dc.l    $E405085D, $082E0010, $E40D0061, $0030FFF0
                dc.l    $F40D0069, $0034FFF0, $FC0D0069, $0034FFF0
                dc.l    $0C0D0083, $0041FFF0
Offset_0x025B60:
                dc.w    $0007
                dc.l    $180D208B, $2045FFF0, $E005005D, $002EFFE0
                dc.l    $E005085D, $082E0010, $E00D0061, $0030FFF0
                dc.l    $F00D0069, $0034FFF0, $000D0069, $0034FFF0
                dc.l    $100D0083, $0041FFF0
Offset_0x025B9A:
                dc.w    $0008
                dc.l    $1C0D208B, $2045FFF0, $DC05005D, $002EFFE0
                dc.l    $DC05085D, $082E0010, $DC0D0061, $0030FFF0
                dc.l    $EC0D0069, $0034FFF0, $FC0D0069, $0034FFF0
                dc.l    $040D0069, $0034FFF0, $140D0083, $0041FFF0
Offset_0x025BDC:
                dc.w    $0008
                dc.l    $200D208B, $2045FFF0, $D805005D, $002EFFE0
                dc.l    $D805085D, $082E0010, $D80D0061, $0030FFF0
                dc.l    $E80D0069, $0034FFF0, $F80D0069, $0034FFF0
                dc.l    $080D0069, $0034FFF0, $180D0083, $0041FFF0
Offset_0x025C1E:
                dc.w    $0009
                dc.l    $240D208B, $2045FFF0, $D405005D, $002EFFE0
                dc.l    $D405085D, $082E0010, $D40D0061, $0030FFF0
                dc.l    $E40D0069, $0034FFF0, $F40D0069, $0034FFF0
                dc.l    $040D0069, $0034FFF0, $0C0D0069, $0034FFF0
                dc.l    $1C0D0083, $0041FFF0
Offset_0x025C68:
                dc.w    $0009
                dc.l    $280D208B, $2045FFF0, $D005005D, $002EFFE0
                dc.l    $D005085D, $082E0010, $D00D0061, $0030FFF0
                dc.l    $E00D0069, $0034FFF0, $F00D0069, $0034FFF0
                dc.l    $000D0069, $0034FFF0, $100D0069, $0034FFF0
                dc.l    $200D0083, $0041FFF0
Offset_0x025CB2:
                dc.w    $0008
                dc.l    $E805005D, $002EFFE0, $E805085D, $082E0010
                dc.l    $E8050061, $0030FFF0, $E8050065, $00320000
                dc.l    $F8050069, $0034FFF0, $F805006D, $00360000
                dc.l    $08050083, $0041FFF0, $08050087, $00430000
Offset_0x025CF4:
                dc.w    $000A
                dc.l    $E405005D, $002EFFE0, $E405085D, $082E0010
                dc.l    $E4050061, $0030FFF0, $E4050065, $00320000
                dc.l    $F4050069, $0034FFF0, $F405006D, $00360000
                dc.l    $FC050069, $0034FFF0, $FC05006D, $00360000
                dc.l    $0C050083, $0041FFF0, $0C050087, $00430000
Offset_0x025D46:
                dc.w    $000A
                dc.l    $E005005D, $002EFFE0, $E005085D, $082E0010
                dc.l    $E0050061, $0030FFF0, $E0050065, $00320000
                dc.l    $F0050069, $0034FFF0, $F005006D, $00360000
                dc.l    $00050069, $0034FFF0, $0005006D, $00360000
                dc.l    $10050083, $0041FFF0, $10050087, $00430000
Offset_0x025D98:
                dc.w    $000C
                dc.l    $DC05005D, $002EFFE0, $DC05085D, $082E0010
                dc.l    $DC050061, $0030FFF0, $DC050065, $00320000
                dc.l    $EC050069, $0034FFF0, $EC05006D, $00360000
                dc.l    $FC050069, $0034FFF0, $FC05006D, $00360000
                dc.l    $04050069, $0034FFF0, $0405006D, $00360000
                dc.l    $14050083, $0041FFF0, $14050087, $00430000
Offset_0x025DFA:
                dc.w    $000C
                dc.l    $D805005D, $002EFFE0, $D805085D, $082E0010
                dc.l    $D8050061, $0030FFF0, $D8050065, $00320000
                dc.l    $E8050069, $0034FFF0, $E805006D, $00360000
                dc.l    $F8050069, $0034FFF0, $F805006D, $00360000
                dc.l    $08050069, $0034FFF0, $0805006D, $00360000
                dc.l    $18050083, $0041FFF0, $18050087, $00430000
Offset_0x025E5C:
                dc.w    $000E
                dc.l    $D405005D, $002EFFE0, $D405085D, $082E0010
                dc.l    $D4050061, $0030FFF0, $D4050065, $00320000
                dc.l    $E4050069, $0034FFF0, $E405006D, $00360000
                dc.l    $F4050069, $0034FFF0, $F405006D, $00360000
                dc.l    $04050069, $0034FFF0, $0405006D, $00360000
                dc.l    $0C050069, $0034FFF0, $0C05006D, $00360000
                dc.l    $1C050083, $0041FFF0, $1C050087, $00430000
Offset_0x025ECE:
                dc.w    $000E
                dc.l    $D005005D, $002EFFE0, $D005085D, $082E0010
                dc.l    $D0050061, $0030FFF0, $D0050065, $00320000
                dc.l    $E0050069, $0034FFF0, $E005006D, $00360000
                dc.l    $F0050069, $0034FFF0, $F005006D, $00360000
                dc.l    $00050069, $0034FFF0, $0005006D, $00360000
                dc.l    $10050069, $0034FFF0, $1005006D, $00360000
                dc.l    $20050083, $0041FFF0, $20050087, $00430000    
;-------------------------------------------------------------------------------
Obj_0x2B_DeleteObject: ;  Offset_0x025F40:
                jmp     (DeleteObject)                         ; Offset_0x01646C                                                     
;===============================================================================
; Objeto 0x2B - Pilar que sobe quando se aproxima e pode ser destruído na 
; [ Término ]   Aquatic Ruin 
;===============================================================================  