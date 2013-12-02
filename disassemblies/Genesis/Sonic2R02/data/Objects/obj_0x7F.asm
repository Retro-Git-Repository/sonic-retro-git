;===============================================================================
; Objeto 0x7F - Raízes usadas como interruptores para levantar as pontes na
; [ Início ]    Mystic Cave
;===============================================================================  
Offset_0x0294C4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0294D2(PC, D0), D1
                jmp     Offset_0x0294D2(PC, D1)
Offset_0x0294D2:
                dc.w    Offset_0x0294D6-Offset_0x0294D2
                dc.w    Offset_0x029500-Offset_0x0294D2
Offset_0x0294D6:
                addq.b  #$02, $0024(A0)
                move.l  #Vines_Switch_Mappings, $0004(A0)      ; Offset_0x02961C
                move.w  #$640E, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$08, $0019(A0)
                move.b  #$04, $0018(A0)
Offset_0x029500:
                lea     $0030(A0), A2
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF604).w, D0
                bsr.s   Offset_0x029520
                lea     ($FFFFB040).w, A1
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D0
                bsr.s   Offset_0x029520
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x029520:
                tst.b   (A2)
                beq.s   Offset_0x029574
                andi.b  #$70, D0
                beq     Offset_0x02961A
                clr.b   $002A(A1)
                clr.b   (A2)
                move.b  #$12, $0002(A2)
                andi.w  #$0F00, D0
                beq.s   Offset_0x029544
                move.b  #$3C, $0002(A2)
Offset_0x029544:
                move.w  #$FD00, $0012(A1)
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                lea     ($FFFFF7E0).w, A3
                lea     $00(A3, D0), A3
                bclr    #$00, (A3)
                move.b  #$00, $001A(A0)
                tst.w   $0030(A0)
                beq.s   Offset_0x029570
                move.b  #$01, $001A(A0)
Offset_0x029570:
                bra     Offset_0x02961A
Offset_0x029574:
                tst.b   $0002(A2)
                beq.s   Offset_0x029582
                subq.b  #$01, $0002(A2)
                bne     Offset_0x02961A
Offset_0x029582:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$000C, D0
                cmpi.w  #$0018, D0
                bcc     Offset_0x02961A
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                subi.w  #$0028, D1
                cmpi.w  #$0010, D1
                bcc     Offset_0x02961A
                tst.b   $002A(A1)
                bmi.s   Offset_0x02961A
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x02961A
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x02961A
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                clr.w   $0014(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0030, $000C(A1)
                move.b  #$14, $001C(A1)
                move.b  #$01, $002A(A1)
                move.b  #$01, (A2)
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                lea     ($FFFFF7E0).w, A3
                bset    #$00, $00(A3, D0)
                move.w  #Switch_Pressed_Sfx, D0 ; $00CD
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.b  #$00, $001A(A0)
                tst.w   $0030(A0)
                beq.s   Offset_0x02961A
                move.b  #$01, $001A(A0)
Offset_0x02961A:
                rts
;-------------------------------------------------------------------------------
Vines_Switch_Mappings: ; Offset_0x02961C:
                dc.w    Offset_0x029620-Vines_Switch_Mappings
                dc.w    Offset_0x02963A-Vines_Switch_Mappings
Offset_0x029620:
                dc.w    $0003
                dc.l    $D0070000, $0000FFF8, $F0070000, $0000FFF8
                dc.l    $10070008, $0004FFF8
Offset_0x02963A:
                dc.w    $0003
                dc.l    $D4070000, $0000FFF8, $F4070000, $0000FFF8
                dc.l    $14070008, $0004FFF8
;===============================================================================
; Objeto 0x7F - Raízes usadas como interruptores para levantar as pontes na
; [ Término ]   Mystic Cave
;===============================================================================  