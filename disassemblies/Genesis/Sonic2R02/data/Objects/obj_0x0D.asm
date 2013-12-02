;===============================================================================
; Objeto 0x0D - Painel de fim de fase
; [ Início ]
;===============================================================================    
Offset_0x019126:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x019146(PC, D0), D1
                jsr     Offset_0x019146(PC, D1)
                lea     (End_Panel_Animate_Data), A1           ; Offset_0x0194FC
                bsr     AnimateSprite                          ; Offset_0x0164CA
                bsr     Offset_0x0194A2
                bra     MarkObjGone                            ; Offset_0x016358
Offset_0x019146:
                dc.w    Offset_0x01914A-Offset_0x019146
                dc.w    Offset_0x0191BA-Offset_0x019146
Offset_0x01914A:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x019176
                move.l  #End_Panel_Mappings_2P, $0004(A0)      ; Offset_0x0195C6
                move.w  #$05E8, $0002(A0)
                move.b  #$FF, ($FFFFFFAA).w
                moveq   #$00, D1
                move.w  #$1020, D1
                move.w  #$FF80, D4
                moveq   #$00, D5
                bsr     Offset_0x0194D2
                bra.s   Offset_0x01919A
Offset_0x019176:
                cmpi.w  #$0401, (Level_Id).w                         ; $FFFFFE10
                beq.s   Offset_0x01918C
                tst.b   (Act_Id).w                                   ; $FFFFFE11
                beq.s   Offset_0x01918C
                move.w  #$0000, $0008(A0)
                rts
Offset_0x01918C:
                move.l  #End_Panel_Mappings, $0004(A0)         ; Offset_0x01952E
                move.w  #$0434, $0002(A0)
Offset_0x01919A:
                addq.b  #$02, $0024(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$18, $0019(A0)
                move.b  #$04, $0018(A0)
                move.w  #$3C3C, ($FFFFFEF8).w
Offset_0x0191BA:
                tst.b   ($FFFFFE1E).w
                beq     Offset_0x019244
                lea     ($FFFFB000).w, A1
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                bcs.s   Offset_0x019244
                cmpi.w  #$0020, D0
                bcc.s   Offset_0x019244
                move.w  #Panel_Spinning_Sfx, D0 ; $00CF
                jsr     (Play_Music)                           ; Offset_0x00131A
                clr.b   ($FFFFFE1E).w
                move.w  #$0001, $001C(A0)
                move.w  #$0000, $0030(A0)
                move.w  ($FFFFEECA).w, ($FFFFEEC8).w
                move.b  #$02, $0025(A0)
                cmpi.b  #$0C, ($FFFFFEF8).w
                bhi.s   Offset_0x01920E
                move.w  (Level_Music_Buffer).w, D0                   ; $FFFFFF70
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x01920E:
                tst.b   $0036(A0)
                bne     Offset_0x0192BE
                move.b  #$03, $0036(A0)
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x01922A
                move.b  #$04, $0036(A0)
Offset_0x01922A:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq     Offset_0x0192BE
                move.w  #$3C3C, ($FFFFFEF8).w
                move.w  #Vs_Level_Clear_Sfx, D0 ; $00D3
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                bra.s   Offset_0x0192BE
Offset_0x019244:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x0192BE
                tst.b   ($FFFFFECA).w
                beq.s   Offset_0x0192BE
                lea     ($FFFFB040).w, A1
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                bcs.s   Offset_0x0192BE
                cmpi.w  #$0020, D0
                bcc.s   Offset_0x0192BE
                move.w  #Panel_Spinning_Sfx, D0 ; $00CF
                jsr     (Play_Music)                           ; Offset_0x00131A
                clr.b   ($FFFFFECA).w
                move.w  #$0001, $001C(A0)
                move.w  #$0000, $0030(A0)
                move.w  ($FFFFEEFA).w, ($FFFFEEF8).w
                move.b  #$02, $0025(A0)
                cmpi.b  #$0C, ($FFFFFEF8).w
                bhi.s   Offset_0x01929C
                move.w  (Level_Music_Buffer).w, D0                   ; $FFFFFF70
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x01929C:
                tst.b   $0036(A0)
                bne.s   Offset_0x0192BE
                move.b  #$04, $0036(A0)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x0192BE
                move.w  #$3C3C, ($FFFFFEF8).w
                move.w  #Vs_Level_Clear_Sfx, D0 ; $00D3
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0192BE:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0192CC(PC, D0), D1
                jmp     Offset_0x0192CC(PC, D1)
Offset_0x0192CC:
                dc.w    Offset_0x0192D4-Offset_0x0192CC
                dc.w    Offset_0x0192D6-Offset_0x0192CC
                dc.w    Offset_0x019386-Offset_0x0192CC
                dc.w    Offset_0x01946A-Offset_0x0192CC
Offset_0x0192D4:
                rts
Offset_0x0192D6:
                subq.w  #$01, $0030(A0)
                bpl.s   Offset_0x019306
                move.w  #$003C, $0030(A0)
                addq.b  #$01, $001C(A0)
                cmpi.b  #$03, $001C(A0)
                bne.s   Offset_0x019306
                move.b  #$04, $0025(A0)
                move.b  $0036(A0), $001C(A0)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x019306
                move.b  #$06, $0025(A0)
Offset_0x019306:
                subq.w  #$01, $0032(A0)
                bpl.s   Offset_0x019374
                move.w  #$000B, $0032(A0)
                moveq   #$00, D0
                move.b  $0034(A0), D0
                addq.b  #$02, $0034(A0)
                andi.b  #$0E, $0034(A0)
                lea     Offset_0x019376(PC, D0), A2
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x019374
                move.b  #$25, $0000(A1) ; Carrega o objeto 0x25 - Anéis (Estrelinhas ao redor do painel girando)
                move.b  #$06, $0024(A1)
                move.b  (A2)+, D0
                ext.w   D0
                add.w   $0008(A0), D0
                move.w  D0, $0008(A1)
                move.b  (A2)+, D0
                ext.w   D0
                add.w   $000C(A0), D0
                move.w  D0, $000C(A1)
                move.l  #Rings_Mappings, $0004(A1)             ; Offset_0x012328
                move.w  #$26BC, $0002(A1)
                bsr     Modify_A1_SpriteAttr_2P                ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$02, $0018(A1)
                move.b  #$08, $0019(A1)
Offset_0x019374:
                rts
;-------------------------------------------------------------------------------                
Offset_0x019376:
                dc.b    $E8, $F0, $08, $08, $F0, $00, $18, $F8, $00, $F8, $10, $00, $E8, $08, $18, $10
;------------------------------------------------------------------------------- 
Offset_0x019386:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x01943E
                btst    #$01, ($FFFFB022).w
                bne.s   Offset_0x0193A2
                move.b  #$01, ($FFFFF7CC).w
                move.w  #$0800, ($FFFFF602).w
Offset_0x0193A2:
                tst.b   ($FFFFB000).w
                beq.s   Offset_0x0193BA
                move.w  ($FFFFB008).w, D0
                move.w  ($FFFFEECA).w, D1
                addi.w  #$0128, D1
                cmp.w   D1, D0
                bcs     Offset_0x01943E
Offset_0x0193BA:
                move.b  #$00, $0025(A0)
;===============================================================================
; Rotina usada para carregar os resultados da fase
; [ Início ]
;===============================================================================
Load_Level_Results: ; Offset_0x0193C0:                
                lea     ($FFFFB000).w, A1
                clr.b   $002B(A1)
                clr.b   ($FFFFFE1E).w
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x0193D6
                move.b  #$3A, (A1)  ; Carrega o objeto 0x3A - Resultados da fase
Offset_0x0193D6:
                moveq   #$26, D0
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x0193E2
                moveq   #$42, D0
Offset_0x0193E2:
                jsr     (LoadPLC2)                             ; Offset_0x00160C
                move.b  #$01, ($FFFFF7D6).w
                moveq   #$00, D0
                move.b  ($FFFFFE23).w, D0
                mulu.w  #$003C, D0
                moveq   #$00, D1
                move.b  ($FFFFFE24).w, D1
                add.w   D1, D0
                divu.w  #$000F, D0
                moveq   #$14, D1
                cmp.w   D1, D0
                bcs.s   Offset_0x01940C
                move.w  D1, D0
Offset_0x01940C:
                add.w   D0, D0
                move.w  Time_Bonus(PC, D0), ($FFFFF7D2).w      ; Offset_0x019440
                move.w  ($FFFFFE20).w, D0
                mulu.w  #$000A, D0
                move.w  D0, ($FFFFF7D4).w
                clr.w   ($FFFFFF6E).w
                clr.w   ($FFFFFF72).w
                tst.w   ($FFFFFF40).w
                bne.s   Offset_0x019434
                move.w  #$1388, ($FFFFFF72).w
Offset_0x019434:
                move.w  #Results_Snd, D0        ; $009A
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x01943E:
                rts
;-------------------------------------------------------------------------------                 
Time_Bonus: ; Offset_0x019440:
                dc.w    $1388, $1388, $03E8, $01F4, $0190, $0190, $012C, $012C
                dc.w    $00C8, $00C8, $00C8, $00C8, $0064, $0064, $0064, $0064
                dc.w    $0032, $0032, $0032, $0032, $0000
;===============================================================================
; Rotina usada para carregar os resultados da fase
; [ Término ]
;===============================================================================
                
Offset_0x01946A:                                              
                subq.w  #$01, $0030(A0)
                bpl.s   Offset_0x0194A0
                tst.b   ($FFFFFE1A).w
                bne.s   Offset_0x0194A0
                tst.b   ($FFFFFECC).w
                bne.s   Offset_0x0194A0
                tst.b   ($FFFFFE1E).w
                bne.s   Offset_0x0194A0
                tst.b   ($FFFFFECA).w
                bne.s   Offset_0x0194A0
                move.b  #$00, ($FFFFFE30).w
                move.b  #$00, ($FFFFFEE0).w
                move.b  #gm_Two_Player_Results, (Game_Mode).w   ; $18, $FFFFF600
                move.w  #$0000, ($FFFFFF10).w
Offset_0x0194A0:
                rts
Offset_0x0194A2:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x0194FA
                moveq   #$00, D0
                move.b  $001A(A0), D0
                cmp.b   ($FFFFFFAA).w, D0
                beq.s   Offset_0x0194FA
                move.b  D0, ($FFFFFFAA).w
                lea     (End_Panel_Dyn_Script), A2             ; Offset_0x01965E
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x0194FA
                move.w  #$BD00, D4
Loop_Load_End_Panel_Sprites: ; Offset_0x0194CE:
                moveq   #$00, D1
                move.w  (A2)+, D1
Offset_0x0194D2:
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.l   #$05, D1
                addi.l  #End_Panel_Spr, D1                     ; Offset_0x07A18A
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x00140A
                dbra    D5, Loop_Load_End_Panel_Sprites        ; Offset_0x0194CE
Offset_0x0194FA:
                rts
;-------------------------------------------------------------------------------
End_Panel_Animate_Data: ; Offset_0x0194FC:
                dc.w    Offset_0x019506-End_Panel_Animate_Data
                dc.w    Offset_0x01950A-End_Panel_Animate_Data
                dc.w    Offset_0x019518-End_Panel_Animate_Data
                dc.w    Offset_0x019526-End_Panel_Animate_Data
                dc.w    Offset_0x01952A-End_Panel_Animate_Data
Offset_0x019506:
                dc.b    $0F, $02, $FF, $00
Offset_0x01950A:
                dc.b    $01, $02, $03, $04, $05, $01, $03, $04, $05, $00, $03, $04, $05, $FF
Offset_0x019518:
                dc.b    $01, $02, $03, $04, $05, $01, $03, $04, $05, $00, $03, $04, $05, $FF
Offset_0x019526:
                dc.b    $0F, $00, $FF, $00
Offset_0x01952A:
                dc.b    $0F, $01, $FF, $00
;-------------------------------------------------------------------------------                
End_Panel_Mappings: ; Offset_0x01952E:                
                dc.w    Offset_0x01953A-End_Panel_Mappings
                dc.w    Offset_0x019554-End_Panel_Mappings
                dc.w    Offset_0x019576-End_Panel_Mappings
                dc.w    Offset_0x019590-End_Panel_Mappings
                dc.w    Offset_0x0195A2-End_Panel_Mappings
                dc.w    Offset_0x0195B4-End_Panel_Mappings
Offset_0x01953A:
                dc.w    $0003
                dc.l    $F00B0022, $0011FFE8, $F00B002E, $00170000
                dc.l    $10010020, $0010FFFC
Offset_0x019554:
                dc.w    $0004
                dc.l    $F003003A, $001DFFE8, $F00F003E, $001FFFF0
                dc.l    $F003083A, $081D0010, $10010020, $0010FFFC
Offset_0x019576:
                dc.w    $0003
                dc.l    $F00B0000, $0000FFE8, $F00B0800, $08000000
                dc.l    $10010020, $0010FFFC
Offset_0x019590:
                dc.w    $0002
                dc.l    $F00F000C, $0006FFF0, $10010020, $0010FFFC
Offset_0x0195A2:
                dc.w    $0002
                dc.l    $F003001C, $000EFFFC, $10010020, $0010FFFC
Offset_0x0195B4:
                dc.w    $0002
                dc.l    $F00F080C, $0806FFF0, $10010020, $0010FFFC
;-------------------------------------------------------------------------------
End_Panel_Mappings_2P: ; Offset_0x0195C6:                 
                dc.w    Offset_0x0195D2-End_Panel_Mappings_2P
                dc.w    Offset_0x0195EC-End_Panel_Mappings_2P
                dc.w    Offset_0x01960E-End_Panel_Mappings_2P
                dc.w    Offset_0x019628-End_Panel_Mappings_2P
                dc.w    Offset_0x01963A-End_Panel_Mappings_2P
                dc.w    Offset_0x01964C-End_Panel_Mappings_2P
Offset_0x0195D2:
                dc.w    $0003
                dc.l    $F00B0000, $0000FFE8, $F00B000C, $00060000
                dc.l    $10010214, $010AFFFC
Offset_0x0195EC:
                dc.w    $0004
                dc.l    $F0030000, $0000FFE8, $F00F0004, $0002FFF0
                dc.l    $F0030814, $080A0010, $10010214, $010AFFFC
Offset_0x01960E:
                dc.w    $0003
                dc.l    $F00B0000, $0000FFE8, $F00B0800, $08000000
                dc.l    $10010214, $010AFFFC
Offset_0x019628:
                dc.w    $0002
                dc.l    $F00F0000, $0000FFF0, $10010214, $010AFFFC
Offset_0x01963A:
                dc.w    $0002
                dc.l    $F0030000, $0000FFFC, $10010214, $010AFFFC
Offset_0x01964C:
                dc.w    $0002
                dc.l    $F00F0800, $0800FFF0, $10010214, $010AFFFC
;-------------------------------------------------------------------------------  
End_Panel_Dyn_Script: ; Offset_0x01965E:
                dc.w    End_Panel_Sonic_Dyn-End_Panel_Dyn_Script        ; Offset_0x01966A
                dc.w    End_Panel_Miles_Dyn-End_Panel_Dyn_Script        ; Offset_0x019670
                dc.w    End_Panel_Robotnik_Dyn-End_Panel_Dyn_Script     ; Offset_0x019678
                dc.w    End_Panel_Spinnig_Char_Dyn-End_Panel_Dyn_Script ; Offset_0x01967E
                dc.w    End_Panel_Post_Dyn-End_Panel_Dyn_Script         ; Offset_0x019682
                dc.w    End_Panel_Spinnig_Char_Dyn-End_Panel_Dyn_Script ; Offset_0x01967E
End_Panel_Sonic_Dyn: ; Offset_0x01966A:
                dc.w    $0002
                dc.w    $B022, $B02E
End_Panel_Miles_Dyn: ; Offset_0x019670:
                dc.w    $0003
                dc.w    $303A, $F03E, $303A
End_Panel_Robotnik_Dyn: ; Offset_0x019678:
                dc.w    $0002
                dc.w    $B000, $B000
End_Panel_Spinnig_Char_Dyn: ; Offset_0x01967E:
                dc.w    $0001
                dc.w    $F00C
End_Panel_Post_Dyn: ; Offset_0x019682:
                dc.w    $0001
                dc.w    $301C              
;===============================================================================
; Objeto 0x0D - Painel de fim de fase
; [ Término ]
;===============================================================================  