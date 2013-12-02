;===============================================================================
; Objeto 0x79 - Poste de reinício, utilizado para salvar sua posição na fase
; [ Início ]
;===============================================================================   
Offset_0x01F044:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01F052(PC, D0), D1
                jmp     Offset_0x01F052(PC, D1)
Offset_0x01F052:
                dc.w    Offset_0x01F05C-Offset_0x01F052
                dc.w    Offset_0x01F0BE-Offset_0x01F052
                dc.w    Offset_0x01F1C0-Offset_0x01F052
                dc.w    Offset_0x01F1D2-Offset_0x01F052
                dc.w    Offset_0x01F4CA-Offset_0x01F052
Offset_0x01F05C:
                addq.b  #$02, $0024(A0)
                move.l  #Star_Post_Mappings, $0004(A0)         ; Offset_0x01F3B8
                move.w  #$047C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$08, $0019(A0)
                move.b  #$05, $0018(A0)
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                bclr    #$07, $02(A2, D0)
                btst    #$00, $02(A2, D0)
                bne.s   Offset_0x01F0B2
                move.b  ($FFFFFE30).w, D1
                andi.b  #$7F, D1
                move.b  $0028(A0), D2
                andi.b  #$7F, D2
                cmp.b   D2, D1
                bcs.s   Offset_0x01F0BE
Offset_0x01F0B2:
                bset    #$00, $02(A2, D0)
                move.b  #$02, $001C(A0)
Offset_0x01F0BE:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x01F1C0
                lea     ($FFFFB000).w, A3
                move.b  ($FFFFFE30).w, D1
                bsr.s   Offset_0x01F0E6
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq     Offset_0x01F1C0
                lea     ($FFFFB040).w, A3
                move.b  ($FFFFFEE0).w, D1
                bsr.s   Offset_0x01F0E6
                bra     Offset_0x01F1C0
Offset_0x01F0E6:
                andi.b  #$7F, D1
                move.b  $0028(A0), D2
                andi.b  #$7F, D2
                cmp.b   D2, D1
                bcc     Offset_0x01F1B2
                move.w  $0008(A3), D0
                sub.w   $0008(A0), D0
                addq.w  #$08, D0
                cmpi.w  #$0010, D0
                bcc     Offset_0x01F1B0
                move.w  $000C(A3), D0
                sub.w   $000C(A0), D0
                addi.w  #$0040, D0
                cmpi.w  #$0068, D0
                bcc     Offset_0x01F1B0
                move.w  #Check_Point_Sfx, D0    ; $00A1
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x01F196
                move.b  #$79, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$06, $0024(A1)
                move.w  $0008(A0), $0030(A1)
                move.w  $000C(A0), $0032(A1)
                subi.w  #$0014, $0032(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$08, $0019(A1)
                move.b  #$04, $0018(A1)
                move.b  #$02, $001A(A1)
                move.w  #$0020, $0036(A1)
                move.w  A0, $003E(A1)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                bne.s   Offset_0x01F196
                cmpi.b  #$07, (Emeralds_Count).w                     ; $FFFFFF91
                beq.s   Offset_0x01F196
                cmpi.w  #$0032, ($FFFFFE20).w
                bcs.s   Offset_0x01F196
                bsr     Load_Star_Post_Stars                   ; Offset_0x01F458
Offset_0x01F196:
                move.b  #$01, $001C(A0)
                bsr     Star_Post_Save_Info                    ; Offset_0x01F22A
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                bset    #$00, $02(A2, D0)
Offset_0x01F1B0:
                rts
Offset_0x01F1B2:
                tst.b   $001C(A0)
                bne.s   Offset_0x01F1BE
                move.b  #$02, $001C(A0)
Offset_0x01F1BE:
                rts
Offset_0x01F1C0:
                lea     (Star_Post_Animate_Data), A1           ; Offset_0x01F3A6
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x01F1D2:
                subq.w  #$01, $0036(A0)
                bpl.s   Offset_0x01F1F4
                move.w  $003E(A0), A1
                cmpi.b  #$79, (A1)
                bne.s   Offset_0x01F1EE
                move.b  #$02, $001C(A1)
                move.b  #$00, $001A(A1)
Offset_0x01F1EE:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x01F1F4:
                move.b  $0026(A0), D0
                subi.b  #$10, $0026(A0)
                subi.b  #$40, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0C00, D1
                swap.w  D1
                add.w   $0030(A0), D1
                move.w  D1, $0008(A0)
                muls.w  #$0C00, D0
                swap.w  D0
                add.w   $0032(A0), D0
                move.w  D0, $000C(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
;===============================================================================
; Sub Rotina para salvar localização atual do jogador. 
; [ Início ]     
;===============================================================================                  
Star_Post_Save_Info: ; Offset_0x01F22A:
                cmpa.w  #$B000, A3
                bne     Offset_0x01F2B8
                move.b  $0028(A0), ($FFFFFE30).w
                move.b  ($FFFFFE30).w, ($FFFFFE31).w
                move.w  $0008(A0), ($FFFFFE32).w
                move.w  $000C(A0), ($FFFFFE34).w
                move.w  ($FFFFB002).w, ($FFFFFE3C).w
                move.w  ($FFFFB03E).w, ($FFFFFE3E).w
                move.w  ($FFFFFE20).w, ($FFFFFE36).w
                move.b  ($FFFFFE1B).w, ($FFFFFE54).w
                move.l  ($FFFFFE22).w, ($FFFFFE38).w
                move.b  ($FFFFEEDF).w, ($FFFFFE58).w
                move.w  ($FFFFEECE).w, ($FFFFFE56).w
                move.w  ($FFFFEE00).w, ($FFFFFE40).w
                move.w  ($FFFFEE04).w, ($FFFFFE42).w
                move.w  ($FFFFEE08).w, ($FFFFFE44).w
                move.w  ($FFFFEE0C).w, ($FFFFFE46).w
                move.w  ($FFFFEE10).w, ($FFFFFE48).w
                move.w  ($FFFFEE14).w, ($FFFFFE4A).w
                move.w  ($FFFFEE18).w, ($FFFFFE4C).w
                move.w  ($FFFFEE1C).w, ($FFFFFE4E).w
                move.w  ($FFFFF648).w, ($FFFFFE50).w
                move.b  ($FFFFF64D).w, ($FFFFFE52).w
                move.b  ($FFFFF64E).w, ($FFFFFE53).w
                rts
Offset_0x01F2B8:
                move.b  $0028(A0), ($FFFFFEE0).w
                move.b  ($FFFFFEE0).w, ($FFFFFEE1).w
                move.w  $0008(A0), ($FFFFFEE2).w
                move.w  $000C(A0), ($FFFFFEE4).w
                move.w  ($FFFFB042).w, ($FFFFFEEC).w
                move.w  ($FFFFB07E).w, ($FFFFFEEE).w
                move.w  ($FFFFFED0).w, ($FFFFFEE6).w
                move.b  ($FFFFFEC7).w, ($FFFFFE55).w
                move.l  ($FFFFFED2).w, ($FFFFFEE8).w
                rts
;===============================================================================
; Sub Rotina para salvar localização atual do jogador. 
; [ Término ]     
;===============================================================================                
 
 ;===============================================================================
; Sub Rotina para carregar a última localização salva do jogador. 
; [ Início ]     
;===============================================================================                  
Star_Post_Load_Info: ; Offset_0x01F2F0:                 
                move.b  ($FFFFFE31).w, ($FFFFFE30).w
                move.w  ($FFFFFE32).w, ($FFFFB008).w
                move.w  ($FFFFFE34).w, ($FFFFB00C).w
                move.w  ($FFFFFE36).w, ($FFFFFE20).w
                move.b  ($FFFFFE54).w, ($FFFFFE1B).w
                clr.w   ($FFFFFE20).w
                clr.b   ($FFFFFE1B).w
                move.l  ($FFFFFE38).w, ($FFFFFE22).w
                move.b  #$3B, ($FFFFFE25).w
                subq.b  #$01, ($FFFFFE24).w
                move.w  ($FFFFFE3C).w, ($FFFFB002).w
                move.w  ($FFFFFE3E).w, ($FFFFB03E).w
                move.b  ($FFFFFE58).w, ($FFFFEEDF).w
                move.b  ($FFFFFE52).w, ($FFFFF64D).w
                move.w  ($FFFFFE56).w, ($FFFFEECE).w
                move.w  ($FFFFFE56).w, ($FFFFEEC6).w
                move.w  ($FFFFFE40).w, ($FFFFEE00).w
                move.w  ($FFFFFE42).w, ($FFFFEE04).w
                move.w  ($FFFFFE44).w, ($FFFFEE08).w
                move.w  ($FFFFFE46).w, ($FFFFEE0C).w
                move.w  ($FFFFFE48).w, ($FFFFEE10).w
                move.w  ($FFFFFE4A).w, ($FFFFEE14).w
                move.w  ($FFFFFE4C).w, ($FFFFEE18).w
                move.w  ($FFFFFE4E).w, ($FFFFEE1C).w
                tst.b   ($FFFFF730).w
                beq.s   Offset_0x01F392
                move.w  ($FFFFFE50).w, ($FFFFF648).w
                move.b  ($FFFFFE52).w, ($FFFFF64D).w
                move.b  ($FFFFFE53).w, ($FFFFF64E).w
Offset_0x01F392:
                tst.b   ($FFFFFE30).w
                bpl.s   Offset_0x01F3A4
                move.w  ($FFFFFE32).w, D0
                subi.w  #$00A0, D0
                move.w  D0, ($FFFFEEC8).w
Offset_0x01F3A4:
                rts
;===============================================================================
; Sub Rotina para carregar a última localização salva do jogador. 
; [ Término ]     
;===============================================================================   
Star_Post_Animate_Data: ; Offset_0x01F3A6:                
                dc.w    Offset_0x01F3AC-Star_Post_Animate_Data
                dc.w    Offset_0x01F3B0-Star_Post_Animate_Data
                dc.w    Offset_0x01F3B4-Star_Post_Animate_Data
Offset_0x01F3AC:
                dc.b    $0F, $00, $FF, $00
Offset_0x01F3B0:
                dc.b    $0F, $01, $FF, $00
Offset_0x01F3B4:
                dc.b    $03, $00, $04, $FF
;-------------------------------------------------------------------------------  
Star_Post_Mappings: ; Offset_0x01F3B8:                
                dc.w    Offset_0x01F3C2-Star_Post_Mappings
                dc.w    Offset_0x01F3E4-Star_Post_Mappings
                dc.w    Offset_0x01F3FE-Star_Post_Mappings
                dc.w    Offset_0x01F408-Star_Post_Mappings
                dc.w    Offset_0x01F412-Star_Post_Mappings
Offset_0x01F3C2:
                dc.w    $0004
                dc.l    $E8012004, $2002FFFC, $F8032006, $2003FFF8
                dc.l    $F8032806, $28030000, $D8050000, $0000FFF8
Offset_0x01F3E4:
                dc.w    $0003
                dc.l    $E8012004, $2002FFFC, $F8032006, $2003FFF8
                dc.l    $F8032806, $28030000
Offset_0x01F3FE:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x01F408:
                dc.w    $0001
                dc.l    $F8052000, $2000FFF8
Offset_0x01F412:
                dc.w    $0004
                dc.l    $E8012004, $2002FFFC, $F8032006, $2003FFF8
                dc.l    $F8032806, $28030000, $D8052000, $2000FFF8      
;-------------------------------------------------------------------------------  
Star_Post_Stars_Mappings: ; Offset_0x01F434:
                dc.w    Offset_0x01F43A-Star_Post_Stars_Mappings
                dc.w    Offset_0x01F444-Star_Post_Stars_Mappings
                dc.w    Offset_0x01F44E-Star_Post_Stars_Mappings
Offset_0x01F43A:
                dc.w    $0001
                dc.l    $F805000A, $0005FFF8
Offset_0x01F444:
                dc.w    $0001
                dc.l    $FC00000E, $0007FFFC
Offset_0x01F44E:
                dc.w    $0001
                dc.l    $FC00000F, $0007FFFC
;-------------------------------------------------------------------------------                  
Load_Star_Post_Stars: ; Offset_0x01F458:
                moveq   #$03, D1
                moveq   #$00, D2
Offset_0x01F45C:                
                bsr     SingleObjectLoad_2                     ; Offset_0x017F68
                bne.s   Offset_0x01F4C8
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  #Star_Post_Stars_Mappings, $0004(A1)   ; Offset_0x01F434
                move.w  #$047C, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$08, $0024(A1)
                move.w  $0008(A0), D0
                move.w  D0, $0008(A1)
                move.w  D0, $0030(A1)
                move.w  $000C(A0), D0
                subi.w  #$0030, D0
                move.w  D0, $000C(A1)
                move.w  D0, $0032(A1)
                move.b  $0018(A0), $0018(A1)
                move.b  #$08, $0019(A1)
                move.b  #$01, $001A(A1)
                move.w  #$FC00, $0010(A1)
                move.w  #$0000, $0012(A1)
                move.w  D2, $0034(A1)
                addi.w  #$0040, D2
                dbra    D1, Offset_0x01F45C
Offset_0x01F4C8:
                rts
;-------------------------------------------------------------------------------                   
Offset_0x01F4CA:
                move.b  $0021(A0), D0
                beq     Offset_0x01F4E8
                andi.b  #$01, D0
                beq.s   Offset_0x01F4E4
                move.b  #$01, ($FFFFF7CD).w
                move.b  #$10, ($FFFFF600).w
Offset_0x01F4E4:
                clr.b   $0021(A0)
Offset_0x01F4E8:
                addi.w  #$000A, $0034(A0)
                move.w  $0034(A0), D0
                andi.w  #$00FF, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$05, D0
                asr.w   #$03, D1
                move.w  D1, D3
                move.w  $0034(A0), D2
                andi.w  #$03E0, D2
                lsr.w   #$05, D2
                moveq   #$02, D5
                moveq   #$00, D4
                cmpi.w  #$0010, D2
                ble.s   Offset_0x01F518
                neg.w   D1
Offset_0x01F518:
                andi.w  #$000F, D2
                cmpi.w  #$0008, D2
                ble.s   Offset_0x01F528
                neg.w   D2
                andi.w  #$0007, D2
Offset_0x01F528:
                lsr.w   #$01, D2
                beq.s   Offset_0x01F52E
                add.w   D1, D4
Offset_0x01F52E:
                asl.w   #$01, D1
                dbra    D5, Offset_0x01F528
                asr.w   #$04, D4
                add.w   D4, D0
                addq.w  #$01, $0036(A0)
                move.w  $0036(A0), D1
                cmpi.w  #$0080, D1
                beq.s   Offset_0x01F552
                bgt.s   Offset_0x01F558
Offset_0x01F548:                
                muls.w  D1, D0
                muls.w  D1, D3
                asr.w   #$07, D0
                asr.w   #$07, D3
                bra.s   Offset_0x01F56A
Offset_0x01F552:
                move.b  #$D8, $0020(A0)
Offset_0x01F558:
                cmpi.w  #$0180, D1
                ble.s   Offset_0x01F56A
                neg.w   D1
                addi.w  #$0200, D1
                bmi     Offset_0x01F59E
                bra.s   Offset_0x01F548
Offset_0x01F56A:
                move.w  $0030(A0), D2
                add.w   D3, D2
                move.w  D2, $0008(A0)
                move.w  $0032(A0), D2
                add.w   D0, D2
                move.w  D2, $000C(A0)
                addq.b  #$01, $001B(A0)
                move.b  $001B(A0), D0
                andi.w  #$0006, D0
                lsr.w   #$01, D0
                cmpi.b  #$03, D0
                bne.s   Offset_0x01F594
                moveq   #$01, D0
Offset_0x01F594:
                move.b  D0, $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x01F59E:
                jmp     (DeleteObject)                         ; Offset_0x01646C                                              
;===============================================================================
; Objeto 0x79 - Poste de reinício, utilizado para salvar sua posição na fase
; [ Término ]
;===============================================================================  