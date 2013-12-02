;===============================================================================
; Objeto 0x52 - Robotnik na Hill Top
; [ Início ]
;===============================================================================  
Offset_0x02F780:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x02F78E(PC, D0), D1
                jmp     Offset_0x02F78E(PC, D1)
Offset_0x02F78E:
                dc.w    Offset_0x02F798-Offset_0x02F78E
                dc.w    Offset_0x02F830-Offset_0x02F78E
                dc.w    Offset_0x02FA2A-Offset_0x02F78E
                dc.w    Offset_0x02FAA4-Offset_0x02F78E
                dc.w    Offset_0x02FD6E-Offset_0x02F78E
Offset_0x02F798:
                move.l  #HTz_Boss_Mappings, $0004(A0)          ; Offset_0x02FE20 
                move.w  #$03C1, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$90, $000E(A0)
                move.b  #$90, $0014(A0)
                move.b  #$04, $0018(A0)
                move.w  #$3040, $0008(A0)
                move.w  #$0580, $000C(A0)
                move.b  #$01, $002C(A0)
                move.b  #$01, $000B(A0)
                addq.b  #$02, $000A(A0)
                bset    #$06, $0001(A0)
                move.b  #$32, $0020(A0)
                move.b  #$08, $0032(A0)
                move.w  #$FF20, ($FFFFF75A).w
                move.w  $0008(A0), ($FFFFF750).w
                move.w  $000C(A0), ($FFFFF754).w
                clr.b   $0014(A0)
                move.w  $0008(A0), $0010(A0)
                move.w  $000C(A0), $0012(A0)
                move.b  #$02, $0015(A0)
                bsr     Offset_0x02F81A
                rts
Offset_0x02F81A:
                lea     ($FFFFF740).w, A2
                move.b  #$06, (A2)+
                move.b  #$00, (A2)+
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                rts
Offset_0x02F830:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x02F83E(PC, D0), D1
                jmp     Offset_0x02F83E(PC, D1)
Offset_0x02F83E:
                dc.w    Offset_0x02F848-Offset_0x02F83E
                dc.w    Offset_0x02F890-Offset_0x02F83E
                dc.w    Offset_0x02F90E-Offset_0x02F83E
                dc.w    Offset_0x02F942-Offset_0x02F83E
                dc.w    Offset_0x02FC56-Offset_0x02F83E
Offset_0x02F848:
                move.b  #$00, ($FFFFF73F).w
                bsr     Boss_Sub                               ; Offset_0x02D192
                tst.b   $002C(A0)
                bne.s   Offset_0x02F862
                cmpi.w  #$0518, ($FFFFF754).w
                bgt.s   Offset_0x02F880
                bra.s   Offset_0x02F86A
Offset_0x02F862:
                cmpi.w  #$04FC, ($FFFFF754).w
                bgt.s   Offset_0x02F880
Offset_0x02F86A:
                move.w  #$0000, ($FFFFF75A).w
                move.b  #$04, $001A(A0)
                addq.b  #$02, $0026(A0)
                move.b  #$3C, $003E(A0)
Offset_0x02F880:
                move.w  ($FFFFF754).w, $000C(A0)
                bsr     Offset_0x02FBF0
Offset_0x02F88A:                
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02F890:
                subq.b  #$01, $003E(A0)
                bpl.s   Offset_0x02F8F4
                move.b  #$01, ($FFFFF73F).w
                move.b  #$01, $000F(A0)
                cmpi.b  #$E8, $003E(A0)
                bne.s   Offset_0x02F8F4
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02F8DC
                move.b  #$52, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$04, $000A(A1)
                move.b  $0001(A0), $0001(A1)
                andi.b  #$01, $0001(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$2F, $003E(A0)
Offset_0x02F8DC:
                bsr     Offset_0x02FBF0
                bsr     Offset_0x02FA18
                lea     (HTz_Boss_Animate_Data), A1            ; Offset_0x02FDE8
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02F8F4:
                move.b  $001A(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$07, D1
                add.w   ($FFFFF754).w, D1
                move.w  D1, $000C(A0)
                addq.b  #$04, $001A(A0)
                bra.s   Offset_0x02F8DC
Offset_0x02F90E:
                move.b  #$00, ($FFFFF73F).w
                move.b  #$00, $000F(A0)
                move.b  #$10, ($FFFFF742).w
                move.b  #$00, ($FFFFF743).w
                subq.b  #$01, $003E(A0)
                bne     Offset_0x02F8F4
                move.w  #$00E0, ($FFFFF75A).w
                addq.b  #$02, $0026(A0)
                bsr     Offset_0x02FA18
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02F942:
                bsr     Boss_Sub                               ; Offset_0x02D192
                tst.b   $002C(A0)
                bne.s   Offset_0x02F956
                cmpi.w  #$0538, ($FFFFF754).w
                blt.s   Offset_0x02F990
                bra.s   Offset_0x02F95E
Offset_0x02F956:
                cmpi.w  #$0548, ($FFFFF754).w
                blt.s   Offset_0x02F990
Offset_0x02F95E:
                tst.b   $0038(A0)
                bne.s   Offset_0x02F990
                st      $0038(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02F990
                move.b  #$52, (A1)         ; Nova instância do objeto na memória
                move.b  #$06, $000A(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #Lava_Sfx, D0           ; $AE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02F990:
                tst.b   $002C(A0)
                bne.s   Offset_0x02F9A6
                cmpi.w  #$05A0, ($FFFFF754).w
                blt.s   Offset_0x02FA08
                move.w  #$05A0, ($FFFFF754).w
                bra.s   Offset_0x02F9B4
Offset_0x02F9A6:
                cmpi.w  #$0580, ($FFFFF754).w
                blt.s   Offset_0x02FA08
                move.w  #$0580, ($FFFFF754).w
Offset_0x02F9B4:
                move.w  #$FF20, ($FFFFF75A).w
                move.b  #$00, $0026(A0)
                sf      $0038(A0)
                move.w  ($FFFFB008).w, D0
                subi.w  #$2FC0, D0
                bmi.s   Offset_0x02F9E0
                move.w  #$0580, ($FFFFF754).w
                move.w  #$3040, $0008(A0)
                st      $002C(A0)
                bra.s   Offset_0x02F9F0
Offset_0x02F9E0:
                move.w  #$2F40, $0008(A0)
                move.w  #$05A0, ($FFFFF754).w
                sf      $002C(A0)
Offset_0x02F9F0:
                move.w  $0008(A0), D0
                cmp.w   ($FFFFB008).w, D0
                bgt.s   Offset_0x02FA02
                bset    #$00, $0001(A0)
                bra.s   Offset_0x02FA08
Offset_0x02FA02:
                bclr    #$00, $0001(A0)
Offset_0x02FA08:
                move.w  ($FFFFF754).w, $000C(A0)
                bsr     Offset_0x02FBF0
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02FA18:
                move.w  $0008(A0), D0
                move.w  $000C(A0), D1
                move.w  D0, $0010(A0)
                move.w  D1, $0012(A0)
                rts
Offset_0x02FA2A:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02FA38(PC, D0), D1
                jmp     Offset_0x02FA38(PC, D1)
Offset_0x02FA38:
                dc.w    Offset_0x02FA3C-Offset_0x02FA38
                dc.w    Offset_0x02FA8A-Offset_0x02FA38
Offset_0x02FA3C:
                move.l  #HTz_Boss_Mappings, $0004(A0)          ; Offset_0x02FE20 
                move.w  #$0421, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                addq.b  #$02, $0025(A0)
                move.b  #$05, $001C(A0)
                move.b  #$98, $0020(A0)
                subi.w  #$001C, $000C(A0)
                move.w  #$FF90, D0
                move.w  #$FFFC, D1
                btst    #$00, $0001(A0)
                beq.s   Offset_0x02FA80
                neg.w   D0
                neg.w   D1
Offset_0x02FA80:
                add.w   D0, $0008(A0)
                move.w  D1, $0010(A0)
                rts
Offset_0x02FA8A:
                move.w  $0010(A0), D1
                add.w   D1, $0008(A0)
                lea     (HTz_Boss_Animate_Data), A1            ; Offset_0x02FDE8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02FAA4:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02FAB2(PC, D0), D1
                jmp     Offset_0x02FAB2(PC, D1)
Offset_0x02FAB2:
                dc.w    Offset_0x02FAB6-Offset_0x02FAB2
                dc.w    Offset_0x02FB48-Offset_0x02FAB2
Offset_0x02FAB6:
                move.l  A0, A1
                moveq   #$00, D2
                moveq   #$01, D1
                bra.s   Offset_0x02FAD4
Offset_0x02FABE:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x02FB46
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
Offset_0x02FAD4:
                move.b  #$52, (A1)         ; Nova instância do objeto na memória
                move.b  #$06, $000A(A1)
                move.l  #HTz_Boss_Mappings, $0004(A1)          ; Offset_0x02FE20 
                move.w  #$0421, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                addq.b  #$02, $0025(A1)
                move.b  #$07, $001C(A1)
                move.b  #$8B, $0020(A1)
                move.b  D2, $002E(A1)
                move.b  #$08, $0016(A1)
                move.b  #$08, $0017(A1)
                move.w  $0008(A1), $002A(A1)
                move.w  #$1C00, D0
                tst.w   D2
                bne.s   Offset_0x02FB28
                neg.w   D0
Offset_0x02FB28:
                move.w  D0, $0010(A1)
                move.w  #$AC00, $0012(A1)
                cmpi.w  #$2F40, $0008(A1)
                beq.s   Offset_0x02FB40
                move.w  #$9C00, $0012(A1)
Offset_0x02FB40:
                addq.w  #$01, D2
                dbra    D1, Offset_0x02FABE
Offset_0x02FB46:
                rts
Offset_0x02FB48:
                bsr     Offset_0x02FBBE
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x02FBAC
                add.w   D1, $000C(A0)
                move.b  #$20, (A0) ; Carrega o objeto 0x20 na memória (Bolas de fogo lançadas pelo chefe)
                move.b  #$0A, $0024(A0)
                move.b  #$02, $001C(A0)
                move.b  #$04, $001A(A0)
                move.w  #$0000, $0012(A0)
                move.l  #Fireball_Mappings, $0004(A0)          ; Offset_0x0231A0
                move.w  #$839E, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$00, $001A(A0)
                move.w  #$0009, $0032(A0)
                move.b  #$03, $0036(A0)
                move.b  #$B3, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (Offset_0x022EE0)
Offset_0x02FBAC:
                lea     (HTz_Boss_Animate_Data), A1            ; Offset_0x02FDE8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02FBBE:
                move.l  $002A(A0), D2
                move.l  $000C(A0), D3
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$04, D0
                add.l   D0, D2
                move.w  $0012(A0), D0
                addi.w  #$0380, $0012(A0)
                ext.l   D0
                asl.l   #$04, D0
                add.l   D0, D3
                move.l  D2, $002A(A0)
                move.l  D3, $000C(A0)
                move.w  $002A(A0), $0008(A0)
                rts
Offset_0x02FBF0:
                cmpi.b  #$08, $0026(A0)
                bcc.s   Offset_0x02FC36
                tst.b   $0032(A0)
                beq.s   Offset_0x02FC38
                tst.b   $0020(A0)
                bne.s   Offset_0x02FC36
                tst.b   $0014(A0)
                bne.s   Offset_0x02FC1A
                move.b  #$20, $0014(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02FC1A:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02FC28
                move.w  #$0EEE, D0
Offset_0x02FC28:
                move.w  D0, (A1)
                subq.b  #$01, $0014(A0)
                bne.s   Offset_0x02FC36
                move.b  #$32, $0020(A0)
Offset_0x02FC36:
                rts
Offset_0x02FC38:
                moveq   #$64, D0
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.w  #$00B3, ($FFFFF75C).w
                move.b  #$08, $0026(A0)
                moveq   #$40, D0
                jsr     (LoadPLC)                              ; Offset_0x0015DA
                rts
Offset_0x02FC56:
                move.b  #$00, $000F(A0)
                subq.w  #$01, ($FFFFF75C).w
                bmi.s   Offset_0x02FC94
                cmpi.w  #$001E, ($FFFFF75C).w
                bgt.s   Offset_0x02FC8A
                move.b  #$10, $000B(A0)
                bsr     Boss_Defeated                          ; Offset_0x02D278
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne     Offset_0x02F88A
                bsr     Offset_0x02FD10
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02FC8A:
                bsr     Boss_Defeated                          ; Offset_0x02D278
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02FC94:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne     Offset_0x02FCA4
                bsr     Offset_0x02FD10
Offset_0x02FCA4:
                cmpi.w  #$FFC4, ($FFFFF75C).w
                bgt     Offset_0x02F88A
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x02FCC6
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
                move.b  #$01, ($FFFFF7A7).w
Offset_0x02FCC6:
                addq.w  #$02, $000C(A0)
                cmpi.w  #$3160, ($FFFFEECA).w
                bcc.s   Offset_0x02FCD8
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x02FCFE
Offset_0x02FCD8:
                tst.b   $0001(A0)
                bpl.s   Offset_0x02FD04
                tst.b   $002C(A0)
                bne.s   Offset_0x02FCF4
                cmpi.w  #$0578, $000C(A0)
                bgt     Offset_0x02FD04
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02FCF4:
                cmpi.w  #$0588, $000C(A0)
                bgt     Offset_0x02FD04
Offset_0x02FCFE:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02FD04:
                move.w  #$3160, ($FFFFEECA).w
Offset_0x02FD0A:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02FD10:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x02FD6C
                move.b  #$52, (A1)         ; Nova instância do objeto na memória
                move.b  #$08, $000A(A1)
                move.l  #HTz_Boss_Defeated_Smoke_Mappings, $0004(A1) ; Offset_0x02FDB8
                move.w  #$05E4, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$01, $0018(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $0008(A0), $002A(A1)
                subi.w  #$0028, $000C(A1)
                move.w  #$FFA0, $0010(A1)
                move.w  #$FF40, $0012(A1)
                move.b  #$00, $001A(A1)
                move.b  #$11, $001E(A1)
Offset_0x02FD6C:
                rts
Offset_0x02FD6E:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02FD88
                move.b  #$11, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$04, $001A(A0)
                beq     Offset_0x02FD0A
Offset_0x02FD88:
                move.l  $002A(A0), D2
                move.l  $000C(A0), D3
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, $002A(A0)
                move.w  $002A(A0), $0008(A0)
                move.l  D3, $000C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
HTz_Boss_Defeated_Smoke_Mappings: ; Offset_0x02FDB8:
                dc.w    Offset_0x02FDC0-HTz_Boss_Defeated_Smoke_Mappings
                dc.w    Offset_0x02FDCA-HTz_Boss_Defeated_Smoke_Mappings
                dc.w    Offset_0x02FDD4-HTz_Boss_Defeated_Smoke_Mappings
                dc.w    Offset_0x02FDDE-HTz_Boss_Defeated_Smoke_Mappings
Offset_0x02FDC0:
                dc.w    $0001
                dc.l    $F8052000, $2000FFF8
Offset_0x02FDCA:
                dc.w    $0001
                dc.l    $F8052004, $2002FFF8
Offset_0x02FDD4:
                dc.w    $0001
                dc.l    $F8052008, $2004FFF8
Offset_0x02FDDE:
                dc.w    $0001
                dc.l    $F805200C, $2006FFF8
;-------------------------------------------------------------------------------
HTz_Boss_Animate_Data: ; Offset_0x02FDE8:
                dc.w    Offset_0x02FDF8-HTz_Boss_Animate_Data
                dc.w    Offset_0x02FDFE-HTz_Boss_Animate_Data
                dc.w    Offset_0x02FE04-HTz_Boss_Animate_Data
                dc.w    Offset_0x02FE0A-HTz_Boss_Animate_Data
                dc.w    Offset_0x02FE10-HTz_Boss_Animate_Data
                dc.w    Offset_0x02FE14-HTz_Boss_Animate_Data
                dc.w    Offset_0x02FE18-HTz_Boss_Animate_Data
                dc.w    Offset_0x02FE1C-HTz_Boss_Animate_Data
Offset_0x02FDF8:
                dc.b    $01, $02, $03, $FD, $01, $00
Offset_0x02FDFE:
                dc.b    $02, $04, $05, $FD, $02, $00
Offset_0x02FE04:
                dc.b    $03, $06, $07, $FD, $03, $00
Offset_0x02FE0A:
                dc.b    $04, $08, $09, $FD, $04, $00
Offset_0x02FE10:
                dc.b    $05, $0A, $0B, $FE
Offset_0x02FE14:
                dc.b    $03, $0C, $0D, $FF
Offset_0x02FE18:
                dc.b    $0F, $01, $FF, $00
Offset_0x02FE1C:
                dc.b    $03, $0E, $0F, $FF
;-------------------------------------------------------------------------------
HTz_Boss_Mappings: ; Offset_0x02FE20: 
                dc.w    HTz_Boss_Mappings-HTz_Boss_Mappings
                dc.w    Offset_0x02FE42-HTz_Boss_Mappings
                dc.w    Offset_0x02FE84-HTz_Boss_Mappings
                dc.w    Offset_0x02FE8E-HTz_Boss_Mappings
                dc.w    Offset_0x02FE98-HTz_Boss_Mappings
                dc.w    Offset_0x02FEA2-HTz_Boss_Mappings
                dc.w    Offset_0x02FEB4-HTz_Boss_Mappings
                dc.w    Offset_0x02FEC6-HTz_Boss_Mappings
                dc.w    Offset_0x02FEE0-HTz_Boss_Mappings
                dc.w    Offset_0x02FEFA-HTz_Boss_Mappings
                dc.w    Offset_0x02FF14-HTz_Boss_Mappings
                dc.w    Offset_0x02FF26-HTz_Boss_Mappings
                dc.w    Offset_0x02FF30-HTz_Boss_Mappings
                dc.w    Offset_0x02FF3A-HTz_Boss_Mappings
                dc.w    Offset_0x02FF44-HTz_Boss_Mappings
                dc.w    Offset_0x02FF4E-HTz_Boss_Mappings
                dc.w    Offset_0x02FF58-HTz_Boss_Mappings
Offset_0x02FE42:
                dc.w    $0008
                dc.l    $04052000, $2000FFE0, $14052004, $2002FFE0
                dc.l    $040F2008, $2004FFF0, $04072018, $200C0010
                dc.l    $F40D0060, $0030FFE0, $F40D0068, $00340000
                dc.l    $DC0A2070, $2038FFE8, $DC062079, $203C0000
Offset_0x02FE84:
                dc.w    $0001
                dc.l    $DF040083, $0041FFD8
Offset_0x02FE8E:
                dc.w    $0001
                dc.l    $DF040085, $0042FFD8
Offset_0x02FE98:
                dc.w    $0001
                dc.l    $DF080087, $0043FFD0
Offset_0x02FEA2:
                dc.w    $0002
                dc.l    $DF0C008A, $0045FFC0, $DF00008E, $0047FFE0
Offset_0x02FEB4:
                dc.w    $0002
                dc.l    $DF0C008F, $0047FFB0, $DF080093, $0049FFD0
Offset_0x02FEC6:
                dc.w    $0003
                dc.l    $DF0C0096, $004BFFA0, $DF0C009A, $004DFFC0
                dc.l    $DF00009E, $004FFFE0
Offset_0x02FEE0:
                dc.w    $0003
                dc.l    $DF0C009F, $004FFF90, $DF0C00A3, $0051FFB0
                dc.l    $DF0800A7, $0053FFD0
Offset_0x02FEFA:
                dc.w    $0003
                dc.l    $DF0C00AA, $0055FF88, $DF0C00AE, $0057FFA8
                dc.l    $DF0800B2, $0059FFC8
Offset_0x02FF14:
                dc.w    $0002
                dc.l    $DF0C00B5, $005AFF88, $DF0C00B9, $005CFFA8
Offset_0x02FF26:
                dc.w    $0001
                dc.l    $DF0C00BD, $005EFF88
Offset_0x02FF30:
                dc.w    $0001
                dc.l    $FC000061, $0030FFFC
Offset_0x02FF3A:
                dc.w    $0001
                dc.l    $FC000062, $0031FFFC
Offset_0x02FF44:
                dc.w    $0001
                dc.l    $F8050063, $0031FFF8
Offset_0x02FF4E:
                dc.w    $0001
                dc.l    $F8050067, $0033FFF8
Offset_0x02FF58:
                dc.w    $0007
                dc.l    $04052000, $2000FFE0, $14052004, $2002FFE0
                dc.l    $040F2008, $2004FFF0, $04072018, $200C0010
                dc.l    $F40D0060, $0030FFE0, $F40D0068, $00340000
                dc.l    $EC0C207F, $203FFFF0                         
;===============================================================================
; Objeto 0x52 - Robotnik na Hill Top
; [ Término ]
;===============================================================================  