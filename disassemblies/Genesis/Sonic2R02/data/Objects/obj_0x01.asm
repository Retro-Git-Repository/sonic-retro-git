;===============================================================================
; Objeto 0x01 - Sonic
; [ Início ]
;===============================================================================
Offset_0x019EBE:                                    
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                beq.s   Obj_Sonic                              ; Offset_0x019ECA
                jmp     (Debug_Mode)                           ; Offset_0x0417C8
Obj_Sonic: ; Offset_0x019ECA:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Sonic_Index(PC, D0), D1                ; Offset_0x019ED8
                jmp     Sonic_Index(PC, D1)                    ; Offset_0x019ED8
Sonic_Index: ; Offset_0x019ED8:
                dc.w    Sonic_Main-Sonic_Index                 ; Offset_0x019EE4
                dc.w    Sonic_Control-Sonic_Index              ; Offset_0x019F9A
                dc.w    Sonic_Hurt-Sonic_Index                 ; Offset_0x01B092
                dc.w    Sonic_Death-Sonic_Index                ; Offset_0x01B158
                dc.w    Sonic_ResetLevel-Sonic_Index           ; Offset_0x01B28E
                dc.w    Sonic_Respawning-Sonic_Index           ; Offset_0x01B2A2    
;===============================================================================
; Sub Rotina Sonic_Main
; [ Início ]
;===============================================================================                  
Sonic_Main: ; Offset_0x019EE4:
                addq.b  #$02, $0024(A0)
                move.b  #$13, $0016(A0)
                move.b  #$09, $0017(A0)
                move.l  #Sonic_Mappings, $0004(A0)             ; Offset_0x06FBE0
                move.b  #$02, $0018(A0)
                move.b  #$18, $0019(A0)
                move.b  #$04, $0001(A0)
                move.w  #$0600, ($FFFFF760).w
                move.w  #$000C, ($FFFFF762).w
                move.w  #$0080, ($FFFFF764).w
                tst.b   ($FFFFFE30).w
                bne.s   Offset_0x019F54
                move.w  #$0780, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$0C, $003E(A0)
                move.b  #$0D, $003F(A0)
                move.w  $0008(A0), ($FFFFFE32).w
                move.w  $000C(A0), ($FFFFFE34).w
                move.w  $0002(A0), ($FFFFFE3C).w
                move.w  $003E(A0), ($FFFFFE3E).w
Offset_0x019F54:
                move.b  #$00, $002C(A0)
                move.b  #$04, $002D(A0)
                move.b  #$00, (Super_Sonic_Flag).w                   ; $FFFFFE19
                move.b  #$1E, $0028(A0)
                subi.w  #$0020, $0008(A0)
                addq.w  #$04, $000C(A0)
                move.w  #$0000, ($FFFFEED2).w
                move.w  #$003F, D2
Offset_0x019F80:
                bsr     CopySonicMovesForMiles                 ; Offset_0x01A0C6
                subq.w  #$04, A1
                move.l  #$00000000, (A1)
                dbra    D2, Offset_0x019F80
                addi.w  #$0020, $0008(A0)
                subq.w  #$04, $000C(A0)
;===============================================================================
; Sub Rotina Sonic_Main
; [ Término ]
;===============================================================================                  
                
;===============================================================================
; Sub Rotina Sonic_Control
; [ Início ]
;===============================================================================                  
Sonic_Control: ; Offset_0x019F9A:
                tst.w   (Debug_Mode_Active).w                        ; $FFFFFFDA
                beq.s   No_Debug_Mode                          ; Offset_0x019FB4
                btst    #$04, ($FFFFF605).w
                beq.s   No_Debug_Mode                          ; Offset_0x019FB4
                move.w  #$0001, ($FFFFFE08).w
                clr.b   ($FFFFF7CC).w
                rts
No_Debug_Mode: ; Offset_0x019FB4:
                tst.b   ($FFFFF7CC).w
                bne.s   Offset_0x019FC0
                move.w  ($FFFFF604).w, ($FFFFF602).w
Offset_0x019FC0:
                btst    #$00, $002A(A0)
                bne.s   Offset_0x019FDA
                moveq   #$00, D0
                move.b  $0022(A0), D0
                andi.w  #$0006, D0
                move.w  Sonic_Modes(PC, D0), D1                ; Offset_0x01A028
                jsr     Sonic_Modes(PC, D1)                    ; Offset_0x01A028
Offset_0x019FDA:
                cmpi.w  #$FF00, ($FFFFEECC).w
                bne.s   Offset_0x019FE8
                andi.w  #$07FF, $000C(A0)
Offset_0x019FE8:
                bsr.s   Sonic_Display                          ; Offset_0x01A030
                bsr     Process_Super_Sonic                    ; Offset_0x01AB18
                bsr     CopySonicMovesForMiles                 ; Offset_0x01A0C6
                bsr     Sonic_Water                            ; Offset_0x01A0F0
                move.b  ($FFFFF768).w, $0036(A0)
                move.b  ($FFFFF76A).w, $0037(A0)
                tst.b   ($FFFFF7C7).w
                beq.s   Offset_0x01A014
                tst.b   $001C(A0)
                bne.s   Offset_0x01A014
                move.b  $001D(A0), $001C(A0)
Offset_0x01A014:
                bsr     Sonic_Animate                          ; Offset_0x01B2C2
                tst.b   $002A(A0)
                bmi.s   Offset_0x01A024
                jsr     (TouchResponse)                        ; Offset_0x03F2BC
Offset_0x01A024:
                bra     Load_Sonic_Dynamic_PLC                 ; Offset_0x01B7C4  
Sonic_Modes: ; Offset_0x01A028:
                dc.w    Sonic_MdNormal-Sonic_Modes             ; Offset_0x01A1D8
                dc.w    Sonic_MdJump-Sonic_Modes               ; Offset_0x01A24A
                dc.w    Sonic_MdRoll-Sonic_Modes               ; Offset_0x01A274
                dc.w    Sonic_MdJump2-Sonic_Modes              ; Offset_0x01A29A
;===============================================================================
; Sub Rotina Sonic_Control
; [ Término ]
;===============================================================================  
                
;=============================================================================== 
; Sub Rotina Sonic_Display
; [ Início ]                         
;===============================================================================   
Sonic_Display: ; Offset_0x01A030:
                move.w  $0030(A0), D0
                beq.s   Offset_0x01A03E
                subq.w  #$01, $0030(A0)
                lsr.w   #$03, D0
                bcc.s   Offset_0x01A044
Offset_0x01A03E:
                jsr     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01A044:
                btst    #$01, $002B(A0)
                beq.s   Offset_0x01A076
                tst.w   $0032(A0)
                beq.s   Offset_0x01A076
                subq.w  #$01, $0032(A0)
                bne.s   Offset_0x01A076
                tst.b   ($FFFFF7AA).w
                bne.s   Offset_0x01A070
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01A070
                move.w  (Level_Music_Buffer).w, D0                   ; $FFFFFF70
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x01A070:
                bclr    #$01, $002B(A0)
Offset_0x01A076:
                btst    #$02, $002B(A0)
                beq.s   Offset_0x01A0C4
                tst.w   $0034(A0)
                beq.s   Offset_0x01A0C4
                subq.w  #$01, $0034(A0)
                bne.s   Offset_0x01A0C4
                move.w  #$0600, ($FFFFF760).w
                move.w  #$000C, ($FFFFF762).w
                move.w  #$0080, ($FFFFF764).w
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                beq.s   Offset_0x01A0B4
                move.w  #$0A00, ($FFFFF760).w
                move.w  #$0030, ($FFFFF762).w
                move.w  #$0100, ($FFFFF764).w
Offset_0x01A0B4:
                bclr    #$02, $002B(A0)
                move.w  #Normal_Sound, D0       ; $00FC
                jmp     (Play_Music)                           ; Offset_0x00131A
Offset_0x01A0C4:
                rts
;=============================================================================== 
; Sub Rotina Sonic_Display
; [ Término ]                         
;===============================================================================
                 
;=============================================================================== 
; Sub Rotina CopySonicMovesForMiles
; [ Início ]                         
;===============================================================================                  
CopySonicMovesForMiles: ; Offset_0x01A0C6:
                move.w  ($FFFFEED2).w, D0
                lea     ($FFFFE500).w, A1
                lea     $00(A1, D0), A1
                move.w  $0008(A0), (A1)+
                move.w  $000C(A0), (A1)+
                addq.b  #$04, ($FFFFEED3).w
                lea     ($FFFFE400).w, A1
                lea     $00(A1, D0), A1
                move.w  ($FFFFF602).w, (A1)+
                move.w  $0022(A0), (A1)+
                rts
;=============================================================================== 
; Sub Rotina CopySonicMovesForMiles
; [ Término ]                         
;===============================================================================
                  
;=============================================================================== 
; Sub Rotina Sonic_Water
; [ Início ]                         
;===============================================================================     
Sonic_Water: ; Offset_0x01A0F0:
                tst.b   (Water_Level_Flag).w                         ; $FFFFF730
                bne.s   Sonic_InLevelWithWater                 ; Offset_0x01A0F8
Offset_0x01A0F6:
                rts
Sonic_InLevelWithWater: ; Offset_0x01A0F8:
                move.w  ($FFFFF646).w, D0
                cmp.w   $000C(A0), D0
                bge.s   Sonic_NotInWater                       ; Offset_0x01A168
                bset    #$06, $0022(A0)
                bne.s   Offset_0x01A0F6
                move.l  A0, A1
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                move.b  #$0A, ($FFFFD080).w
                move.b  #$81, ($FFFFD0A8).w
                move.l  A0, ($FFFFD0BC).w
                move.w  #$0300, ($FFFFF760).w
                move.w  #$0006, ($FFFFF762).w
                move.w  #$0040, ($FFFFF764).w
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                beq.s   Offset_0x01A14A
                move.w  #$0500, ($FFFFF760).w
                move.w  #$0018, ($FFFFF762).w
                move.w  #$0080, ($FFFFF764).w
Offset_0x01A14A:
                asr.w   $0010(A0)
                asr.w   $0012(A0)
                asr.w   $0012(A0)
                beq.s   Offset_0x01A0F6
                move.w  #$0100, ($FFFFD11C).w
                move.w  #Water_Splash_Sfx, D0   ; $00AA
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;===============================================================================                 
Sonic_NotInWater: ; Offset_0x01A168:
                bclr    #$06, $0022(A0)
                beq.s   Offset_0x01A0F6
                move.l  A0, A1
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                move.w  #$0600, ($FFFFF760).w
                move.w  #$000C, ($FFFFF762).w
                move.w  #$0080, ($FFFFF764).w
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                beq.s   Offset_0x01A1A0
                move.w  #$0A00, ($FFFFF760).w
                move.w  #$0030, ($FFFFF762).w
                move.w  #$0100, ($FFFFF764).w
Offset_0x01A1A0:
                cmpi.b  #$04, $0024(A0)
                beq.s   Offset_0x01A1AC
                asl.w   $0012(A0)
Offset_0x01A1AC:
                tst.w   $0012(A0)
                beq     Offset_0x01A0F6
                move.w  #$0100, ($FFFFD11C).w
                move.l  A0, A1
                bsr     ResumeMusic                            ; Offset_0x01D7AA
                cmpi.w  #$F000, $0012(A0)
                bgt.s   Offset_0x01A1CE
                move.w  #$F000, $0012(A0)
Offset_0x01A1CE:
                move.w  #Water_Splash_Sfx, D0   ; $00AA
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;=============================================================================== 
; Sub Rotina Sonic_Water
; [ Término ]                         
;===============================================================================                 

;=============================================================================== 
; Sub Rotina Sonic_MdNormal
; [ Início ]                         
;=============================================================================== 
Sonic_MdNormal: ; Offset_0x01A1D8:
                move.b  ($FFFFF603).w, D0
                andi.b  #$70, D0
                bne.s   Offset_0x01A222
                cmpi.b  #$0A, $001C(A0)
                beq.s   Offset_0x01A248
                cmpi.b  #$0B, $001C(A0)
                beq.s   Offset_0x01A248
                cmpi.b  #$05, $001C(A0)
                bne.s   Offset_0x01A222
                cmpi.b  #$1E, $001B(A0)
                bcs.s   Offset_0x01A222
                move.b  ($FFFFF602).w, D0
                andi.b  #$7F, D0
                beq.s   Offset_0x01A248
                move.b  #$0A, $001C(A0)
                cmpi.b  #$AC, $001B(A0)
                bcs.s   Offset_0x01A248
                move.b  #$0B, $001C(A0)
                bra.s   Offset_0x01A248
Offset_0x01A222:
                bsr     Sonic_Spindash                         ; Offset_0x01ABB0
                bsr     Sonic_Jump                             ; Offset_0x01A9A4
                bsr     Sonic_SlopeResist                      ; Offset_0x01AD08
                bsr     Sonic_Move                             ; Offset_0x01A2C4
                bsr     Sonic_Roll                             ; Offset_0x01A93E
                bsr     Sonic_LevelBoundaries                  ; Offset_0x01A8DE
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
                bsr     Sonic_SlopeRepel                       ; Offset_0x01AD7A      
Offset_0x01A248:
                rts
;=============================================================================== 
; Sub Rotina Sonic_MdNormal
; [ Término ]                         
;===============================================================================
  
;=============================================================================== 
; Sub Rotina Sonic_MdJump
; [ Início ]                         
;=============================================================================== 
Sonic_MdJump: ; Offset_0x01A24A:
                bsr     Sonic_JumpHeight                       ; Offset_0x01AA5C
                bsr     Sonic_ChgJumpDir                       ; Offset_0x01A852
                bsr     Sonic_LevelBoundaries                  ; Offset_0x01A8DE
                jsr     (ObjectFall)                           ; Offset_0x016306
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01A26A
                subi.w  #$0028, $0012(A0)
Offset_0x01A26A:
                bsr     Sonic_JumpAngle                        ; Offset_0x01ADBC
                bsr     Sonic_Floor                            ; Offset_0x01AE1C
                rts
;=============================================================================== 
; Sub Rotina Sonic_MdJump
; [ Término ]                         
;===============================================================================                 
                
;=============================================================================== 
; Sub Rotina Sonic_MdRoll
; [ Início ]                         
;===============================================================================                 
Sonic_MdRoll: ; Offset_0x01A274:
                tst.b   $0039(A0)
                bne.s   Offset_0x01A27E
                bsr     Sonic_Jump                             ; Offset_0x01A9A4
Offset_0x01A27E:
                bsr     Sonic_RollRepel                        ; Offset_0x01AD3E
                bsr     Sonic_RollSpeed                        ; Offset_0x01A730
                bsr     Sonic_LevelBoundaries                  ; Offset_0x01A8DE
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
                bsr     Sonic_SlopeRepel                       ; Offset_0x01AD7A
                rts
;=============================================================================== 
; Sub Rotina Sonic_MdRoll
; [ Término ]                         
;===============================================================================
                 
;=============================================================================== 
; Sub Rotina Sonic_MdJump2
; [ Início ]                         
;===============================================================================  
Sonic_MdJump2: ; Offset_0x01A29A:
                bsr     Sonic_JumpHeight                       ; Offset_0x01AA5C
                bsr     Sonic_ChgJumpDir                       ; Offset_0x01A852
                bsr     Sonic_LevelBoundaries                  ; Offset_0x01A8DE
                jsr     (ObjectFall)                           ; Offset_0x016306
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01A2BA
                subi.w  #$0028, $0012(A0)
Offset_0x01A2BA:
                bsr     Sonic_JumpAngle                        ; Offset_0x01ADBC
                bsr     Sonic_Floor                            ; Offset_0x01AE1C
                rts
;=============================================================================== 
; Sub Rotina Sonic_MdJump2
; [ Término ]                         
;===============================================================================
                 
;=============================================================================== 
; Sub Rotina Sonic_Move
; [ Início ]                         
;===============================================================================                  
Sonic_Move: ; Offset_0x01A2C4:
                move.w  ($FFFFF760).w, D6
                move.w  ($FFFFF762).w, D5
                move.w  ($FFFFF764).w, D4
                tst.b   $002B(A0)
                bmi     Offset_0x01A59A
                tst.w   $002E(A0)
                bne     Offset_0x01A54A
                btst    #$02, ($FFFFF602).w
                beq.s   Offset_0x01A2EC
                bsr     Offset_0x01A62A
Offset_0x01A2EC:
                btst    #$03, ($FFFFF602).w
                beq.s   Offset_0x01A2F8
                bsr     Offset_0x01A6B0
Offset_0x01A2F8:
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne     Offset_0x01A54A
                tst.w   $0014(A0)
                bne     Offset_0x01A54A
                bclr    #$05, $0022(A0)
                move.b  #$05, $001C(A0)
                btst    #$03, $0022(A0)
                beq     Offset_0x01A3F6
                moveq   #$00, D0
                move.b  $003D(A0), D0
                lsl.w   #$06, D0
                lea     ($FFFFB000).w, A1
                lea     $00(A1, D0), A1
                tst.b   $0022(A1)
                bmi     Offset_0x01A4EE
                moveq   #$00, D1
                move.b  $0019(A1), D1
                move.w  D1, D2
                add.w   D2, D2
                subq.w  #$02, D2
                add.w   $0008(A0), D1
                sub.w   $0008(A1), D1
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                bne     Offset_0x01A368
                cmpi.w  #$0002, D1
                blt.s   Offset_0x01A3B8
                cmp.w   D2, D1
                bge.s   Offset_0x01A37A
                bra     Offset_0x01A4EE
Offset_0x01A368:
                cmpi.w  #$0002, D1
                blt     Offset_0x01A4E0
                cmp.w   D2, D1
                bge     Offset_0x01A4D0
                bra     Offset_0x01A4EE
Offset_0x01A37A:
                btst    #$00, $0022(A0)
                bne.s   Offset_0x01A39A
                move.b  #$06, $001C(A0)
                addq.w  #$06, D2
                cmp.w   D2, D1
                blt     Offset_0x01A54A
                move.b  #$0C, $001C(A0)
                bra     Offset_0x01A54A
Offset_0x01A39A:
                move.b  #$1D, $001C(A0)
                addq.w  #$06, D2
                cmp.w   D2, D1
                blt     Offset_0x01A54A
                move.b  #$1E, $001C(A0)
                bclr    #$00, $0022(A0)
                bra     Offset_0x01A54A
Offset_0x01A3B8:
                btst    #$00, $0022(A0)
                beq.s   Offset_0x01A3D8
                move.b  #$06, $001C(A0)
                cmpi.w  #$FFFC, D1
                bge     Offset_0x01A54A
                move.b  #$0C, $001C(A0)
                bra     Offset_0x01A54A
Offset_0x01A3D8:
                move.b  #$1D, $001C(A0)
                cmpi.w  #$FFFC, D1
                bge     Offset_0x01A54A
                move.b  #$1E, $001C(A0)
                bset    #$00, $0022(A0)
                bra     Offset_0x01A54A
Offset_0x01A3F6:
                jsr     (Player_HitFloor)                      ; Offset_0x01ECE6
                cmpi.w  #$000C, D1
                blt     Offset_0x01A4EE
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                bne     Offset_0x01A4C8
                cmpi.b  #$03, $0036(A0)
                bne.s   Offset_0x01A46A
                btst    #$00, $0022(A0)
                bne.s   Offset_0x01A440
                move.b  #$06, $001C(A0)
                move.w  $0008(A0), D3
                subq.w  #$06, D3
                jsr     (Player_HitFloor_D3)                   ; Offset_0x01ECEA
                cmpi.w  #$000C, D1                                   
                blt     Offset_0x01A54A
                move.b  #$0C, $001C(A0)
                bra     Offset_0x01A54A
Offset_0x01A440:
                move.b  #$1D, $001C(A0)
                move.w  $0008(A0), D3
                subq.w  #$06, D3
                jsr     (Player_HitFloor_D3)                   ; Offset_0x01ECEA
                cmpi.w  #$000C, D1
                blt     Offset_0x01A54A
                move.b  #$1E, $001C(A0)
                bclr    #$00, $0022(A0)
                bra     Offset_0x01A54A
Offset_0x01A46A:
                cmpi.b  #$03, $0037(A0)
                bne.s   Offset_0x01A4EE
                btst    #$00, $0022(A0)
                beq.s   Offset_0x01A49E
                move.b  #$06, $001C(A0)
                move.w  $0008(A0), D3
                addq.w  #$06, D3
                jsr     (Player_HitFloor_D3)                   ; Offset_0x01ECEA
                cmpi.w  #$000C, D1
                blt     Offset_0x01A54A
                move.b  #$0C, $001C(A0)
                bra     Offset_0x01A54A
Offset_0x01A49E:
                move.b  #$1D, $001C(A0)
                move.w  $0008(A0), D3
                addq.w  #$06, D3
                jsr     (Player_HitFloor_D3)                   ; Offset_0x01ECEA
                cmpi.w  #$000C, D1
                blt     Offset_0x01A54A
                move.b  #$1E, $001C(A0)
                bset    #$00, $0022(A0)
                bra     Offset_0x01A54A
Offset_0x01A4C8:
                cmpi.b  #$03, $0036(A0)
                bne.s   Offset_0x01A4D8
Offset_0x01A4D0:
                bclr    #$00, $0022(A0)
                bra.s   Offset_0x01A4E6
Offset_0x01A4D8:
                cmpi.b  #$03, $0037(A0)
                bne.s   Offset_0x01A4EE
Offset_0x01A4E0:
                bset    #$00, $0022(A0)
Offset_0x01A4E6:
                move.b  #$06, $001C(A0)
                bra.s   Offset_0x01A54A
Offset_0x01A4EE:
                btst    #$00, ($FFFFF602).w
                beq.s   Offset_0x01A51C
                move.b  #$07, $001C(A0)
                addq.w  #$01, ($FFFFF66C).w
                cmpi.w  #$0078, ($FFFFF66C).w
                bcs.s   Offset_0x01A550
                move.w  #$0078, ($FFFFF66C).w
                cmpi.w  #$00C8, ($FFFFEED8).w
                beq.s   Offset_0x01A562
                addq.w  #$02, ($FFFFEED8).w
                bra.s   Offset_0x01A562
Offset_0x01A51C:
                btst    #$01, ($FFFFF602).w
                beq.s   Offset_0x01A54A
                move.b  #$08, $001C(A0)
                addq.w  #$01, ($FFFFF66C).w
                cmpi.w  #$0078, ($FFFFF66C).w
                bcs.s   Offset_0x01A550
                move.w  #$0078, ($FFFFF66C).w
                cmpi.w  #$0008, ($FFFFEED8).w
                beq.s   Offset_0x01A562
                subq.w  #$02, ($FFFFEED8).w
                bra.s   Offset_0x01A562
Offset_0x01A54A:
                move.w  #$0000, ($FFFFF66C).w
Offset_0x01A550:
                cmpi.w  #$0060, ($FFFFEED8).w
                beq.s   Offset_0x01A562
                bcc.s   Offset_0x01A55E
                addq.w  #$04, ($FFFFEED8).w
Offset_0x01A55E:
                subq.w  #$02, ($FFFFEED8).w
Offset_0x01A562:
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                beq     Offset_0x01A56E
                move.w  #$000C, D5
Offset_0x01A56E:
                move.b  ($FFFFF602).w, D0
                andi.b  #$0C, D0
                bne.s   Offset_0x01A59A
                move.w  $0014(A0), D0
                beq.s   Offset_0x01A59A
                bmi.s   Offset_0x01A58E
                sub.w   D5, D0
                bcc.s   Offset_0x01A588
                move.w  #$0000, D0
Offset_0x01A588:
                move.w  D0, $0014(A0)
                bra.s   Offset_0x01A59A
Offset_0x01A58E:
                add.w   D5, D0
                bcc.s   Offset_0x01A596
                move.w  #$0000, D0
Offset_0x01A596:
                move.w  D0, $0014(A0)
Offset_0x01A59A:
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  $0014(A0), D1
                asr.l   #$08, D1
                move.w  D1, $0010(A0)
                muls.w  $0014(A0), D0
                asr.l   #$08, D0
                move.w  D0, $0012(A0)
Offset_0x01A5B8:
                move.b  $0026(A0), D0
                addi.b  #$40, D0
                bmi.s   Offset_0x01A628
                move.b  #$40, D1
                tst.w   $0014(A0)
                beq.s   Offset_0x01A628
                bmi.s   Offset_0x01A5D0
                neg.w   D1
Offset_0x01A5D0:
                move.b  $0026(A0), D0
                add.b   D1, D0
                move.w  D0, -(A7)
                bsr     Player_WalkSpeed                       ; Offset_0x01EB14
                move.w  (A7)+, D0
                tst.w   D1
                bpl.s   Offset_0x01A628
                asl.w   #$08, D1
                addi.b  #$20, D0
                andi.b  #$C0, D0
                beq.s   Offset_0x01A624
                cmpi.b  #$40, D0
                beq.s   Offset_0x01A612
                cmpi.b  #$80, D0
                beq.s   Offset_0x01A60C
                add.w   D1, $0010(A0)
                bset    #$05, $0022(A0)
                move.w  #$0000, $0014(A0)
                rts
Offset_0x01A60C:
                sub.w   D1, $0012(A0)
                rts
Offset_0x01A612:
                sub.w   D1, $0010(A0)
                bset    #$05, $0022(A0)
                move.w  #$0000, $0014(A0)
                rts
Offset_0x01A624:
                add.w   D1, $0012(A0)
Offset_0x01A628:
                rts
Offset_0x01A62A:
                move.w  $0014(A0), D0
                beq.s   Offset_0x01A632
                bpl.s   Offset_0x01A664
Offset_0x01A632:
                bset    #$00, $0022(A0)
                bne.s   Offset_0x01A646
                bclr    #$05, $0022(A0)
                move.b  #$01, $001D(A0)
Offset_0x01A646:
                sub.w   D5, D0
                move.w  D6, D1
                neg.w   D1
                cmp.w   D1, D0
                bgt.s   Offset_0x01A658
                add.w   D5, D0
                cmp.w   D1, D0
                ble.s   Offset_0x01A658
                move.w  D1, D0
Offset_0x01A658:
                move.w  D0, $0014(A0)
                move.b  #$00, $001C(A0)
                rts
Offset_0x01A664:
                sub.w   D4, D0
                bcc.s   Offset_0x01A66C
                move.w  #$FF80, D0
Offset_0x01A66C:
                move.w  D0, $0014(A0)
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne.s   Offset_0x01A6AE
                cmpi.w  #$0400, D0
                blt.s   Offset_0x01A6AE
                move.b  #$0D, $001C(A0)
                bclr    #$00, $0022(A0)
                move.w  #Stopping_Sfx, D0       ; $00A4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01A6AE
                move.b  #$06, ($FFFFD124).w
                move.b  #$15, ($FFFFD11A).w
Offset_0x01A6AE:
                rts
Offset_0x01A6B0:
                move.w  $0014(A0), D0
                bmi.s   Offset_0x01A6E4
                bclr    #$00, $0022(A0)
                beq.s   Offset_0x01A6CA
                bclr    #$05, $0022(A0)
                move.b  #$01, $001D(A0)
Offset_0x01A6CA:
                add.w   D5, D0
                cmp.w   D6, D0
                blt.s   Offset_0x01A6D8
                sub.w   D5, D0
                cmp.w   D6, D0
                bge.s   Offset_0x01A6D8
                move.w  D6, D0
Offset_0x01A6D8:
                move.w  D0, $0014(A0)
                move.b  #$00, $001C(A0)
                rts
Offset_0x01A6E4:
                add.w   D4, D0
                bcc.s   Offset_0x01A6EC
                move.w  #$0080, D0
Offset_0x01A6EC:
                move.w  D0, $0014(A0)
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                bne.s   Offset_0x01A72E
                cmpi.w  #$FC00, D0
                bgt.s   Offset_0x01A72E
                move.b  #$0D, $001C(A0)
                bset    #$00, $0022(A0)
                move.w  #Stopping_Sfx, D0       ; $00A4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01A72E
                move.b  #$06, ($FFFFD124).w
                move.b  #$15, ($FFFFD11A).w
Offset_0x01A72E:
                rts
;=============================================================================== 
; Sub Rotina Sonic_Move
; [ Término ]                         
;===============================================================================    
                   
;=============================================================================== 
; Sub Rotina Sonic_RollSpeed
; [ Início ]                         
;===============================================================================                           
Sonic_RollSpeed: ; Offset_0x01A730:
                move.w  ($FFFFF760).w, D6
                asl.w   #$01, D6
                move.w  ($FFFFF762).w, D5
                asr.w   #$01, D5
                move.w  #$0020, D4
                tst.b   $002B(A0)
                bmi     Offset_0x01A7C4
                tst.w   $002E(A0)
                bne.s   Offset_0x01A766
                btst    #$02, ($FFFFF602).w
                beq.s   Offset_0x01A75A
                bsr     Offset_0x01A80C
Offset_0x01A75A:
                btst    #$03, ($FFFFF602).w
                beq.s   Offset_0x01A766
                bsr     Offset_0x01A830
Offset_0x01A766:
                move.w  $0014(A0), D0
                beq.s   Offset_0x01A788
                bmi.s   Offset_0x01A77C
                sub.w   D5, D0
                bcc.s   Offset_0x01A776
                move.w  #$0000, D0
Offset_0x01A776:
                move.w  D0, $0014(A0)
                bra.s   Offset_0x01A788
Offset_0x01A77C:
                add.w   D5, D0
                bcc.s   Offset_0x01A784
                move.w  #$0000, D0
Offset_0x01A784:
                move.w  D0, $0014(A0)
Offset_0x01A788:
                tst.w   $0014(A0)
                bne.s   Offset_0x01A7C4
                tst.b   $0039(A0)
                bne.s   Offset_0x01A7B2
                bclr    #$02, $0022(A0)
                move.b  #$13, $0016(A0)
                move.b  #$09, $0017(A0)
                move.b  #$05, $001C(A0)
                subq.w  #$05, $000C(A0)
                bra.s   Offset_0x01A7C4
Offset_0x01A7B2:
                move.w  #$0400, $0014(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x01A7C4
                neg.w   $0014(A0)
Offset_0x01A7C4:
                cmpi.w  #$0060, ($FFFFEED8).w
                beq.s   Offset_0x01A7D6
                bcc.s   Offset_0x01A7D2
                addq.w  #$04, ($FFFFEED8).w
Offset_0x01A7D2:
                subq.w  #$02, ($FFFFEED8).w
Offset_0x01A7D6:
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  $0014(A0), D0
                asr.l   #$08, D0
                move.w  D0, $0012(A0)
                muls.w  $0014(A0), D1
                asr.l   #$08, D1
                cmpi.w  #$1000, D1
                ble.s   Offset_0x01A7FA
                move.w  #$1000, D1
Offset_0x01A7FA:
                cmpi.w  #$F000, D1
                bge.s   Offset_0x01A804
                move.w  #$F000, D1
Offset_0x01A804:
                move.w  D1, $0010(A0)
                bra     Offset_0x01A5B8
Offset_0x01A80C:
                move.w  $0014(A0), D0
                beq.s   Offset_0x01A814
                bpl.s   Offset_0x01A822
Offset_0x01A814:
                bset    #$00, $0022(A0)
                move.b  #$02, $001C(A0)
                rts
Offset_0x01A822:
                sub.w   D4, D0
                bcc.s   Offset_0x01A82A
                move.w  #$FF80, D0
Offset_0x01A82A:
                move.w  D0, $0014(A0)
                rts
Offset_0x01A830:
                move.w  $0014(A0), D0
                bmi.s   Offset_0x01A844
                bclr    #$00, $0022(A0)
                move.b  #$02, $001C(A0)
                rts
Offset_0x01A844:
                add.w   D4, D0
                bcc.s   Offset_0x01A84C
                move.w  #$0080, D0
Offset_0x01A84C:
                move.w  D0, $0014(A0)
                rts
;=============================================================================== 
; Sub Rotina Sonic_RollRight
; [ Término ]                         
;===============================================================================
                  
;=============================================================================== 
; Sub Rotina Sonic_ChgJumpDir
; [ Início ]                         
;===============================================================================             
Sonic_ChgJumpDir: ; Offset_0x01A852:
                move.w  ($FFFFF760).w, D6
                move.w  ($FFFFF762).w, D5
                asl.w   #$01, D5
                btst    #$04, $0022(A0)
                bne.s   Offset_0x01A89C
                move.w  $0010(A0), D0
                btst    #$02, ($FFFFF602).w
                beq.s   Offset_0x01A882
                bset    #$00, $0022(A0)
                sub.w   D5, D0
                move.w  D6, D1
                neg.w   D1
                cmp.w   D1, D0
                bgt.s   Offset_0x01A882
                move.w  D1, D0
Offset_0x01A882:
                btst    #$03, ($FFFFF602).w
                beq.s   Offset_0x01A898
                bclr    #$00, $0022(A0)
                add.w   D5, D0
                cmp.w   D6, D0
                blt.s   Offset_0x01A898
                move.w  D6, D0
Offset_0x01A898:
                move.w  D0, $0010(A0)
Offset_0x01A89C:
                cmpi.w  #$0060, ($FFFFEED8).w
                beq.s   Offset_0x01A8AE
                bcc.s   Offset_0x01A8AA
                addq.w  #$04, ($FFFFEED8).w
Offset_0x01A8AA:
                subq.w  #$02, ($FFFFEED8).w
Offset_0x01A8AE:
                cmpi.w  #$FC00, $0012(A0)
                bcs.s   Offset_0x01A8DC
                move.w  $0010(A0), D0
                move.w  D0, D1
                asr.w   #$05, D1
                beq.s   Offset_0x01A8DC
                bmi.s   Offset_0x01A8D0
                sub.w   D1, D0
                bcc.s   Offset_0x01A8CA
                move.w  #$0000, D0
Offset_0x01A8CA:
                move.w  D0, $0010(A0)
                rts
Offset_0x01A8D0:
                sub.w   D1, D0
                bcs.s   Offset_0x01A8D8
                move.w  #$0000, D0
Offset_0x01A8D8:
                move.w  D0, $0010(A0)
Offset_0x01A8DC:
                rts
;=============================================================================== 
; Sub Rotina Sonic_ChgJumpDir
; [ Término ]                         
;=============================================================================== 
                
;=============================================================================== 
; Sub Rotina Sonic_LevelBoundaries
; [ Início ]                         
;===============================================================================                               
Sonic_LevelBoundaries: ; Offset_0x01A8DE:
                move.l  $0008(A0), D1
                move.w  $0010(A0), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D1
                swap.w  D1
                move.w  ($FFFFEEC8).w, D0
                addi.w  #$0010, D0
                cmp.w   D1, D0
                bhi.s   Offset_0x01A926
                move.w  ($FFFFEECA).w, D0
                addi.w  #$0128, D0
                tst.b   ($FFFFF7AA).w
                bne.s   Offset_0x01A90C
                addi.w  #$0040, D0
Offset_0x01A90C:
                cmp.w   D1, D0
                bls.s   Offset_0x01A926
Offset_0x01A910:
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                blt.s   Offset_0x01A920
                rts
Offset_0x01A920:
                jmp     (Kill_Player)                          ; Offset_0x03F690
Offset_0x01A926:
                move.w  D0, $0008(A0)
                move.w  #$0000, $000A(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0014(A0)
                bra.s   Offset_0x01A910
;=============================================================================== 
; Sub Rotina Sonic_LevelBoundaries
; [ Término ]                         
;===============================================================================  
                
;=============================================================================== 
; Sub Routina Sonic_Roll
; [ Início ]                         
;===============================================================================                   
Sonic_Roll: ; Offset_0x01A93E:
                tst.b   $002B(A0)
                bmi.s   Offset_0x01A964
                move.w  $0014(A0), D0
                bpl.s   Offset_0x01A94C
                neg.w   D0
Offset_0x01A94C:
                cmpi.w  #$0080, D0
                bcs.s   Offset_0x01A964
                move.b  ($FFFFF602).w, D0
                andi.b  #$0C, D0
                bne.s   Offset_0x01A964
                btst    #$01, ($FFFFF602).w
                bne.s   Offset_0x01A966
Offset_0x01A964:
                rts
Offset_0x01A966:
                btst    #$02, $0022(A0)
                beq.s   Offset_0x01A970
                rts
Offset_0x01A970:
                bset    #$02, $0022(A0)
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.b  #$02, $001C(A0)
                addq.w  #$05, $000C(A0)
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                tst.w   $0014(A0)
                bne.s   Offset_0x01A9A2
                move.w  #$0200, $0014(A0)
Offset_0x01A9A2:
                rts
;=============================================================================== 
; Sub Rotina Sonic_Roll
; [ Término ]                         
;===============================================================================  
                
;=============================================================================== 
; Sub Rotina Sonic_Jump
; [ Início ]                         
;===============================================================================                
Sonic_Jump: ; Offset_0x01A9A4:
                move.b  ($FFFFF603).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01AA52
                moveq   #$00, D0
                move.b  $0026(A0), D0
                addi.b  #$80, D0
                bsr     CalcRoomOverHead                       ; Offset_0x01EB9A
                cmpi.w  #$0006, D1
                blt     Offset_0x01AA52
                move.w  #$0680, D2
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                beq.s   Offset_0x01A9D4
                move.w  #$0800, D2
Offset_0x01A9D4:
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01A9E0
                move.w  #$0380, D2
Offset_0x01A9E0:
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
                move.b  #$13, $0016(A0)
                move.b  #$09, $0017(A0)
                btst    #$02, $0022(A0)
                bne.s   Offset_0x01AA54
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.b  #$02, $001C(A0)
                bset    #$02, $0022(A0)
                addq.w  #$05, $000C(A0)
Offset_0x01AA52:
                rts
Offset_0x01AA54:
                bset    #$04, $0022(A0)
                rts
;=============================================================================== 
; Sub Rotina Sonic_Jump
; [ Término ]                         
;===============================================================================   

;=============================================================================== 
; Sub Rotina Sonic_JumpHeight
; [ Início ]                         
;===============================================================================   
Sonic_JumpHeight: ; Offset_0x01AA5C:
                tst.b   $003C(A0)
                beq.s   Offset_0x01AA8E
                move.w  #$FC00, D1
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01AA72
                move.w  #$FE00, D1
Offset_0x01AA72:
                cmp.w   $0012(A0), D1
                ble.s   Offset_0x01AA86
                move.b  ($FFFFF602).w, D0
                andi.b  #$70, D0
                bne.s   Offset_0x01AA86
                move.w  D1, $0012(A0)
Offset_0x01AA86:
                tst.b   $0012(A0)
                beq.s   Offset_0x01AAA4
                rts
Offset_0x01AA8E:
                tst.b   $0039(A0)
                bne.s   Offset_0x01AAA2
                cmpi.w  #$F040, $0012(A0)
                bge.s   Offset_0x01AAA2
                move.w  #$F040, $0012(A0)
Offset_0x01AAA2:
                rts
Offset_0x01AAA4:
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                bne.s   Offset_0x01AB16
                cmpi.b  #$07, ($FFFFFF91).w
                bne.s   Offset_0x01AB16
                cmpi.w  #$0032, ($FFFFFE20).w
                bcs.s   Offset_0x01AB16
                tst.b   ($FFFFFE1E).w
                beq.s   Offset_0x01AB16
                move.b  #$01, ($FFFFF65F).w
                move.b  #$0F, ($FFFFF65E).w
                move.b  #$01, ($FFFFFE19).w
                move.b  #$81, $002A(A0)
                move.b  #$1F, $001C(A0)
                move.b  #$7E, ($FFFFD040).w
                move.w  #$0A00, ($FFFFF760).w
                move.w  #$0030, ($FFFFF762).w
                move.w  #$0100, ($FFFFF764).w
                move.w  #$0000, $0032(A0)
                bset    #$01, $002B(A0)
                move.w  #Super_Sonic_Change_Sfx, D0 ; $00DF
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.w  #Super_Sonic_Snd, D0    ; $0096
                jmp     (Play_Music)                           ; Offset_0x00131A
Offset_0x01AB16:
                rts
;=============================================================================== 
; Sub Rotina Sonic_JumpHeight
; [ Término ]                         
;===============================================================================   

;=============================================================================== 
; Sub Rotina Process_Super_Sonic
; [ Início ]                         
;===============================================================================               
Process_Super_Sonic: ; Offset_0x01AB18:
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                beq     Offset_0x01ABAE
                tst.b   (HUD_Timer_Refresh_Flag).w                   ; $FFFFFE1E
                beq.s   Unload_Super_Sonic                     ; Offset_0x01AB64
                subq.w  #$01, ($FFFFF670).w
                bpl     Offset_0x01ABAE
                move.w  #$003C, ($FFFFF670).w
                tst.w   ($FFFFFE20).w
                beq.s   Unload_Super_Sonic                     ; Offset_0x01AB64
                ori.b   #$01, (HUD_Rings_Refresh_Flag).w             ; $FFFFFE1D
                cmpi.w  #$0001, ($FFFFFE20).w
                beq.s   Offset_0x01AB58
                cmpi.w  #$000A, ($FFFFFE20).w
                beq.s   Offset_0x01AB58
                cmpi.w  #$0064, ($FFFFFE20).w
                bne.s   Offset_0x01AB5E
Offset_0x01AB58:
                ori.b   #$80, ($FFFFFE1D).w
Offset_0x01AB5E:
                subq.w  #$01, ($FFFFFE20).w
                bne.s   Offset_0x01ABAE
Unload_Super_Sonic: ; Offset_0x01AB64:
                move.b  #$02, ($FFFFF65F).w
                move.w  #$0028, ($FFFFF65C).w
                move.b  #$00, (Super_Sonic_Flag).w                   ; $FFFFFE19
                move.b  #$01, $001D(A0)
                move.w  #$0001, $0032(A0)
                move.w  #$0600, ($FFFFF760).w
                move.w  #$000C, ($FFFFF762).w
                move.w  #$0080, ($FFFFF764).w
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01ABAE
                move.w  #$0300, ($FFFFF760).w
                move.w  #$0006, ($FFFFF762).w
                move.w  #$0040, ($FFFFF764).w
Offset_0x01ABAE:
                rts
;=============================================================================== 
; Sub Rotina Process_Super_Sonic
; [ Término ]                         
;===============================================================================                  
                
;=============================================================================== 
; Sub Rotinq Sonic_Spindash
; [ Início ]                         
;===============================================================================                                     
Sonic_Spindash: ; Offset_0x01ABB0:
                tst.b   $0039(A0)
                bne.s   Offset_0x01AC00
                cmpi.b  #$08, $001C(A0)
                bne.s   Offset_0x01ABFE
                move.b  ($FFFFF603).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01ABFE
                move.b  #$09, $001C(A0)
                move.w  #Spindash_Sfx, D0       ; $00E0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.l  #$04, A7
                move.b  #$01, $0039(A0)
                move.w  #$0000, $003A(A0)
                cmpi.b  #$0C, $0028(A0)
                bcs.s   Offset_0x01ABF6
                move.b  #$02, ($FFFFD11C).w
Offset_0x01ABF6:
                bsr     Sonic_LevelBoundaries                  ; Offset_0x01A8DE
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
Offset_0x01ABFE:
                rts
Offset_0x01AC00:
                move.b  ($FFFFF602).w, D0
                btst    #$01, D0
                bne     Offset_0x01ACA2
                move.b  #$0E, $0016(A0)
                move.b  #$07, $0017(A0)
                move.b  #$02, $001C(A0)
                addq.w  #$05, $000C(A0)
                move.b  #$00, $0039(A0)
                moveq   #$00, D0
                move.b  $003A(A0), D0
                add.w   D0, D0
                move.w  Sonic_Spindash_Speed(PC, D0), $0014(A0) ; Offset_0x01AC7E
                tst.b   (Super_Sonic_Flag).w                         ; $FFFFFE19
                beq.s   Offset_0x01AC42
                move.w  Super_Sonic_Spindash_Speed(PC, D0), $0014(A0) ; Offset_0x01AC90
Offset_0x01AC42:
                move.w  $0014(A0), D0
                subi.w  #$0800, D0
                add.w   D0, D0
                andi.w  #$1F00, D0
                neg.w   D0
                addi.w  #$2000, D0
                move.w  D0, ($FFFFEED0).w
                btst    #$00, $0022(A0)
                beq.s   Offset_0x01AC66
                neg.w   $0014(A0)
Offset_0x01AC66:
                bset    #$02, $0022(A0)
                move.b  #$00, ($FFFFD11C).w
                move.w  #Spindash_Release_Sfx, D0 ; $00BC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                bra.s   Offset_0x01ACEA 
;-------------------------------------------------------------------------------                  
Sonic_Spindash_Speed: ; Offset_0x01AC7E:
                dc.w    $0800, $0880, $0900, $0980, $0A00, $0A80, $0B00, $0B80
                dc.w    $0C00
;-------------------------------------------------------------------------------                  
Super_Sonic_Spindash_Speed: ; Offset_0x01AC90:                
                dc.w    $0B00, $0B80, $0C00, $0C80, $0D00, $0D80, $0E00, $0E80
                dc.w    $0F00  
;-------------------------------------------------------------------------------  
Offset_0x01ACA2:
                tst.w   $003A(A0)
                beq.s   Offset_0x01ACBA
                move.w  $003A(A0), D0
                lsr.w   #$05, D0
                sub.w   D0, $003A(A0)
                bcc.s   Offset_0x01ACBA
                move.w  #$0000, $003A(A0)
Offset_0x01ACBA:
                move.b  ($FFFFF603).w, D0
                andi.b  #$70, D0
                beq     Offset_0x01ACEA
                move.w  #$0900, $001C(A0)
                move.w  #Spindash_Sfx, D0       ; $00E0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addi.w  #$0200, $003A(A0)
                cmpi.w  #$0800, $003A(A0)
                bcs.s   Offset_0x01ACEA
                move.w  #$0800, $003A(A0)
Offset_0x01ACEA:
                addq.l  #$04, A7
                cmpi.w  #$0060, ($FFFFEED8).w
                beq.s   Offset_0x01ACFE
                bcc.s   Offset_0x01ACFA
                addq.w  #$04, ($FFFFEED8).w
Offset_0x01ACFA:
                subq.w  #$02, ($FFFFEED8).w
Offset_0x01ACFE:
                bsr     Sonic_LevelBoundaries                  ; Offset_0x01A8DE
                bsr     Player_AnglePos                        ; Offset_0x01E1C6
                rts
;=============================================================================== 
; Sub Rotina Sonic_Spindash
; [ Término ]                         
;===============================================================================
                
;=============================================================================== 
; Sub Rotina Sonic_SlopeResist
; [ Início ]                         
;===============================================================================                      
Sonic_SlopeResist: ; Offset_0x01AD08:
                move.b  $0026(A0), D0
                addi.b  #$60, D0
                cmpi.b  #$C0, D0
                bcc.s   Offset_0x01AD3C
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0020, D0
                asr.l   #$08, D0
                tst.w   $0014(A0)
                beq.s   Offset_0x01AD3C
                bmi.s   Offset_0x01AD38
                tst.w   D0
                beq.s   Offset_0x01AD36
                add.w   D0, $0014(A0)
Offset_0x01AD36:
                rts
Offset_0x01AD38:
                add.w   D0, $0014(A0)
Offset_0x01AD3C:
                rts
;=============================================================================== 
; Sub Rotina Sonic_SlopeResist
; [ Término ]                         
;=============================================================================== 
                
;=============================================================================== 
; Sub Rotina Sonic_RollRepel
; [ Início ]                         
;===============================================================================  
Sonic_RollRepel: ; Offset_0x01AD3E:
                move.b  $0026(A0), D0
                addi.b  #$60, D0
                cmpi.b  #$C0, D0
                bcc.s   Offset_0x01AD78
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0050, D0
                asr.l   #$08, D0
                tst.w   $0014(A0)
                bmi.s   Offset_0x01AD6E
                tst.w   D0
                bpl.s   Offset_0x01AD68
                asr.l   #$02, D0
Offset_0x01AD68:
                add.w   D0, $0014(A0)
                rts
Offset_0x01AD6E:
                tst.w   D0
                bmi.s   Offset_0x01AD74
                asr.l   #$02, D0
Offset_0x01AD74:
                add.w   D0, $0014(A0)
Offset_0x01AD78:
                rts
;=============================================================================== 
; Sub Rotina Sonic_RollRepel
; [ Término ]                         
;===============================================================================

;=============================================================================== 
; Sub Rotina Sonic_SlopeRepel
; [ Início ]                         
;=============================================================================== 
Sonic_SlopeRepel: ; Offset_0x01AD7A:
                nop
                tst.b   $0038(A0)
                bne.s   Offset_0x01ADB4
                tst.w   $002E(A0)
                bne.s   Offset_0x01ADB6
                move.b  $0026(A0), D0
                addi.b  #$20, D0
                andi.b  #$C0, D0
                beq.s   Offset_0x01ADB4
                move.w  $0014(A0), D0
                bpl.s   Offset_0x01AD9E
                neg.w   D0
Offset_0x01AD9E:
                cmpi.w  #$0280, D0
                bcc.s   Offset_0x01ADB4
                clr.w   $0014(A0)
                bset    #$01, $0022(A0)
                move.w  #$001E, $002E(A0)
Offset_0x01ADB4:
                rts
Offset_0x01ADB6:
                subq.w  #$01, $002E(A0)
                rts
;=============================================================================== 
; Sub Rotina Sonic_SlopeRepel
; [ Término ]                         
;===============================================================================  

;=============================================================================== 
; Sub Rotina Sonic_JumpAngle
; [ Início ]                         
;===============================================================================                 
Sonic_JumpAngle: ; Offset_0x01ADBC:
                move.b  $0026(A0), D0
                beq.s   Offset_0x01ADD6
                bpl.s   Offset_0x01ADCC
                addq.b  #$02, D0
                bcc.s   Offset_0x01ADCA
                moveq   #$00, D0
Offset_0x01ADCA:
                bra.s   Offset_0x01ADD2
Offset_0x01ADCC:
                subq.b  #$02, D0
                bcc.s   Offset_0x01ADD2
                moveq   #$00, D0
Offset_0x01ADD2:
                move.b  D0, $0026(A0)
Offset_0x01ADD6:
                move.b  $0027(A0), D0
                beq.s   Offset_0x01AE1A
                tst.w   $0014(A0)
                bmi.s   Offset_0x01ADFA
Offset_0x01ADE2:
                move.b  $002D(A0), D1
                add.b   D1, D0
                bcc.s   Offset_0x01ADF8
                subq.b  #$01, $002C(A0)
                bcc.s   Offset_0x01ADF8
                move.b  #$00, $002C(A0)
                moveq   #$00, D0
Offset_0x01ADF8:
                bra.s   Offset_0x01AE16
Offset_0x01ADFA:
                tst.b   $0029(A0)
                bne.s   Offset_0x01ADE2
                move.b  $002D(A0), D1
                sub.b   D1, D0
                bcc.s   Offset_0x01AE16
                subq.b  #$01, $002C(A0)
                bcc.s   Offset_0x01AE16
                move.b  #$00, $002C(A0)
                moveq   #$00, D0
Offset_0x01AE16:
                move.b  D0, $0027(A0)
Offset_0x01AE1A:
                rts
;=============================================================================== 
; Sub Rotina Sonic_JumpAngle
; [ Término ]                         
;=============================================================================== 

;=============================================================================== 
; Sub Rotina Sonic_Floor
; [ Início ]                         
;=============================================================================== 
Sonic_Floor: ; Offset_0x01AE1C:
                move.l  #$FFFFD600, ($FFFFF796).w
                cmpi.b  #$0C, $003E(A0)
                beq.s   Offset_0x01AE34
                move.l  #$FFFFD900, ($FFFFF796).w
Offset_0x01AE34:
                move.b  $003F(A0), D5
                move.w  $0010(A0), D1
                move.w  $0012(A0), D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                subi.b  #$20, D0
                andi.b  #$C0, D0
                cmpi.b  #$40, D0
                beq     Offset_0x01AEFE
                cmpi.b  #$80, D0
                beq     Offset_0x01AF5A
                cmpi.b  #$C0, D0
                beq     Offset_0x01AFB6
                bsr     Player_HitWall                         ; Offset_0x01EFEE
                tst.w   D1
                bpl.s   Offset_0x01AE78
                sub.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01AE78:
                bsr     Offset_0x01EE6C
                tst.w   D1
                bpl.s   Offset_0x01AE8A
                add.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01AE8A:
                bsr     Offset_0x01EBDE
                tst.w   D1
                bpl.s   Offset_0x01AEFC
                move.b  $0012(A0), D2
                addq.b  #$08, D2
                neg.b   D2
                cmp.b   D2, D1
                bge.s   Offset_0x01AEA2
                cmp.b   D2, D0
                blt.s   Offset_0x01AEFC
Offset_0x01AEA2:
                add.w   D1, $000C(A0)
                move.b  D3, $0026(A0)
                bsr     Offset_0x01B012
                move.b  D3, D0
                addi.b  #$20, D0
                andi.b  #$40, D0
                bne.s   Offset_0x01AEDA
                move.b  D3, D0
                addi.b  #$10, D0
                andi.b  #$20, D0
                beq.s   Offset_0x01AECC
                asr.w   $0012(A0)
                bra.s   Offset_0x01AEEE
Offset_0x01AECC:
                move.w  #$0000, $0012(A0)
                move.w  $0010(A0), $0014(A0)
                rts
Offset_0x01AEDA:
                move.w  #$0000, $0010(A0)
                cmpi.w  #$0FC0, $0012(A0)
                ble.s   Offset_0x01AEEE
                move.w  #$0FC0, $0012(A0)
Offset_0x01AEEE:
                move.w  $0012(A0), $0014(A0)
                tst.b   D3
                bpl.s   Offset_0x01AEFC
                neg.w   $0014(A0)
Offset_0x01AEFC:
                rts
Offset_0x01AEFE:
                bsr     Player_HitWall                         ; Offset_0x01EFEE
                tst.w   D1
                bpl.s   Offset_0x01AF18
                sub.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
                move.w  $0012(A0), $0014(A0)
                rts
Offset_0x01AF18:
                bsr     Player_DontRunOnWalls                  ; Offset_0x01EEBE
                tst.w   D1
                bpl.s   Offset_0x01AF32
                sub.w   D1, $000C(A0)
                tst.w   $0012(A0)
                bpl.s   Offset_0x01AF30
                move.w  #$0000, $0012(A0)
Offset_0x01AF30:
                rts
Offset_0x01AF32:
                tst.w   $0012(A0)
                bmi.s   Offset_0x01AF58
                bsr     Offset_0x01EBDE
                tst.w   D1
                bpl.s   Offset_0x01AF58
                add.w   D1, $000C(A0)
                move.b  D3, $0026(A0)
                bsr     Offset_0x01B012
                move.w  #$0000, $0012(A0)
                move.w  $0010(A0), $0014(A0)
Offset_0x01AF58:
                rts
Offset_0x01AF5A:
                bsr     Player_HitWall                         ; Offset_0x01EFEE
                tst.w   D1
                bpl.s   Offset_0x01AF6C
                sub.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01AF6C:
                bsr     Offset_0x01EE6C
                tst.w   D1
                bpl.s   Offset_0x01AF7E
                add.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
Offset_0x01AF7E:
                bsr     Player_DontRunOnWalls                  ; Offset_0x01EEBE
                tst.w   D1
                bpl.s   Offset_0x01AFB4
                sub.w   D1, $000C(A0)
                move.b  D3, D0
                addi.b  #$20, D0
                andi.b  #$40, D0
                bne.s   Offset_0x01AF9E
                move.w  #$0000, $0012(A0)
                rts
Offset_0x01AF9E:
                move.b  D3, $0026(A0)
                bsr     Offset_0x01B012
                move.w  $0012(A0), $0014(A0)
                tst.b   D3
                bpl.s   Offset_0x01AFB4
                neg.w   $0014(A0)
Offset_0x01AFB4:
                rts
Offset_0x01AFB6:
                bsr     Offset_0x01EE6C
                tst.w   D1
                bpl.s   Offset_0x01AFD0
                add.w   D1, $0008(A0)
                move.w  #$0000, $0010(A0)
                move.w  $0012(A0), $0014(A0)
                rts
Offset_0x01AFD0:
                bsr     Player_DontRunOnWalls                  ; Offset_0x01EEBE
                tst.w   D1
                bpl.s   Offset_0x01AFEA
                sub.w   D1, $000C(A0)
                tst.w   $0012(A0)
                bpl.s   Offset_0x01AFE8
                move.w  #$0000, $0012(A0)
Offset_0x01AFE8:
                rts
Offset_0x01AFEA:
                tst.w   $0012(A0)
                bmi.s   Offset_0x01B010
                bsr     Offset_0x01EBDE
                tst.w   D1
                bpl.s   Offset_0x01B010
                add.w   D1, $000C(A0)
                move.b  D3, $0026(A0)
                bsr     Offset_0x01B012
                move.w  #$0000, $0012(A0)
                move.w  $0010(A0), $0014(A0)
Offset_0x01B010:
                rts
Offset_0x01B012:
                tst.b   $0039(A0)
                bne.s   Offset_0x01B04C
                move.b  #$00, $001C(A0)
;=============================================================================== 
; Sub Rotina Sonic_Floor
; [ Término ]                         
;===============================================================================  
                
;===============================================================================
; Sub Rotina Sonic_ResetOnFloor
; [ Início ]
;===============================================================================                
Sonic_ResetOnFloor: ; Offset_0x01B01E:                
                cmpi.b  #$01, $0000(A0)
                bne     Miles_ResetOnFloor                     ; Offset_0x01CAD8
                btst    #$02, $0022(A0)
                beq.s   Offset_0x01B04C
                bclr    #$02, $0022(A0)
                move.b  #$13, $0016(A0)
                move.b  #$09, $0017(A0)
                move.b  #$00, $001C(A0)
                subq.w  #$05, $000C(A0)
Offset_0x01B04C:
                bclr    #$01, $0022(A0)
                bclr    #$05, $0022(A0)
                bclr    #$04, $0022(A0)
                move.b  #$00, $003C(A0)
                move.w  #$0000, ($FFFFF7D0).w
                move.b  #$00, $0027(A0)
                move.b  #$00, $0029(A0)
                move.b  #$00, $002C(A0)
                move.w  #$0000, ($FFFFF66C).w
                cmpi.b  #$14, $001C(A0)
                bne.s   Offset_0x01B090
                move.b  #$00, $001C(A0)
Offset_0x01B090:
                rts
;===============================================================================
; Sub Rotina Sonic_ResetOnFloor
; [ Término ]
;=============================================================================== 
                
;===============================================================================
; Sub Rotina Sonic_Hurt
; [ Início ]
;===============================================================================                             
Sonic_Hurt: ; Offset_0x01B092:
                tst.w   (Debug_Mode_Active).w                        ; $FFFFFFDA
                beq.s   Sonic_Hurt_Normal                      ; Offset_0x01B0AC
                btst    #$04, ($FFFFF605).w
                beq.s   Sonic_Hurt_Normal                      ; Offset_0x01B0AC
                move.w  #$0001, ($FFFFFE08).w
                clr.b   ($FFFFF7CC).w
                rts
;=============================================================================== 
; Sub Rotina Sonic_Hurt
; [ Término ]                         
;===============================================================================

;===============================================================================
; Sub Rotina Sonic_Hurt_Normal
; [ Início ]
;===============================================================================                                       
Sonic_Hurt_Normal: ; Offset_0x01B0AC:
                tst.b   $0025(A0)
                bmi     Offset_0x01B13C
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0030, $0012(A0)
                btst    #$06, $0022(A0)
                beq.s   Offset_0x01B0CE
                subi.w  #$0020, $0012(A0)
Offset_0x01B0CE:
                cmpi.w  #$FF00, ($FFFFEECC).w
                bne.s   Offset_0x01B0DC
                andi.w  #$07FF, $000C(A0)
Offset_0x01B0DC:
                bsr     Sonic_HurtStop                         ; Offset_0x01B0F6
                bsr     Sonic_LevelBoundaries                  ; Offset_0x01A8DE
                bsr     CopySonicMovesForMiles                 ; Offset_0x01A0C6
                bsr     Sonic_Animate                          ; Offset_0x01B2C2
                bsr     Load_Sonic_Dynamic_PLC                 ; Offset_0x01B7C4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;===============================================================================
; Sub Rotina Sonic_Hurt_Normal
; [ Término]
;===============================================================================
                
;=============================================================================== 
; Sub Rotina Sonic_HurtStop
; [ Início ]                         
;===============================================================================                   
Sonic_HurtStop: ; Offset_0x01B0F6:
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                blt     Kill_Sonic                             ; Offset_0x01B818
                bsr     Sonic_Floor                            ; Offset_0x01AE1C
                btst    #$01, $0022(A0)
                bne.s   Offset_0x01B13A
                moveq   #$00, D0
                move.w  D0, $0012(A0)
                move.w  D0, $0010(A0)
                move.w  D0, $0014(A0)
                move.b  D0, $002A(A0)
                move.b  #$00, $001C(A0)
                subq.b  #$02, $0024(A0)
                move.w  #$0078, $0030(A0)
                move.b  #$00, $0039(A0)
Offset_0x01B13A:
                rts
;=============================================================================== 
; Sub Rotina Sonic_HurtStop
; [ Término ]                         
;===============================================================================
Offset_0x01B13C:
                subq.b  #$02, $0024(A0)
                move.b  #$00, $0025(A0)
                bsr     CopySonicMovesForMiles                 ; Offset_0x01A0C6
                bsr     Sonic_Animate                          ; Offset_0x01B2C2
                bsr     Load_Sonic_Dynamic_PLC                 ; Offset_0x01B7C4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;=============================================================================== 
; Sub Routine Sonic_Death
; [ Início ]                         
;===============================================================================                  
Sonic_Death: ; Offset_0x01B158:
                tst.w   (Debug_Mode_Active).w                        ; $FFFFFFDA
                beq.s   Offset_0x01B172
                btst    #$04, ($FFFFF605).w
                beq.s   Offset_0x01B172
                move.w  #$0001, ($FFFFFE08).w
                clr.b   ($FFFFF7CC).w
                rts
Offset_0x01B172:
                bsr     Sonic_GameOver                         ; Offset_0x01B18E
                jsr     (ObjectFall)                           ; Offset_0x016306
                bsr     CopySonicMovesForMiles                 ; Offset_0x01A0C6
                bsr     Sonic_Animate                          ; Offset_0x01B2C2
                bsr     Load_Sonic_Dynamic_PLC                 ; Offset_0x01B7C4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;=============================================================================== 
; Sub Routina Sonic_Death
; [ Término ]                         
;===============================================================================                

;=============================================================================== 
; Sub Rotina Sonic_GameOver
; [ Início ]                         
;===============================================================================                 
Sonic_GameOver: ; Offset_0x01B18E:
                move.b  #$01, ($FFFFEEBE).w
                move.b  #$00, $0039(A0)
                move.w  ($FFFFEECE).w, D0
                addi.w  #$0100, D0
                cmp.w   $000C(A0), D0
                bge     Offset_0x01B28C
                move.b  #$08, $0024(A0)
                move.w  #$003C, $003A(A0)
                addq.b  #$01, ($FFFFFE1C).w
                subq.b  #$01, ($FFFFFE12).w
                bne.s   Offset_0x01B200
                move.w  #$0000, $003A(A0)
                move.b  #$39, ($FFFFB080).w  ; Carrega o objeto 0x39 - Game Over
                move.b  #$39, ($FFFFB0C0).w  ; Carrega o objeto 0x39 - Game Over
                move.b  #$01, ($FFFFB0DA).w
                move.w  A0, ($FFFFB0BE).w
                clr.b   ($FFFFFE1A).w
Offset_0x01B1E0:
                clr.b   ($FFFFFE1E).w
                clr.b   ($FFFFFECA).w
                move.b  #$08, $0024(A0)
                move.w  #Time_Game_Over_Snd, D0 ; $009B
                jsr     (Play_Music)                           ; Offset_0x00131A
                moveq   #$03, D0
                jmp     (LoadPLC)                              ; Offset_0x0015DA
Offset_0x01B200:
                tst.b   ($FFFFFE1A).w
                beq.s   Offset_0x01B22A
                move.w  #$0000, $003A(A0)
                move.b  #$39, ($FFFFB080).w  ; Carrega o objeto 0x39 - Game Over
                move.b  #$39, ($FFFFB0C0).w  ; Carrega o objeto 0x39 - Game Over
                move.b  #$02, ($FFFFB09A).w
                move.b  #$03, ($FFFFB0DA).w
                move.w  A0, ($FFFFB0BE).w
                bra.s   Offset_0x01B1E0
Offset_0x01B22A:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x01B28C
                move.b  #$00, ($FFFFEEBE).w
                move.b  #$0A, $0024(A0)
                move.w  ($FFFFFE32).w, $0008(A0)
                move.w  ($FFFFFE34).w, $000C(A0)
                move.w  ($FFFFFE3C).w, $0002(A0)
                move.w  ($FFFFFE3E).w, $003E(A0)
                clr.w   ($FFFFFE20).w
                clr.b   ($FFFFFE1B).w
                move.b  #$00, $002A(A0)
                move.b  #$05, $001C(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                move.w  #$0000, $0014(A0)
                move.b  #$02, $0022(A0)
                move.w  #$0000, $002E(A0)
                move.w  #$0000, $003A(A0)
Offset_0x01B28C:
                rts
;=============================================================================== 
; Sub Rotina Sonic_GameOver
; [ Término ]                         
;===============================================================================
                
;=============================================================================== 
; Sub Rotina Sonic_ResetLevel
; [ Início ]                         
;=============================================================================== 
Sonic_ResetLevel: ;  Offset_0x01B28E:
                tst.w   $003A(A0)
                beq.s   Offset_0x01B2A0
                subq.w  #$01, $003A(A0)
                bne.s   Offset_0x01B2A0
                move.w  #$0001, ($FFFFFE02).w
Offset_0x01B2A0:
                rts
;=============================================================================== 
; Sub Rotina Sonic_ResetLevel
; [ Término ]                         
;===============================================================================                 
                
;=============================================================================== 
; Sub Rotina Sonic_Respawning - Sonic aguardando a câmera chegar onder ele 
; [ Início ]                    reapareceu na fase     
;===============================================================================                  
Sonic_Respawning: ; Offset_0x01B2A2:
                tst.w   ($FFFFEEB0).w
                bne.s   Offset_0x01B2B4
                tst.w   ($FFFFEEB2).w
                bne.s   Offset_0x01B2B4
                move.b  #$02, $0024(A0)
Offset_0x01B2B4:
                bsr     Sonic_Animate                          ; Offset_0x01B2C2
                bsr     Load_Sonic_Dynamic_PLC                 ; Offset_0x01B7C4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;=============================================================================== 
; Sub Rotina Sonic_Respawning - Sonic aguardando a câmera chegar onder ele 
; [ Término ]                   reapareceu na fase     
;===============================================================================  
                
;=============================================================================== 
; Sub Rotina Sonic_Animate
; [ Início ]                         
;===============================================================================                   
Sonic_Animate: ; Offset_0x01B2C2:
                lea     (Offset_0x01B58A), A1
                tst.b   ($FFFFFE19).w
                beq.s   Offset_0x01B2D4
                lea     (Offset_0x01B742), A1
Offset_0x01B2D4:
                moveq   #$00, D0
                move.b  $001C(A0), D0
                cmp.b   $001D(A0), D0
                beq.s   Offset_0x01B2F6
                move.b  D0, $001D(A0)
                move.b  #$00, $001B(A0)
                move.b  #$00, $001E(A0)
                bclr    #$05, $0022(A0)
Offset_0x01B2F6:
                add.w   D0, D0
                adda.w  $00(A1, D0), A1
                move.b  (A1), D0
                bmi.s   Offset_0x01B366
                move.b  $0022(A0), D1
                andi.b  #$01, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x01B334
                move.b  D0, $001E(A0)
Offset_0x01B31C:
                moveq   #$00, D1
                move.b  $001B(A0), D1
                move.b  $01(A1, D1), D0
                cmpi.b  #$F0, D0
                bcc.s   Offset_0x01B336
Offset_0x01B32C:
                move.b  D0, $001A(A0)
                addq.b  #$01, $001B(A0)
Offset_0x01B334:
                rts
Offset_0x01B336:
                addq.b  #$01, D0
                bne.s   Offset_0x01B346
                move.b  #$00, $001B(A0)
                move.b  $0001(A1), D0
                bra.s   Offset_0x01B32C
Offset_0x01B346:
                addq.b  #$01, D0
                bne.s   Offset_0x01B35A
                move.b  $02(A1, D1), D0
                sub.b   D0, $001B(A0)
                sub.b   D0, D1
                move.b  $01(A1, D1), D0
                bra.s   Offset_0x01B32C
Offset_0x01B35A:
                addq.b  #$01, D0
                bne.s   Offset_0x01B364
                move.b  $02(A1, D1), $001C(A0)
Offset_0x01B364:
                rts
Offset_0x01B366:
                addq.b  #$01, D0
                bne     Offset_0x01B4F8
                moveq   #$00, D0
                move.b  $0027(A0), D0
                bne     Offset_0x01B492
                moveq   #$00, D1
                move.b  $0026(A0), D0
                bmi.s   Offset_0x01B382
                beq.s   Offset_0x01B382
                subq.b  #$01, D0
Offset_0x01B382:
                move.b  $0022(A0), D2
                andi.b  #$01, D2
                bne.s   Offset_0x01B38E
                not.b   D0
Offset_0x01B38E:
                addi.b  #$10, D0
                bpl.s   Offset_0x01B396
                moveq   #$03, D1
Offset_0x01B396:
                andi.b  #$FC, $0001(A0)
                eor.b   D1, D2
                or.b    D2, $0001(A0)
                btst    #$05, $0022(A0)
                bne     Offset_0x01B544
                lsr.b   #$04, D0
                andi.b  #$06, D0
                move.w  $0014(A0), D2
                bpl.s   Offset_0x01B3BA
                neg.w   D2
Offset_0x01B3BA:
                tst.b   $002B(A0)
                bpl     Offset_0x01B3C4
                add.w   D2, D2
Offset_0x01B3C4:
                tst.b   ($FFFFFE19).w
                bne.s   Offset_0x01B420
                lea     (Offset_0x01B5D8), A1
                cmpi.w  #$0600, D2
                bcc.s   Offset_0x01B3DE
                lea     (Offset_0x01B5CE), A1
                add.b   D0, D0
Offset_0x01B3DE:
                add.b   D0, D0
                move.b  D0, D3
                moveq   #$00, D1
                move.b  $001B(A0), D1
                move.b  $01(A1, D1), D0
                cmpi.b  #$FF, D0
                bne.s   Offset_0x01B3FC
                move.b  #$00, $001B(A0)
                move.b  $0001(A1), D0
Offset_0x01B3FC:
                move.b  D0, $001A(A0)
                add.b   D3, $001A(A0)
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x01B41E
                neg.w   D2
                addi.w  #$0800, D2
                bpl.s   Offset_0x01B414
                moveq   #$00, D2
Offset_0x01B414:
                lsr.w   #$08, D2
                move.b  D2, $001E(A0)
                addq.b  #$01, $001B(A0)
Offset_0x01B41E:
                rts
Offset_0x01B420:
                lea     (Offset_0x01B78C), A1
                cmpi.w  #$0800, D2
                bcc.s   Offset_0x01B438
                lea     (Offset_0x01B782), A1
                add.b   D0, D0
                add.b   D0, D0
                bra.s   Offset_0x01B43A
Offset_0x01B438:
                lsr.b   #$01, D0
Offset_0x01B43A:
                move.b  D0, D3
                moveq   #$00, D1
                move.b  $001B(A0), D1
                move.b  $01(A1, D1), D0
                cmpi.b  #$FF, D0
                bne.s   Offset_0x01B456
                move.b  #$00, $001B(A0)
                move.b  $0001(A1), D0
Offset_0x01B456:
                move.b  D0, $001A(A0)
                add.b   D3, $001A(A0)
                move.b  ($FFFFFE05).w, D1
                andi.b  #$03, D1
                bne.s   Offset_0x01B476
                cmpi.b  #$B5, $001A(A0)
                bcc.s   Offset_0x01B476
                addi.b  #$20, $001A(A0)
Offset_0x01B476:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x01B490
                neg.w   D2
                addi.w  #$0800, D2
                bpl.s   Offset_0x01B486
                moveq   #$00, D2
Offset_0x01B486:
                lsr.w   #$08, D2
                move.b  D2, $001E(A0)
                addq.b  #$01, $001B(A0)
Offset_0x01B490:
                rts
Offset_0x01B492:
                move.b  $0027(A0), D0
                moveq   #$00, D1
                move.b  $0022(A0), D2
                andi.b  #$01, D2
                bne.s   Offset_0x01B4C0
                andi.b  #$FC, $0001(A0)
                addi.b  #$0B, D0
                divu.w  #$0016, D0
                addi.b  #$5F, D0
                move.b  D0, $001A(A0)
                move.b  #$00, $001E(A0)
                rts
Offset_0x01B4C0:
                andi.b  #$FC, $0001(A0)
                tst.b   $0029(A0)
                beq.s   Offset_0x01B4D8
                ori.b   #$01, $0001(A0)
                addi.b  #$0B, D0
                bra.s   Offset_0x01B4E4
Offset_0x01B4D8:
                ori.b   #$03, $0001(A0)
                neg.b   D0
                addi.b  #$8F, D0
Offset_0x01B4E4:
                divu.w  #$0016, D0
                addi.b  #$5F, D0
                move.b  D0, $001A(A0)
                move.b  #$00, $001E(A0)
                rts
Offset_0x01B4F8:
                subq.b  #$01, $001E(A0)
                bpl     Offset_0x01B334
                addq.b  #$01, D0
                bne.s   Offset_0x01B544
                move.w  $0014(A0), D2
                bpl.s   Offset_0x01B50C
                neg.w   D2
Offset_0x01B50C:
                lea     (Offset_0x01B5EC), A1
                cmpi.w  #$0600, D2
                bcc.s   Offset_0x01B51E
                lea     (Offset_0x01B5E2), A1
Offset_0x01B51E:
                neg.w   D2
                addi.w  #$0400, D2
                bpl.s   Offset_0x01B528
                moveq   #$00, D2
Offset_0x01B528:
                lsr.w   #$08, D2
                move.b  D2, $001E(A0)
                move.b  $0022(A0), D1
                andi.b  #$01, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                bra     Offset_0x01B31C
Offset_0x01B544:
                subq.b  #$01, $001E(A0)
                bpl     Offset_0x01B334
                move.w  $0014(A0), D2
                bmi.s   Offset_0x01B554
                neg.w   D2
Offset_0x01B554:
                addi.w  #$0800, D2
                bpl.s   Offset_0x01B55C
                moveq   #$00, D2
Offset_0x01B55C:
                lsr.w   #$06, D2
                move.b  D2, $001E(A0)
                lea     (Offset_0x01B5F6), A1
                tst.b   ($FFFFFE19).w
                beq.s   Offset_0x01B574
                lea     (Offset_0x01B796), A1
Offset_0x01B574:
                move.b  $0022(A0), D1
                andi.b  #$01, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                bra     Offset_0x01B31C
;-------------------------------------------------------------------------------                     
Offset_0x01B58A:  
                dc.w    Offset_0x01B5CE-Offset_0x01B58A
                dc.w    Offset_0x01B5D8-Offset_0x01B58A
                dc.w    Offset_0x01B5E2-Offset_0x01B58A
                dc.w    Offset_0x01B5EC-Offset_0x01B58A
                dc.w    Offset_0x01B5F6-Offset_0x01B58A
                dc.w    Offset_0x01B600-Offset_0x01B58A
                dc.w    Offset_0x01B6B6-Offset_0x01B58A
                dc.w    Offset_0x01B6BC-Offset_0x01B58A
                dc.w    Offset_0x01B6C2-Offset_0x01B58A
                dc.w    Offset_0x01B6C8-Offset_0x01B58A
                dc.w    Offset_0x01B6D4-Offset_0x01B58A
                dc.w    Offset_0x01B6D8-Offset_0x01B58A
                dc.w    Offset_0x01B6DC-Offset_0x01B58A
                dc.w    Offset_0x01B6E2-Offset_0x01B58A
                dc.w    Offset_0x01B6EA-Offset_0x01B58A
                dc.w    Offset_0x01B6EE-Offset_0x01B58A
                dc.w    Offset_0x01B6F6-Offset_0x01B58A
                dc.w    Offset_0x01B6FA-Offset_0x01B58A
                dc.w    Offset_0x01B6FE-Offset_0x01B58A
                dc.w    Offset_0x01B704-Offset_0x01B58A
                dc.w    Offset_0x01B70A-Offset_0x01B58A
                dc.w    Offset_0x01B70E-Offset_0x01B58A
                dc.w    Offset_0x01B716-Offset_0x01B58A
                dc.w    Offset_0x01B71A-Offset_0x01B58A
                dc.w    Offset_0x01B71E-Offset_0x01B58A
                dc.w    Offset_0x01B722-Offset_0x01B58A
                dc.w    Offset_0x01B722-Offset_0x01B58A
                dc.w    Offset_0x01B726-Offset_0x01B58A
                dc.w    Offset_0x01B72A-Offset_0x01B58A
                dc.w    Offset_0x01B72E-Offset_0x01B58A
                dc.w    Offset_0x01B732-Offset_0x01B58A
                dc.w    Offset_0x01B7B4-Offset_0x01B58A
                dc.w    Offset_0x01B73A-Offset_0x01B58A
                dc.w    Offset_0x01B73E-Offset_0x01B58A
Offset_0x01B5CE:
                dc.b    $FF, $0F, $10, $11, $12, $13, $14, $0D, $0E, $FF
Offset_0x01B5D8:
                dc.b    $FF, $2D, $2E, $2F, $30, $FF, $FF, $FF, $FF, $FF
Offset_0x01B5E2:
                dc.b    $FE, $3D, $41, $3E, $41, $3F, $41, $40, $41, $FF
Offset_0x01B5EC:
                dc.b    $FE, $3D, $41, $3E, $41, $3F, $41, $40, $41, $FF
Offset_0x01B5F6:
                dc.b    $FD, $48, $49, $4A, $4B, $FF, $FF, $FF, $FF, $FF
Offset_0x01B600:
                dc.b    $05, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
                dc.b    $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
                dc.b    $03, $03, $03, $03, $03, $04, $04, $04, $05, $05, $05, $04, $04, $04, $05, $05
                dc.b    $05, $04, $04, $04, $05, $05, $05, $04, $04, $04, $05, $05, $05, $06, $06, $06
                dc.b    $06, $06, $06, $06, $06, $06, $06, $04, $04, $04, $05, $05, $05, $04, $04, $04
                dc.b    $05, $05, $05, $04, $04, $04, $05, $05, $05, $04, $04, $04, $05, $05, $05, $06
                dc.b    $06, $06, $06, $06, $06, $06, $06, $06, $06, $04, $04, $04, $05, $05, $05, $04
                dc.b    $04, $04, $05, $05, $05, $04, $04, $04, $05, $05, $05, $04, $04, $04, $05, $05
                dc.b    $05, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $04, $04, $04, $05, $05
                dc.b    $05, $04, $04, $04, $05, $05, $05, $04, $04, $04, $05, $05, $05, $04, $04, $04
                dc.b    $05, $05, $05, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $07, $08, $08
                dc.b    $08, $09, $09, $09, $FE, $06
Offset_0x01B6B6:
                dc.b    $09, $CC, $CD, $CE, $CD, $FF
Offset_0x01B6BC:
                dc.b    $05, $0B, $0C, $FE, $01, $00
Offset_0x01B6C2:
                dc.b    $05, $4C, $4D, $FE, $01, $00
Offset_0x01B6C8:
                dc.b    $00, $42, $43, $42, $44, $42, $45, $42, $46, $42, $47, $FF
Offset_0x01B6D4:
                dc.b    $01, $02, $FD, $00
Offset_0x01B6D8:
                dc.b    $03, $0A, $FD, $00
Offset_0x01B6DC:
                dc.b    $03, $C8, $C9, $CA, $CB, $FF
Offset_0x01B6E2:
                dc.b    $05, $D2, $D3, $D4, $D5, $FD, $00, $00
Offset_0x01B6EA:
                dc.b    $07, $54, $59, $FF
Offset_0x01B6EE:
                dc.b    $07, $54, $55, $56, $57, $58, $FF, $00
Offset_0x01B6F6:
                dc.b    $2F, $5B, $FD, $00
Offset_0x01B6FA:
                dc.b    $01, $50, $51, $FF
Offset_0x01B6FE:
                dc.b    $0F, $43, $43, $43, $FE, $01
Offset_0x01B704:
                dc.b    $0F, $43, $44, $FE, $01, $00
Offset_0x01B70A:
                dc.b    $13, $6B, $6C, $FF
Offset_0x01B70E:
                dc.b    $0B, $5A, $5A, $11, $12, $FD, $00, $00
Offset_0x01B716:
                dc.b    $20, $5E, $FF, $00
Offset_0x01B71A:
                dc.b    $20, $5D, $FF, $00
Offset_0x01B71E:
                dc.b    $20, $5C, $FF, $00
Offset_0x01B722:
                dc.b    $40, $4E, $FF, $00
Offset_0x01B726:
                dc.b    $09, $4E, $4F, $FF
Offset_0x01B72A:
                dc.b    $77, $00, $FD, $00
Offset_0x01B72E:
                dc.b    $13, $D0, $D1, $FF
Offset_0x01B732:
                dc.b    $03, $CF, $C8, $C9, $CA, $CB, $FE, $04
Offset_0x01B73A:
                dc.b    $09, $08, $09, $FF
Offset_0x01B73E:
                dc.b    $03, $07, $FD, $00
;-------------------------------------------------------------------------------       
Offset_0x01B742: 
                dc.w    Offset_0x01B782-Offset_0x01B742
                dc.w    Offset_0x01B78C-Offset_0x01B742
                dc.w    Offset_0x01B5E2-Offset_0x01B742
                dc.w    Offset_0x01B5EC-Offset_0x01B742
                dc.w    Offset_0x01B796-Offset_0x01B742
                dc.w    Offset_0x01B7A0-Offset_0x01B742
                dc.w    Offset_0x01B7A6-Offset_0x01B742
                dc.w    Offset_0x01B6BC-Offset_0x01B742
                dc.w    Offset_0x01B7B0-Offset_0x01B742
                dc.w    Offset_0x01B6C8-Offset_0x01B742
                dc.w    Offset_0x01B6D4-Offset_0x01B742
                dc.w    Offset_0x01B6D8-Offset_0x01B742
                dc.w    Offset_0x01B6DC-Offset_0x01B742
                dc.w    Offset_0x01B6E2-Offset_0x01B742
                dc.w    Offset_0x01B6EA-Offset_0x01B742
                dc.w    Offset_0x01B6EE-Offset_0x01B742
                dc.w    Offset_0x01B6F6-Offset_0x01B742
                dc.w    Offset_0x01B6FA-Offset_0x01B742
                dc.w    Offset_0x01B6FE-Offset_0x01B742
                dc.w    Offset_0x01B704-Offset_0x01B742
                dc.w    Offset_0x01B70A-Offset_0x01B742
                dc.w    Offset_0x01B70E-Offset_0x01B742
                dc.w    Offset_0x01B716-Offset_0x01B742
                dc.w    Offset_0x01B71A-Offset_0x01B742
                dc.w    Offset_0x01B71E-Offset_0x01B742
                dc.w    Offset_0x01B722-Offset_0x01B742
                dc.w    Offset_0x01B722-Offset_0x01B742
                dc.w    Offset_0x01B726-Offset_0x01B742
                dc.w    Offset_0x01B72A-Offset_0x01B742
                dc.w    Offset_0x01B72E-Offset_0x01B742
                dc.w    Offset_0x01B732-Offset_0x01B742
                dc.w    Offset_0x01B7B4-Offset_0x01B742     
Offset_0x01B782:
                dc.b    $FF, $77, $78, $79, $7A, $7B, $7C, $75, $76, $FF
Offset_0x01B78C:
                dc.b    $FF, $B5, $B9, $FF, $FF, $FF, $FF, $FF, $FF, $FF
Offset_0x01B796:
                dc.b    $FD, $BD, $BE, $BF, $C0, $FF, $FF, $FF, $FF, $FF
Offset_0x01B7A0:
                dc.b    $07, $72, $73, $74, $73, $FF
Offset_0x01B7A6:
                dc.b    $09, $C2, $C3, $C4, $C3, $C5, $C6, $C7, $C6, $FF
Offset_0x01B7B0:
                dc.b    $05, $C1, $FF, $00
Offset_0x01B7B4:
                dc.b    $02, $6D, $6D, $6E, $6E, $6F, $70, $71, $70, $71, $70, $71, $70, $71, $FD, $00      
;===============================================================================
; Sub Rotina Load_Sonic_Dynamic_PLC - Rotina para carregar os Sprites do Sonic
; [ Início ]
;===============================================================================                 
Load_Sonic_Dynamic_PLC: ; Offset_0x01B7C4:
                moveq   #$00, D0
                move.b  $001A(A0), D0
Load_Sonic_Dynamic_PLC_D0: ; Offset_0x01B7CA:                
                cmp.b   ($FFFFF766).w, D0
                beq.s   Offset_0x01B816
                move.b  D0, ($FFFFF766).w
                lea     (Sonic_Dyn_Script), A2                 ; Offset_0x0714E0
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D5
                subq.w  #$01, D5
                bmi.s   Offset_0x01B816
                move.w  #$F000, D4
Loop_Load_Sonic_Sprites: ; Offset_0x01B7EA:
                moveq   #$00, D1
                move.w  (A2)+, D1
                move.w  D1, D3
                lsr.w   #$08, D3
                andi.w  #$00F0, D3
                addi.w  #$0010, D3
                andi.w  #$0FFF, D1
                lsl.l   #$05, D1
                addi.l  #Sonic_Sprites, D1                     ; Offset_0x050000
                move.w  D4, D2
                add.w   D3, D4
                add.w   D3, D4
                jsr     (DMA_68KtoVRAM)                        ; Offset_0x00140A
                dbra    D5, Loop_Load_Sonic_Sprites            ; Offset_0x01B7EA
Offset_0x01B816:
                rts
Kill_Sonic: ; Offset_0x01B818:
                jmp     (Kill_Player)                          ; Offset_0x03F690
;===============================================================================
; Sub Rotina Load_Sonic_Dynamic_PLC - Rotina para carregar os Sprites do Sonic
; [ Término ]
;===============================================================================  
                                                                                                                                                                     
;===============================================================================
; Objeto 0x01 - Sonic
; [ Término ]                                                                     
;===============================================================================               
