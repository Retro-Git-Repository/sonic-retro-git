;===============================================================================
; Objeto 0xAF - Galo do inimigo Clucker na Wing Fortress
; [ Início ]
;===============================================================================   
Offset_0x038FF8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x039006(PC, D0), D1
                jmp     Offset_0x039006(PC, D1)
Offset_0x039006:
                dc.w    Offset_0x039014-Offset_0x039006
                dc.w    Offset_0x03902E-Offset_0x039006
                dc.w    Offset_0x03904C-Offset_0x039006
                dc.w    Offset_0x039082-Offset_0x039006
                dc.w    Offset_0x039094-Offset_0x039006
                dc.w    Offset_0x0390C0-Offset_0x039006
                dc.w    Offset_0x0390D2-Offset_0x039006
Offset_0x039014:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$15, $001A(A0)
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03902C
                bset    #$00, $0022(A0)
Offset_0x03902C:
                rts
Offset_0x03902E:
                bsr     Offset_0x0360FC
                addi.w  #$0080, D2
                cmpi.w  #$0100, D2
                bcs.s   Offset_0x039042
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x039042:
                addq.b  #$02, $0024(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03904C:
                move.b  $0024(A0), D2
                lea     (Clucker_Animate_Data), A1             ; Offset_0x03914C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                cmp.b   $0024(A0), D2
                bne.s   Offset_0x039068
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x039068:
                lea     $001A(A0), A1
                clr.l   (A1)
                clr.w   $0004(A1)
                move.b  #$08, (A1)
                move.b  #$06, $0020(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x039082:
                lea     (Clucker_Animate_Data_01), A1          ; Offset_0x039158
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x039094:
                tst.b   $002A(A0)
                beq.s   Offset_0x0390A4
                subq.b  #$01, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0390A4:
                addq.b  #$02, $0024(A0)
                lea     $001A(A0), A1
                clr.l   (A1)
                clr.w   $0004(A1)
                move.b  #$0B, (A1)
                bsr     Load_Clucker_Weapon                    ; Offset_0x0390E4
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0390C0:
                lea     (Clucker_Animate_Data_02), A1          ; Offset_0x039164
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0390D2:
                move.b  #$08, $0024(A0)
                move.b  #$40, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
;------------------------------------------------------------------------------- 
Load_Clucker_Weapon: ; Offset_0x0390E4:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x039136
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Arma dos inimigos
                move.b  #$0D, $001A(A1)
                move.b  #$46, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$000B, $000C(A1)
                move.w  #$FE00, D0
                move.w  #$FFF8, D1
                btst    #$00, $0001(A0)
                beq.s   Offset_0x039124
                neg.w   D0
                neg.w   D1
Offset_0x039124:
                move.w  D0, $0010(A1)
                add.w   D1, $0008(A1)
                lea     (Clucker_Weapon), A2                   ; Offset_0x0371E6
                move.l  A2, $002A(A1)
Offset_0x039136:
                rts
;-------------------------------------------------------------------------------                 
Obj_0xAD_Ptr: ; Offset_0x039138:
                dc.l    Clucker_Mappings                       ; Offset_0x039176 
                dc.w    $0379
                dc.b    $04, $04, $18, $00
;------------------------------------------------------------------------------- 
Obj_0xAE_Ptr: ; Offset_0x039142:
                dc.l    Clucker_Mappings                       ; Offset_0x039176
                dc.w    $0379
                dc.b    $04, $05, $10, $00   
;-------------------------------------------------------------------------------    
Clucker_Animate_Data: ; Offset_0x03914C:
                dc.w    Offset_0x03914E-Clucker_Animate_Data
Offset_0x03914E:
                dc.b    $01, $00, $01, $02, $03, $04, $05, $06, $07, $FC
;-------------------------------------------------------------------------------    
Clucker_Animate_Data_01: ; Offset_0x039158:
                dc.w    Offset_0x03915A-Clucker_Animate_Data_01
Offset_0x03915A:
                dc.b    $01, $08, $09, $0A, $0B, $0B, $0B, $0B, $FC, $00
;-------------------------------------------------------------------------------    
Clucker_Animate_Data_02: ; Offset_0x039164:
                dc.w    Offset_0x039166-Clucker_Animate_Data_02
Offset_0x039166:
                dc.b    $03, $0A, $0B, $FC
;-------------------------------------------------------------------------------    
Clucker_Weapon_Animate_Data: ; Offset_0x03916A:
                dc.w    Offset_0x03916C-Clucker_Weapon_Animate_Data
Offset_0x03916C:
                dc.b    $03, $0D, $0E, $0F, $10, $11, $12, $13, $14, $FF
;-------------------------------------------------------------------------------
Clucker_Mappings: ; Offset_0x039176:
                dc.w    Offset_0x0391A2-Clucker_Mappings
                dc.w    Offset_0x0391AC-Clucker_Mappings
                dc.w    Offset_0x0391B6-Clucker_Mappings
                dc.w    Offset_0x0391C0-Clucker_Mappings
                dc.w    Offset_0x0391D2-Clucker_Mappings
                dc.w    Offset_0x0391E4-Clucker_Mappings
                dc.w    Offset_0x0391F6-Clucker_Mappings
                dc.w    Offset_0x039208-Clucker_Mappings
                dc.w    Offset_0x03921A-Clucker_Mappings
                dc.w    Offset_0x039234-Clucker_Mappings
                dc.w    Offset_0x03924E-Clucker_Mappings
                dc.w    Offset_0x039268-Clucker_Mappings
                dc.w    Offset_0x039282-Clucker_Mappings
                dc.w    Offset_0x039294-Clucker_Mappings
                dc.w    Offset_0x03929E-Clucker_Mappings
                dc.w    Offset_0x0392A8-Clucker_Mappings
                dc.w    Offset_0x0392B2-Clucker_Mappings
                dc.w    Offset_0x0392BC-Clucker_Mappings
                dc.w    Offset_0x0392C6-Clucker_Mappings
                dc.w    Offset_0x0392D0-Clucker_Mappings
                dc.w    Offset_0x0392DA-Clucker_Mappings
                dc.w    Offset_0x0392E4-Clucker_Mappings
Offset_0x0391A2:
                dc.w    $0001
                dc.l    $0C0D2000, $2000FFF0
Offset_0x0391AC:
                dc.w    $0001
                dc.l    $080D2000, $2000FFF0
Offset_0x0391B6:
                dc.w    $0001
                dc.l    $040D2000, $2000FFF0
Offset_0x0391C0:
                dc.w    $0002
                dc.l    $000D2000, $2000FFF0, $100D2008, $2004FFF0
Offset_0x0391D2:
                dc.w    $0002
                dc.l    $FC0D2000, $2000FFF0, $0C0D2008, $2004FFF0
Offset_0x0391E4:
                dc.w    $0002
                dc.l    $F80D2000, $2000FFF0, $080D2008, $2004FFF0
Offset_0x0391F6:
                dc.w    $0002
                dc.l    $F40D2000, $2000FFF0, $040D2008, $2004FFF0
Offset_0x039208:
                dc.w    $0002
                dc.l    $F00D2000, $2000FFF0, $000D2008, $2004FFF0
Offset_0x03921A:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0, $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFEE
Offset_0x039234:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0, $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFEC
Offset_0x03924E:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0, $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFEA
Offset_0x039268:
                dc.w    $0003
                dc.l    $F00D2000, $2000FFF0, $000D2008, $2004FFF0
                dc.l    $07002010, $2008FFE8
Offset_0x039282:
                dc.w    $0002
                dc.l    $F8096011, $6008FFE8, $F8096811, $68080000
Offset_0x039294:
                dc.w    $0001
                dc.l    $FC000017, $000BFFFC
Offset_0x03929E:
                dc.w    $0001
                dc.l    $FC000018, $000CFFFC
Offset_0x0392A8:
                dc.w    $0001
                dc.l    $FC000019, $000CFFFC
Offset_0x0392B2:
                dc.w    $0001
                dc.l    $FC001018, $100CFFFC
Offset_0x0392BC:
                dc.w    $0001
                dc.l    $FC001017, $100BFFFC
Offset_0x0392C6:
                dc.w    $0001
                dc.l    $FC001818, $180CFFFC
Offset_0x0392D0:
                dc.w    $0001
                dc.l    $FC000819, $080CFFFC
Offset_0x0392DA:
                dc.w    $0001
                dc.l    $FC000818, $080CFFFC
Offset_0x0392E4:
                dc.w    $0001
                dc.l    $100D2000, $2000FFF0                                                                                                                   
;===============================================================================
; Objeto 0xAF - Galo do inimigo Clucker na Wing Fortress
; [ Término ]
;===============================================================================