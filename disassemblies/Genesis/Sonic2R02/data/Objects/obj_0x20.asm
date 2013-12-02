;===============================================================================
; Objeto 0x20 - Bolas de fogo usadas pelo Robotnik na Hill Top
; [ Início ]
;===============================================================================  
Offset_0x022EE0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x022EEE(PC, D0), D1
                jmp     Offset_0x022EEE(PC, D1)
Offset_0x022EEE:
                dc.w    Offset_0x022EFC-Offset_0x022EEE
                dc.w    Offset_0x022F60-Offset_0x022EEE
                dc.w    Offset_0x022F72-Offset_0x022EEE
                dc.w    Offset_0x023014-Offset_0x022EEE
                dc.w    Offset_0x02303E-Offset_0x022EEE
                dc.w    Offset_0x0230D4-Offset_0x022EEE
                dc.w    Offset_0x02313A-Offset_0x022EEE
Offset_0x022EFC:
                addq.b  #$02, $0024(A0)
                move.b  #$08, $0016(A0)
                move.b  #$08, $0017(A0)
                move.l  #Lava_Bubble_Mappings, $0004(A0)       ; Offset_0x023160
                move.w  #$8416, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$08, $0019(A0)
                move.w  $000C(A0), $0030(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$03, D0
                andi.w  #$0780, D0
                neg.w   D0
                move.w  D0, $0010(A0)
                move.w  D0, $0012(A0)
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                lsl.w   #$04, D0
                move.w  D0, $0032(A0)
                move.w  D0, $0034(A0)
Offset_0x022F60:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x023140
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x022F72:
                cmpi.b  #$05, $001E(A0)
                bne.s   Offset_0x022FA6
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x022F98
                bsr.s   Offset_0x022FB8
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x022F98
                bsr.s   Offset_0x022FB8
                neg.w   $0010(A1)
                bset    #$00, $0001(A1)
Offset_0x022F98:
                move.w  #Lava_Sfx, D0           ; $00AE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.b  #$02, $0024(A0)
Offset_0x022FA6:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x023140
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x022FB8:
                move.b  #$20, $0000(A1)
                move.b  #$08, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  $0010(A0), $0010(A1)
                move.w  $0012(A0), $0012(A1)
                move.b  #$08, $0016(A1)
                move.b  #$08, $0017(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$08, $0019(A1)
                move.b  #$8B, $0020(A1)
                move.w  $000C(A1), $0030(A1)
                rts
Offset_0x023014:
                subq.w  #$01, $0032(A0)
                bpl.s   Offset_0x02302C
                move.w  $0034(A0), $0032(A0)
                move.b  #$02, $0024(A0)
                move.w  #$0001, $001C(A0)
Offset_0x02302C:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x023140
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02303E:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x023054
                move.b  #$07, $001E(A0)
                addq.b  #$01, $001A(A0)
                andi.b  #$01, $001A(A0)
Offset_0x023054:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x023074
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x023074:
                bclr    #$01, $0001(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x0230CE
                bset    #$01, $0001(A0)
                bsr     ObjHitFloor                            ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x0230CE
                add.w   D1, $000C(A0)
                addq.b  #$02, $0024(A0)
                move.b  #$02, $001C(A0)
                move.b  #$04, $001A(A0)
                move.w  #$0000, $0012(A0)
                move.l  #Fireball_Mappings, $0004(A0)          ; Offset_0x0231A0
                move.w  #$839E, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$00, $001A(A0)
                move.w  #$0009, $0032(A0)
                move.b  #$03, $0036(A0)
Offset_0x0230CE:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0230D4:
                subq.w  #$01, $0032(A0)
                bpl.s   Offset_0x023128
                move.w  #$007F, $0032(A0)
                subq.b  #$01, $0036(A0)
                bmi.s   Offset_0x023128
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x023128
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x0230F4:
                move.l  $00(A0, D0), $00(A1, D0) ; Nova instância do objeto na memória
                addq.w  #$04, D0
                dbra    D1, Offset_0x0230F4
                move.w  #$0009, $0032(A1)
                move.w  #$0200, $001C(A1)
                move.w  #$000E, D0
                tst.w   $0010(A1)
                bpl.s   Offset_0x023118
                neg.w   D0
Offset_0x023118:
                add.w   D0, $0008(A1)
                move.l  A1, -(A7)
                bsr     Fire_FindFloor                         ; Offset_0x01EDC0
                move.l  (A7)+, A1
                add.w   D1, $000C(A1)
Offset_0x023128:
                lea     (Fireball_Animate_Data), A1            ; Offset_0x023140
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02313A:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------    
Fireball_Animate_Data: ; Offset_0x023140:
                dc.w    Offset_0x023146-Fireball_Animate_Data
                dc.w    Offset_0x02314E-Fireball_Animate_Data
                dc.w    Offset_0x023152-Fireball_Animate_Data
Offset_0x023146:
                dc.b    $0B, $02, $03, $FC, $04, $FD, $01, $00
Offset_0x02314E:
                dc.b    $7F, $05, $FF, $00
Offset_0x023152:
                dc.b    $05, $04, $05, $02, $03, $00, $01, $00, $01, $02, $03, $04, $05, $FC
;-------------------------------------------------------------------------------   
Lava_Bubble_Mappings: ; Offset_0x023160:
                dc.w    Offset_0x02316C-Lava_Bubble_Mappings
                dc.w    Offset_0x023176-Lava_Bubble_Mappings
                dc.w    Offset_0x023180-Lava_Bubble_Mappings
                dc.w    Offset_0x02318A-Lava_Bubble_Mappings
                dc.w    Offset_0x023194-Lava_Bubble_Mappings
                dc.w    Offset_0x02319E-Lava_Bubble_Mappings
Offset_0x02316C:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x023176:
                dc.w    $0001
                dc.l    $F8050004, $0002FFF8
Offset_0x023180:
                dc.w    $0001
                dc.l    $F9050008, $0004FFF8
Offset_0x02318A:
                dc.w    $0001
                dc.l    $F6050008, $0004FFF8
Offset_0x023194:
                dc.w    $0001
                dc.l    $F605000C, $0006FFF8
Offset_0x02319E:
                dc.w    $0000        
;-------------------------------------------------------------------------------  
Fireball_Mappings: ; Offset_0x0231A0:
                dc.w    Offset_0x0231AC-Fireball_Mappings
                dc.w    Offset_0x0231B6-Fireball_Mappings
                dc.w    Offset_0x0231C0-Fireball_Mappings
                dc.w    Offset_0x0231CA-Fireball_Mappings
                dc.w    Offset_0x0231D4-Fireball_Mappings
                dc.w    Offset_0x0231DE-Fireball_Mappings
Offset_0x0231AC:
                dc.w    $0001
                dc.l    $F0070000, $0000FFF8
Offset_0x0231B6:
                dc.w    $0001
                dc.l    $F0070800, $0800FFF8
Offset_0x0231C0:
                dc.w    $0001
                dc.l    $F0070008, $0004FFF8
Offset_0x0231CA:
                dc.w    $0001
                dc.l    $F0070808, $0804FFF8
Offset_0x0231D4:
                dc.w    $0001
                dc.l    $00050010, $0008FFF8
Offset_0x0231DE:
                dc.w    $0001
                dc.l    $00050810, $0808FFF8                 
;===============================================================================
; Objeto 0x20 - Bolas de fogo usadas pelo Robotnik na Hill Top
; [ Término ]
;===============================================================================  