;===============================================================================
; Objeto 0x04 - Superfície da água na Hidden Palace/Chemical Plant/Aquatic Ruin
; [ Início ]
;===============================================================================   
Offset_0x020804:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020812(PC, D0), D1
                jmp     Offset_0x020812(PC, D1)
Offset_0x020812:                
                dc.w    Offset_0x020818-Offset_0x020812
                dc.w    Offset_0x02085A-Offset_0x020812
                dc.w    Offset_0x0208EE-Offset_0x020812     
Offset_0x020818:
                addq.b  #$02, $0024(A0)
                move.l  #Water_Surface_Mappings, $0004(A0)     ; Offset_0x02093C
                move.w  #$8400, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$80, $0019(A0)
                move.w  $0008(A0), $0030(A0)
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x02085A
                addq.b  #$02, $0024(A0)
                move.l  #ARz_Water_Surface_Mappings, $0004(A0) ; Offset_0x020A2C
                bra     Offset_0x0208EE
Offset_0x02085A:
                move.w  ($FFFFF646).w, D1
                move.w  D1, $000C(A0)
                tst.b   $0032(A0)
                bne.s   Offset_0x02087C
                btst    #$07, ($FFFFF605).w
                beq.s   Offset_0x02088C
                addq.b  #$03, $001A(A0)
                move.b  #$01, $0032(A0)
                bra.s   Offset_0x02088C
Offset_0x02087C:
                tst.w   ($FFFFF63A).w
                bne.s   Offset_0x02088C
                move.b  #$00, $0032(A0)
                subq.b  #$03, $001A(A0)
Offset_0x02088C:
                lea     (Water_Surface_Data), A1               ; Offset_0x0208AE
                moveq   #$00, D1
                move.b  $001B(A0), D1
                move.b  $00(A1, D1), $001A(A0)
                addq.b  #$01, $001B(A0)
                andi.b  #$3F, $001B(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Water_Surface_Data: ; Offset_0x0208AE:
                dc.b    $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01
                dc.b    $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02
                dc.b    $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01
                dc.b    $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00
;-------------------------------------------------------------------------------   
Offset_0x0208EE:
                move.w  ($FFFFF646).w, D1
                move.w  D1, $000C(A0)
                tst.b   $0032(A0)
                bne.s   Offset_0x020910
                btst    #$07, ($FFFFF605).w
                beq.s   Offset_0x020920
                addq.b  #$02, $001A(A0)
                move.b  #$01, $0032(A0)
                bra.s   Offset_0x020936
Offset_0x020910:
                tst.w   ($FFFFF63A).w
                bne.s   Offset_0x020936
                move.b  #$00, $0032(A0)
                subq.b  #$02, $001A(A0)
Offset_0x020920:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x020936
                move.b  #$05, $001E(A0)
                addq.b  #$01, $001A(A0)
                andi.b  #$01, $001A(A0)
Offset_0x020936:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Water_Surface_Mappings: ; Offset_0x02093C:                
                dc.w    Offset_0x020948-Water_Surface_Mappings
                dc.w    Offset_0x020962-Water_Surface_Mappings
                dc.w    Offset_0x02097C-Water_Surface_Mappings
                dc.w    Offset_0x020996-Water_Surface_Mappings
                dc.w    Offset_0x0209C8-Water_Surface_Mappings
                dc.w    Offset_0x0209FA-Water_Surface_Mappings
Offset_0x020948:
                dc.w    $0003
                dc.l    $F80D0000, $0000FFA0, $F80D0000, $0000FFE0
                dc.l    $F80D0000, $00000020
Offset_0x020962:
                dc.w    $0003
                dc.l    $F80D0008, $0004FFA0, $F80D0008, $0004FFE0
                dc.l    $F80D0008, $00040020
Offset_0x02097C:
                dc.w    $0003
                dc.l    $F80D0010, $0008FFA0, $F80D0010, $0008FFE0
                dc.l    $F80D0010, $00080020
Offset_0x020996:
                dc.w    $0006
                dc.l    $F80D0000, $0000FFA0, $F80D0008, $0004FFC0
                dc.l    $F80D0000, $0000FFE0, $F80D0008, $00040000
                dc.l    $F80D0000, $00000020, $F80D0008, $00040040
Offset_0x0209C8:
                dc.w    $0006
                dc.l    $F80D0008, $0004FFA0, $F80D0010, $0008FFC0
                dc.l    $F80D0008, $0004FFE0, $F80D0010, $00080000
                dc.l    $F80D0008, $00040020, $F80D0010, $00080040
Offset_0x0209FA:
                dc.w    $0006
                dc.l    $F80D0010, $0008FFA0, $F80D0008, $0004FFC0
                dc.l    $F80D0010, $0008FFE0, $F80D0008, $00040000
                dc.l    $F80D0010, $00080020, $F80D0008, $00040040
;-------------------------------------------------------------------------------
ARz_Water_Surface_Mappings: ; Offset_0x020A2C:                
                dc.w    Offset_0x020A34-ARz_Water_Surface_Mappings
                dc.w    Offset_0x020A4E-ARz_Water_Surface_Mappings
                dc.w    Offset_0x020A68-ARz_Water_Surface_Mappings
                dc.w    Offset_0x020A9A-ARz_Water_Surface_Mappings
Offset_0x020A34:
                dc.w    $0003
                dc.l    $FC0D0000, $0000FFA0, $FC0D0000, $0000FFE0
                dc.l    $FC0D0000, $00000020
Offset_0x020A4E:
                dc.w    $0003
                dc.l    $FC0D0008, $0004FFA0, $FC0D0008, $0004FFE0
                dc.l    $FC0D0008, $00040020
Offset_0x020A68:
                dc.w    $0006
                dc.l    $FC0D0000, $0000FFA0, $FC0D0000, $0000FFC0
                dc.l    $FC0D0000, $0000FFE0, $FC0D0000, $00000000
                dc.l    $FC0D0000, $00000020, $FC0D0000, $00000040
Offset_0x020A9A:
                dc.w    $0006
                dc.l    $FC0D0008, $0004FFA0, $FC0D0008, $0004FFC0
                dc.l    $FC0D0008, $0004FFE0, $FC0D0008, $00040000
                dc.l    $FC0D0008, $00040020, $FC0D0008, $00040040
;===============================================================================
; Objeto 0x04 - Superfície da água na Hidden Palace/Chemical Plant/Aquatic Ruin
; [ Término ]
;===============================================================================  