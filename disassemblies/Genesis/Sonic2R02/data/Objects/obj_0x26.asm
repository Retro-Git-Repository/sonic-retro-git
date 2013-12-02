;===============================================================================
; Objeto 0x26 - Monitores
; [ Início ]
;===============================================================================    
Offset_0x01260A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x012618(PC, D0), D1
                jmp     Offset_0x012618(PC, D1)
Offset_0x012618:
                dc.w    Offset_0x012622-Offset_0x012618
                dc.w    Offset_0x012694-Offset_0x012618
                dc.w    Offset_0x012756-Offset_0x012618
                dc.w    Offset_0x0126E2-Offset_0x012618
                dc.w    Offset_0x0126EC-Offset_0x012618
Offset_0x012622:
                addq.b  #$02, $0024(A0)
                move.b  #$0E, $0016(A0)
                move.b  #$0E, $0017(A0)
                move.l  #Monitors_Mappings, $0004(A0)          ; Offset_0x012CD0
                move.w  #$0680, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$0F, $0019(A0)
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                bclr    #$07, $02(A2, D0)
                btst    #$00, $02(A2, D0)
                beq.s   Offset_0x01267C
                move.b  #$08, $0024(A0)
                move.b  #$0B, $001A(A0)
                rts
Offset_0x01267C:
                move.b  #$46, $0020(A0)
                move.b  $0028(A0), $001C(A0)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x012694
                move.b  #$09, $001C(A0)
Offset_0x012694:
                move.b  $0025(A0), D0
                beq.s   Offset_0x0126B6
                bsr     ObjectFall                             ; Offset_0x016306
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl     Offset_0x0126B6
                add.w   D1, $000C(A0)
                clr.w   $0012(A0)
                clr.b   $0025(A0)
Offset_0x0126B6:
                move.w  #$001A, D1
                move.w  #$000F, D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     Offset_0x0126F0
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                bsr     Offset_0x012702
Offset_0x0126E2:
                lea     (Monitors_AnimateData), A1             ; Offset_0x012C68
                bsr     AnimateSprite                          ; Offset_0x0164CA
Offset_0x0126EC:
                bra     MarkObjGone                            ; Offset_0x016358
Offset_0x0126F0:
                btst    D6, $0022(A0)
                bne.s   Offset_0x01271C
                cmpi.b  #$02, $001C(A1)
                bne     Solid_Object_Monitors                  ; Offset_0x01995E
                rts
Offset_0x012702:
                btst    D6, $0022(A0)
                bne.s   Offset_0x01271C
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq     Solid_Object_Monitors                  ; Offset_0x01995E
                cmpi.b  #$02, $001C(A1)
                bne     Solid_Object_Monitors                  ; Offset_0x01995E
                rts
Offset_0x01271C:
                move.w  D1, D2
                add.w   D2, D2
                btst    #$01, $0022(A1)
                bne.s   Offset_0x012738
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                add.w   D1, D0
                bmi.s   Offset_0x012738
                cmp.w   D2, D0
                bcs.s   Offset_0x01274C
Offset_0x012738:
                bclr    #$03, $0022(A1)
                bset    #$01, $0022(A1)
                bclr    D6, $0022(A0)
                moveq   #$00, D4
                rts
Offset_0x01274C:
                move.w  D4, D2
                bsr     Player_On_Platform                     ; Offset_0x019B00
                moveq   #$00, D4
                rts
Offset_0x012756:
                move.b  $0022(A0), D0
                andi.b  #$78, D0
                beq.s   Offset_0x012786
                move.b  D0, D1
                andi.b  #$28, D1
                beq.s   Offset_0x012774
                andi.b  #$D7, ($FFFFB022).w
                ori.b   #$02, ($FFFFB022).w
Offset_0x012774:
                andi.b  #$50, D0
                beq.s   Offset_0x012786
                andi.b  #$D7, ($FFFFB062).w
                ori.b   #$02, ($FFFFB062).w
Offset_0x012786:
                clr.b   $0022(A0)
                addq.b  #$02, $0024(A0)
                move.b  #$00, $0020(A0)
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x0127B8
                move.b  #$2E, $0000(A1)      ; Carrega o objeto 0x2E - contéudo dos monitores
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  $001C(A0), $001C(A1)
                move.w  $003E(A0), $003E(A1)
Offset_0x0127B8:
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x0127D4
                move.b  #$27, $0000(A1)      ; Carrega o objeto 0x27 - resposta ao toque dos objetos
                addq.b  #$02, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
Offset_0x0127D4:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                bset    #$00, $02(A2, D0)
                move.b  #$0A, $001C(A0)
                bra     DisplaySprite                          ; Offset_0x01647A              
;===============================================================================
; Objeto 0x26 - Monitores
; [ Término ]
;===============================================================================  