;===============================================================================
; Objeto 0x6A - Três caixas rodando na Mystic Cave / Plataformas na Metropolis
; [ Início ]
;===============================================================================    
Offset_0x027868:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x027876(PC, D0), D1
                jmp     Offset_0x027876(PC, D1)
Offset_0x027876:
                dc.w    Offset_0x02787C-Offset_0x027876
                dc.w    Offset_0x02799C-Offset_0x027876
                dc.w    Offset_0x027A28-Offset_0x027876
Offset_0x02787C:
                addq.b  #$02, $0024(A0)
                move.l  #Mz_Platform_Mappings, $0004(A0)       ; Offset_0x026CD4
                move.w  #$6000, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  #$20, $0019(A0)
                move.b  #$0C, $0016(A0)
                move.l  #Offset_0x027AA2, $002C(A0)
                move.b  #$01, $001A(A0)
                cmpi.b  #$0B, (Level_Id).w                           ; $FFFFFE10
                bne     Offset_0x027980
                addq.b  #$02, $0024(A0)
                move.l  #Rotating_Boxes_Mappings, $0004(A0)    ; Offset_0x027AF6
                move.w  #$63D4, $0002(A0)
                move.b  #$20, $0019(A0)
                move.b  #$20, $0016(A0)
                move.l  #Offset_0x027ABA, $002C(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x0278F4
                move.l  #Offset_0x027AD8, $002C(A0)
Offset_0x0278F4:
                move.b  #$00, $001A(A0)
                cmpi.b  #$18, $0028(A0)
                bne     Offset_0x02798C
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x027958
                bsr.s   Offset_0x02795A
                addi.w  #$0040, $0008(A1)
                addi.w  #$0040, $000C(A1)
                move.b  #$06, $0028(A1)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02792E
                move.b  #$0C, $0028(A1)
Offset_0x02792E:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x027958
                bsr.s   Offset_0x02795A
                subi.w  #$0040, $0008(A1)
                addi.w  #$0040, $000C(A1)
                move.b  #$0C, $0028(A1)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x027958
                move.b  #$06, $0028(A1)
Offset_0x027958:
                bra.s   Offset_0x027980
Offset_0x02795A:
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $0008(A0), $0032(A1)
                move.w  $000C(A0), $0030(A1)
                move.b  $0022(A0), $0022(A1)
                rts
Offset_0x027980:
                move.w  $0008(A0), $0032(A0)
                move.w  $000C(A0), $0030(A0)
Offset_0x02798C:
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  $0028(A0), $0038(A0)
                bra     Offset_0x027A68
Offset_0x02799C:
                move.w  $0008(A0), -(A7)
                tst.w   $0036(A0)
                bne.s   Offset_0x0279EC
                move.b  $003C(A0), D1
                move.b  $0022(A0), D0
                btst    #$03, D0
                bne.s   Offset_0x0279C8
                btst    #$03, D1
                beq.s   Offset_0x0279CC
                move.b  #$01, $0036(A0)
                move.b  #$00, $003C(A0)
                bra.s   Offset_0x0279FC
Offset_0x0279C8:
                move.b  D0, $003C(A0)
Offset_0x0279CC:
                btst    #$04, D0
                bne.s   Offset_0x0279E6
                btst    #$04, D1
                beq.s   Offset_0x0279FC
                move.b  #$01, $0036(A0)
                move.b  #$00, $003C(A0)
                bra.s   Offset_0x0279FC
Offset_0x0279E6:
                move.b  D0, $003C(A0)
                bra.s   Offset_0x0279FC
Offset_0x0279EC:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                subq.w  #$01, $0034(A0)
                bne.s   Offset_0x0279FC
                bsr     Offset_0x027A68
Offset_0x0279FC:
                move.w  (A7)+, D4
                tst.b   $0001(A0)
                bpl.s   Offset_0x027A1E
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
Offset_0x027A1E:
                move.w  $0032(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x027A28:
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                subq.w  #$01, $0034(A0)
                bne.s   Offset_0x027A3C
                bsr     Offset_0x027A68
Offset_0x027A3C:
                move.w  (A7)+, D4
                tst.b   $0001(A0)
                bpl.s   Offset_0x027A5E
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
Offset_0x027A5E:
                move.w  $0032(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x027A68:
                moveq   #$00, D0
                move.b  $0038(A0), D0
                move.l  $002C(A0), A1
                lea     $00(A1, D0), A1
                move.w  (A1)+, $0010(A0)
                move.w  (A1)+, $0012(A0)
                move.w  (A1)+, $0034(A0)
                move.w  #$0007, $003A(A0)
                move.b  #$00, $0036(A0)
                addq.b  #$06, $0038(A0)
                cmpi.b  #$18, $0038(A0)
                bcs.s   Offset_0x027AA0
                move.b  #$00, $0038(A0)
Offset_0x027AA0:
                rts
;-------------------------------------------------------------------------------                  
Offset_0x027AA2:
                dc.w    $0000, $0400, $0010, $0400, $FE00, $0020, $0000, $0400
                dc.w    $0010, $FC00, $FE00, $0020
;-------------------------------------------------------------------------------                   
Offset_0x027ABA:
                dc.w    $0000, $0100, $0040, $FF00, $0000, $0080, $0000, $FF00
                dc.w    $0040, $0100, $0000, $0080, $0100, $0000, $0040
;-------------------------------------------------------------------------------                
Offset_0x027AD8:
                dc.w    $0000, $0100, $0040, $0100, $0000, $0080, $0000, $FF00
                dc.w    $0040, $FF00, $0000, $0080, $FF00, $0000, $0040
;-------------------------------------------------------------------------------
Rotating_Boxes_Mappings: ; Offset_0x027AF6:
                dc.w    Offset_0x027AF8-Rotating_Boxes_Mappings
Offset_0x027AF8:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFE0, $E00F0010, $00080000
                dc.l    $000F1810, $1808FFE0, $000F1800, $18000000      
;===============================================================================
; Objeto 0x6A - Três caixas rodando na Mystic Cave / Plataformas na Metropolis
; [ Término ]
;===============================================================================  