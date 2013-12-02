;===============================================================================
; Objeto 0xC1 - Parede que se destrói quando o jogador segura na Wing Fortress
; [ Início ]
;===============================================================================    
Offset_0x03BD66:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03BD74(PC, D0), D1
                jmp     Offset_0x03BD74(PC, D1)
Offset_0x03BD74:
                dc.w    Offset_0x03BD7A-Offset_0x03BD74
                dc.w    Offset_0x03BD90-Offset_0x03BD74
                dc.w    Offset_0x03BE66-Offset_0x03BD74
Offset_0x03BD7A:
                move.w  #$0088, D0
                bsr     ObjectSettings_D0                      ; Offset_0x036020
                moveq   #$00, D0
                move.b  $0028(A0), D0
                mulu.w  #$003C, D0
                move.w  D0, $0030(A0)
Offset_0x03BD90:
                tst.b   $0032(A0)
                beq.s   Offset_0x03BDFA
                tst.w   $0030(A0)
                beq.s   Offset_0x03BDA2
                subq.w  #$01, $0030(A0)
                beq.s   Offset_0x03BDE8
Offset_0x03BDA2:
                lea     ($FFFFB000).w, A1
                move.w  $000C(A0), D0
                subi.w  #$0018, D0
                btst    #$00, ($FFFFF604).w
                beq.s   Offset_0x03BDC4
                subq.w  #$01, $000C(A1)
                cmp.w   $000C(A1), D0
                bcs.s   Offset_0x03BDC4
                move.w  D0, $000C(A1)
Offset_0x03BDC4:
                addi.w  #$0030, D0
                btst    #$01, ($FFFFF604).w
                beq.s   Offset_0x03BDDE
                addq.w  #$01, $000C(A1)
                cmp.w   $000C(A1), D0
                bcc.s   Offset_0x03BDDE
                move.w  D0, $000C(A1)
Offset_0x03BDDE:
                move.b  ($FFFFF603).w, D0
                andi.w  #$0070, D0
                beq.s   Offset_0x03BE50
Offset_0x03BDE8:
                clr.b   $0020(A0)
                clr.b   ($FFFFB02A).w
                clr.b   ($FFFFF7C9).w
                clr.b   $0032(A0)
                bra.s   Offset_0x03BE56
Offset_0x03BDFA:
                tst.b   $0021(A0)
                beq.s   Offset_0x03BE50
                lea     ($FFFFB000).w, A1
                move.w  $0008(A0), D0
                subi.w  #$0014, D0
                cmp.w   $0008(A1), D0
                bcc.s   Offset_0x03BE50
                clr.b   $0021(A0)
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x03BE50
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                move.w  $0008(A0), D0
                subi.w  #$0014, D0
                move.w  D0, $0008(A1)
                bset    #$00, $0022(A1)
                move.b  #$11, $001C(A1)
                move.b  #$01, ($FFFFB02A).w
                move.b  #$01, ($FFFFF7C9).w
                move.b  #$01, $0032(A0)
Offset_0x03BE50:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BE56:
                lea     (Offset_0x03BEA4), A4
                lea     (Offset_0x03BEA0), A2
                bsr     Offset_0x03BEB4
Offset_0x03BE66:
                tst.b   $003F(A0)
                beq.s   Offset_0x03BE72
                subq.b  #$01, $003F(A0)
                bra.s   Offset_0x03BE88
Offset_0x03BE72:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addq.w  #$08, $0012(A0)
                lea     (Breakable_Wall_Animate_Data), A1      ; Offset_0x03BE96
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x03BE88:
                tst.b   $0001(A0)
                bpl     J_DeleteObject_01                      ; Offset_0x036344
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Breakable_Wall_Animate_Data: ; Offset_0x03BE96:
                dc.w    Offset_0x03BE98-Breakable_Wall_Animate_Data
Offset_0x03BE98:
                dc.b    $03, $02, $03, $04, $05, $01, $FF, $00
;-------------------------------------------------------------------------------                  
Offset_0x03BEA0:
                dc.b    $00, $04, $18, $20
;-------------------------------------------------------------------------------  
Offset_0x03BEA4:
                dc.w    $FFF0, $FFF0, $FFF0, $0010, $FFD0, $FFF0, $FFD0, $0010
;-------------------------------------------------------------------------------     
Offset_0x03BEB4:
                move.w  $0008(A0), D2
                move.w  $000C(A0), D3
                move.b  $0018(A0), D4
                subq.b  #$01, D4
                moveq   #$03, D1
                move.l  A0, A1
                bra.s   Offset_0x03BED0
Offset_0x03BEC8:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03BF2E
Offset_0x03BED0:
                move.b  #$04, $0024(A1)
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$84, $0001(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  (A4)+, D0
                add.w   D2, D0
                move.w  D0, $0008(A1)
                move.w  (A4)+, D0
                add.w   D3, D0
                move.w  D0, $000C(A1)
                move.b  D4, $0018(A1)
                move.b  #$10, $0019(A1)
                move.b  #$01, $001A(A1)
                move.w  #$FC00, $0010(A1)
                move.w  #$0000, $0012(A1)
                move.b  (A2)+, $003F(A1)
                dbra    D1, Offset_0x03BEC8
Offset_0x03BF2E:
                move.w  #Break_Wall_Sfx, D0     ; $00CB
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------
Obj_0xC1_Ptr: ; Offset_0x03BF38:
                dc.l    Breakable_Wall_Mappings                ; Offset_0x03BF42
                dc.w    $E48C
                dc.b    $04, $04, $40, $E1
;-------------------------------------------------------------------------------                
Breakable_Wall_Mappings: ; Offset_0x03BF42:
                dc.w    Offset_0x03BF4E-Breakable_Wall_Mappings
                dc.w    Offset_0x03BF90-Breakable_Wall_Mappings
                dc.w    Offset_0x03BFA2-Breakable_Wall_Mappings
                dc.w    Offset_0x03BFB4-Breakable_Wall_Mappings
                dc.w    Offset_0x03BFC6-Breakable_Wall_Mappings
                dc.w    Offset_0x03BFD8-Breakable_Wall_Mappings
Offset_0x03BF4E:
                dc.w    $0008
                dc.l    $E0070000, $0000FFE0, $E0070800, $0800FFF0
                dc.l    $00070000, $0000FFE0, $00070800, $0800FFF0
                dc.l    $E0070000, $0000FFC0, $E0070800, $0800FFD0
                dc.l    $00070000, $0000FFC0, $00070800, $0800FFD0
Offset_0x03BF90:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0, $F0070800, $08000000
Offset_0x03BFA2:
                dc.w    $0002
                dc.l    $F0050008, $0004FFF8, $00051008, $1004FFF8
Offset_0x03BFB4:
                dc.w    $0002
                dc.l    $F001000C, $0006FFFC, $0001100C, $1006FFFC
Offset_0x03BFC6:
                dc.w    $0002
                dc.l    $F001080C, $0806FFFC, $0001180C, $1806FFFC
Offset_0x03BFD8:
                dc.w    $0002
                dc.l    $F0050808, $0804FFF8, $00051808, $1804FFF8                                                                                                                                                  
;===============================================================================
; Objeto 0xC1 - Parede que se destrói quando o jogador segura na Wing Fortress
; [ Término ]
;===============================================================================