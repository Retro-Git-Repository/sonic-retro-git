;===============================================================================
; Objeto 0x3A - Resultados da fase
; [ Início ]                
;===============================================================================   
Offset_0x014026:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x014034(PC, D0), D1
                jmp     Offset_0x014034(PC, D1)
Offset_0x014034:
                dc.w    Offset_0x01404C-Offset_0x014034
                dc.w    Offset_0x0140A2-Offset_0x014034
                dc.w    Offset_0x0140E2-Offset_0x014034
                dc.w    Offset_0x0140E6-Offset_0x014034
                dc.w    Offset_0x014108-Offset_0x014034
                dc.w    Offset_0x01413C-Offset_0x014034
                dc.w    Offset_0x01414A-Offset_0x014034
                dc.w    Offset_0x01413C-Offset_0x014034
                dc.w    Offset_0x014210-Offset_0x014034
                dc.w    Offset_0x014250-Offset_0x014034
                dc.w    Offset_0x01426A-Offset_0x014034
                dc.w    Offset_0x0140DA-Offset_0x014034
Offset_0x01404C:
                tst.l   ($FFFFF680).w
                beq.s   Offset_0x014054
                rts
Offset_0x014054:
                move.l  A0, A1
                lea     Level_Results_Screen_Pos(PC), A2       ; Offset_0x01431E
                moveq   #$07, D1
Offset_0x01405C:
                move.b  $0000(A1), D0
                beq.s   Offset_0x01406E
                cmpi.b  #$3A, D0
                beq.s   Offset_0x01406E
                lea     $0040(A1), A1
                bra.s   Offset_0x01405C
Offset_0x01406E:
                move.b  #$3A, $0000(A1)   ; Carrega uma nova instância do objeto na memória
                move.w  (A2)+, $0008(A1)
                move.w  (A2)+, $0030(A1)
                move.w  (A2)+, $000A(A1)
                move.b  (A2)+, $0024(A1)
                move.b  (A2)+, $001A(A1)
                move.l  #Level_Results_Mappings, $0004(A1)     ; Offset_0x014C5A
                bsr     Modify_A1_SpriteAttr_2P                ; Offset_0x016D16
                move.b  #$00, $0001(A1)
                lea     $0040(A1), A1
                dbra    D1, Offset_0x01405C
Offset_0x0140A2:
                moveq   #$00, D0
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x0140B8
                addq.w  #$01, D0
                btst    #$07, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x0140B8
                addq.w  #$01, D0
Offset_0x0140B8:
                move.b  D0, $001A(A0)
                bsr     Offset_0x013DB8
                move.w  $0008(A0), D0
                cmp.w   $0030(A0), D0
                bne     Offset_0x0140D8
                move.b  #$0A, $0024(A0)
                move.w  #$00B4, $001E(A0)
Offset_0x0140D8:
                rts
Offset_0x0140DA:
                tst.w   ($FFFFFF40).w
                bne     DeleteObject                           ; Offset_0x01646C
Offset_0x0140E2:
                bra     Offset_0x013DB8
Offset_0x0140E6:
                move.b  (Level_Id).w, D0                             ; $FFFFFE10
                cmpi.b  #$10, D0
                beq.s   Offset_0x0140FE
                cmpi.b  #$06, D0
                beq.s   Offset_0x0140FE
                cmpi.b  #$0E, D0
                bne     Offset_0x013DB8
Offset_0x0140FE:
                move.b  #$05, $001A(A0)
                bra     Offset_0x013DB8
Offset_0x014108:
                move.b  (Level_Id).w, D0                             ; $FFFFFE10
                cmpi.b  #$10, D0
                beq     Offset_0x013DDA
                cmpi.b  #$06, D0
                beq     Offset_0x013DDA
                cmpi.b  #$0E, D0
                beq     Offset_0x013DDA
                cmpi.b  #$05, D0
                bne.s   Offset_0x01412E
                moveq   #$08, D0
                bra.s   Offset_0x014134
Offset_0x01412E:
                move.b  (Act_Id).w, D0                               ; $FFFFFE11
                addq.b  #$06, D0
Offset_0x014134:
                move.b  D0, $001A(A0)
                bra     Offset_0x013DB8
Offset_0x01413C:
                subq.w  #$01, $001E(A0)
                bne.s   Offset_0x014146
                addq.b  #$02, $0024(A0)
Offset_0x014146:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x01414A:
                bsr     DisplaySprite                          ; Offset_0x01647A
                move.b  #$01, ($FFFFF7D6).w
                moveq   #$00, D0
                tst.w   ($FFFFF7D2).w
                beq.s   Offset_0x014166
                addi.w  #$000A, D0
                subi.w  #$000A, ($FFFFF7D2).w
Offset_0x014166:
                tst.w   ($FFFFF7D4).w
                beq.s   Offset_0x014176
                addi.w  #$000A, D0
                subi.w  #$000A, ($FFFFF7D4).w
Offset_0x014176:
                tst.w   ($FFFFFF72).w
                beq.s   Offset_0x014186
                addi.w  #$000A, D0
                subi.w  #$000A, ($FFFFFF72).w
Offset_0x014186:
                add.w   D0, ($FFFFFF6E).w
                tst.w   D0
                bne.s   Offset_0x0141F6
                move.w  #Results_Ring_Sfx, D0   ; $00C5
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.b  #$02, $0024(A0)
                move.w  #$00B4, $001E(A0)
                cmpi.w  #$03E8, ($FFFFFF6E).w
                bcs.s   Offset_0x0141F4
                move.w  #$012C, $001E(A0)
                lea     $0040(A0), A1
Offset_0x0141B4:
                tst.b   $0000(A1)
                beq.s   Offset_0x0141C0
                lea     $0040(A1), A1
                bra.s   Offset_0x0141B4
Offset_0x0141C0:
                move.b  #$3A, $0000(A1)   ; Carrega uma nova instância do objeto na memória
                move.b  #$12, $0024(A1)
                move.w  #$0188, $0008(A1)
                move.w  #$0118, $000A(A1)
                move.l  #Level_Results_Mappings, $0004(A1)     ; Offset_0x014C5A
                bsr     Modify_A1_SpriteAttr_2P                ; Offset_0x016D16
                move.b  #$00, $0001(A1)
                move.w  #$003C, $001E(A1)
                addq.b  #$01, ($FFFFFE18).w
Offset_0x0141F4:
                rts
Offset_0x0141F6:
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x0141F4
                move.w  #Add_Point_Sfx, D0      ; $00CD
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x014210:
                moveq   #$00, D0
                move.b  (Level_Id).w, D0                             ; $FFFFFE10
                add.w   D0, D0
                add.b   (Act_Id).w, D0                               ; $FFFFFE11
                add.w   D0, D0
                lea     Level_Sequence_Array(PC), A1           ; Offset_0x014296
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x01422C
                lea     Level_Sequence_2P_Array(PC), A1        ; Offset_0x0142DA
Offset_0x01422C:
                move.w  $00(A1, D0), D0
                tst.w   D0
                bpl.s   Go_NextLevel                           ; Offset_0x01423C
                move.b  #gm_SegaScreen, (Game_Mode).w          ; $00,  $FFFFF600
                rts
Go_NextLevel: ; Offset_0x01423C:
                move.w  D0, (Level_Id).w                             ; $FFFFFE10
                clr.b   ($FFFFFE30).w
                clr.b   ($FFFFFEE0).w
                move.w  #$0001, ($FFFFFE02).w
                rts
Offset_0x014250:
                tst.w   $001E(A0)
                beq.s   Offset_0x01425C
                subq.w  #$01, $001E(A0)
                rts
Offset_0x01425C:
                addq.b  #$02, $0024(A0)
                move.w  #Extra_Continue_Sfx, D0 ; $00BF
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x01426A:
                subq.w  #$01, $001E(A0)
                bpl.s   Offset_0x014280
                move.w  #$0013, $001E(A0)
                addq.b  #$01, $001B(A0)
                andi.b  #$01, $001B(A0)
Offset_0x014280:
                moveq   #$0C, D0
                add.b   $001B(A0), D0
                move.b  D0, $001A(A0)
                btst    #$04, ($FFFFFE05).w
                bne     DisplaySprite                          ; Offset_0x01647A
                rts    
;-------------------------------------------------------------------------------                
Level_Sequence_Array: ;  Offset_0x014296:
                dc.w    $0001, $0D00, $0000, $0000, $0201, $0400, $0000, $0000
                dc.w    $0401, $0500, $1000, $0000, $0E00, $0000, $0701, $0B00
                dc.w    $0801, $0A00, $0000, $0000, $0A01, $0400, $0B01, $0A00
                dc.w    $0C01, $0700, $0D01, $0F00, $FFFF, $0000, $0F01, $0C00
                dc.w    $0600, $0000
;-------------------------------------------------------------------------------                  
Level_Sequence_2P_Array: ; Offset_0x0142DA:
                dc.w    $0001, $0C00, $0000, $0000, $0201, $0400, $0000, $0000
                dc.w    $0401, $0500, $1000, $0000, $0E00, $0000, $0701, $0B00
                dc.w    $0801, $0A00, $0000, $0000, $0A01, $0400, $0B01, $FFFF
                dc.w    $0C01, $0B00, $0D01, $0F00, $FFFF, $0000, $0F01, $0C00
                dc.w    $0600, $0000   
;-------------------------------------------------------------------------------                 
Level_Results_Screen_Pos: ; Offset_0x01431E:  
                dc.w    $0020, $0120, $00B8
                dc.b    $02, $00
                dc.w    $0200, $0100, $00CA
                dc.b    $04, $03
                dc.w    $0240, $0140, $00CA
                dc.b    $06, $04
                dc.w    $0278, $0178, $00BE
                dc.b    $08, $06
                dc.w    $0350, $0120, $0120
                dc.b    $04, $09
                dc.w    $0320, $0120, $00F0
                dc.b    $04, $0A
                dc.w    $0330, $0120, $0100
                dc.b    $04, $0B
                dc.w    $0340, $0120, $0110
                dc.b    $16, $0E            
;===============================================================================
; Objeto 0x3A - Resultados da fase
; [ Término ]           
;===============================================================================  