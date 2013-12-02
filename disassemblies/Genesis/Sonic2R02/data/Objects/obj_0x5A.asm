;===============================================================================
; Objeto 0x5A - Checagem de anéis no Special Stage.
; [ Início ]    
;===============================================================================  
Offset_0x034FAC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x034FBA(PC, D0), D1
                jmp     Offset_0x034FBA(PC, D1)
Offset_0x034FBA:
                dc.w    Obj_0x59_SS_Ring_Check_Sub_00-Offset_0x034FBA ; Offset_0x034FD0
                dc.w    Obj_0x59_SS_Ring_Check_Sub_01-Offset_0x034FBA ; Offset_0x03525E
                dc.w    Obj_0x59_SS_Ring_Check_Sub_02-Offset_0x034FBA ; Offset_0x0355A6
                dc.w    Obj_0x59_SS_Ring_Check_Sub_03-Offset_0x034FBA ; Offset_0x035424
                dc.w    Obj_0x59_SS_Ring_Check_Sub_04-Offset_0x034FBA ; Offset_0x0355E2
                dc.w    Obj_0x59_SS_Ring_Check_Sub_05-Offset_0x034FBA ; Offset_0x035400
                dc.w    Obj_0x59_SS_Ring_Check_Sub_06-Offset_0x034FBA ; Offset_0x035414
                dc.w    Obj_0x59_SS_Ring_Check_Sub_07-Offset_0x034FBA ; Offset_0x035168
                dc.w    Obj_0x59_SS_Ring_Check_Sub_08-Offset_0x034FBA ; Offset_0x035212
                dc.w    Obj_0x59_SS_Ring_Check_Sub_09-Offset_0x034FBA ; Offset_0x035232
                dc.w    Obj_0x59_SS_Ring_Check_Sub_0A-Offset_0x034FBA ; Offset_0x035248
;-------------------------------------------------------------------------------                
Obj_0x59_SS_Ring_Check_Sub_00: ; Offset_0x034FD0:
                tst.b   ($FFFFDB95).w
                bne.s   Offset_0x03503A
                move.l  ($FFFFDB28).w, A1
                cmpa.l  #Offset_0x0D1400, A1
                blt.s   Offset_0x035038
                cmpa.l  #Offset_0x0D19FC, A1
                bge.s   Offset_0x035038
                moveq   #$06, D0
                bsr.s   Offset_0x034F8C
                st      ($FFFFDB98).w
                moveq   #$06, D0
Offset_0x034FF4:
                jsr     (Offset_0x006F30)
                bne.s   Offset_0x035030
                move.b  #$5A, (A1)         ; Nova instância do objeto na memória
                move.b  #$02, $0024(A1)
                move.l  #SS_Rings_Mappings, $0004(A1)          ; Offset_0x035D78
                move.w  #$6322, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$05, $0018(A1)
                move.b  D0, $002A(A1)
                move.w  #$0000, $0030(A1)
                move.b  #$FF, $001A(A1)
Offset_0x035030:
                dbra    D0, Offset_0x034FF4
                bra     Offset_0x034BC6
Offset_0x035038:
                rts
Offset_0x03503A:
                sf      ($FFFFDB95).w
                tst.b   ($FFFFFE00).w
                bne     Offset_0x034BC6
                sf      ($FFFFDBA6).w
                sf      ($FFFFDBA7).w
                move.w  #$0000, ($FFFFDBA2).w
                move.b  #$00, $003A(A0)
                bra     Offset_0x034BC6     
;-------------------------------------------------------------------------------      
Offset_0x03505E:
                dc.b    $03, $04, $05, $00, $FF, $11, $08, $00, $08, $02, $FF, $06, $FF, $00 
;------------------------------------------------------------------------------- 
Offset_0x03506C:
                dc.w    $00C0, $00B8, $00B0, $00A0, $0098, $0088
;-------------------------------------------------------------------------------  
SS_Load_Check_Point: ; Offset_0x035078:
                st      ($FFFFDBA7).w
                jsr     (Offset_0x006F30)
                bne     Offset_0x035146
                move.l  #SS_Ring_Count_Display_Mappings, $0004(A1) ; Offset_0x007282
                move.w  #$41FA, $0002(A1)
                move.b  #$5A, (A1)            ; Carrega o objeto 0x5A na memória
                move.b  #$04, $0001(A1)    
                move.b  #$01, $0018(A1)
                bset    #$06, $0001(A1)
                move.b  #$00, $000F(A1)
                move.b  #$0E, $0024(A1)
                lea     $0010(A1), A2
                move.w  #$005A, D1
                move.w  #$0038, D2
                moveq   #$00, D0
                moveq   #$02, D3
Offset_0x0350C6:
                move.w  D1, (A2)+
                move.w  D2, (A2)+
                move.w  D0, (A2)+
                subq.w  #$08, D1
                dbra    D3, Offset_0x0350C6
                lea     Offset_0x03505E(PC), A3
                move.w  #$0068, D1
                move.w  #$0038, D2
Offset_0x0350DE:
                move.b  (A3)+, D0
                bmi.s   Offset_0x035102
                jsr     (Offset_0x006F30)
                bne.s   Offset_0x035146
                bsr.s   Offset_0x035148
                move.b  #$10, $0024(A1)
                move.w  D1, $0008(A1)
                move.w  D2, $000C(A1)
                move.b  D0, $001A(A1)
                addq.w  #$08, D1
                bra.s   Offset_0x0350DE
Offset_0x035102:
                lea     Offset_0x03506C(PC), A2
Offset_0x035106:
                move.b  (A3)+, D0
                bmi.s   Offset_0x035128
                jsr     (Offset_0x006F30)
                bne.s   Offset_0x035146
                bsr.s   Offset_0x035148
                move.b  #$12, $0024(A1)
                move.w  (A2)+, $002A(A1)
                move.w  D2, $000C(A1)
                move.b  D0, $001A(A1)
                bra.s   Offset_0x035106
Offset_0x035128:
                move.b  (A3)+, D0
                jsr     (Offset_0x006F30)
                bne.s   Offset_0x035146
                bsr.s   Offset_0x035148
                move.b  #$14, $0024(A1)
                move.w  (A2)+, $0008(A1)
                move.w  D2, $000C(A1)
                move.b  D0, $001A(A1)
Offset_0x035146:
                rts
Offset_0x035148:
                move.b  #$5A, (A1)            ; Carrega o objeto 0x5A na memória
                move.l  #Offset_0x03586C, $0004(A1)
                move.w  #$41A2, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$01, $0018(A1)
                rts
;-------------------------------------------------------------------------------           
Obj_0x59_SS_Ring_Check_Sub_07: ; Offset_0x035168:
                move.b  ($FFFFDBA7).w, ($FFFFDBA6).w
                bne.s   Offset_0x035176
                bsr.s   Offset_0x035178
                bra     Obj_0x59_SS_Ring_Check_Sub_08          ; Offset_0x035212
Offset_0x035176:
                rts
Offset_0x035178:
                move.w  ($FFFFFE20).w, D0
                cmpi.w  #$0001, (Player_Selected_Flag).w             ; $FFFFFF7A
                blt.s   Offset_0x03518C
                beq.s   Offset_0x035190
                move.w  ($FFFFFED0).w, D0
                bra.s   Offset_0x035190
Offset_0x03518C:
                add.w   ($FFFFFED0).w, D0
Offset_0x035190:
                sub.w   ($FFFFDB8C).w, D0
                neg.w   D0
                bgt.s   Offset_0x0351AE
                moveq   #$00, D0
                moveq   #$01, D2
                addq.w  #$01, ($FFFFDBA2).w
                cmpi.w  #$000C, ($FFFFDBA2).w
                bcs.s   Offset_0x0351DA
                st      ($FFFFDBA6).w
                bra.s   Offset_0x0351DA
Offset_0x0351AE:
                moveq   #$00, D1
                move.w  D0, D1
                moveq   #$00, D0
                cmpi.w  #$0064, D1
                blt.s   Offset_0x0351C4
Offset_0x0351BA:
                addi.w  #$0100, D0
                subi.w  #$0064, D1
                bgt.s   Offset_0x0351BA
Offset_0x0351C4:
                divu.w  #$000A, D1
                lsl.w   #$04, D1
                or.b    D1, D0
                swap.w  D1
                or.b    D1, D0
                move.w  #$0000, ($FFFFDBA2).w
                sf      ($FFFFDBA6).w
Offset_0x0351DA:
                moveq   #$01, D2
                lea     $0010(A0), A1
                move.w  D0, ($FFFFDBA4).w
                move.w  D0, D1
                andi.w  #$000F, D1
                move.b  D1, $0005(A1)
                lsr.w   #$04, D0
                beq.s   Offset_0x03520C
                addq.w  #$01, D2
                move.w  D0, D1
                andi.w  #$000F, D1
                move.b  D1, $000B(A1)
                lsr.w   #$04, D0
                beq.s   Offset_0x03520C
                addq.w  #$01, D2
                andi.w  #$000F, D0
                move.b  D0, $0011(A1)
Offset_0x03520C:
                move.b  D2, $000F(A0)
                rts                
;-------------------------------------------------------------------------------    
Obj_0x59_SS_Ring_Check_Sub_08: ; Offset_0x035212:
                tst.b   ($FFFFDBA0).w
                bne     Offset_0x035230
                tst.b   ($FFFFDBA6).w
                bne.s   Offset_0x035230
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$07, D0
                cmpi.b  #$06, D0
                bcs     J_DisplaySprite_01                     ; Offset_0x036014
Offset_0x035230:
                rts            
;-------------------------------------------------------------------------------
Obj_0x59_SS_Ring_Check_Sub_09: ; Offset_0x035232:
                moveq   #$00, D0
                cmpi.w  #$0002, ($FFFFDBA4).w
                bcc.s   Offset_0x03523E
                moveq   #$FFFFFFF8, D0
Offset_0x03523E:
                add.w   $002A(A0), D0
                move.w  D0, $0008(A0)
                bra.s   Obj_0x59_SS_Ring_Check_Sub_08          ; Offset_0x035212
;-------------------------------------------------------------------------------   
Obj_0x59_SS_Ring_Check_Sub_0A: ; Offset_0x035248:
                moveq   #$00, D0
                cmpi.w  #$0002, ($FFFFDBA4).w
                bcc.s   Obj_0x59_SS_Ring_Check_Sub_08          ; Offset_0x035212
                rts
;-------------------------------------------------------------------------------
Offset_0x035254:
                dc.b    $00, $01, $01, $01, $02, $04, $06, $08, $09, $FF
;-------------------------------------------------------------------------------                
Obj_0x59_SS_Ring_Check_Sub_01: ; Offset_0x03525E:
                cmpi.b  #$04, ($FFFFDB0D).w
                bne.s   Offset_0x03529A
                move.w  $002C(A0), D0
                move.b  Offset_0x035254(PC, D0), $001A(A0)
                bmi     Offset_0x035322
                addq.w  #$01, $002C(A0)
                moveq   #$00, D0
                move.b  $002A(A0), D0
                add.w   D0, D0
                add.w   $0030(A0), D0
                move.b  Offset_0x0352A4(PC, D0), $0009(A0)
                move.b  Offset_0x0352A4+$01(PC, D0), $000D(A0)
                addi.w  #$000E, $0030(A0)
                bra     J_DisplaySprite_01                     ; Offset_0x036014     
Offset_0x03529A:
                tst.b   $001A(A0)
                bpl     J_DisplaySprite_01                     ; Offset_0x036014
                rts
;-------------------------------------------------------------------------------                                 
Offset_0x0352A4:
                dc.b    $F6, $F6, $70, $5E, $76, $58, $7E, $56, $88, $58, $8E, $5E, $F6, $F6, $F6, $F6
                dc.b    $6D, $5A, $74, $54, $7E, $50, $8A, $54, $92, $5A, $F6, $F6, $F6, $F6, $6A, $58
                dc.b    $72, $50, $7E, $4C, $8C, $50, $94, $58, $F6, $F6, $F6, $F6, $68, $56, $70, $4C
                dc.b    $7E, $48, $8E, $4C, $96, $56, $F6, $F6, $62, $5E, $66, $50, $70, $46, $7E, $42
                dc.b    $8E, $46, $98, $50, $9C, $5E, $5C, $5A, $62, $4A, $70, $3E, $7E, $38, $8E, $3E
                dc.b    $9C, $4A, $A2, $5A, $54, $54, $5A, $3E, $6A, $30, $7E, $2A, $94, $30, $A4, $3E
                dc.b    $AA, $54, $42, $4A, $4C, $28, $62, $12, $7E, $0A, $9C, $12, $B2, $28, $BC, $4A
                dc.b    $16, $26, $28, $FC, $EC, $EC, $EC, $EC, $EC, $EC, $D6, $FC, $E8, $26
;-------------------------------------------------------------------------------  
Offset_0x035322:
                cmpi.w  #$00E8, $0008(A0)
                bne     Offset_0x034BC6
                moveq   #$00, D0
                bsr     Offset_0x034F8C
                sf      ($FFFFDB98).w
                st      ($FFFFDBA0).w
                tst.b   ($FFFFFE00).w
                beq     Offset_0x0353D2
                move.w  #Check_Point_Sfx, D0    ; $00A1
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addi.b  #$10, ($FFFFDB93).w
                moveq   #$00, D6
                addq.b  #$01, ($FFFFFE17).w
                move.w  #$000C, D0
                move.w  ($FFFFFE20).w, D2
                cmp.w   ($FFFFFED0).w, D2
                bgt.s   Offset_0x035384
                beq.s   Offset_0x03539C
                subi.b  #$10, ($FFFFDB93).w
                addq.b  #$01, ($FFFFDB93).w
                move.w  #$000E, D0
                tst.b   (Hardware_Id).w                              ; $FFFFFFD8
                bpl.s   Offset_0x035380
                move.w  #$0014, D0
Offset_0x035380:
                move.w  #$2000, D6
Offset_0x035384:
                move.w  #$0080, D3
                bsr     Offset_0x0354FE
                add.w   D6, $0002(A1)
                add.w   D6, $0002(A2)
                bsr     Offset_0x0357FA
                bra     Offset_0x034BC6   
Offset_0x03539C:
                subi.b  #$10, ($FFFFDB93).w
                move.w  #$0010, D0
                bsr     Offset_0x0357FA
                cmpi.b  #$03, ($FFFFFE17).w
                beq.s   Offset_0x0353C0
                move.w  #$0046, $002A(A0)
                move.b  #$0A, $0024(A0)
                rts    
Offset_0x0353C0:
                bsr     Offset_0x0354C2
                move.w  #$0046, $002A(A0)
                move.b  #$0C, $0024(A0)
                rts   
Offset_0x0353D2:
                move.w  #$0006, D1
                move.w  #$00ED, D0
                move.w  ($FFFFFE20).w, D2
                add.w   ($FFFFFED0).w, D2
                cmp.w   ($FFFFDB8C).w, D2
                blt.s   Offset_0x0353F0
                move.w  #$0004, D1
                move.w  #Check_Point_Sfx, D0    ; $00A1
Offset_0x0353F0:
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.w  D1, D0
                bsr     Offset_0x0357A4
                bra     Offset_0x034BC6
;-------------------------------------------------------------------------------                
Obj_0x59_SS_Ring_Check_Sub_05: ; Offset_0x035400:                
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x035408
                rts
Offset_0x035408:
                move.w  #$000A, D0
                bsr     Offset_0x0357FA
                bra     Offset_0x034BC6
;-------------------------------------------------------------------------------   
Obj_0x59_SS_Ring_Check_Sub_06: ; Offset_0x035414:               
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03541C
                rts
Offset_0x03541C:
                st      ($FFFFDB86).w
                bra     Offset_0x035C0E
;-------------------------------------------------------------------------------                
Obj_0x59_SS_Ring_Check_Sub_03: ; Offset_0x035424:                
                cmpi.b  #$15, $001A(A0)
                bne.s   Offset_0x035464
                move.w  $0030(A0), D0
                tst.b   $002E(A0)
                bne.s   Offset_0x03544E
                subq.w  #$01, $000C(A0)
                subq.w  #$04, D0
                cmp.w   $000C(A0), D0
                blt.s   Offset_0x035464
                addq.w  #$01, D0
                move.w  D0, $000C(A0)
                st      $002E(A0)
                bra.s   Offset_0x035464
Offset_0x03544E:
                addq.w  #$01, $000C(A0)
                addq.w  #$04, D0
                cmp.w   $000C(A0), D0
                bgt.s   Offset_0x035464
                subq.w  #$01, D0
                move.w  D0, $000C(A0)
                sf      $002E(A0)
Offset_0x035464:
                subq.w  #$01, $002A(A0)
                bne     J_DisplaySprite_01                     ; Offset_0x036014
                tst.b   $002F(A0)
                beq.s   Offset_0x03548A
Offset_0x035472:                
                move.w  #Volume_Down, D0                       ; $00F9
                jsr     (Play_Music)                           ; Offset_0x00131A
                move.w  #$0030, $002A(A0)
                move.b  #$0C, $0024(A0)
                rts         
Offset_0x03548A:
                cmpi.b  #$15, $001A(A0)
                bne     Offset_0x034BC6
                tst.w   $0030(A0)
                beq     Offset_0x034BC6
                tst.b   ($FFFFFE00).w
                beq.s   Offset_0x0354BA
                bsr     Offset_0x0354C2
                cmpi.b  #$03, ($FFFFFE17).w
                beq.s   Offset_0x035472
                move.w  #$000A, D0
                bsr     Offset_0x0357FA
                bra     Offset_0x034BC6
Offset_0x0354BA:
                bsr     Offset_0x035738
                bra     Offset_0x034BC6
Offset_0x0354C2:
                lea     ($FFFFFF80).w, A3
                moveq   #$00, D0
                move.b  ($FFFFFE17).w, D0
                subq.w  #$01, D0
                add.w   D0, D0
                add.w   D0, D0
                move.w  ($FFFFFE20).w, $00(A3, D0)
                move.w  ($FFFFFED0).w, $02(A3, D0)
                move.w  #$0000, ($FFFFFE20).w
                move.w  #$0000, ($FFFFFED0).w
                moveq   #$00, D0
                move.w  D0, ($FFFFB03C).w
                move.b  D0, ($FFFFB03E).w
                move.w  D0, ($FFFFB07C).w
                move.b  D0, ($FFFFB07E).w
                rts
Offset_0x0354FE:
                move.w  #$0048, D4
                tst.b   ($FFFFFE00).w
                beq.s   Offset_0x03550C
                move.w  #$001C, D4
Offset_0x03550C:
                jsr     (Offset_0x006F30)
                bne     Offset_0x0355A4
                move.b  #$5A, (A1)         ; Nova instância do objeto na memória
                move.b  #$06, $0024(A1)
                move.l  #Offset_0x03586C, $0004(A1)
                move.w  #$21A2, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$01, $0018(A1)
                move.w  D3, $0008(A1)
                move.w  D4, $000C(A1)
                move.w  #$0046, $002A(A1)
                move.b  #$14, $001A(A1)
                move.l  A1, A2
                jsr     (Offset_0x006F30)
                bne.s   Offset_0x0355A4
                move.b  #$5A, (A1)         ; Nova instância do objeto na memória
                move.b  #$06, $0024(A1)  
                move.l  #Offset_0x03586C, $0004(A1)
                move.w  #$21A2, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$00, $0018(A1)
                move.w  D3, $0008(A1)
                move.w  D4, $000C(A1)
                move.w  D4, $0030(A1)
                move.w  #$0046, $002A(A1)
                move.b  #$15, $001A(A1)
                cmpi.w  #$0006, D0
                bne.s   Offset_0x0355A4
                st      $002F(A1)
                bset    #$01, $0001(A1)
Offset_0x0355A4:
                rts                       
;-------------------------------------------------------------------------------                  
Obj_0x59_SS_Ring_Check_Sub_02: ; Offset_0x0355A6:
                subq.w  #$01, $002A(A0)
                bne     J_DisplaySprite_01                     ; Offset_0x036014
                cmpi.b  #$13, $001A(A0)
                bgt     Offset_0x034BC6
                move.b  #$08, $0024(A0)
                move.w  #$0008, $0014(A0)
                move.w  $0008(A0), D1
                subi.w  #$0080, D1
                move.w  $000C(A0), D2
                subi.w  #$0070, D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                move.b  D0, $0026(A0)
                bra     J_DisplaySprite_01                     ; Offset_0x036014     
;-------------------------------------------------------------------------------                             
Obj_0x59_SS_Ring_Check_Sub_04: ; Offset_0x0355E2:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  $0014(A0), D0
                muls.w  $0014(A0), D1
                asr.w   #$08, D0
                asr.w   #$08, D1
                add.w   D1, $0008(A0)
                add.w   D0, $000C(A0)
                cmpi.w  #$0000, $0008(A0)
                blt     Offset_0x034BC6
                cmpi.w  #$0100, $0008(A0)
                bgt     Offset_0x034BC6
                cmpi.w  #$0000, $000C(A0)
                blt     Offset_0x034BC6
                bra     J_DisplaySprite_01                     ; Offset_0x036014                                                        
;===============================================================================
; Objeto 0x5A - Checagem de anéis no Special Stage.
; [ Término ]   
;===============================================================================  