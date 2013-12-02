;===============================================================================
; Objeto 0x08 - Poeira do Spindash / freio e Splash de água
; [ Início ]
;===============================================================================  
Offset_0x01DCB6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01DCC4(PC, D0), D1
                jmp     Offset_0x01DCC4(PC, D1)
Offset_0x01DCC4:
                dc.w    Offset_0x01DCCC-Offset_0x01DCC4
                dc.w    Offset_0x01DD26-Offset_0x01DCC4
                dc.w    Offset_0x01DDDA-Offset_0x01DCC4
                dc.w    Offset_0x01DDDE-Offset_0x01DCC4
Offset_0x01DCCC:
                addq.b  #$02, $0024(A0)
                move.l  #Dust_Water_Splash_Mappings, $0004(A0) ; Offset_0x01DEF2
                ori.b   #$04, $0001(A0)
                move.b  #$01, $0018(A0)
                move.b  #$10, $0019(A0)
                move.w  #$049C, $0002(A0)
                move.w  #$B000, $003E(A0)
                move.w  #$9380, $003C(A0)
                cmpa.w  #$D100, A0
                beq.s   Offset_0x01DD22
                move.b  #$01, $0034(A0)
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                beq.s   Offset_0x01DD22
                move.w  #$048C, $0002(A0)
                move.w  #$B040, $003E(A0)
                move.w  #$9180, $003C(A0)
Offset_0x01DD22:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
Offset_0x01DD26:
                move.w  $003E(A0), A2
                moveq   #$00, D0
                move.b  $001C(A0), D0
                add.w   D0, D0
                move.w  Offset_0x01DD3A(PC, D0), D1
                jmp     Offset_0x01DD3A(PC, D1)
Offset_0x01DD3A:
                dc.w    Offset_0x01DDBC-Offset_0x01DD3A
                dc.w    Offset_0x01DD42-Offset_0x01DD3A
                dc.w    Offset_0x01DD62-Offset_0x01DD3A
                dc.w    Offset_0x01DDB4-Offset_0x01DD3A
Offset_0x01DD42:
                move.w  ($FFFFF646).w, $000C(A0)
                tst.b   $001D(A0)
                bne.s   Offset_0x01DDBC
                move.w  $0008(A2), $0008(A0)
                move.b  #$00, $0022(A0)
                andi.w  #$7FFF, $0002(A0)
                bra.s   Offset_0x01DDBC
Offset_0x01DD62:
                cmpi.b  #$0C, $0028(A2)
                bcs.s   Offset_0x01DDD2
                cmpi.b  #$04, $0024(A2)
                bcc.s   Offset_0x01DDD2
                tst.b   $0039(A2)
                beq.s   Offset_0x01DDD2
                move.w  $0008(A2), $0008(A0)
                move.w  $000C(A2), $000C(A0)
                move.b  $0022(A2), $0022(A0)
                andi.b  #$01, $0022(A0)
                tst.b   $0034(A0)
                beq.s   Offset_0x01DD9A
                subq.w  #$04, $000C(A0)
Offset_0x01DD9A:
                tst.b   $001D(A0)
                bne.s   Offset_0x01DDBC
                andi.w  #$7FFF, $0002(A0)
                tst.w   $0002(A2)
                bpl.s   Offset_0x01DDBC
                ori.w   #$8000, $0002(A0)
                bra.s   Offset_0x01DDBC
Offset_0x01DDB4:
                cmpi.b  #$0C, $0028(A2)
                bcs.s   Offset_0x01DDD2
Offset_0x01DDBC:
                lea     (Dust_Water_Splash_AnimateData), A1    ; Offset_0x01DECA
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bsr     Offset_0x01DE76
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01DDD2:
                move.b  #$00, $001C(A0)
                rts
Offset_0x01DDDA:
                bra     DeleteObject                           ; Offset_0x01646C
Offset_0x01DDDE:
                move.w  $003E(A0), A2
                cmpi.b  #$0D, $001C(A2)
                beq.s   Offset_0x01DDF8
                move.b  #$02, $0024(A0)
                move.b  #$00, $0032(A0)
                rts
Offset_0x01DDF8:
                subq.b  #$01, $0032(A0)
                bpl.s   Offset_0x01DE72
                move.b  #$03, $0032(A0)
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x01DE72
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.w  $0008(A2), $0008(A1)
                move.w  $000C(A2), $000C(A1)
                addi.w  #$0010, $000C(A1)
                tst.b   $0034(A0)
                beq.s   Offset_0x01DE2C
                subq.w  #$04, $000C(A1)
Offset_0x01DE2C:
                move.b  #$00, $0022(A1)
                move.b  #$03, $001C(A1)
                addq.b  #$02, $0024(A1)
                move.l  $0004(A0), $0004(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$01, $0018(A1)
                move.b  #$04, $0019(A1)
                move.w  $0002(A0), $0002(A1)
                move.w  $003E(A0), $003E(A1)
                andi.w  #$7FFF, $0002(A1)
                tst.w   $0002(A2)
                bpl.s   Offset_0x01DE72
                ori.w   #$8000, $0002(A1)
Offset_0x01DE72:
                bsr.s   Offset_0x01DE76
                rts
Offset_0x01DE76:
                moveq   #$00, D0
                move.b  $001A(A0), D0
                cmp.b   $0030(A0), D0
                beq.s   Offset_0x01DEC8
                move.b  D0, $0030(A0)
                lea     (Dust_Water_Splash_Dyn_Script), A2     ; Offset_0x01E008
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x01DEC8
                move.w  $003C(A0), D4
Loop_Load_Water_Splash_Dust: ; Offset_0x01DE9C:
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.l   #$05, D1
                addi.l  #Water_Splash_Dust_Spr, D1             ; Offset_0x071FFC
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x00140A
                dbra    D5, Loop_Load_Water_Splash_Dust        ; Offset_0x01DE9C
Offset_0x01DEC8:
                rts
;-------------------------------------------------------------------------------                  
Dust_Water_Splash_AnimateData: ; Offset_0x01DECA:
                dc.w    Offset_0x01DED2-Dust_Water_Splash_AnimateData
                dc.w    Offset_0x01DED6-Dust_Water_Splash_AnimateData
                dc.w    Offset_0x01DEE2-Dust_Water_Splash_AnimateData
                dc.w    Offset_0x01DEEC-Dust_Water_Splash_AnimateData
Offset_0x01DED2:
                dc.b    $1F, $00, $FF, $00
Offset_0x01DED6:
                dc.b    $03, $01, $02, $03, $04, $05, $06, $07, $08, $09, $FD, $00
Offset_0x01DEE2:
                dc.b    $01, $0A, $0B, $0C, $0D, $0E, $0F, $10, $FF, $00
Offset_0x01DEEC:
                dc.b    $03, $11, $12, $13, $14, $FC
;-------------------------------------------------------------------------------    
Dust_Water_Splash_Mappings: ; Offset_0x01DEF2:
                dc.w    Offset_0x01DF1E-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF20-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF2A-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF34-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF3E-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF48-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF52-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF5C-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF66-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF70-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF7A-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF84-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF8E-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF98-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DFAA-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DFBC-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DFCE-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DFE0-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DFEA-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DFF4-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DFFE-Dust_Water_Splash_Mappings
                dc.w    Offset_0x01DF1E-Dust_Water_Splash_Mappings
Offset_0x01DF1E:
                dc.w    $0000
Offset_0x01DF20:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x01DF2A:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x01DF34:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x01DF3E:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x01DF48:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x01DF52:
                dc.w    $0001
                dc.l    $E20F0000, $0000FFF0
Offset_0x01DF5C:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x01DF66:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x01DF70:
                dc.w    $0001
                dc.l    $F20D0000, $0000FFF0
Offset_0x01DF7A:
                dc.w    $0001
                dc.l    $040D0000, $0000FFE0
Offset_0x01DF84:
                dc.w    $0001
                dc.l    $040D0000, $0000FFE0
Offset_0x01DF8E:
                dc.w    $0001
                dc.l    $040D0000, $0000FFE0
Offset_0x01DF98:
                dc.w    $0002
                dc.l    $F4010000, $0000FFE8, $040D0002, $0001FFE0
Offset_0x01DFAA:
                dc.w    $0002
                dc.l    $F4050000, $0000FFE8, $040D0004, $0002FFE0
Offset_0x01DFBC:
                dc.w    $0002
                dc.l    $F4090000, $0000FFE0, $040D0006, $0003FFE0
Offset_0x01DFCE:
                dc.w    $0002
                dc.l    $F4090000, $0000FFE0, $040D0006, $0003FFE0
Offset_0x01DFE0:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x01DFEA:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x01DFF4:
                dc.w    $0001
                dc.l    $F8050008, $0004FFF8
Offset_0x01DFFE:
                dc.w    $0001
                dc.l    $F805000C, $0006FFF8
;-------------------------------------------------------------------------------
Dust_Water_Splash_Dyn_Script: ; Offset_0x01E008:
                dc.w    Offset_0x01E034-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E036-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E03A-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E03E-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E042-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E046-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E04A-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E04E-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E052-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E056-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E05A-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E05E-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E062-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E066-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E06C-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E072-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E078-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E07E-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E07E-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E07E-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E07E-Dust_Water_Splash_Dyn_Script
                dc.w    Offset_0x01E080-Dust_Water_Splash_Dyn_Script
Offset_0x01E034:
                dc.w    $0000
Offset_0x01E036:
                dc.w    $0001
                dc.w    $7000
Offset_0x01E03A:
                dc.w    $0001
                dc.w    $F008
Offset_0x01E03E:
                dc.w    $0001
                dc.w    $F018
Offset_0x01E042:
                dc.w    $0001
                dc.w    $F028
Offset_0x01E046:
                dc.w    $0001
                dc.w    $F038
Offset_0x01E04A:
                dc.w    $0001
                dc.w    $F048
Offset_0x01E04E:
                dc.w    $0001
                dc.w    $7058
Offset_0x01E052:
                dc.w    $0001
                dc.w    $7060
Offset_0x01E056:
                dc.w    $0001
                dc.w    $7068
Offset_0x01E05A:
                dc.w    $0001
                dc.w    $7070
Offset_0x01E05E:
                dc.w    $0001
                dc.w    $7078
Offset_0x01E062:
                dc.w    $0001
                dc.w    $7080
Offset_0x01E066:
                dc.w    $0002
                dc.w    $1088, $708A
Offset_0x01E06C:
                dc.w    $0002
                dc.w    $3092, $7096
Offset_0x01E072:
                dc.w    $0002
                dc.w    $509E, $70A4
Offset_0x01E078:
                dc.w    $0002
                dc.w    $50AC, $70B2
Offset_0x01E07E:
                dc.w    $0000
Offset_0x01E080:
                dc.w    $0001
                dc.w    $F0BA                
;===============================================================================
; Objeto 0x08 - Poeira do Spindash / freio e Splash de água
; [ Término ]
;===============================================================================  