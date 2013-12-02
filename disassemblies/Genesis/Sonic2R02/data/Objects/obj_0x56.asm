;===============================================================================
; Objeto 0x56 - Robotnik na Emerald Hill
; [ Início ]
;===============================================================================  
Offset_0x02EA7C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02EA8A(PC, D0), D1
                jmp     Offset_0x02EA8A(PC, D1)
Offset_0x02EA8A:
                dc.w    Offset_0x02EA9A-Offset_0x02EA8A
                dc.w    Offset_0x02EDD0-Offset_0x02EA8A
                dc.w    Offset_0x02F0C2-Offset_0x02EA8A
                dc.w    Offset_0x02F16E-Offset_0x02EA8A
                dc.w    Offset_0x02F1D8-Offset_0x02EA8A
                dc.w    Offset_0x02F36E-Offset_0x02EA8A
                dc.w    Offset_0x02F0A0-Offset_0x02EA8A
                dc.w    Offset_0x02F456-Offset_0x02EA8A
Offset_0x02EA9A:
                move.l  #EHz_Boss_Mappings_02, $0004(A0)       ; Offset_0x02F678
                move.w  #$23A0, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$81, $0028(A0)
                move.w  #$29D0, $0008(A0)
                move.w  #$0426, $000C(A0)
                move.b  #$20, $0019(A0)
                move.b  #$14, $0016(A0)
                move.b  #$04, $0018(A0)
                move.b  #$0F, $0020(A0)
                move.b  #$08, $0021(A0)
                addq.b  #$02, $0024(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0038(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x02EB4A
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  A1, $0034(A0)
                move.l  #EHz_Boss_Mappings_02, $0004(A1)       ; Offset_0x02F678
                move.w  #$03A0, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$04, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$0E, $0024(A1)
                move.b  #$01, $001C(A1)
                move.b  $0001(A0), $0001(A1)
Offset_0x02EB4A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02EB9A
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #EHz_Boss_Mappings_01, $0004(A1)       ; Offset_0x02F5D4
                move.w  #$0400, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$30, $0019(A1)
                move.b  #$10, $0016(A1)
                move.b  #$03, $0018(A1)
                move.w  #$2AF0, $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.b  #$06, $0024(A1)
Offset_0x02EB9A:
                bsr     Offset_0x02EC00
                subq.w  #$08, $0038(A0)
                move.w  #$2AF0, $0008(A0)
                move.w  #$02F8, $000C(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02EBFE
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #EHz_Boss_Mappings, $0004(A1)          ; Offset_0x02F4EC
                move.w  #$256C, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$40, $0019(A1)
                move.b  #$03, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                move.w  #$001E, $002A(A1)
                move.b  #$04, $0024(A1)
Offset_0x02EBFE:
                rts
Offset_0x02EC00:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02EC7A
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #EHz_Boss_Mappings_01, $0004(A1)       ; Offset_0x02F5D4
                move.w  #$2400, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$02, $0018(A1)
                move.b  #$10, $0016(A1)
                move.b  #$10, $0017(A1)
                move.w  #$2AF0, $0008(A1)
                move.l  $000C(A0), $000C(A1)
                addi.w  #$001C, $0008(A1)
                addi.w  #$000C, $000C(A1)
                move.b  #$08, $0024(A1)
                move.b  #$04, $001A(A1)
                move.b  #$01, $001C(A1)
                move.w  #$000A, $002A(A1)
                move.b  #$00, $0028(A1)
Offset_0x02EC7A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02ECF4
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #EHz_Boss_Mappings_01, $0004(A1)       ; Offset_0x02F5D4
                move.w  #$2400, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$02, $0018(A1)
                move.b  #$10, $0016(A1)
                move.b  #$10, $0017(A1)
                move.w  #$2AF0, $0008(A1)
                move.l  $000C(A0), $000C(A1)
                addi.w  #$FFF4, $0008(A1)
                addi.w  #$000C, $000C(A1)
                move.b  #$08, $0024(A1)
                move.b  #$04, $001A(A1)
                move.b  #$01, $001C(A1)
                move.w  #$000A, $002A(A1)
                move.b  #$01, $0028(A1)
Offset_0x02ECF4:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02ED6E
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #EHz_Boss_Mappings_01, $0004(A1)       ; Offset_0x02F5D4
                move.w  #$2400, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$03, $0018(A1)
                move.b  #$10, $0016(A1)
                move.b  #$10, $0017(A1)
                move.w  #$2AF0, $0008(A1)
                move.l  $000C(A0), $000C(A1)
                addi.w  #$FFD4, $0008(A1)
                addi.w  #$000C, $000C(A1)
                move.b  #$08, $0024(A1)
                move.b  #$06, $001A(A1)
                move.b  #$02, $001C(A1)
                move.w  #$000A, $002A(A1)
                move.b  #$02, $0028(A1)
Offset_0x02ED6E:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x02EDCE
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #EHz_Boss_Mappings_01, $0004(A1)       ; Offset_0x02F5D4
                move.w  #$2400, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$02, $0018(A1)
                move.w  #$2AF0, $0008(A1)
                move.l  $000C(A0), $000C(A1)
                addi.w  #$FFCA, $0008(A1)
                addq.w  #$08, $000C(A1)
                move.b  #$0A, $0024(A1)
                move.b  #$01, $001A(A1)
                move.b  #$00, $001C(A1)
Offset_0x02EDCE:
                rts
Offset_0x02EDD0:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02EDDE(PC, D0), D1
                jmp     Offset_0x02EDDE(PC, D1)
Offset_0x02EDDE:
                dc.w    Offset_0x02EDEA-Offset_0x02EDDE
                dc.w    Offset_0x02EE12-Offset_0x02EDDE
                dc.w    Offset_0x02EE6A-Offset_0x02EDDE
                dc.w    Offset_0x02EE9C-Offset_0x02EDDE
                dc.w    Offset_0x02EEDE-Offset_0x02EDDE
                dc.w    Offset_0x02EEF4-Offset_0x02EDDE
Offset_0x02EDEA:
                move.b  #$00, $0020(A0)
                cmpi.w  #$29D0, $0008(A0)
                ble.s   Offset_0x02EE04
                subq.w  #$01, $0008(A0)
                addq.w  #$01, $000C(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EE04:
                move.w  #$29D0, $0008(A0)
                addq.b  #$02, $0025(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EE12:
                moveq   #$00, D0
                move.b  $002C(A0), D0
                move.w  Offset_0x02EE20(PC, D0), D1
                jmp     Offset_0x02EE20(PC, D1)
Offset_0x02EE20:
                dc.w    Offset_0x02EE24-Offset_0x02EE20
                dc.w    Offset_0x02EE48-Offset_0x02EE20
Offset_0x02EE24:
                cmpi.w  #$041E, $000C(A0)
                bge.s   Offset_0x02EE34
                addq.w  #$01, $000C(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EE34:
                addq.b  #$02, $002C(A0)
                bset    #$00, $002D(A0)
                move.w  #$003C, $002A(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EE48:
                subq.w  #$01, $002A(A0)
                bpl     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                move.w  #$FE00, $0010(A0)
                addq.b  #$02, $0025(A0)
                move.b  #$0F, $0020(A0)
                bset    #$01, $002D(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EE6A:
                bsr     Offset_0x02F018
                bsr     Offset_0x02EFF6
                move.w  $002E(A0), D0
                lsr.w   #$01, D0
                subi.w  #$0014, D0
                move.w  D0, $000C(A0)
                move.w  #$0000, $002E(A0)
                move.l  $0008(A0), D2
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.l  D2, $0008(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EE9C:
                subq.w  #$01, $003C(A0)
                bmi.s   Offset_0x02EEC6
                bsr     Boss_Defeated                          ; Offset_0x02D278
                jsr     (ObjectFall)                           ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                add.w   D1, $000C(A0)
                move.w  #$0000, $0012(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EEC6:
                clr.w   $0010(A0)
                addq.b  #$02, $0025(A0)
                move.w  #$FFDA, $003C(A0)
                move.w  #$000C, $002A(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EEDE:
                subq.w  #$01, $002A(A0)
                bpl     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                addq.b  #$02, $0025(A0)
                move.b  #$00, $002C(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EEF4:
                moveq   #$00, D0
                move.b  $002C(A0), D0
                move.w  Offset_0x02EF06(PC, D0), D1
                jsr     Offset_0x02EF06(PC, D1)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02EF06:
                dc.w    Offset_0x02EF0C-Offset_0x02EF06
                dc.w    Offset_0x02EF94-Offset_0x02EF06
                dc.w    Offset_0x02EFB2-Offset_0x02EF06
Offset_0x02EF0C:
                bclr    #$00, $002D(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne     Offset_0x02EF92
                move.b  #$56, $0000(A1)    ; Nova instância do objeto na memória
                move.l  A0, $0034(A1)
                move.l  #EHz_Boss_Mappings, $0004(A1)          ; Offset_0x02F4EC
                move.w  #$256C, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$20, $0019(A1)
                move.b  #$03, $0018(A1)
                move.l  $0008(A0), $0008(A1)
                move.l  $000C(A0), $000C(A1)
                addi.w  #$000C, $000C(A1)
                move.b  $0022(A0), $0022(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$0C, $0024(A1)
                move.b  #$02, $001C(A1)
                move.w  #$0010, $002A(A1)
                move.w  #$0032, $002A(A0)
                addq.b  #$02, $002C(A0)
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
                move.b  #$01, ($FFFFF7A7).w
Offset_0x02EF92:
                rts
Offset_0x02EF94:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x02EFB0
                bset    #$02, $002D(A0)
                move.w  #$0060, $002A(A0)
                addq.b  #$02, $002C(A0)
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
Offset_0x02EFB0:
                rts
Offset_0x02EFB2:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x02EFCA
                bset    #$00, $0022(A0)
                bset    #$00, $0001(A0)
                addq.w  #$06, $0008(A0)
                bra.s   Offset_0x02EFCE
Offset_0x02EFCA:
                subq.w  #$01, $000C(A0)
Offset_0x02EFCE:
                cmpi.w  #$2AB0, ($FFFFEECA).w
                bcc.s   Offset_0x02EFDC
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x02EFF4
Offset_0x02EFDC:
                tst.b   $0001(A0)
                bmi.s   Offset_0x02EFF4
                addq.w  #$04, A7
                move.l  $0034(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02EFF4:
                rts
Offset_0x02EFF6:
                move.w  $0008(A0), D0
                cmpi.w  #$28A0, D0
                ble.s   Offset_0x02F006
                cmpi.w  #$2B08, D0
                blt.s   Offset_0x02F016
Offset_0x02F006:
                bchg    #00, $0022(A0)
                bchg    #00, $0001(A0)
                neg.w   $0010(A0)
Offset_0x02F016:
                rts
Offset_0x02F018:
                cmpi.b  #$06, $0025(A0)
                bcc.s   Offset_0x02F05E
                tst.b   $0022(A0)
                bmi.s   Offset_0x02F060
                tst.b   $0020(A0)
                bne.s   Offset_0x02F05E
                tst.b   $003E(A0)
                bne.s   Offset_0x02F042
                move.b  #$20, $003E(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02F042:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x02F050
                move.w  #$0EEE, D0
Offset_0x02F050:
                move.w  D0, (A1)
                subq.b  #$01, $003E(A0)
                bne.s   Offset_0x02F05E
                move.b  #$0F, $0020(A0)
Offset_0x02F05E:
                rts
Offset_0x02F060:
                moveq   #$64, D0
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.b  #$06, $0025(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$FE80, $0012(A0)
                move.w  #$00B3, $003C(A0)
                bset    #$03, $002D(A0)
                move.l  $0034(A0), A1
                move.b  #$04, $001C(A1)
                move.b  #$06, $001A(A1)
                moveq   #$40, D0
                jmp     (LoadPLC)                              ; Offset_0x0015DA
                rts
Offset_0x02F0A0:
                subq.w  #$01, $000C(A0)
                subq.w  #$01, $002A(A0)
                bpl     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                move.b  #$04, $0024(A0)
                lea     (EHz_Boss_Animate_Data), A1            ; Offset_0x02F4B2
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F0C2:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02F0D0(PC, D0), D1
                jmp     Offset_0x02F0D0(PC, D1)
Offset_0x02F0D0:
                dc.w    Offset_0x02F0D4-Offset_0x02F0D0
                dc.w    Offset_0x02F140-Offset_0x02F0D0
Offset_0x02F0D4:
                move.l  $0034(A0), A1
                cmpi.b  #$56, (A1)
                bne     Ehz_Boss_DeleteObject                  ; Offset_0x02F774
                btst    #$00, $002D(A1)
                beq.s   Offset_0x02F104
                move.b  #$01, $001C(A0)
                move.w  #$0018, $002A(A0)
                addq.b  #$02, $0025(A0)
                move.b  #$F8, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                bra.s   Offset_0x02F118
Offset_0x02F104:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x02F118
                move.b  #$DE, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02F118:
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                lea     (EHz_Boss_Animate_Data), A1            ; Offset_0x02F4B2
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F140:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x02F15E
                cmpi.w  #$FFF0, $002A(A0)
                ble     Ehz_Boss_DeleteObject                  ; Offset_0x02F774
                move.b  #$04, $0018(A0)
                addq.w  #$01, $000C(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F15E:
                lea     (EHz_Boss_Animate_Data), A1            ; Offset_0x02F4B2
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F16E:
                tst.b   $0025(A0)
                bne.s   Offset_0x02F19C
                cmpi.w  #$28F0, ($FFFFEEC8).w
                bcs     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                cmpi.w  #$29D0, $0008(A0)
                ble.s   Offset_0x02F18E
                subq.w  #$01, $0008(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F18E:
                move.w  #$29D0, $0008(A0)
                addq.b  #$02, $0025(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F19C:
                move.l  $0034(A0), A1
                btst    #$01, $002D(A1)
                beq     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                btst    #$02, $002D(A1)
                bne     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                addq.w  #$08, $000C(A0)
                move.b  $0022(A1), $0022(A0)
                bmi     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                move.b  $0001(A1), $0001(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F1D8:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x02F1E6(PC, D0), D1
                jmp     Offset_0x02F1E6(PC, D1)
Offset_0x02F1E6:
                dc.w    Offset_0x02F1F0-Offset_0x02F1E6
                dc.w    Offset_0x02F286-Offset_0x02F1E6
                dc.w    Offset_0x02F2B8-Offset_0x02F1E6
                dc.w    Offset_0x02F31C-Offset_0x02F1E6
                dc.w    Offset_0x02F346-Offset_0x02F1E6
Offset_0x02F1F0:
                cmpi.w  #$28F0, ($FFFFEEC8).w
                bcs     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                move.w  #$0100, $0012(A0)
                cmpi.b  #$01, $0028(A0)
                bgt.s   Offset_0x02F226
                beq.s   Offset_0x02F218
                cmpi.w  #$29EC, $0008(A0)
                ble.s   Offset_0x02F234
                subq.w  #$01, $0008(A0)
                bra.s   Offset_0x02F256
Offset_0x02F218:
                cmpi.w  #$29C4, $0008(A0)
                ble.s   Offset_0x02F240
                subq.w  #$01, $0008(A0)
                bra.s   Offset_0x02F256
Offset_0x02F226:
                cmpi.w  #$29A4, $0008(A0)
                ble.s   Offset_0x02F24C
                subq.w  #$01, $0008(A0)
                bra.s   Offset_0x02F256
Offset_0x02F234:
                move.w  #$29EC, $0008(A0)
                addq.b  #$02, $0025(A0)
                bra.s   Offset_0x02F256
Offset_0x02F240:
                move.w  #$29C4, $0008(A0)
                addq.b  #$02, $0025(A0)
                bra.s   Offset_0x02F256
Offset_0x02F24C:
                move.w  #$29A4, $0008(A0)
                addq.b  #$02, $0025(A0)
Offset_0x02F256:
                jsr     (ObjectFall)                           ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x02F26A
                add.w   D1, $000C(A0)
Offset_0x02F26A:
                tst.b   $0025(A0)
                beq.s   Offset_0x02F276
                move.w  #$FE00, $0010(A0)
Offset_0x02F276:
                lea     (EHz_Boss_Animate_Data_01), A1         ; Offset_0x02F5C0
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F286:
                move.l  $0034(A0), A1
                cmpi.b  #$56, (A1)
                bne     Ehz_Boss_DeleteObject                  ; Offset_0x02F774
                btst    #$01, $002D(A1)
                beq     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                addq.b  #$02, $0025(A0)
                cmpi.b  #$02, $0018(A0)
                bne.s   Offset_0x02F2B4
                move.w  $000C(A0), D0
                move.l  $0034(A0), A1
                add.w   D0, $002E(A1)
Offset_0x02F2B4:
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F2B8:
                move.l  $0034(A0), A1
                cmpi.b  #$56, (A1)
                bne     Ehz_Boss_DeleteObject                  ; Offset_0x02F774
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                tst.b   $0022(A0)
                bpl.s   Offset_0x02F2DA
                addq.b  #$02, $0025(A0)
Offset_0x02F2DA:
                bsr     Offset_0x02EFF6
                jsr     (ObjectFall)                           ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x02F2F2
                add.w   D1, $000C(A0)
Offset_0x02F2F2:
                move.w  #$0100, $0012(A0)
                cmpi.b  #$02, $0018(A0)
                bne.s   Offset_0x02F30C
                move.w  $000C(A0), D0
                move.l  $0034(A0), A1
                add.w   D0, $002E(A1)
Offset_0x02F30C:
                lea     (EHz_Boss_Animate_Data_01), A1         ; Offset_0x02F5C0
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F31C:
                subq.w  #$01, $002A(A0)
                bpl     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                addq.b  #$02, $0025(A0)
                move.w  #$000A, $002A(A0)
                move.w  #$FD00, $0012(A0)
                cmpi.b  #$02, $0018(A0)
                beq     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                neg.w   $0010(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F346:
                subq.w  #$01, $002A(A0)
                bpl     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                jsr     (ObjectFall)                           ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x02F368
                move.w  #$FE00, $0012(A0)
                add.w   D1, $000C(A0)
Offset_0x02F368:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02F36E:
                tst.b   $0025(A0)
                bne.s   Offset_0x02F39C
                cmpi.w  #$28F0, ($FFFFEEC8).w
                bcs     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                cmpi.w  #$299A, $0008(A0)
                ble.s   Offset_0x02F38E
                subq.w  #$01, $0008(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F38E:
                move.w  #$299A, $0008(A0)
                addq.b  #$02, $0025(A0)
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F39C:
                move.l  $0034(A0), A1
                cmpi.b  #$56, (A1)
                bne     Ehz_Boss_DeleteObject                  ; Offset_0x02F774
                btst    #$03, $002D(A1)
                bne.s   Offset_0x02F404
                bsr     Offset_0x02F426
                btst    #$01, $002D(A1)
                beq     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
                move.b  #$8B, $0020(A0)
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                addi.w  #$0010, $000C(A0)
                move.w  #$FFCA, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02F3F0
                neg.w   D0
Offset_0x02F3F0:
                add.w   D0, $0008(A0)
                lea     (EHz_Boss_Animate_Data_01), A1         ; Offset_0x02F5C0
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F404:
                move.w  #$FFFD, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02F412
                neg.w   D0
Offset_0x02F412:
                add.w   D0, $0008(A0)
                lea     (EHz_Boss_Animate_Data_01), A1         ; Offset_0x02F5C0
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Ehz_Boss_DisplaySprite                 ; Offset_0x02F77A
Offset_0x02F426:
                cmpi.b  #$01, $0021(A1)
                beq.s   Offset_0x02F430
                rts
Offset_0x02F430:
                move.w  $0008(A0), D0
                sub.w   ($FFFFB008).w, D0
                bpl.s   Offset_0x02F444
                btst    #$00, $0022(A1)
                bne.s   Offset_0x02F44E
                rts
Offset_0x02F444:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x02F44E
                rts
Offset_0x02F44E:
                bset    #$03, $002D(A1)
                rts
Offset_0x02F456:
                move.l  $0034(A0), A1
                move.l  $0008(A1), $0008(A0)
                move.l  $000C(A1), $000C(A0)
                move.b  $0022(A1), $0022(A0)
                move.b  $0001(A1), $0001(A0)
                move.b  $003E(A1), D0
                cmpi.b  #$1F, D0
                bne.s   Offset_0x02F482
                move.b  #$02, $001C(A0)
Offset_0x02F482:
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x02F492
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x02F4A0
Offset_0x02F492:
                cmpi.b  #$02, $001C(A0)
                beq.s   Offset_0x02F4A0
                move.b  #$03, $001C(A0)
Offset_0x02F4A0:
                lea     (EHz_Boss_Animate_Data_02), A1         ; Offset_0x02F644
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
EHz_Boss_Animate_Data: ; Offset_0x02F4B2:
                dc.w    Offset_0x02F4B8-EHz_Boss_Animate_Data
                dc.w    Offset_0x02F4BC-EHz_Boss_Animate_Data
                dc.w    Offset_0x02F4D2-EHz_Boss_Animate_Data
Offset_0x02F4B8:
                dc.b    $01, $05, $06, $FF
Offset_0x02F4BC:
                dc.b    $01, $01, $01, $01, $02, $02, $02, $03, $03, $03, $04, $04, $04, $00, $00, $00
                dc.b    $00, $00, $00, $00, $00, $FF
Offset_0x02F4D2:
                dc.b    $01, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $03, $03, $03, $02
                dc.b    $02, $02, $01, $01, $01, $05, $06, $FE, $02, $00
;-------------------------------------------------------------------------------
EHz_Boss_Mappings: ; Offset_0x02F4EC:
                dc.w    Offset_0x02F4FA-EHz_Boss_Mappings
                dc.w    Offset_0x02F504-EHz_Boss_Mappings                       
                dc.w    Offset_0x02F52E-EHz_Boss_Mappings
                dc.w    Offset_0x02F558-EHz_Boss_Mappings                       
                dc.w    Offset_0x02F572-EHz_Boss_Mappings
                dc.w    Offset_0x02F58C-EHz_Boss_Mappings                       
                dc.w    Offset_0x02F5A6-EHz_Boss_Mappings
Offset_0x02F4FA:
                dc.w    $0001
                dc.l    $D8050000, $00000002
Offset_0x02F504:
                dc.w    $0005
                dc.l    $D8050004, $00020002, $D80D000C, $00060012
                dc.l    $D80D000C, $00060032, $D80D000C, $0006FFE2
                dc.l    $D80D000C, $0006FFC2
Offset_0x02F52E:
                dc.w    $0005
                dc.l    $D8050004, $00020002, $D80D000C, $00060012
                dc.l    $D8050008, $00040032, $D80D000C, $0006FFE2
                dc.l    $D8050008, $0004FFD2
Offset_0x02F558:
                dc.w    $0003
                dc.l    $D8050004, $00020002, $D80D000C, $00060012
                dc.l    $D80D000C, $0006FFE2
Offset_0x02F572:
                dc.w    $0003
                dc.l    $D8050004, $00020002, $D8050008, $00040012
                dc.l    $D8050008, $0004FFF2
Offset_0x02F58C:
                dc.w    $0003
                dc.l    $D8050000, $00000002, $D80D000C, $00060012
                dc.l    $D80D000C, $00060032
Offset_0x02F5A6:
                dc.w    $0003
                dc.l    $D8050004, $00020002, $D80D000C, $0006FFE2
                dc.l    $D80D000C, $0006FFC2
;-------------------------------------------------------------------------------
EHz_Boss_Animate_Data_01: ; Offset_0x02F5C0:
                dc.w    Offset_0x02F5C6-EHz_Boss_Animate_Data_01
                dc.w    Offset_0x02F5CC-EHz_Boss_Animate_Data_01
                dc.w    Offset_0x02F5D0-EHz_Boss_Animate_Data_01
Offset_0x02F5C6:
                dc.b    $05, $01, $02, $03, $FF, $00
Offset_0x02F5CC:
                dc.b    $01, $04, $05, $FF
Offset_0x02F5D0:
                dc.b    $01, $06, $07, $FF                
;-------------------------------------------------------------------------------
EHz_Boss_Mappings_01: ; Offset_0x02F5D4:
                dc.w    Offset_0x02F5E4-EHz_Boss_Mappings_01
                dc.w    Offset_0x02F5FE-EHz_Boss_Mappings_01
                dc.w    Offset_0x02F608-EHz_Boss_Mappings_01
                dc.w    Offset_0x02F612-EHz_Boss_Mappings_01
                dc.w    Offset_0x02F61C-EHz_Boss_Mappings_01
                dc.w    Offset_0x02F626-EHz_Boss_Mappings_01
                dc.w    Offset_0x02F630-EHz_Boss_Mappings_01
                dc.w    Offset_0x02F63A-EHz_Boss_Mappings_01
Offset_0x02F5E4:
                dc.w    $0003
                dc.l    $F00F0000, $0000FFD0, $F00F0010, $0008FFF0
                dc.l    $F00F0020, $00100010
Offset_0x02F5FE:
                dc.w    $0001
                dc.l    $F00F0030, $0018FFF0
Offset_0x02F608:
                dc.w    $0001
                dc.l    $F00F0040, $0020FFF0
Offset_0x02F612:
                dc.w    $0001
                dc.l    $F00F0050, $0028FFF0
Offset_0x02F61C:
                dc.w    $0001
                dc.l    $F00F0060, $0030FFF0
Offset_0x02F626:
                dc.w    $0001
                dc.l    $F00F1060, $1030FFF0
Offset_0x02F630:
                dc.w    $0001
                dc.l    $F00F0070, $0038FFF0
Offset_0x02F63A:
                dc.w    $0001
                dc.l    $F00F1070, $1038FFF0                               
;-------------------------------------------------------------------------------
EHz_Boss_Animate_Data_02: ; Offset_0x02F644:
                dc.w    Offset_0x02F64E-EHz_Boss_Animate_Data_02
                dc.w    Offset_0x02F652-EHz_Boss_Animate_Data_02
                dc.w    Offset_0x02F656-EHz_Boss_Animate_Data_02
                dc.w    Offset_0x02F660-EHz_Boss_Animate_Data_02
                dc.w    Offset_0x02F66A-EHz_Boss_Animate_Data_02
Offset_0x02F64E:
                dc.b    $0F, $00, $FF, $00
Offset_0x02F652:
                dc.b    $07, $01, $02, $FF
Offset_0x02F656:
                dc.b    $07, $05, $05, $05, $05, $05, $05, $FD, $01, $00
Offset_0x02F660:
                dc.b    $07, $03, $04, $03, $04, $03, $04, $FD, $01, $00
Offset_0x02F66A:
                dc.b    $0F, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $FD, $01, $00                                                
;-------------------------------------------------------------------------------
EHz_Boss_Mappings_02: ; Offset_0x02F678:
                dc.w    Offset_0x02F686-EHz_Boss_Mappings_02
                dc.w    Offset_0x02F6A8-EHz_Boss_Mappings_02
                dc.w    Offset_0x02F6CA-EHz_Boss_Mappings_02
                dc.w    Offset_0x02F6EC-EHz_Boss_Mappings_02
                dc.w    Offset_0x02F70E-EHz_Boss_Mappings_02
                dc.w    Offset_0x02F730-EHz_Boss_Mappings_02
                dc.w    Offset_0x02F752-EHz_Boss_Mappings_02
Offset_0x02F686:
                dc.w    $0004
                dc.l    $F8050000, $0000FFE0, $08050004, $0002FFE0
                dc.l    $F80F0008, $0004FFF0, $F8070018, $000C0010
Offset_0x02F6A8:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0030, $0018FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02F6CA:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0038, $001CFFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02F6EC:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0040, $0020FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02F70E:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0048, $0024FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02F730:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0050, $0028FFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
Offset_0x02F752:
                dc.w    $0004
                dc.l    $E8050028, $0014FFE0, $E80D0058, $002CFFF0
                dc.l    $E8050024, $00120010, $D8050020, $00100002
;-------------------------------------------------------------------------------
Ehz_Boss_DeleteObject: ; Offset_0x02F774:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Ehz_Boss_DisplaySprite: ;  Offset_0x02F77A:
                jmp     (DisplaySprite)                        ; Offset_0x01647A                                                                                  
;===============================================================================
; Objeto 0x56 - Robotnik na Emerald Hill
; [ Término ]
;===============================================================================  