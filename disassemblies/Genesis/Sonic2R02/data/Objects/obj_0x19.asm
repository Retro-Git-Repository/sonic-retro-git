;===============================================================================
; Objeto 0x19 - Platformas rotatórias - Wing Fortress / Oil Ocean...
; [ Início ]
;===============================================================================    
Offset_0x021F2A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x021F38(PC, D0), D1
                jmp     Offset_0x021F38(PC, D1)
Offset_0x021F38:
                dc.w    Offset_0x021F44-Offset_0x021F38
                dc.w    Offset_0x021FCC-Offset_0x021F38
Offset_0x021F3C:
                dc.b    $20, $00, $18, $01, $40, $02, $20, $03
Offset_0x021F44:
                addq.b  #$02, $0024(A0)
                move.l  #Rotating_Platforms_Mappings, $0004(A0) ; Offset_0x022146
                move.w  #$63A0, $0002(A0)
                cmpi.b  #$0A, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x021F64
                move.w  #$62F4, $0002(A0)
Offset_0x021F64:
                cmpi.b  #$06, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x021F72
                move.w  #$A46D, $0002(A0)
Offset_0x021F72:
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$03, D0
                andi.w  #$001E, D0
                lea     Offset_0x021F3C(PC, D0), A2
                move.b  (A2)+, $0019(A0)
                move.b  (A2)+, $001A(A0)
                move.b  #$04, $0018(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                andi.b  #$0F, $0028(A0)
                cmpi.b  #$03, $0028(A0)
                bne.s   Offset_0x021FBE
                btst    #$00, $0022(A0)
                bne.s   Offset_0x021FC6
Offset_0x021FBE:
                cmpi.b  #$07, $0028(A0)
                bne.s   Offset_0x021FCC
Offset_0x021FC6:
                subi.w  #$00C0, $000C(A0)
Offset_0x021FCC:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x022000
                moveq   #$00, D1
                move.b  $0019(A0), D1
                move.w  #$0011, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                move.w  $0030(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Obj_0x19_DeleteObject                  ; Offset_0x0221A6
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x022000:
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                add.w   D0, D0
                move.w  Offset_0x022014(PC, D0), D1
                jmp     Offset_0x022014(PC, D1)
Offset_0x022014:
                dc.w    Offset_0x022034-Offset_0x022014
                dc.w    Offset_0x02203E-Offset_0x022014
                dc.w    Offset_0x02205E-Offset_0x022014
                dc.w    Offset_0x02207E-Offset_0x022014
                dc.w    Offset_0x02208E-Offset_0x022014
                dc.w    Offset_0x0220B0-Offset_0x022014
                dc.w    Offset_0x0220B2-Offset_0x022014
                dc.w    Offset_0x0220B2-Offset_0x022014
                dc.w    Offset_0x0220D0-Offset_0x022014
                dc.w    Offset_0x0220D0-Offset_0x022014
                dc.w    Offset_0x0220D0-Offset_0x022014
                dc.w    Offset_0x0220D0-Offset_0x022014
                dc.w    Offset_0x02210A-Offset_0x022014
                dc.w    Offset_0x02210A-Offset_0x022014
                dc.w    Offset_0x02210A-Offset_0x022014
                dc.w    Offset_0x02210A-Offset_0x022014
Offset_0x022034:
                move.b  ($FFFFFE68).w, D0
                move.w  #$0040, D1
                bra.s   Offset_0x022046
Offset_0x02203E:
                move.b  ($FFFFFE6C).w, D0
                move.w  #$0060, D1
Offset_0x022046:
                btst    #$00, $0022(A0)
                beq.s   Offset_0x022052
                neg.w   D0
                add.w   D1, D0
Offset_0x022052:
                move.w  $0030(A0), D1
                sub.w   D0, D1
                move.w  D1, $0008(A0)
                rts
Offset_0x02205E:
                move.b  ($FFFFFE7C).w, D0
                move.w  #$0080, D1
                btst    #$00, $0022(A0)
                beq.s   Offset_0x022072
                neg.w   D0
                add.w   D1, D0
Offset_0x022072:
                move.w  $0032(A0), D1
                sub.w   D0, D1
                move.w  D1, $000C(A0)
                rts
Offset_0x02207E:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x02208C
                addq.b  #$01, $0028(A0)
Offset_0x02208C:
                rts
Offset_0x02208E:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                moveq   #$08, D1
                move.w  $0032(A0), D0
                subi.w  #$0060, D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x0220A6
                neg.w   D1
Offset_0x0220A6:
                add.w   D1, $0012(A0)
                bne.s   Offset_0x0220B0
                addq.b  #$01, $0028(A0)
Offset_0x0220B0:
                rts
Offset_0x0220B2:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                moveq   #$08, D1
                move.w  $0032(A0), D0
                subi.w  #$0060, D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x0220CA
                neg.w   D1
Offset_0x0220CA:
                add.w   D1, $0012(A0)
                rts
Offset_0x0220D0:
                move.b  ($FFFFFE98).w, D1
                subi.b  #$40, D1
                ext.w   D1
                move.b  ($FFFFFE9C).w, D2
                subi.b  #$40, D2
                ext.w   D2
                btst    #$02, D0
                beq.s   Offset_0x0220EE
                neg.w   D1
                neg.w   D2
Offset_0x0220EE:
                btst    #$01, D0
                beq.s   Offset_0x0220F8
                neg.w   D1
                exg.l   D2, D1
Offset_0x0220F8:
                add.w   $0030(A0), D1
                move.w  D1, $0008(A0)
                add.w   $0032(A0), D2
                move.w  D2, $000C(A0)
                rts
Offset_0x02210A:
                move.b  ($FFFFFE98).w, D1
                subi.b  #$40, D1
                ext.w   D1
                move.b  ($FFFFFE9C).w, D2
                subi.b  #$40, D2
                ext.w   D2
                btst    #$02, D0
                beq.s   Offset_0x022128
                neg.w   D1
                neg.w   D2
Offset_0x022128:
                btst    #$01, D0
                beq.s   Offset_0x022132
                neg.w   D1
                exg.l   D2, D1
Offset_0x022132:
                neg.w   D1
                add.w   $0030(A0), D1
                move.w  D1, $0008(A0)
                add.w   $0032(A0), D2
                move.w  D2, $000C(A0)
                rts
;-------------------------------------------------------------------------------
Rotating_Platforms_Mappings: ; Offset_0x022146:                
                dc.w    Offset_0x02214E-Rotating_Platforms_Mappings
                dc.w    Offset_0x022160-Rotating_Platforms_Mappings
                dc.w    Offset_0x022172-Rotating_Platforms_Mappings
                dc.w    Offset_0x022194-Rotating_Platforms_Mappings
Offset_0x02214E:
                dc.w    $0002
                dc.l    $F00F0000, $0000FFE0, $F00F0800, $08000000
Offset_0x022160:
                dc.w    $0002
                dc.l    $F00B0000, $0000FFE8, $F00B0800, $08000000
Offset_0x022172:
                dc.w    $0004
                dc.l    $F00E0000, $0000FFC0, $F00E000C, $0006FFE0
                dc.l    $F00E080C, $08060000, $F00E0800, $08000020
Offset_0x022194:
                dc.w    $0002
                dc.l    $F00E0000, $0000FFE0, $F00E0800, $08000000          
;-------------------------------------------------------------------------------
Obj_0x19_DeleteObject: ; Offset_0x0221A6:
                jmp     (DeleteObject)                         ; Offset_0x01646C                                                            
;===============================================================================
; Objeto 0x19 - Platformas rotatórias - Wing Fortress / Oil Ocean...
; [ Início ]
;===============================================================================  