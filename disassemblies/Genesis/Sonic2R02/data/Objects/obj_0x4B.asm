;===============================================================================
; Objeto 0x4B - Buzzer na Emerald Hill  
; [ Início ]
;=============================================================================== 
Offset_0x02CC2C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02CC3A(PC, D0), D1
                jmp     Offset_0x02CC3A(PC, D1)
Offset_0x02CC3A:
                dc.w    Offset_0x02CC96-Offset_0x02CC3A
                dc.w    Offset_0x02CD48-Offset_0x02CC3A
                dc.w    Offset_0x02CC5A-Offset_0x02CC3A
                dc.w    Offset_0x02CC42-Offset_0x02CC3A
Offset_0x02CC42:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Buzzer_AnimateData), A1               ; Offset_0x02CEA8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x02CC5A:
                move.l  $002A(A0), A1
                tst.b   (A1)
                beq     Obj_0x4B_DeleteObject                  ; Offset_0x02CF40
                tst.w   $0030(A1)
                bmi.s   Offset_0x02CC6C
                rts
Offset_0x02CC6C:
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                lea     (Buzzer_AnimateData), A1               ; Offset_0x02CEA8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x02CC96:
                move.l  #Buzzer_Mappings, $0004(A0)            ; Offset_0x02CEC4   
                move.w  #$03D2, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$0A, $0020(A0)
                move.b  #$04, $0018(A0)
                move.b  #$10, $0019(A0)
                move.b  #$10, $0016(A0)
                move.b  #$18, $0017(A0)
                move.b  #$03, $0018(A0)
                addq.b  #$02, $0024(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02CD46
                move.b  #$4B, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$04, $0024(A1)
                move.l  #Buzzer_Mappings, $0004(A1)            ; Offset_0x02CEC4   
                move.w  #$03D2, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0018(A1)
                move.b  #$10, $0019(A1)
                move.b  $0022(A0), $0022(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$01, $001C(A1)
                move.l  A0, $002A(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  #$0100, $002E(A0)
                move.w  #$FF00, $0010(A0)
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02CD46
                neg.w   $0010(A0)
Offset_0x02CD46:
                rts
Offset_0x02CD48:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02CD68(PC, D0), D1
                jsr     Offset_0x02CD68(PC, D1)
                lea     (Buzzer_AnimateData), A1               ; Offset_0x02CEA8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x02CD68:
                dc.w    Offset_0x02CD6C-Offset_0x02CD68
                dc.w    Offset_0x02CE0C-Offset_0x02CD68
Offset_0x02CD6C:
                bsr     Offset_0x02CDAE
                subq.w  #$01, $0030(A0)
                move.w  $0030(A0), D0
                cmpi.w  #$000F, D0
                beq.s   Offset_0x02CD92
                tst.w   D0
                bpl.s   Offset_0x02CD90
                subq.w  #$01, $002E(A0)
                bgt     Obj_0x4B_SpeedToPos                    ; Offset_0x02CF46
                move.w  #$001E, $0030(A0)
Offset_0x02CD90:
                rts
Offset_0x02CD92:
                sf      $0032(A0)
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
                bchg    #00, $0022(A0)
                move.w  #$0100, $002E(A0)
                rts
Offset_0x02CDAE:
                tst.b   $0032(A0)
                bne     Offset_0x02CE0A
                move.w  $0008(A0), D0
                lea     ($FFFFB000).w, A1
                btst    #$00, ($FFFFFE0F).w
                beq.s   Offset_0x02CDCA
                lea     ($FFFFB040).w, A1
Offset_0x02CDCA:
                sub.w   $0008(A1), D0
                move.w  D0, D1
                bpl.s   Offset_0x02CDD4
                neg.w   D0
Offset_0x02CDD4:
                cmpi.w  #$0028, D0
                blt.s   Offset_0x02CE0A
                cmpi.w  #$0030, D0
                bgt.s   Offset_0x02CE0A
                tst.w   D1
                bpl.s   Offset_0x02CDEE
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02CE0A
                bra.s   Offset_0x02CDF6
Offset_0x02CDEE:
                btst    #$00, $0001(A0)
                bne.s   Offset_0x02CE0A
Offset_0x02CDF6:
                st      $0032(A0)
                addq.b  #$02, $0025(A0)
                move.b  #$03, $001C(A0)
                move.w  #$0032, $0034(A0)
Offset_0x02CE0A:
                rts
Offset_0x02CE0C:
                move.w  $0034(A0), D0
                subq.w  #$01, D0
                blt.s   Offset_0x02CE20
                move.w  D0, $0034(A0)
                cmpi.w  #$0014, D0
                beq.s   Offset_0x02CE26
                rts
Offset_0x02CE20:
                subq.b  #$02, $0025(A0)
                rts
Offset_0x02CE26:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02CEA2
                move.b  #$4B, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$06, $0024(A1)
                move.l  #Buzzer_Mappings, $0004(A1)            ; Offset_0x02CEC4   
                move.w  #$03D2, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0018(A1)
                move.b  #$98, $0020(A1)
                move.b  #$10, $0019(A1)
                move.b  $0022(A0), $0022(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$02, $001C(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0018, $000C(A1)
                move.w  #$000D, D0
                move.w  #$0180, $0012(A1)
                move.w  #$FE80, $0010(A1)
                btst    #$00, $0001(A1)
                beq.s   Offset_0x02CEA2
                neg.w   $0010(A1)
                neg.w   D0
Offset_0x02CEA2:
                add.w   D0, $0008(A1)
                rts
;-------------------------------------------------------------------------------
Buzzer_AnimateData: ; Offset_0x02CEA8:
                dc.w    Offset_0x02CEB0-Buzzer_AnimateData
                dc.w    Offset_0x02CEB4-Buzzer_AnimateData
                dc.w    Offset_0x02CEB8-Buzzer_AnimateData
                dc.w    Offset_0x02CEBC-Buzzer_AnimateData
Offset_0x02CEB0:
                dc.b    $0F, $00, $FF, $00
Offset_0x02CEB4:
                dc.b    $02, $03, $04, $FF
Offset_0x02CEB8:
                dc.b    $03, $05, $06, $FF
Offset_0x02CEBC:
                dc.b    $09, $01, $01, $01, $01, $01, $FD, $00
;-------------------------------------------------------------------------------
Buzzer_Mappings: ; Offset_0x02CEC4:                
                dc.w    Offset_0x02CED2-Buzzer_Mappings
                dc.w    Offset_0x02CEE4-Buzzer_Mappings
                dc.w    Offset_0x02CEFE-Buzzer_Mappings
                dc.w    Offset_0x02CF18-Buzzer_Mappings
                dc.w    Offset_0x02CF22-Buzzer_Mappings
                dc.w    Offset_0x02CF2C-Buzzer_Mappings
                dc.w    Offset_0x02CF36-Buzzer_Mappings
Offset_0x02CED2:
                dc.w    $0002
                dc.l    $F8090000, $0000FFE8, $F8090006, $00030000
Offset_0x02CEE4:
                dc.w    $0003
                dc.l    $F8090000, $0000FFE8, $F805000C, $00060000
                dc.l    $08050010, $00080002
Offset_0x02CEFE:
                dc.w    $0003
                dc.l    $F8090000, $0000FFE8, $F805000C, $00060000
                dc.l    $08050014, $000A0002
Offset_0x02CF18:
                dc.w    $0001
                dc.l    $F0010014, $000A0004
Offset_0x02CF22:
                dc.w    $0001
                dc.l    $F0010016, $000B0004
Offset_0x02CF2C:
                dc.w    $0001
                dc.l    $F8010018, $000CFFF4
Offset_0x02CF36:
                dc.w    $0001
                dc.l    $F801001A, $000DFFF4
;-------------------------------------------------------------------------------
Obj_0x4B_DeleteObject: ;  Offset_0x02CF40:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Obj_0x4B_SpeedToPos: ;  Offset_0x02CF46:
                jmp     (SpeedToPos)                           ; Offset_0x016332                
;===============================================================================
; Objeto 0x4B - Buzzer na Emerald Hill  
; [ Término ]
;===============================================================================  