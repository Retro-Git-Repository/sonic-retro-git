;===============================================================================
; Objeto 0x5E - Display na tela no Special Stage
; [ Início ]
;===============================================================================     
Offset_0x006F62:
                move.b  $0024(A0), D0
                bne     Offset_0x0070E8
                move.l  #SS_Head_Up_Display_Mappings, $0004(A0) ; Offset_0x007012
                move.w  #$01FA, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$00, $0018(A0)
                move.b  #$01, $0024(A0)
                bset    #$06, $0001(A0)
                moveq   #$00, D1
                tst.b   ($FFFFFE00).w
                beq.s   Offset_0x006FA4
                addq.w  #$06, D1
                tst.b   (Hardware_Id).w                              ; $FFFFFFD8
                bpl.s   Offset_0x006FB4
                addq.w  #$01, D1
                bra.s   Offset_0x006FB4
Offset_0x006FA4:
                move.w  (Player_Selected_Flag).w, D1                 ; $FFFFFF7A
                andi.w  #$0003, D1
                tst.b   (Hardware_Id).w                              ; $FFFFFFD8
                bpl.s   Offset_0x006FB4
                addq.w  #$03, D1
Offset_0x006FB4:
                add.w   D1, D1
                moveq   #$00, D2
                moveq   #$00, D3
                lea     (SS_Head_Up_Display_Data), A1          ; Offset_0x006FE4
                lea     $0010(A0), A2
                adda.w  $00(A1, D1), A1
                move.b  (A1)+, D3
                move.b  D3, $000F(A0)
                subq.w  #$01, D3
                moveq   #$00, D0
                move.b  (A1)+, D0
Offset_0x006FD4:
                move.w  D0, $00(A2, D2)
                move.b  (A1)+, $05(A2, D2)
                addq.w  #$06, D2
                dbra    D3, Offset_0x006FD4
                rts    
;-------------------------------------------------------------------------------                  
SS_Head_Up_Display_Data: ; Offset_0x006FE4:
                dc.w    Offset_0x006FF4-SS_Head_Up_Display_Data
                dc.w    Offset_0x006FF9-SS_Head_Up_Display_Data
                dc.w    Offset_0x006FFC-SS_Head_Up_Display_Data
                dc.w    Offset_0x006FFF-SS_Head_Up_Display_Data
                dc.w    Offset_0x007004-SS_Head_Up_Display_Data
                dc.w    Offset_0x007007-SS_Head_Up_Display_Data
                dc.w    Offset_0x00700A-SS_Head_Up_Display_Data
                dc.w    Offset_0x00700E-SS_Head_Up_Display_Data
Offset_0x006FF4:
                dc.b    $03, $80, $00, $01, $03
Offset_0x006FF9:
                dc.b    $01, $D4, $00
Offset_0x006FFC:
                dc.b    $01, $38, $01
Offset_0x006FFF:
                dc.b    $03, $80, $00, $02, $03
Offset_0x007004:
                dc.b    $01, $D4, $00
Offset_0x007007:
                dc.b    $01, $38, $02
Offset_0x00700A:
                dc.b    $02, $80, $00, $01
Offset_0x00700E:
                dc.b    $02, $80, $00, $02
;-------------------------------------------------------------------------------                
SS_Head_Up_Display_Mappings: ; Offset_0x007012:
                dc.w    SS_HUD_Sonic-SS_Head_Up_Display_Mappings ; Offset_0x00701A
                dc.w    SS_HUD_Miles-SS_Head_Up_Display_Mappings ; Offset_0x00703C
                dc.w    SS_HUD_Tails-SS_Head_Up_Display_Mappings ; Offset_0x00705E
                dc.w    SS_HUD_Total-SS_Head_Up_Display_Mappings ; Offset_0x007080
SS_HUD_Sonic: ; Offset_0x00701A:
                dc.w    $0004
                dc.l    $100CA000, $A000FFA0, $1000A004, $A002FFC0
                dc.l    $180DC00A, $C005FF98, $1801C03C, $C01EFFB8
SS_HUD_Miles: ; Offset_0x00703C:
                dc.w    $0004
                dc.l    $100CC005, $C0020038, $1000C009, $C0040058
                dc.l    $180DC00A, $C0050030, $1801C03C, $C01E0050
SS_HUD_Tails: ; Offset_0x00705E:
                dc.w    $0004
                dc.l    $100CC5AA, $C2D50038, $1000C5AE, $C2D70058
                dc.l    $180DC00A, $C0050030, $1801C03C, $C01E0050
SS_HUD_Total: ; Offset_0x007080:
                dc.w    $0002
                dc.l    $100FC026, $C013FFEC, $1003C036, $C01B000C                    
;===============================================================================
; Objeto 0x5E - Display na tela no Special Stage
; [ Término ]
;===============================================================================  