;===============================================================================
; Objeto 0x02 - Miles / Tails
; [ Início ]
;===============================================================================  
Offset_0x01B81E:
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x01B838
                move.w  ($FFFFEEC8).w, ($FFFFEEF8).w
                move.w  ($FFFFEECA).w, ($FFFFEEFA).w
                move.w  ($FFFFEECE).w, ($FFFFEEFE).w
Offset_0x01B838:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Miles_Index(PC, D0), D1                ; Offset_0x01B846
                jmp     Miles_Index(PC, D1)                    ; Offset_0x01B846
Miles_Index: ; Offset_0x01B846:
                dc.w    Miles_Main-Miles_Index                 ; Offset_0x01B852
                dc.w    Miles_Control-Miles_Index              ; Offset_0x01B92E
                dc.w    Miles_Hurt-Miles_Index                 ; Offset_0x01CB42
                dc.w    Miles_Death-Miles_Index                ; Offset_0x01CBCC
                dc.w    Miles_ResetLevel-Miles_Index           ; Offset_0x01CD0C
                dc.w    Miles_Respawning-Miles_Index           ; Offset_0x01CD20
;===============================================================================
; Sub Rotina Miles_Main
; [ Início ]
;===============================================================================                  
Miles_Main: ; Offset_0x01B852:
                addq.b  #$02, $0024(A0)
                move.b  #$0F, $0016(A0)
                move.b  #$09, $0017(A0)
                move.l  #Miles_Mappings, $0004(A0)             ; Offset_0x0739E2
                move.b  #$02, $0018(A0)
                move.b  #$18, $0019(A0)
                move.b  #$84, $0001(A0)
                move.w  #$0600, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$000C, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0080, (Miles_Deceleration).w               ; $FFFFFEC4
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x01B8CC
                tst.b   ($FFFFFE30).w
                bne.s   Offset_0x01B8E8
                move.w  #$07A0, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$0C, $003E(A0)
                move.b  #$0D, $003F(A0)
                move.w  $0008(A0), ($FFFFFE32).w
                move.w  $000C(A0), ($FFFFFE34).w
                move.w  $0002(A0), ($FFFFFE3C).w
                move.w  $003E(A0), ($FFFFFE3E).w
                bra.s   Offset_0x01B8E8
Offset_0x01B8CC:
                move.w  #$07A0, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.w  ($FFFFB03E).w, $003E(A0)
                tst.w   ($FFFFB002).w
                bpl.s   Offset_0x01B8E8
                ori.w   #$8000, $0002(A0)
Offset_0x01B8E8:
                move.w  $0008(A0), ($FFFFFEE2).w
                move.w  $000C(A0), ($FFFFFEE4).w
                move.w  $0002(A0), ($FFFFFEEC).w
                move.w  $003E(A0), ($FFFFFEEE).w
                move.b  #$00, $002C(A0)
                move.b  #$04, $002D(A0)
                move.b  #$1E, $0028(A0)
                move.w  #$0000, ($FFFFF708).w
                move.w  #$0000, ($FFFFF702).w
                move.w  #$0000, ($FFFFF704).w
                move.b  #$05, ($FFFFD000).w
                move.w  A0, ($FFFFD03E).w
;===============================================================================
; Sub Rotina Miles_Main
; [ Término ]
;===============================================================================                  
                
;===============================================================================
; Sub Rotina Miles_Control
; [ Início ]
;===============================================================================                   
Miles_Control: ; Offset_0x01B92E:
                cmpa.w  #$B000, A0
                bne.s   Offset_0x01B94E
                move.w  ($FFFFF602).w, ($FFFFF66A).w
                tst.b   ($FFFFF7CC).w
                bne.s   Offset_0x01B964
                move.w  ($FFFFF604).w, ($FFFFF66A).w
                move.w  ($FFFFF604).w, ($FFFFF602).w
                bra.s   Offset_0x01B964
Offset_0x01B94E:
                tst.b   ($FFFFF7CF).w
                bne.s   Offset_0x01B95A
                move.w  ($FFFFF606).w, ($FFFFF66A).w
Offset_0x01B95A:
                tst.w   ($FFFFFFB8).w
                bne.s   Offset_0x01B964
                bsr     Offset_0x01BA4E
Offset_0x01B964:
                btst    #$00, $002A(A0)
                bne.s   Miles_ControlsLock                     ; Offset_0x01B97E
                moveq   #$00, D0
                move.b  $0022(A0), D0
                andi.w  #$0006, D0
                move.w  Miles_Modes(PC, D0), D1                ; Offset_0x01B9C8
                jsr     Miles_Modes(PC, D1)                    ; Offset_0x01B9C8
Miles_ControlsLock: ; Offset_0x01B97E:
                cmpi.w  #$FF00, ($FFFFEECC).w
                bne.s   Offset_0x01B98C
                andi.w  #$07FF, $000C(A0)
Offset_0x01B98C:
                bsr.s   Miles_Display                          ; Offset_0x01B9D0
                bsr     Miles_RecordMoves                      ; Offset_0x01BEB2
                bsr     Miles_Water                            ; Offset_0x01BECC
                move.b  ($FFFFF768).w, $0036(A0)
                move.b  ($FFFFF76A).w, $0037(A0)
                tst.b   ($FFFFF7C7).w
                beq.s   Offset_0x01B9B4
                tst.b   $001C(A0)
                bne.s   Offset_0x01B9B4
                move.b  $001D(A0), $001C(A0)
Offset_0x01B9B4:
                bsr     Miles_Animate                          ; Offset_0x01CD40
                tst.b   $002A(A0)
                bmi.s   Offset_0x01B9C4
                jsr     (TouchResponse)                        ; Offset_0x03F2BC
Offset_0x01B9C4:
                bra     Load_Miles_Dynamic_PLC                 ; Offset_0x01D138 
Miles_Modes: ; Offset_0x01B9C8:
                dc.w    Miles_MdNormal-Miles_Modes             ; Offset_0x01BF84
                dc.w    Miles_MdJump-Miles_Modes               ; Offset_0x01BFAC
                dc.w    Miles_MdRoll-Miles_Modes               ; Offset_0x01BFD6
                dc.w    Miles_MdJump2-Miles_Modes              ; Offset_0x01BFFC
;===============================================================================
; Sub Rotina Miles_Control
; [ Término ]
;===============================================================================  
                
;=============================================================================== 
; Sub Rotina Miles_Display
; [ Início ]                         
;===============================================================================                  
Miles_Display: ; Offset_0x01B9D0:
                move.w  $0030(A0), D0
                beq.s   Offset_0x01B9DE
                subq.w  #$01, $0030(A0)
                lsr.w   #$03, D0
                bcc.s   Offset_0x01B9E4
Offset_0x01B9DE:
                jsr     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01B9E4:
                btst    #$01, $002B(A0)
                beq.s   Offset_0x01BA16
                tst.w   $0032(A0)
                beq.s   Offset_0x01BA16
                subq.w  #$01, $0032(A0)
                bne.s   Offset_0x01BA16
                tst.b   ($FFFFF7AA).w
                bne.s   Offset_0x01BA10
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01BA10
                move.w  (Level_Music_Buffer).w, D0                   ; $FFFFFF70
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x01BA10:
                bclr    #$01, $002B(A0)
Offset_0x01BA16:
                btst    #$02, $002B(A0)
                beq.s   Offset_0x01BA4C
                tst.w   $0034(A0)
                beq.s   Offset_0x01BA4C
                subq.w  #$01, $0034(A0)
                bne.s   Offset_0x01BA4C
                move.w  #$0600, ($FFFFFEC0).w
                move.w  #$000C, ($FFFFFEC2).w
                move.w  #$0080, ($FFFFFEC4).w
                bclr    #$02, $002B(A0)
                move.w  #Normal_Sound, D0       ; $00FC
                jmp     (Play_Music)                           ; Offset_0x00131A
Offset_0x01BA4C:
                rts
;=============================================================================== 
; Sub Rotina Miles_Display
; [ Término ]                         
;===============================================================================                 
Offset_0x01BA4E:
                move.b  ($FFFFF606).w, D0
                andi.b  #$7F, D0
                beq.s   Offset_0x01BA5E
                move.w  #$0258, ($FFFFF702).w
Offset_0x01BA5E:
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF708).w, D0
                move.w  Offset_0x01BA6E(PC, D0), D0
                jmp     Offset_0x01BA6E(PC, D0)
Offset_0x01BA6E:
                dc.w    Offset_0x01BA78-Offset_0x01BA6E
                dc.w    Offset_0x01BAAA-Offset_0x01BA6E
                dc.w    Offset_0x01BB04-Offset_0x01BA6E
                dc.w    Offset_0x01BC5A-Offset_0x01BA6E
                dc.w    Offset_0x01BE32-Offset_0x01BA6E
Offset_0x01BA78:                                              
                move.w  #$0006, ($FFFFF708).w
                move.b  #$00, $002A(A0)
                move.b  #$00, $001C(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                move.w  #$0000, $0014(A0)
                move.b  #$00, $0022(A0)
                move.w  #$0000, ($FFFFF704).w
                rts
Offset_0x01BAAA:                
                move.b  ($FFFFF66A).w, D0
                andi.b  #$F0, D0
                bne.s   Offset_0x01BACE
                move.w  ($FFFFFE04).w, D0
                andi.w  #$003F, D0
                bne.s   Offset_0x01BB02
                tst.b   $002A(A1)
                bne.s   Offset_0x01BB02
                move.b  $0022(A1), D0
                andi.b  #$D2, D0
                bne.s   Offset_0x01BB02
Offset_0x01BACE:
                move.w  #$0004, ($FFFFF708).w
                move.w  $0008(A1), D0
                move.w  D0, $0008(A0)
                move.w  D0, ($FFFFF70A).w
                move.w  $000C(A1), D0
                move.w  D0, ($FFFFF70C).w
                subi.w  #$00C0, D0
                move.w  D0, $000C(A0)
                ori.w   #$8000, $0002(A0)
                move.b  #$00, $0039(A0)
                move.w  #$0000, $003A(A0)
Offset_0x01BB02:
                rts
Offset_0x01BB04:                
                tst.b   $0001(A0)
                bmi.s   Offset_0x01BB42
                addq.w  #$01, ($FFFFF704).w
                cmpi.w  #$012C, ($FFFFF704).w
                bcs.s   Offset_0x01BB48
                move.w  #$0000, ($FFFFF704).w
                move.w  #$0002, ($FFFFF708).w
                move.b  #$81, $002A(A0)
                move.b  #$02, $0022(A0)
                move.w  #$0000, $0008(A0)
                move.w  #$0000, $000C(A0)
                move.b  #$20, $001C(A0)
                rts
Offset_0x01BB42:
                move.w  #$0000, ($FFFFF704).w
Offset_0x01BB48:
                lea     ($FFFFE500).w, A2
                move.w  #$0010, D2
                lsl.b   #$02, D2
                addq.b  #$04, D2
                move.w  ($FFFFEED2).w, D3
                sub.b   D2, D3
                move.w  $00(A2, D3), ($FFFFF70A).w
                move.w  $02(A2, D3), ($FFFFF70C).w
                tst.b   ($FFFFF730).w
                beq.s   Offset_0x01BB7E
                move.w  ($FFFFF646).w, D0
                subi.w  #$0010, D0
                cmp.w   ($FFFFF70C).w, D0
                bge.s   Offset_0x01BB7E
                move.w  D0, ($FFFFF70C).w
Offset_0x01BB7E:
                move.w  $0008(A0), D0
                sub.w   ($FFFFF70A).w, D0
                beq.s   Offset_0x01BBCE
                move.w  D0, D2
                bpl.s   Offset_0x01BB8E
                neg.w   D2
Offset_0x01BB8E:
                lsr.w   #$04, D2
                cmpi.w  #$000C, D2
                bcs.s   Offset_0x01BB98
                moveq   #$0C, D2
Offset_0x01BB98:
                move.b  $0010(A1), D1
                bpl.s   Offset_0x01BBA0
                neg.b   D1
Offset_0x01BBA0:
                add.b   D1, D2
                addq.w  #$01, D2
                tst.w   D0
                bmi.s   Offset_0x01BBBA
                bset    #$00, $0022(A0)
                cmp.w   D0, D2
                bcs.s   Offset_0x01BBB6
                move.w  D0, D2
                moveq   #$00, D0
Offset_0x01BBB6:
                neg.w   D2
                bra.s   Offset_0x01BBCA
Offset_0x01BBBA:
                bclr    #$00, $0022(A0)
                neg.w   D0
                cmp.w   D0, D2
                bcs.s   Offset_0x01BBCA
                move.b  D0, D2
                moveq   #$00, D0
Offset_0x01BBCA:
                add.w   D2, $0008(A0)
Offset_0x01BBCE:
                moveq   #$01, D2
                move.w  $000C(A0), D1
                sub.w   ($FFFFF70C).w, D1
                beq.s   Offset_0x01BBE2
                bmi.s   Offset_0x01BBDE
                neg.w   D2
Offset_0x01BBDE:
                add.w   D2, $000C(A0)
Offset_0x01BBE2:
                lea     ($FFFFE400).w, A2
                move.b  $02(A2, D3), D2
                andi.b  #$D2, D2
                bne.s   Offset_0x01BC58
                or.w    D0, D1
                bne.s   Offset_0x01BC58
                move.w  #$0006, ($FFFFF708).w
                move.b  #$00, $002A(A0)
                move.b  #$00, $001C(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                move.w  #$0000, $0014(A0)
                move.b  #$02, $0022(A0)
                move.w  #$0000, $002E(A0)
                andi.w  #$7FFF, $0002(A0)
                tst.b   $0002(A1)
                bpl.s   Offset_0x01BC36
                ori.w   #$8000, $0002(A0)
Offset_0x01BC36:
                move.b  $003E(A1), $003E(A0)
                move.b  $003F(A1), $003F(A0)
                cmpi.b  #$09, $001C(A1)
                beq.s   Offset_0x01BC58
                move.b  $0039(A0), D0
                beq.s   Offset_0x01BC58
                move.b  D0, $0039(A1)
                bsr     Offset_0x021208
Offset_0x01BC58:
                rts
Offset_0x01BC5A:                
                cmpi.b  #$06, ($FFFFB024).w
                bcs.s   Offset_0x01BC88
                move.w  #$0004, ($FFFFF708).w
                move.b  #$00, $0039(A0)
                move.w  #$0000, $003A(A0)
                move.b  #$81, $002A(A0)
                move.b  #$02, $0022(A0)
                move.b  #$20, $001C(A0)
                rts
Offset_0x01BC88:
                bsr     Offset_0x01BDE0
                tst.w   ($FFFFF702).w
                bne     Offset_0x01BDA2
                tst.b   $002A(A0)
                bmi     Offset_0x01BDA2
                tst.w   $002E(A0)
                beq.s   Offset_0x01BCAE
                tst.w   $0014(A0)
                bne.s   Offset_0x01BCAE
                move.w  #$0008, ($FFFFF708).w
Offset_0x01BCAE:
                lea     ($FFFFE500).w, A1
                move.w  #$0010, D1
                lsl.b   #$02, D1
                addq.b  #$04, D1
                move.w  ($FFFFEED2).w, D0
                sub.b   D1, D0
                move.w  $00(A1, D0), D2
                move.w  $02(A1, D0), D3
                lea     ($FFFFE400).w, A1
                move.w  $00(A1, D0), D1
                move.b  $02(A1, D0), D4
                move.w  D1, D0
                btst    #$05, $0022(A0)
                beq.s   Offset_0x01BCE6
                btst    #$05, D4
                beq     Offset_0x01BD80
Offset_0x01BCE6:
                sub.w   $0008(A0), D2
                beq.s   Offset_0x01BD34
                bpl.s   Offset_0x01BD12
                neg.w   D2
                cmpi.w  #$0010, D2
                bcs.s   Offset_0x01BCFE
                andi.w  #$F3F3, D1
                ori.w   #$0404, D1
Offset_0x01BCFE:
                tst.w   $0014(A0)
                beq.s   Offset_0x01BD48
                btst    #$00, $0022(A0)
                beq.s   Offset_0x01BD48
                subq.w  #$01, $0008(A0)
                bra.s   Offset_0x01BD48
Offset_0x01BD12:
                cmpi.w  #$0010, D2
                bcs.s   Offset_0x01BD20
                andi.w  #$F3F3, D1
                ori.w   #$0808, D1
Offset_0x01BD20:
                tst.w   $0014(A0)
                beq.s   Offset_0x01BD48
                btst    #$00, $0022(A0)
                bne.s   Offset_0x01BD48
                addq.w  #$01, $0008(A0)
                bra.s   Offset_0x01BD48
Offset_0x01BD34:
                bclr    #$00, $0022(A0)
                move.b  D4, D0
                andi.b  #$01, D0
                beq.s   Offset_0x01BD48
                bset    #$00, $0022(A0)
Offset_0x01BD48:
                tst.b   ($FFFFF70F).w
                beq.s   Offset_0x01BD60
                ori.w   #$7000, D1
                btst    #$01, $0022(A0)
                bne.s   Offset_0x01BD9C
                move.b  #$00, ($FFFFF70F).w
Offset_0x01BD60:
                move.w  ($FFFFFE04).w, D0
                andi.w  #$00FF, D0
                beq.s   Offset_0x01BD70
                cmpi.w  #$0040, D2
                bcc.s   Offset_0x01BD9C
Offset_0x01BD70:
                sub.w   $000C(A0), D3
                beq.s   Offset_0x01BD9C
                bpl.s   Offset_0x01BD9C
                neg.w   D3
                cmpi.w  #$0020, D3
                bcs.s   Offset_0x01BD9C
Offset_0x01BD80:
                move.b  ($FFFFFE05).w, D0
                andi.b  #$3F, D0
                bne.s   Offset_0x01BD9C
                cmpi.b  #$08, $001C(A0)
                beq.s   Offset_0x01BD9C
                ori.w   #$7070, D1
                move.b  #$01, ($FFFFF70F).w
Offset_0x01BD9C:
                move.w  D1, ($FFFFF66A).w
                rts
Offset_0x01BDA2:
                tst.w   ($FFFFF702).w
                beq.s   Offset_0x01BDAC
                subq.w  #$01, ($FFFFF702).w
Offset_0x01BDAC:
                rts
Offset_0x01BDAE:
                move.w  #$0000, ($FFFFF702).w
                move.w  #$0000, ($FFFFF704).w
                move.w  #$0002, ($FFFFF708).w
                move.b  #$81, $002A(A0)
                move.b  #$02, $0022(A0)
                move.w  #$4000, $0008(A0)
                move.w  #$0000, $000C(A0)
                move.b  #$20, $001C(A0)
                rts
Offset_0x01BDE0:
                tst.b   $0001(A0)
                bmi.s   Offset_0x01BE16
                btst    #$03, $0022(A0)
                beq.s   Offset_0x01BE06
                moveq   #$00, D0
                move.b  $003D(A0), D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A3
                move.b  ($FFFFF70E).w, D0
                cmp.b   (A3), D0
                bne.s   Offset_0x01BE12
Offset_0x01BE06:
                addq.w  #$01, ($FFFFF704).w
                cmpi.w  #$012C, ($FFFFF704).w
                bcs.s   Offset_0x01BE1C
Offset_0x01BE12:
                bra     Offset_0x01BDAE
Offset_0x01BE16:
                move.w  #$0000, ($FFFFF704).w
Offset_0x01BE1C:
                moveq   #$00, D0
                move.b  $003D(A0), D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A3
                move.b  (A3), ($FFFFF70E).w
                rts
Offset_0x01BE32:                
                bsr     Offset_0x01BDE0
                tst.w   ($FFFFF702).w
                bne     Offset_0x01BEB0
                tst.w   $002E(A0)
                bne.s   Offset_0x01BEB0
                tst.b   $0039(A0)
                bne.s   Offset_0x01BE86
                tst.w   $0014(A0)
                bne.s   Offset_0x01BEB0
                bclr    #$00, $0022(A0)
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcs.s   Offset_0x01BE66
                bset    #$00, $0022(A0)
Offset_0x01BE66:
                move.w  #$0202, ($FFFFF66A).w
                move.b  ($FFFFFE05).w, D0
                andi.b  #$7F, D0
                beq.s   Offset_0x01BE96
                cmpi.b  #$08, $001C(A0)
                bne.s   Offset_0x01BEB0
                move.w  #$7272, ($FFFFF66A).w
                rts
Offset_0x01BE86:
                move.w  #$0202, ($FFFFF66A).w
                move.b  ($FFFFFE05).w, D0
                andi.b  #$7F, D0
                bne.s   Offset_0x01BEA4
Offset_0x01BE96:
                move.w  #$0000, ($FFFFF66A).w
                move.w  #$0006, ($FFFFF708).w
                rts
Offset_0x01BEA4:
                andi.b  #$1F, D0
                bne.s   Offset_0x01BEB0
                ori.w   #$7070, ($FFFFF66A).w
Offset_0x01BEB0:
                rts
;=============================================================================== 
; Sub Routina Miles_RecordMoves
; [ Início ]                         
;===============================================================================                  
Miles_RecordMoves: ; Offset_0x01BEB2:
                move.w  ($FFFFEED6).w, D0
                lea     ($FFFFE600).w, A1
                lea     $00(A1, D0), A1
                move.w  $0008(A0), (A1)+
                move.w  $000C(A0), (A1)+
                addq.b  #$04, ($FFFFEED7).w
                rts
;=============================================================================== 
; Sub Routina Miles_RecordMoves
; [ Término ]                         
;===============================================================================  
               
;=============================================================================== 
; Sub Rotina Miles_Water
; [ Início ]                         
;===============================================================================     
Miles_Water: ; Offset_0x01BECC:
                tst.b   (Water_Level_Flag).w                         ; $FFFFF730
                bne.s   Miles_InLevelWithWater                 ; Offset_0x01BED4
Offset_0x01BED2:
                rts
Miles_InLevelWithWater: ; Offset_0x01BED4:
                move.w  ($FFFFF646).w, D0
                cmp.w   $000C(A0), D0
                bge.s   Miles_NotInWater                       ; Offset_0x01BF2C
                bset    #$06, $0022(A0)
                bne.s   Offset_0x01BED2
                move.l  A0, A1
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                move.b  #$0A, ($FFFFD0C0).w
                move.b  #$81, ($FFFFD0E8).w
                move.l  A0, ($FFFFD0FC).w
                move.w  #$0300, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$0006, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0040, (Miles_Deceleration).w               ; $FFFFFEC4
                asr.w   $0010(A0)
                asr.w   $0012(A0)
                asr.w   $0012(A0)
                beq.s   Offset_0x01BED2
                move.w  #$0100, ($FFFFD15C).w
                move.w  #Water_Splash_Sfx, D0   ; $00AA
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;===============================================================================                 
Miles_NotInWater: ; Offset_0x01BF2C:
                bclr    #$06, $0022(A0)
                beq.s   Offset_0x01BED2
                move.l  A0, A1
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                move.w  #$0600, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$000C, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0080, (Miles_Deceleration).w               ; $FFFFFEC4
                cmpi.b  #$04, $0024(A0)
                beq.s   Offset_0x01BF58
                asl.w   $0012(A0)
Offset_0x01BF58:
                tst.w   $0012(A0)
                beq     Offset_0x01BED2
                move.w  #$0100, ($FFFFD15C).w
                move.l  A0, A1
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                cmpi.w  #$F000, $0012(A0)
                bgt.s   Offset_0x01BF7A
                move.w  #$F000, $0012(A0)
Offset_0x01BF7A:
                move.w  #Water_Splash_Sfx, D0   ; $00AA
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;=============================================================================== 
; Sub Rotina Miles_Water
; [ Término ]                         
;===============================================================================                 

;=============================================================================== 
; Sub Rotina Miles_MdNormal
; [ Início ]                         
;===============================================================================             
Miles_MdNormal: ; Offset_0x01BF84:
                bsr     Miles_Spindash                         ; Offset_0x01C68A
                bsr     Miles_Jump                             ; Offset_0x01C59A
                bsr     Miles_SlopeResist                      ; Offset_0x01C7C2
                bsr     Miles_Move                             ; Offset_0x01C026
                bsr     Miles_Roll                             ; Offset_0x01C534
                bsr     Miles_LevelBoundaries                  ; Offset_0x01C4D4
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
                bsr     Miles_SlopeRepel                       ; Offset_0x01C834
                rts
;=============================================================================== 
; Sub Rotina Miles_MdNormal
; [ Término ]                         
;===============================================================================
  
;=============================================================================== 
; Sub Rotina Miles_MdJump
; [ Início ]                         
;===============================================================================                 
Miles_MdJump: ; Offset_0x01BFAC:
                bsr     Miles_JumpHeight                       ; Offset_0x01C648
                bsr     Miles_ChgJumpDir                       ; Offset_0x01C448
                bsr     Miles_LevelBoundaries                  ; Offset_0x01C4D4
                jsr     (ObjectFall)                           ; Offset_0x016306
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01BFCC
                subi.w  #$0028, $0012(A0)
Offset_0x01BFCC:
                bsr     Miles_JumpAngle                        ; Offset_0x01C876
                bsr     Miles_Floor                            ; Offset_0x01C8D6
                rts
;=============================================================================== 
; Sub Rotina Miles_MdJump
; [ Término ]                         
;===============================================================================                 
                
;=============================================================================== 
; Sub Rotina Miles_MdRoll
; [ Início ]                         
;===============================================================================                
Miles_MdRoll: ; Offset_0x01BFD6:
                tst.b   $0039(A0)
                bne.s   Offset_0x01BFE0
                bsr     Miles_Jump                             ; Offset_0x01C59A
Offset_0x01BFE0:
                bsr     Miles_RollRepel                        ; Offset_0x01C7F8
                bsr     Miles_RollSpeed                        ; Offset_0x01C324
                bsr     Miles_LevelBoundaries                  ; Offset_0x01C4D4
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
                bsr     Miles_SlopeRepel                       ; Offset_0x01C834
                rts
;=============================================================================== 
; Sub Rotina Miles_MdRoll
; [ Término ]                         
;===============================================================================
                 
;=============================================================================== 
; Sub Rotina Miles_MdJump2
; [ Início ]                         
;===============================================================================                 
Miles_MdJump2: ; Offset_0x01BFFC:
                bsr     Miles_JumpHeight                       ; Offset_0x01C648
                bsr     Miles_ChgJumpDir                       ; Offset_0x01C448
                bsr     Miles_LevelBoundaries                  ; Offset_0x01C4D4
                jsr     (ObjectFall)                           ; Offset_0x016306
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01C01C
                subi.w  #$0028, $0012(A0)
Offset_0x01C01C:
                bsr     Miles_JumpAngle                        ; Offset_0x01C876
                bsr     Miles_Floor                            ; Offset_0x01C8D6
                rts
;=============================================================================== 
; Sub Rotina Miles_MdJump2
; [ Término ]                         
;===============================================================================
                 
;=============================================================================== 
; Sub Rotina Miles_Move
; [ Início ]                         
;===============================================================================                  
Miles_Move: ; Offset_0x01C026:
                move.w  (Miles_Max_Speed).w, D6                      ; $FFFFFEC0
                move.w  (Miles_Acceleration).w, D5                   ; $FFFFFEC2
                move.w  (Miles_Deceleration).w, D4                   ; $FFFFFEC4
                tst.b   $002B(A0)
                bmi     Offset_0x01C18E
                tst.w   $002E(A0)
                bne     Offset_0x01C14A
                btst    #$02, ($FFFFF66A).w
                beq.s   Offset_0x01C04E
                bsr     Offset_0x01C21E
Offset_0x01C04E:
                btst    #$03, ($FFFFF66A).w
                beq.s   Offset_0x01C05A
                bsr     Offset_0x01C2A4
Offset_0x01C05A:
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne     Offset_0x01C14A
                tst.w   $0014(A0)
                bne     Offset_0x01C14A
                bclr    #$05, $0022(A0)
                move.b  #$05, $001C(A0)
                btst    #$03, $0022(A0)
                beq.s   Offset_0x01C0BC
                moveq   #$00, D0
                move.b  $003D(A0), D0
                lsl.w   #$06, D0
                lea     ($FFFFB000).w, A1
                lea     $00(A1, D0), A1
                tst.b   $0022(A1)
                bmi.s   Offset_0x01C0EE
                moveq   #$00, D1
                move.b  $0019(A1), D1
                move.w  D1, D2
                add.w   D2, D2
                subq.w  #$04, D2
                add.w   $0008(A0), D1
                sub.w   $0008(A1), D1
                cmpi.w  #$0004, D1
                blt.s   Offset_0x01C0E0
                cmp.w   D2, D1
                bge.s   Offset_0x01C0D0
                bra.s   Offset_0x01C0EE
Offset_0x01C0BC:
                jsr     (Player_HitFloor)                      ; Offset_0x01ECE6
                cmpi.w  #$000C, D1
                blt.s   Offset_0x01C0EE
                cmpi.b  #$03, $0036(A0)
                bne.s   Offset_0x01C0D8
Offset_0x01C0D0:
                bclr    #$00, $0022(A0)
                bra.s   Offset_0x01C0E6
Offset_0x01C0D8:
                cmpi.b  #$03, $0037(A0)
                bne.s   Offset_0x01C0EE
Offset_0x01C0E0:
                bset    #$00, $0022(A0)
Offset_0x01C0E6:
                move.b  #$06, $001C(A0)
                bra.s   Offset_0x01C14A
Offset_0x01C0EE:
                btst    #$00, ($FFFFF66A).w
                beq.s   Offset_0x01C11C
                move.b  #$07, $001C(A0)
                addq.w  #$01, ($FFFFF66E).w
                cmpi.w  #$0078, ($FFFFF66E).w
                bcs.s   Offset_0x01C150
                move.w  #$0078, ($FFFFF66E).w
                cmpi.w  #$00C8, ($FFFFEEDA).w
                beq.s   Offset_0x01C162
                addq.w  #$02, ($FFFFEEDA).w
                bra.s   Offset_0x01C162
Offset_0x01C11C:
                btst    #$01, ($FFFFF66A).w
                beq.s   Offset_0x01C14A
                move.b  #$08, $001C(A0)
                addq.w  #$01, ($FFFFF66E).w
                cmpi.w  #$0078, ($FFFFF66E).w
                bcs.s   Offset_0x01C150
                move.w  #$0078, ($FFFFF66E).w
                cmpi.w  #$0008, ($FFFFEEDA).w
                beq.s   Offset_0x01C162
                subq.w  #$02, ($FFFFEEDA).w
                bra.s   Offset_0x01C162
Offset_0x01C14A:
                move.w  #$0000, ($FFFFF66E).w
Offset_0x01C150:
                cmpi.w  #$0060, ($FFFFEEDA).w
                beq.s   Offset_0x01C162
                bcc.s   Offset_0x01C15E
                addq.w  #$04, ($FFFFEEDA).w
Offset_0x01C15E:
                subq.w  #$02, ($FFFFEEDA).w
Offset_0x01C162:
                move.b  ($FFFFF66A).w, D0
                andi.b  #$0C, D0
                bne.s   Offset_0x01C18E
                move.w  $0014(A0), D0
                beq.s   Offset_0x01C18E
                bmi.s   Offset_0x01C182
                sub.w   D5, D0
                bcc.s   Offset_0x01C17C
                move.w  #$0000, D0
Offset_0x01C17C:
                move.w  D0, $0014(A0)
                bra.s   Offset_0x01C18E
Offset_0x01C182:
                add.w   D5, D0
                bcc.s   Offset_0x01C18A
                move.w  #$0000, D0
Offset_0x01C18A:
                move.w  D0, $0014(A0)
Offset_0x01C18E:
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  $0014(A0), D1
                asr.l   #$08, D1
                move.w  D1, $0010(A0)
                muls.w  $0014(A0), D0
                asr.l   #$08, D0
                move.w  D0, $0012(A0)
Offset_0x01C1AC:
                move.b  $0026(A0), D0
                addi.b  #$40, D0
                bmi.s   Offset_0x01C21C
                move.b  #$40, D1
                tst.w   $0014(A0)
                beq.s   Offset_0x01C21C
                bmi.s   Offset_0x01C1C4
                neg.w   D1
Offset_0x01C1C4:
                move.b  $0026(A0), D0
                add.b   D1, D0
                move.w  D0, -(A7)
                bsr     Player_WalkSpeed                       ; Offset_0x01EB14
                move.w  (A7)+, D0
                tst.w   D1
                bpl.s   Offset_0x01C21C
                asl.w   #$08, D1
                addi.b  #$20, D0
                andi.b  #$C0, D0
                beq.s   Offset_0x01C218
                cmpi.b  #$40, D0
                beq.s   Offset_0x01C206
                cmpi.b  #$80, D0
                beq.s   Offset_0x01C200
                add.w   D1, $0010(A0)
                bset    #$05, $0022(A0)
                move.w  #$0000, $0014(A0)
                rts
Offset_0x01C200:
                sub.w   D1, $0012(A0)
                rts
Offset_0x01C206:
                sub.w   D1, $0010(A0)
                bset    #$05, $0022(A0)
                move.w  #$0000, $0014(A0)
                rts
Offset_0x01C218:
                add.w   D1, $0012(A0)
Offset_0x01C21C:
                rts
Offset_0x01C21E:
                move.w  $0014(A0), D0
                beq.s   Offset_0x01C226
                bpl.s   Offset_0x01C258
Offset_0x01C226:
                bset    #$00, $0022(A0)
                bne.s   Offset_0x01C23A
                bclr    #$05, $0022(A0)
                move.b  #$01, $001D(A0)
Offset_0x01C23A:
                sub.w   D5, D0
                move.w  D6, D1
                neg.w   D1
                cmp.w   D1, D0
                bgt.s   Offset_0x01C24C
                add.w   D5, D0
                cmp.w   D1, D0
                ble.s   Offset_0x01C24C
                move.w  D1, D0
Offset_0x01C24C:
                move.w  D0, $0014(A0)
                move.b  #$00, $001C(A0)
                rts
Offset_0x01C258:
                sub.w   D4, D0
                bcc.s   Offset_0x01C260
                move.w  #$FF80, D0
Offset_0x01C260:
                move.w  D0, $0014(A0)
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne.s   Offset_0x01C2A2
                cmpi.w  #$0400, D0
                blt.s   Offset_0x01C2A2
                move.b  #$0D, $001C(A0)
                bclr    #$00, $0022(A0)
                move.w  #Stopping_Sfx, D0       ; $00A4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01C2A2
                move.b  #$06, ($FFFFD164).w
                move.b  #$15, ($FFFFD15A).w
Offset_0x01C2A2:
                rts
Offset_0x01C2A4:
                move.w  $0014(A0), D0
                bmi.s   Offset_0x01C2D8
                bclr    #$00, $0022(A0)
                beq.s   Offset_0x01C2BE
                bclr    #$05, $0022(A0)
                move.b  #$01, $001D(A0)
Offset_0x01C2BE:
                add.w   D5, D0
                cmp.w   D6, D0
                blt.s   Offset_0x01C2CC
                sub.w   D5, D0
                cmp.w   D6, D0
                bge.s   Offset_0x01C2CC
                move.w  D6, D0
Offset_0x01C2CC:
                move.w  D0, $0014(A0)
                move.b  #$00, $001C(A0)
                rts
Offset_0x01C2D8:
                add.w   D4, D0
                bcc.s   Offset_0x01C2E0
                move.w  #$0080, D0
Offset_0x01C2E0:
                move.w  D0, $0014(A0)
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne.s   Offset_0x01C322
                cmpi.w  #$FC00, D0
                bgt.s   Offset_0x01C322
                move.b  #$0D, $001C(A0)
                bset    #$00, $0022(A0)
                move.w  #Stopping_Sfx, D0       ; $00A4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01C322
                move.b  #$06, ($FFFFD164).w
                move.b  #$15, ($FFFFD15A).w
Offset_0x01C322:
                rts
;=============================================================================== 
; Sub Rotina Miles_Move
; [ Término ]                         
;===============================================================================    
                   
;=============================================================================== 
; Sub Rotina Miles_RollSpeed
; [ Início ]                         
;===============================================================================                           
Miles_RollSpeed: ; Offset_0x01C324:
                move.w  (Miles_Max_Speed).w, D6                      ; $FFFFFEC0
                asl.w   #$01, D6
                move.w  (Miles_Acceleration).w, D5                   ; $FFFFFEC2
                asr.w   #$01, D5
                move.w  (Miles_Deceleration).w, D4                   ; $FFFFFEC4
                asr.w   #$02, D4
                tst.b   $002B(A0)
                bmi     Offset_0x01C3BA
                tst.w   $002E(A0)
                bne.s   Offset_0x01C35C
                btst    #$02, ($FFFFF66A).w
                beq.s   Offset_0x01C350
                bsr     Offset_0x01C402
Offset_0x01C350:
                btst    #$03, ($FFFFF66A).w
                beq.s   Offset_0x01C35C
                bsr     Offset_0x01C426
Offset_0x01C35C:
                move.w  $0014(A0), D0
                beq.s   Offset_0x01C37E
                bmi.s   Offset_0x01C372
                sub.w   D5, D0
                bcc.s   Offset_0x01C36C
                move.w  #$0000, D0
Offset_0x01C36C:
                move.w  D0, $0014(A0)
                bra.s   Offset_0x01C37E
Offset_0x01C372:
                add.w   D5, D0
                bcc.s   Offset_0x01C37A
                move.w  #$0000, D0
Offset_0x01C37A:
                move.w  D0, $0014(A0)
Offset_0x01C37E:
                tst.w   $0014(A0)
                bne.s   Offset_0x01C3BA
                tst.b   $0039(A0)
                bne.s   Offset_0x01C3A8
                bclr    #$02, $0022(A0)
                move.b  #$0F, $0016(A0)
                move.b  #$09, $0017(A0)
                move.b  #$05, $001C(A0)
                subq.w  #$01, $000C(A0)
                bra.s   Offset_0x01C3BA
Offset_0x01C3A8:
                move.w  #$0400, $0014(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x01C3BA
                neg.w   $0014(A0)
Offset_0x01C3BA:
                cmpi.w  #$0060, ($FFFFEEDA).w
                beq.s   Offset_0x01C3CC
                bcc.s   Offset_0x01C3C8
                addq.w  #$04, ($FFFFEEDA).w
Offset_0x01C3C8:
                subq.w  #$02, ($FFFFEEDA).w
Offset_0x01C3CC:
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  $0014(A0), D0
                asr.l   #$08, D0
                move.w  D0, $0012(A0)
                muls.w  $0014(A0), D1
                asr.l   #$08, D1
                cmpi.w  #$1000, D1
                ble.s   Offset_0x01C3F0
                move.w  #$1000, D1
Offset_0x01C3F0:
                cmpi.w  #$F000, D1
                bge.s   Offset_0x01C3FA
                move.w  #$F000, D1
Offset_0x01C3FA:
                move.w  D1, $0010(A0)
                bra     Offset_0x01C1AC
Offset_0x01C402:
                move.w  $0014(A0), D0
                beq.s   Offset_0x01C40A
                bpl.s   Offset_0x01C418
Offset_0x01C40A:
                bset    #$00, $0022(A0)
                move.b  #$02, $001C(A0)
                rts
Offset_0x01C418:
                sub.w   D4, D0
                bcc.s   Offset_0x01C420
                move.w  #$FF80, D0
Offset_0x01C420:
                move.w  D0, $0014(A0)
                rts
Offset_0x01C426:
                move.w  $0014(A0), D0
                bmi.s   Offset_0x01C43A
                bclr    #$00, $0022(A0)
                move.b  #$02, $001C(A0)
                rts
Offset_0x01C43A:
                add.w   D4, D0
                bcc.s   Offset_0x01C442
                move.w  #$0080, D0
Offset_0x01C442:
                move.w  D0, $0014(A0)
                rts
;=============================================================================== 
; Sub Rotina Miles_RollRight
; [ Término ]                         
;===============================================================================
                  
;=============================================================================== 
; Sub Rotina Miles_ChgJumpDir
; [ Início ]                         
;===============================================================================             
Miles_ChgJumpDir: ; Offset_0x01C448:
                move.w  (Miles_Max_Speed).w, D6                      ; $FFFFFEC0
                move.w  (Miles_Acceleration).w, D5                   ; $FFFFFEC2
                asl.w   #$01, D5
                btst    #$04, $0022(A0)
                bne.s   Offset_0x01C492
                move.w  $0010(A0), D0
                btst    #$02, ($FFFFF66A).w
                beq.s   Offset_0x01C478
                bset    #$00, $0022(A0)
                sub.w   D5, D0
                move.w  D6, D1
                neg.w   D1
                cmp.w   D1, D0
                bgt.s   Offset_0x01C478
                move.w  D1, D0
Offset_0x01C478:
                btst    #$03, ($FFFFF66A).w
                beq.s   Offset_0x01C48E
                bclr    #$00, $0022(A0)
                add.w   D5, D0
                cmp.w   D6, D0
                blt.s   Offset_0x01C48E
                move.w  D6, D0
Offset_0x01C48E:
                move.w  D0, $0010(A0)
Offset_0x01C492:
                cmpi.w  #$0060, ($FFFFEEDA).w
                beq.s   Offset_0x01C4A4
                bcc.s   Offset_0x01C4A0
                addq.w  #$04, ($FFFFEEDA).w
Offset_0x01C4A0:
                subq.w  #$02, ($FFFFEEDA).w
Offset_0x01C4A4:
                cmpi.w  #$FC00, $0012(A0)
                bcs.s   Offset_0x01C4D2
                move.w  $0010(A0), D0
                move.w  D0, D1
                asr.w   #$05, D1
                beq.s   Offset_0x01C4D2
                bmi.s   Offset_0x01C4C6
                sub.w   D1, D0
                bcc.s   Offset_0x01C4C0
                move.w  #$0000, D0
Offset_0x01C4C0:
                move.w  D0, $0010(A0)
                rts
Offset_0x01C4C6:
                sub.w   D1, D0
                bcs.s   Offset_0x01C4CE
                move.w  #$0000, D0
Offset_0x01C4CE:
                move.w  D0, $0010(A0)
Offset_0x01C4D2:
                rts
;=============================================================================== 
; Sub Rotina Miles_ChgJumpDir
; [ Término ]                         
;=============================================================================== 
                
;=============================================================================== 
; Sub Rotina Miles_LevelBoundaries
; [ Início ]                         
;===============================================================================                               
Miles_LevelBoundaries: ; Offset_0x01C4D4:
                move.l  $0008(A0), D1
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D1
                swap.w  D1
                move.w  (Miles_Level_Limite).w, D0                   ; $FFFFEEF8
                addi.w  #$0010, D0
                cmp.w   D1, D0
                bhi.s   Offset_0x01C51C
                move.w  (Miles_Level_Limite_X).w, D0                 ; $FFFFEEFA
                addi.w  #$0128, D0
                tst.b   ($FFFFF7AA).w
                bne.s   Offset_0x01C502
                addi.w  #$0040, D0
Offset_0x01C502:
                cmp.w   D1, D0
                bls.s   Offset_0x01C51C
Offset_0x01C506:
                move.w  (Miles_Floor_Detect).w, D0                   ; $FFFFEEFE
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                blt.s   Offset_0x01C516
                rts
Offset_0x01C516:
                jmp     (Kill_Player)                          ; Offset_0x03F690
Offset_0x01C51C:
                move.w  D0, $0008(A0)
                move.w  #$0000, $000A(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0014(A0)
                bra.s   Offset_0x01C506
;=============================================================================== 
; Sub Rotina Miles_LevelBoundaries
; [ Término ]                         
;===============================================================================  
                
;=============================================================================== 
; Sub Routina Miles_Roll
; [ Início ]                         
;===============================================================================                   
Miles_Roll: ; Offset_0x01C534:
                tst.b   $002B(A0)
                bmi.s   Offset_0x01C55A
                move.w  $0014(A0), D0
                bpl.s   Offset_0x01C542
                neg.w   D0
Offset_0x01C542:
                cmpi.w  #$0080, D0
                bcs.s   Offset_0x01C55A
                move.b  ($FFFFF66A).w, D0
                andi.b  #$0C, D0
                bne.s   Offset_0x01C55A
                btst    #$01, ($FFFFF66A).w
                bne.s   Offset_0x01C55C
Offset_0x01C55A:
                rts
Offset_0x01C55C:
                btst    #$02, $0022(A0)
                beq.s   Offset_0x01C566
                rts
Offset_0x01C566:
                bset    #$02, $0022(A0)
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.b  #$02, $001C(A0)
                addq.w  #$01, $000C(A0)
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                tst.w   $0014(A0)
                bne.s   Offset_0x01C598
                move.w  #$0200, $0014(A0)
Offset_0x01C598:
                rts
;=============================================================================== 
; Sub Rotina Miles_Roll
; [ Término ]                         
;===============================================================================  
                
;=============================================================================== 
; Sub Rotina Miles_Jump
; [ Início ]                         
;===============================================================================                
Miles_Jump: ; Offset_0x01C59A:
                move.b  ($FFFFF66B).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01C63E
                moveq   #$00, D0
                move.b  $0026(A0), D0
                addi.b  #$80, D0
                bsr     CalcRoomOverHead                       ; Offset_0x01EB9A
                cmpi.w  #$0006, D1
                blt     Offset_0x01C63E
                move.w  #$0680, D2
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01C5CC
                move.w  #$0380, D2
Offset_0x01C5CC:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                subi.b  #$40, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  D2, D1
                asr.l   #$08, D1
                add.w   D1, $0010(A0)
                muls.w  D2, D0
                asr.l   #$08, D0
                add.w   D0, $0012(A0)
                bset    #$01, $0022(A0)
                bclr    #$05, $0022(A0)
                addq.l  #$04, A7
                move.b  #$01, $003C(A0)
                clr.b   $0038(A0)
                move.w  #Jump_Sfx, D0           ; $00A0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.b  #$0F, $0016(A0)
                move.b  #$09, $0017(A0)
                btst    #$02, $0022(A0)
                bne.s   Offset_0x01C640
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.b  #$02, $001C(A0)
                bset    #$02, $0022(A0)
                addq.w  #$01, $000C(A0)
Offset_0x01C63E:
                rts
Offset_0x01C640:
                bset    #$04, $0022(A0)
                rts
;=============================================================================== 
; Sub Rotina Miles_Jump
; [ Término ]                         
;===============================================================================   

;=============================================================================== 
; Sub Rotina Miles_JumpHeight
; [ Início ]                         
;===============================================================================   
Miles_JumpHeight: ; Offset_0x01C648:
                tst.b   $003C(A0)
                beq.s   Offset_0x01C674
                move.w  #$FC00, D1
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01C65E
                move.w  #$FE00, D1
Offset_0x01C65E:
                cmp.w   $0012(A0), D1
                ble.s   Offset_0x01C672
                move.b  ($FFFFF66A).w, D0
                andi.b  #$70, D0
                bne.s   Offset_0x01C672
                move.w  D1, $0012(A0)
Offset_0x01C672:
                rts
Offset_0x01C674:
                tst.b   $0039(A0)
                bne.s   Offset_0x01C688
                cmpi.w  #$F040, $0012(A0)
                bge.s   Offset_0x01C688
                move.w  #$F040, $0012(A0)
Offset_0x01C688:
                rts
;=============================================================================== 
; Sub Rotina Miles_JumpHeight
; [ Término ]                         
;=============================================================================== 
                
;=============================================================================== 
; Sub Rotinq Miles_Spindash
; [ Início ]                         
;===============================================================================                                     
Miles_Spindash: ; Offset_0x01C68A:
                tst.b   $0039(A0)
                bne.s   Offset_0x01C6DA
                cmpi.b  #$08, $001C(A0)
                bne.s   Offset_0x01C6D8
                move.b  ($FFFFF66B).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01C6D8
                move.b  #$09, $001C(A0)
                move.w  #Spindash_Sfx, D0       ; $00E0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.l  #$04, A7
                move.b  #$01, $0039(A0)
                move.w  #$0000, $003A(A0)
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01C6D0
                move.b  #$02, ($FFFFD15C).w
Offset_0x01C6D0:
                bsr     Miles_LevelBoundaries                  ; Offset_0x01C4D4
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
Offset_0x01C6D8:
                rts
Offset_0x01C6DA:
                move.b  ($FFFFF66A).w, D0
                btst    #$01, D0
                bne.s   Offset_0x01C75C
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.b  #$02, $001C(A0)
                addq.w  #$01, $000C(A0)
                move.b  #$00, $0039(A0)
                moveq   #$00, D0
                move.b  $003A(A0), D0
                add.w   D0, D0
                move.w  Miles_Spindash_Speed(PC, D0), $0014(A0) ; Offset_0x01C74A
                move.w  $0014(A0), D0
                subi.w  #$0800, D0
                add.w   D0, D0
                andi.w  #$1F00, D0
                neg.w   D0
                addi.w  #$2000, D0
                move.w  D0, ($FFFFEED4).w
                btst    #$00, $0022(A0)
                beq.s   Offset_0x01C732
                neg.w   $0014(A0)
Offset_0x01C732:
                bset    #$02, $0022(A0)
                move.b  #$00, ($FFFFD15C).w
                move.w  #Spindash_Release_Sfx, D0 ; $00BC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                bra.s   Offset_0x01C7A4  
;-------------------------------------------------------------------------------                
Miles_Spindash_Speed: ; Offset_0x01C74A:  
                dc.w    $0800, $0880, $0900, $0980, $0A00, $0A80, $0B00, $0B80
                dc.w    $0C00     
;-------------------------------------------------------------------------------                
Offset_0x01C75C:
                tst.w   $003A(A0)
                beq.s   Offset_0x01C774
                move.w  $003A(A0), D0
                lsr.w   #$05, D0
                sub.w   D0, $003A(A0)
                bcc.s   Offset_0x01C774
                move.w  #$0000, $003A(A0)
Offset_0x01C774:
                move.b  ($FFFFF66B).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01C7A4
                move.w  #$0900, $001C(A0)
                move.w  #Spindash_Sfx, D0       ; $00E0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addi.w  #$0200, $003A(A0)
                cmpi.w  #$0800, $003A(A0)
                bcs.s   Offset_0x01C7A4
                move.w  #$0800, $003A(A0)
Offset_0x01C7A4:
                addq.l  #$04, A7
                cmpi.w  #$0060, ($FFFFEEDA).w
                beq.s   Offset_0x01C7B8
                bcc.s   Offset_0x01C7B4
                addq.w  #$04, ($FFFFEEDA).w
Offset_0x01C7B4:
                subq.w  #$02, ($FFFFEEDA).w
Offset_0x01C7B8:
                bsr     Miles_LevelBoundaries                  ; Offset_0x01C4D4
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
                rts
;=============================================================================== 
; Sub Rotina Miles_Spindash
; [ Término ]                         
;===============================================================================
                
;=============================================================================== 
; Sub Rotina Miles_SlopeResist
; [ Início ]                         
;===============================================================================                      
Miles_SlopeResist: ; Offset_0x01C7C2:
                move.b  $0026(A0), D0
                addi.b  #$60, D0
                cmpi.b  #$C0, D0
                bcc.s   Offset_0x01C7F6
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0020, D0
                asr.l   #$08, D0
                tst.w   $0014(A0)
                beq.s   Offset_0x01C7F6
                bmi.s   Offset_0x01C7F2
                tst.w   D0
                beq.s   Offset_0x01C7F0
                add.w   D0, $0014(A0)
Offset_0x01C7F0:
                rts
Offset_0x01C7F2:
                add.w   D0, $0014(A0)
Offset_0x01C7F6:
                rts
;=============================================================================== 
; Sub Rotina Miles_SlopeResist
; [ Término ]                         
;=============================================================================== 
                
;=============================================================================== 
; Sub Rotina Miles_RollRepel
; [ Início ]                         
;===============================================================================  
Miles_RollRepel: ; Offset_0x01C7F8:
                move.b  $0026(A0), D0
                addi.b  #$60, D0
                cmpi.b  #$C0, D0
                bcc.s   Offset_0x01C832
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0050, D0
                asr.l   #$08, D0
                tst.w   $0014(A0)
                bmi.s   Offset_0x01C828
                tst.w   D0
                bpl.s   Offset_0x01C822
                asr.l   #$02, D0
Offset_0x01C822:
                add.w   D0, $0014(A0)
                rts
Offset_0x01C828:
                tst.w   D0
                bmi.s   Offset_0x01C82E
                asr.l   #$02, D0
Offset_0x01C82E:
                add.w   D0, $0014(A0)
Offset_0x01C832:
                rts
;=============================================================================== 
; Sub Rotina Miles_RollRepel
; [ Término ]                         
;===============================================================================

;=============================================================================== 
; Sub Rotina Miles_SlopeRepel
; [ Início ]                         
;=============================================================================== 
Miles_SlopeRepel: ; Offset_0x01C834:
                nop
                tst.b   $0038(A0)
                bne.s   Offset_0x01C86E
                tst.w   $002E(A0)
                bne.s   Offset_0x01C870
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                beq.s   Offset_0x01C86E
                move.w  $0014(A0), D0
                bpl.s   Offset_0x01C858
                neg.w   D0
Offset_0x01C858:
                cmpi.w  #$0280, D0
                bcc.s   Offset_0x01C86E
                clr.w   $0014(A0)
                bset    #$01, $0022(A0)
                move.w  #$001E, $002E(A0)
Offset_0x01C86E:
                rts
Offset_0x01C870:
                subq.w  #$01, $002E(A0)
                rts
;=============================================================================== 
; Sub Rotina Miles_SlopeRepel
; [ Término ]                         
;===============================================================================  

;=============================================================================== 
; Sub Rotina Miles_JumpAngle
; [ Início ]                         
;===============================================================================                 
Miles_JumpAngle: ; Offset_0x01C876:
                move.b  $0026(A0), D0
                beq.s   Offset_0x01C890
                bpl.s   Offset_0x01C886
                addq.b  #$02, D0
                bcc.s   Offset_0x01C884
                moveq   #$00, D0
Offset_0x01C884:
                bra.s   Offset_0x01C88C
Offset_0x01C886:
                subq.b  #$02, D0
                bcc.s   Offset_0x01C88C
                moveq   #$00, D0
Offset_0x01C88C:
                move.b  D0, $0026(A0)
Offset_0x01C890:
                move.b  $0027(A0), D0
                beq.s   Offset_0x01C8D4
                tst.w   $0014(A0)
                bmi.s   Offset_0x01C8B4
Offset_0x01C89C:
                move.b  $002D(A0), D1
                add.b   D1, D0
                bcc.s   Offset_0x01C8B2
                subq.b  #$01, $002C(A0)
                bcc.s   Offset_0x01C8B2
                move.b  #$00, $002C(A0)
                moveq   #$00, D0
Offset_0x01C8B2:
                bra.s   Offset_0x01C8D0
Offset_0x01C8B4:
                tst.b   $0029(A0)
                bne.s   Offset_0x01C89C
                move.b  $002D(A0), D1
                sub.b   D1, D0
                bcc.s   Offset_0x01C8D0
                subq.b  #$01, $002C(A0)
                bcc.s   Offset_0x01C8D0
                move.b  #$00, $002C(A0)
                moveq   #$00, D0
Offset_0x01C8D0:
                move.b  D0, $0027(A0)
Offset_0x01C8D4:
                rts
;=============================================================================== 
; Sub Rotina Miles_JumpAngle
; [ Término ]                         
;=============================================================================== 

;=============================================================================== 
; Sub Rotina Miles_Floor
; [ Início ]                         
;=============================================================================== 
Miles_Floor: ; Offset_0x01C8D6:
                move.l  #$FFFFD600, ($FFFFF796).w
                cmpi.b  #$0C, $003E(A0)
                beq.s   Offset_0x01C8EE
                move.l  #$FFFFD900, ($FFFFF796).w
Offset_0x01C8EE:
                move.b  $003F(A0), D5
                move.w  $0010(A0), D1
                move.w  $0012(A0), D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                subi.b  #$20, D0
                andi.b  #$C0, D0
                cmpi.b  #$40, D0
                beq     Offset_0x01C9B8
                cmpi.b  #$80, D0
                beq     Offset_0x01CA14
                cmpi.b  #$C0, D0
                beq     Offset_0x01CA70
                bsr     Player_HitWall                         ; Offset_0x01EFEE
                tst.w   D1
                bpl.s   Offset_0x01C932
                sub.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01C932:
                bsr     Offset_0x01EE6C
                tst.w   D1
                bpl.s   Offset_0x01C944
                add.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01C944:
                bsr     Offset_0x01EBDE
                tst.w   D1
                bpl.s   Offset_0x01C9B6
                move.b  $0012(A0), D2
                addq.b  #$08, D2
                neg.b   D2
                cmp.b   D2, D1
                bge.s   Offset_0x01C95C
                cmp.b   D2, D0
                blt.s   Offset_0x01C9B6
Offset_0x01C95C:
                add.w   D1, $000C(A0)
                move.b  D3, $0026(A0)
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x01CACC
                move.b  D3, D0
                addi.b  #$20, D0
                andi.b  #$40, D0
                bne.s   Offset_0x01C994
                move.b  D3, D0
                addi.b  #$10, D0
                andi.b  #$20, D0
                beq.s   Offset_0x01C986
                asr.w   $0012(A0)
                bra.s   Offset_0x01C9A8
Offset_0x01C986:
                move.w  #$0000, $0012(A0)
                move.w  $0010(A0), $0014(A0)
                rts
Offset_0x01C994:
                move.w  #$0000, $0010(A0)
                cmpi.w  #$0FC0, $0012(A0)
                ble.s   Offset_0x01C9A8
                move.w  #$0FC0, $0012(A0)
Offset_0x01C9A8:
                move.w  $0012(A0), $0014(A0)
                tst.b   D3
                bpl.s   Offset_0x01C9B6
                neg.w   $0014(A0)
Offset_0x01C9B6:
                rts
Offset_0x01C9B8:
                bsr     Player_HitWall                         ; Offset_0x01EFEE
                tst.w   D1
                bpl.s   Offset_0x01C9D2
                sub.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
                move.w  $0012(A0), $0014(A0)
                rts
Offset_0x01C9D2:
                bsr     Player_DontRunOnWalls                  ; Offset_0x01EEBE
                tst.w   D1
                bpl.s   Offset_0x01C9EC
                sub.w   D1, $000C(A0)
                tst.w   $0012(A0)
                bpl.s   Offset_0x01C9EA
                move.w  #$0000, $0012(A0)
Offset_0x01C9EA:
                rts
Offset_0x01C9EC:
                tst.w   $0012(A0)
                bmi.s   Offset_0x01CA12
                bsr     Offset_0x01EBDE
                tst.w   D1
                bpl.s   Offset_0x01CA12
                add.w   D1, $000C(A0)
                move.b  D3, $0026(A0)
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x01CACC
                move.w  #$0000, $0012(A0)
                move.w  $0010(A0), $0014(A0)
Offset_0x01CA12:
                rts
Offset_0x01CA14:
                bsr     Player_HitWall                         ; Offset_0x01EFEE
                tst.w   D1
                bpl.s   Offset_0x01CA26
                sub.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01CA26:
                bsr     Offset_0x01EE6C
                tst.w   D1
                bpl.s   Offset_0x01CA38
                add.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01CA38:
                bsr     Player_DontRunOnWalls                  ; Offset_0x01EEBE
                tst.w   D1
                bpl.s   Offset_0x01CA6E
                sub.w   D1, $000C(A0)
                move.b  D3, D0
                addi.b  #$20, D0
                andi.b  #$40, D0
                bne.s   Offset_0x01CA58
                move.w  #$0000, $0012(A0)
                rts
Offset_0x01CA58:
                move.b  D3, $0026(A0)
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x01CACC
                move.w  $0012(A0), $0014(A0)
                tst.b   D3
                bpl.s   Offset_0x01CA6E
                neg.w   $0014(A0)
Offset_0x01CA6E:
                rts
Offset_0x01CA70:
                bsr     Offset_0x01EE6C
                tst.w   D1
                bpl.s   Offset_0x01CA8A
                add.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
                move.w  $0012(A0), $0014(A0)
                rts
Offset_0x01CA8A:
                bsr     Player_DontRunOnWalls                  ; Offset_0x01EEBE
                tst.w   D1
                bpl.s   Offset_0x01CAA4
                sub.w   D1, $000C(A0)
                tst.w   $0012(A0)
                bpl.s   Offset_0x01CAA2
                move.w  #$0000, $0012(A0)
Offset_0x01CAA2:
                rts
Offset_0x01CAA4:
                tst.w   $0012(A0)
                bmi.s   Offset_0x01CACA
                bsr     Offset_0x01EBDE
                tst.w   D1
                bpl.s   Offset_0x01CACA
                add.w   D1, $000C(A0)
                move.b  D3, $0026(A0)
                bsr     Miles_ResetMilesOnFloor                ; Offset_0x01CACC
                move.w  #$0000, $0012(A0)
                move.w  $0010(A0), $0014(A0)
Offset_0x01CACA:
                rts
Miles_ResetMilesOnFloor: ; Offset_0x01CACC:
                tst.b   $0039(A0)
                bne.s   Offset_0x01CAFC
                move.b  #$00, $001C(A0)
;=============================================================================== 
; Sub Rotina Miles_Floor
; [ Término ]                         
;===============================================================================  
                
;===============================================================================
; Sub Rotina Miles_ResetOnFloor
; [ Início ]
;===============================================================================                
Miles_ResetOnFloor: ; Offset_0x01CAD8:                
                btst    #$02, $0022(A0)
                beq.s   Offset_0x01CAFC
                bclr    #$02, $0022(A0)
                move.b  #$0F, $0016(A0)
                move.b  #$09, $0017(A0)
                move.b  #$00, $001C(A0)
                subq.w  #$01, $000C(A0)
Offset_0x01CAFC:
                bclr    #$01, $0022(A0)
                bclr    #$05, $0022(A0)
                bclr    #$04, $0022(A0)
                move.b  #$00, $003C(A0)
                move.w  #$0000, ($FFFFF7D0).w
                move.b  #$00, $0027(A0)
                move.b  #$00, $0029(A0)
                move.b  #$00, $002C(A0)
                move.w  #$0000, ($FFFFF66E).w
                cmpi.b  #$14, $001C(A0)
                bne.s   Offset_0x01CB40
                move.b  #$00, $001C(A0)
Offset_0x01CB40:
                rts
;===============================================================================
; Sub Rotina Miles_ResetOnFloor
; [ Término ]
;=============================================================================== 
                
;===============================================================================
; Sub Rotina Miles_Hurt
; [ Início ]
;===============================================================================   
Miles_Hurt: ; Offset_0x01CB42:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0030, $0012(A0)
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01CB5C
                subi.w  #$0020, $0012(A0)
Offset_0x01CB5C:
                cmpi.w  #$FF00, ($FFFFEECC).w
                bne.s   Offset_0x01CB6A
                andi.w  #$07FF, $000C(A0)
Offset_0x01CB6A:
                bsr     Miles_HurtStop                         ; Offset_0x01CB84
                bsr     Miles_LevelBoundaries                  ; Offset_0x01C4D4
                bsr     Miles_RecordMoves                      ; Offset_0x01BEB2
                bsr     Miles_Animate                          ; Offset_0x01CD40
                bsr     Load_Miles_Dynamic_PLC                 ; Offset_0x01D138
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;=============================================================================== 
; Sub Rotina Miles_Hurt
; [ Término ]                         
;===============================================================================

;=============================================================================== 
; Sub Rotina Miles_HurtStop
; [ Início ]                         
;===============================================================================                   
Miles_HurtStop: ; Offset_0x01CB84:
                move.w  (Miles_Floor_Detect).w, D0                   ; $FFFFEEFE
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                blt     J_Kill_Player                          ; Offset_0x01D2A6
                bsr     Miles_Floor                            ; Offset_0x01C8D6
                btst    #$01, $0022(A0)
                bne.s   Offset_0x01CBCA
                moveq   #$00, D0
                move.w  D0, $0012(A0)
                move.w  D0, $0010(A0)
                move.w  D0, $0014(A0)
                move.b  D0, $002A(A0)
                move.b  #$00, $001C(A0)
                move.b  #$02, $0024(A0)
                move.w  #$0078, $0030(A0)
                move.b  #$00, $0039(A0)
Offset_0x01CBCA:
                rts
;=============================================================================== 
; Sub Rotina Miles_HurtStop
; [ Término ]                         
;=============================================================================== 
  
;=============================================================================== 
; Sub Routine Miles_Death
; [ Início ]                         
;===============================================================================              
Miles_Death: ; Offset_0x01CBCC:
                bsr     Miles_GameOver                         ; Offset_0x01CBE8
                jsr     (ObjectFall)                           ; Offset_0x016306
                bsr     Miles_RecordMoves                      ; Offset_0x01BEB2
                bsr     Miles_Animate                          ; Offset_0x01CD40
                bsr     Load_Miles_Dynamic_PLC                 ; Offset_0x01D138
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;=============================================================================== 
; Sub Routina Miles_Death
; [ Término ]                         
;===============================================================================                

;=============================================================================== 
; Sub Rotina Miles_GameOver
; [ Início ]                         
;===============================================================================                 
Miles_GameOver: ; Offset_0x01CBE8:
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                beq     Sonic_GameOver                         ; Offset_0x01B18E
                move.b  #$01, ($FFFFEEBF).w
                move.b  #$00, $0039(A0)
                move.w  (Miles_Floor_Detect).w, D0                   ; $FFFFEEFE
                addi.w  #$0100, D0
                cmp.w   $000C(A0), D0
                bge     Offset_0x01CD0A
                move.b  #$02, $0024(A0)
                tst.w   ($FFFFFFB8).w
                bne.s   Offset_0x01CC1E
                bra     Offset_0x01BDAE
Offset_0x01CC1E:
                addq.b  #$01, ($FFFFFEC8).w
                subq.b  #$01, ($FFFFFEC6).w
                bne.s   Offset_0x01CC68
                move.w  #$0000, $003A(A0)
                move.b  #$39, ($FFFFB080).w  ; Carrega o objeto 0x39 - Game Over
                move.b  #$39, ($FFFFB0C0).w  ; Carrega o objeto 0x39 - Game Over
                move.b  #$01, ($FFFFB0DA).w
                move.w  A0, ($FFFFB0BE).w
                clr.b   ($FFFFFECC).w
Offset_0x01CC48:
                clr.b   ($FFFFFE1E).w
                clr.b   ($FFFFFECA).w
                move.b  #$08, $0024(A0)
                move.w  #Time_Game_Over_Snd, D0 ; $009B       
                jsr     (Play_Music)                           ; Offset_0x00131A
                moveq   #$03, D0
                jmp     (LoadPLC)                              ; Offset_0x0015DA
Offset_0x01CC68:
                tst.b   ($FFFFFE1A).w
                beq.s   Offset_0x01CC8A
                tst.b   ($FFFFFECC).w
                beq.s   Offset_0x01CCB4
                move.w  #$0000, $003A(A0)
                clr.b   ($FFFFFE1E).w
                clr.b   ($FFFFFECA).w
                move.b  #$08, $0024(A0)
                rts
Offset_0x01CC8A:
                tst.b   ($FFFFFECC).w
                beq.s   Offset_0x01CCB4
                move.w  #$0000, $003A(A0)
                move.b  #$39, ($FFFFB080).w
                move.b  #$39, ($FFFFB0C0).w
                move.b  #$02, ($FFFFB09A).w
                move.b  #$03, ($FFFFB0DA).w
                move.w  A0, ($FFFFB0BE).w
                bra.s   Offset_0x01CC48
Offset_0x01CCB4:
                move.b  #$00, ($FFFFEEBF).w
                move.b  #$0A, $0024(A0)
                move.w  ($FFFFFEE2).w, $0008(A0)
                move.w  ($FFFFFEE4).w, $000C(A0)
                move.w  ($FFFFFEEC).w, $0002(A0)
                move.w  ($FFFFFEEE).w, $003E(A0)
                clr.w   ($FFFFFED0).w
                clr.b   ($FFFFFEC7).w
                move.b  #$00, $002A(A0)
                move.b  #$05, $001C(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                move.w  #$0000, $0014(A0)
                move.b  #$02, $0022(A0)
                move.w  #$0000, $002E(A0)
Offset_0x01CD0A:
                rts
;=============================================================================== 
; Sub Rotina Miles_GameOver
; [ Término ]                         
;===============================================================================
                
;=============================================================================== 
; Sub Rotina Miles_ResetLevel
; [ Início ]                         
;=============================================================================== 
Miles_ResetLevel: ; Offset_0x01CD0C:
                tst.w   $003A(A0)
                beq.s   Offset_0x01CD1E
                subq.w  #$01, $003A(A0)
                bne.s   Offset_0x01CD1E
                move.w  #$0001, ($FFFFFE02).w
Offset_0x01CD1E:
                rts
;=============================================================================== 
; Sub Rotina Miles_ResetLevel
; [ Término ]                         
;===============================================================================                 
                
;=============================================================================== 
; Sub Rotina Miles_Respawning - Miles aguardando a câmera chegar onder ele 
; [ Início ]                    reapareceu na fase     
;===============================================================================                  
Miles_Respawning: ; Offset_0x01CD20:
                tst.w   ($FFFFEEB8).w
                bne.s   Offset_0x01CD32
                tst.w   ($FFFFEEBA).w
                bne.s   Offset_0x01CD32
                move.b  #$02, $0024(A0)
Offset_0x01CD32:
                bsr     Miles_Animate                          ; Offset_0x01CD40
                bsr     Load_Miles_Dynamic_PLC                 ; Offset_0x01D138
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;=============================================================================== 
; Sub Rotina Miles_Respawning - Miles aguardando a câmera chegar onder ele 
; [ Término ]                   reapareceu na fase     
;===============================================================================  
                
;=============================================================================== 
; Sub Rotina Miles_Animate
; [ Início ]                         
;=============================================================================== 
Miles_Animate: ; Offset_0x01CD40:
                lea     (Offset_0x01CFB4), A1
Miles_Animate_A1: ; Offset_0x01CD46:                
                moveq   #$00, D0
                move.b  $001C(A0), D0
                cmp.b   $001D(A0), D0
                beq.s   Offset_0x01CD68
                move.b  D0, $001D(A0)
                move.b  #$00, $001B(A0)
                move.b  #$00, $001E(A0)
                bclr    #$05, $0022(A0)
Offset_0x01CD68:
                add.w   D0, D0
                adda.w  $00(A1, D0), A1
                move.b  (A1), D0
                bmi.s   Offset_0x01CDD8
                move.b  $0022(A0), D1
                andi.b  #$01, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x01CDA6
                move.b  D0, $001E(A0)
Offset_0x01CD8E:
                moveq   #$00, D1
                move.b  $001B(A0), D1
                move.b  $01(A1, D1), D0
                cmpi.b  #$F0, D0
                bcc.s   Offset_0x01CDA8
Offset_0x01CD9E:
                move.b  D0, $001A(A0)
                addq.b  #$01, $001B(A0)
Offset_0x01CDA6:
                rts
Offset_0x01CDA8:
                addq.b  #$01, D0
                bne.s   Offset_0x01CDB8
                move.b  #$00, $001B(A0)
                move.b  $0001(A1), D0
                bra.s   Offset_0x01CD9E
Offset_0x01CDB8:
                addq.b  #$01, D0
                bne.s   Offset_0x01CDCC
                move.b  $02(A1, D1), D0
                sub.b   D0, $001B(A0)
                sub.b   D0, D1
                move.b  $01(A1, D1), D0
                bra.s   Offset_0x01CD9E
Offset_0x01CDCC:
                addq.b  #$01, D0
                bne.s   Offset_0x01CDD6
                move.b  $02(A1, D1), $001C(A0)
Offset_0x01CDD6:
                rts
Offset_0x01CDD8:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x01CDA6
                addq.b  #$01, D0
                bne     Offset_0x01CEEA
                moveq   #$00, D0
                move.b  $0027(A0), D0
                bne     Offset_0x01CE84
                moveq   #$00, D1
                move.b  $0026(A0), D0
                bmi.s   Offset_0x01CDFA
                beq.s   Offset_0x01CDFA
                subq.b  #$01, D0
Offset_0x01CDFA:
                move.b  $0022(A0), D2
                andi.b  #$01, D2
                bne.s   Offset_0x01CE06
                not.b   D0
Offset_0x01CE06:
                addi.b  #$10, D0
                bpl.s   Offset_0x01CE0E
                moveq   #$03, D1
Offset_0x01CE0E:
                andi.b  #$FC, $0001(A0)
                eor.b   D1, D2
                or.b    D2, $0001(A0)
                btst    #$05, $0022(A0)
                bne     Offset_0x01CF2E
                lsr.b   #$04, D0
                andi.b  #$06, D0
                move.w  $0014(A0), D2
                bpl.s   Offset_0x01CE32
                neg.w   D2
Offset_0x01CE32:
                tst.b   $002B(A0)
                bpl     Offset_0x01CE3C
                add.w   D2, D2
Offset_0x01CE3C:
                move.b  D0, D3
                add.b   D3, D3
                add.b   D3, D3
                lea     (Offset_0x01CFF6), A1
                cmpi.w  #$0600, D2
                bcs.s   Offset_0x01CE6A
                lea     (Offset_0x01D000), A1
                move.b  D0, D1
                lsr.b   #$01, D1
                add.b   D1, D0
                add.b   D0, D0
                move.b  D0, D3
                cmpi.w  #$0700, D2
                bcs.s   Offset_0x01CE6A
                lea     (Offset_0x01D102), A1
Offset_0x01CE6A:
                neg.w   D2
                addi.w  #$0800, D2
                bpl.s   Offset_0x01CE74
                moveq   #$00, D2
Offset_0x01CE74:
                lsr.w   #$08, D2
                move.b  D2, $001E(A0)
                bsr     Offset_0x01CD8E
                add.b   D3, $001A(A0)
                rts
Offset_0x01CE84:
                move.b  $0027(A0), D0
                moveq   #$00, D1
                move.b  $0022(A0), D2
                andi.b  #$01, D2
                bne.s   Offset_0x01CEB2
                andi.b  #$FC, $0001(A0)
                addi.b  #$0B, D0
                divu.w  #$0016, D0
                addi.b  #$75, D0
                move.b  D0, $001A(A0)
                move.b  #$00, $001E(A0)
                rts
Offset_0x01CEB2:
                andi.b  #$FC, $0001(A0)
                tst.b   $0029(A0)
                beq.s   Offset_0x01CECA
                ori.b   #$01, $0001(A0)
                addi.b  #$0B, D0
                bra.s   Offset_0x01CED6
Offset_0x01CECA:
                ori.b   #$03, $0001(A0)
                neg.b   D0
                addi.b  #$8F, D0
Offset_0x01CED6:
                divu.w  #$0016, D0
                addi.b  #$75, D0
                move.b  D0, $001A(A0)
                move.b  #$00, $001E(A0)
                rts
Offset_0x01CEEA:
                addq.b  #$01, D0
                bne.s   Offset_0x01CF60
                move.w  $0014(A0), D2
                bpl.s   Offset_0x01CEF6
                neg.w   D2
Offset_0x01CEF6:
                lea     (Offset_0x01D010), A1
                cmpi.w  #$0600, D2
                bcc.s   Offset_0x01CF08
                lea     (Offset_0x01D00A), A1
Offset_0x01CF08:
                neg.w   D2
                addi.w  #$0400, D2
                bpl.s   Offset_0x01CF12
                moveq   #$00, D2
Offset_0x01CF12:
                lsr.w   #$08, D2
                move.b  D2, $001E(A0)
                move.b  $0022(A0), D1
                andi.b  #$01, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                bra     Offset_0x01CD8E
Offset_0x01CF2E:
                move.w  $0014(A0), D2
                bmi.s   Offset_0x01CF36
                neg.w   D2
Offset_0x01CF36:
                addi.w  #$0800, D2
                bpl.s   Offset_0x01CF3E
                moveq   #$00, D2
Offset_0x01CF3E:
                lsr.w   #$06, D2
                move.b  D2, $001E(A0)
                lea     (Offset_0x01D016), A1
                move.b  $0022(A0), D1
                andi.b  #$01, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                bra     Offset_0x01CD8E
Offset_0x01CF60:
                move.w  $0010(A2), D1
                move.w  $0012(A2), D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                moveq   #$00, D1
                move.b  $0022(A0), D2
                andi.b  #$01, D2
                bne.s   Offset_0x01CF7E
                not.b   D0
                bra.s   Offset_0x01CF82
Offset_0x01CF7E:
                addi.b  #$80, D0
Offset_0x01CF82:
                addi.b  #$10, D0
                bpl.s   Offset_0x01CF8A
                moveq   #$03, D1
Offset_0x01CF8A:
                andi.b  #$FC, $0001(A0)
                eor.b   D1, D2
                or.b    D2, $0001(A0)
                lsr.b   #$03, D0
                andi.b  #$0C, D0
                move.b  D0, D3
                lea     (Offset_0x01D276), A1
                move.b  #$03, $001E(A0)
                bsr     Offset_0x01CD8E
                add.b   D3, $001A(A0)
                rts    
;-------------------------------------------------------------------------------
Offset_0x01CFB4:
                dc.w    Offset_0x01CFF6-Offset_0x01CFB4
                dc.w    Offset_0x01D000-Offset_0x01CFB4
                dc.w    Offset_0x01D00A-Offset_0x01CFB4
                dc.w    Offset_0x01D010-Offset_0x01CFB4
                dc.w    Offset_0x01D016-Offset_0x01CFB4
                dc.w    Offset_0x01D020-Offset_0x01CFB4
                dc.w    Offset_0x01D05E-Offset_0x01CFB4
                dc.w    Offset_0x01D076-Offset_0x01CFB4
                dc.w    Offset_0x01D07A-Offset_0x01CFB4
                dc.w    Offset_0x01D07E-Offset_0x01CFB4
                dc.w    Offset_0x01D084-Offset_0x01CFB4
                dc.w    Offset_0x01D088-Offset_0x01CFB4
                dc.w    Offset_0x01D08E-Offset_0x01CFB4
                dc.w    Offset_0x01D092-Offset_0x01CFB4
                dc.w    Offset_0x01D09A-Offset_0x01CFB4
                dc.w    Offset_0x01D09E-Offset_0x01CFB4
                dc.w    Offset_0x01D0A6-Offset_0x01CFB4
                dc.w    Offset_0x01D0B6-Offset_0x01CFB4
                dc.w    Offset_0x01D0BA-Offset_0x01CFB4
                dc.w    Offset_0x01D0C0-Offset_0x01CFB4
                dc.w    Offset_0x01D0C6-Offset_0x01CFB4
                dc.w    Offset_0x01D0CA-Offset_0x01CFB4
                dc.w    Offset_0x01D0D2-Offset_0x01CFB4
                dc.w    Offset_0x01D0D6-Offset_0x01CFB4
                dc.w    Offset_0x01D0DA-Offset_0x01CFB4
                dc.w    Offset_0x01D0DE-Offset_0x01CFB4
                dc.w    Offset_0x01D0E2-Offset_0x01CFB4
                dc.w    Offset_0x01D0E6-Offset_0x01CFB4
                dc.w    Offset_0x01D0EA-Offset_0x01CFB4
                dc.w    Offset_0x01D0EE-Offset_0x01CFB4
                dc.w    Offset_0x01D0F8-Offset_0x01CFB4
                dc.w    Offset_0x01D102-Offset_0x01CFB4
                dc.w    Offset_0x01D10C-Offset_0x01CFB4
Offset_0x01CFF6:
                dc.b    $FF, $10, $11, $12, $13, $14, $15, $0E, $0F, $FF
Offset_0x01D000:
                dc.b    $FF, $2E, $2F, $30, $31, $FF, $FF, $FF, $FF, $FF
Offset_0x01D00A:
                dc.b    $01, $48, $47, $46, $FF, $00
Offset_0x01D010:
                dc.b    $01, $48, $47, $46, $FF, $00
Offset_0x01D016:
                dc.b    $FD, $63, $64, $65, $66, $FF, $FF, $FF, $FF, $FF
Offset_0x01D020:
                dc.b    $07, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $02, $01, $01, $01
                dc.b    $01, $01, $01, $01, $01, $03, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01
                dc.b    $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
                dc.b    $06, $07, $08, $07, $08, $07, $08, $07, $08, $07, $08, $06, $FE, $1C
Offset_0x01D05E:
                dc.b    $09, $69, $69, $6A, $6A, $69, $69, $6A, $6A, $69, $69, $6A, $6A, $69, $69, $6A
                dc.b    $6A, $69, $69, $6A, $6A, $69, $6A, $FF
Offset_0x01D076:
                dc.b    $3F, $04, $FF, $00
Offset_0x01D07A:
                dc.b    $3F, $5B, $FF, $00
Offset_0x01D07E:
                dc.b    $00, $60, $61, $62, $FF, $00
Offset_0x01D084:
                dc.b    $3F, $82, $FF, $00
Offset_0x01D088:
                dc.b    $07, $08, $08, $09, $FD, $05
Offset_0x01D08E:
                dc.b    $07, $09, $FD, $05
Offset_0x01D092:
                dc.b    $07, $67, $68, $67, $68, $FD, $00, $00
Offset_0x01D09A:
                dc.b    $09, $6E, $73, $FF
Offset_0x01D09E:
                dc.b    $09, $6E, $6F, $70, $71, $72, $FF, $00
Offset_0x01D0A6:
                dc.b    $03, $59, $5A, $59, $5A, $59, $5A, $59, $5A, $59, $5A, $59, $5A, $FD, $00, $00
Offset_0x01D0B6:
                dc.b    $05, $6C, $6D, $FF
Offset_0x01D0BA:
                dc.b    $0F, $01, $02, $03, $FE, $01
Offset_0x01D0C0:
                dc.b    $0F, $01, $02, $FE, $01, $00
Offset_0x01D0C6:
                dc.b    $13, $85, $86, $FF
Offset_0x01D0CA:
                dc.b    $0B, $74, $74, $12, $13, $FD, $00, $00
Offset_0x01D0D2:
                dc.b    $20, $5D, $FF, $00
Offset_0x01D0D6:
                dc.b    $2F, $5D, $FF, $00
Offset_0x01D0DA:
                dc.b    $03, $5D, $FF, $00
Offset_0x01D0DE:
                dc.b    $03, $5D, $FF, $00
Offset_0x01D0E2:
                dc.b    $03, $5C, $FF, $00
Offset_0x01D0E6:
                dc.b    $09, $6B, $5C, $FF
Offset_0x01D0EA:
                dc.b    $77, $00, $FD, $00
Offset_0x01D0EE:
                dc.b    $03, $01, $02, $03, $04, $05, $06, $07, $08, $FF
Offset_0x01D0F8:
                dc.b    $03, $01, $02, $03, $04, $05, $06, $07, $08, $FF
Offset_0x01D102:
                dc.b    $FF, $32, $33, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Offset_0x01D10C:
                dc.b    $01, $5E, $5F, $FF      
;===============================================================================
; Sub Rotina Load_Miles_Tail_Dynamic_PLC - Rotina para carregar os Sprites do 
; [ Início ]                               rabo do Miles
;===============================================================================  
Load_Miles_Tail_Dynamic_PLC: ; Offset_0x01D110:
                moveq   #$00, D0
                move.b  $001A(A0), D0
                cmp.b   ($FFFFF7DF).w, D0
                beq.s   Offset_0x01D18A
                move.b  D0, ($FFFFF7DF).w
                lea     (Miles_Dyn_Script), A2                 ; Offset_0x07446C
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x01D18A
                move.w  #$F600, D4
                bra.s   Loop_Load_Miles_Sprites                ; Offset_0x01D15E
;===============================================================================
; Sub Rotina Load_Miles_Tail_Dynamic_PLC - Rotina para carregar os Sprites do 
; [ Término ]                              rabo do Miles
;===============================================================================

;===============================================================================
; Sub Rotina Load_Miles_Dynamic_PLC - Rotina para carregar os Sprites do Miles
; [ Início ]                            
;===============================================================================                  
Load_Miles_Dynamic_PLC: ; Offset_0x01D138:
                moveq   #$00, D0
                move.b  $001A(A0), D0
Load_Miles_Dynamic_PLC_D0: ; Offset_0x01D13E:                  
                cmp.b   ($FFFFF7DE).w, D0
                beq.s   Offset_0x01D18A
                move.b  D0, ($FFFFF7DE).w
                lea     (Miles_Dyn_Script), A2                 ; Offset_0x07446C
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x01D18A
                move.w  #$F400, D4
Loop_Load_Miles_Sprites: ; Offset_0x01D15E:                
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.l   #$05, D1
                addi.l  #Miles_Sprites, D1                     ; Offset_0x064320
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x00140A
                dbra    D5, Loop_Load_Miles_Sprites ; Offset_0x01D15E
Offset_0x01D18A:                
                rts  
;===============================================================================
; Sub Rotina Load_Miles_Dynamic_PLC - Rotina para carregar os Sprites do Miles
; [ Término ]                            
;===============================================================================                
                                                                                                                                                                                 
;===============================================================================
; Objeto 0x02 - Miles / Tails
; [ Término ]
;===============================================================================  