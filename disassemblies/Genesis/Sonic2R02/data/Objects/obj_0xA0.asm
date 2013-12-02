;===============================================================================
; Objeto 0xA0 - Subojeto do objeto 0x9F - Inimigo Sheelcracker na Metropolis
; [ Início ]    concha do inimigo
;=============================================================================== 
Offset_0x037C68:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x037C76(PC, D0), D1
                jmp     Offset_0x037C76(PC, D1)
Offset_0x037C76:
                dc.w    Offset_0x037C7C-Offset_0x037C76
                dc.w    Offset_0x037CBA-Offset_0x037C76
                dc.w    Offset_0x037D96-Offset_0x037C76
Offset_0x037C7C:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  $002C(A0), A1
                move.b  $0001(A1), D0
                andi.b  #$01, D0
                or.b    D0, $0001(A0)
                move.w  $002E(A0), D0
                beq.s   Offset_0x037CA4
                move.b  #$04, $001A(A0)
                addq.w  #$06, $0008(A0)
                addq.w  #$06, $000C(A0)
Offset_0x037CA4:
                lsr.w   #$01, D0
                move.b  Offset_0x037CB2(PC, D0), $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                 
Offset_0x037CB2:
                dc.b    $00, $03, $05, $07, $09, $0B, $0D, $0F
;------------------------------------------------------------------------------- 
Offset_0x037CBA:
                move.w  $002C(A0), A1
                cmpi.b  #$9F, (A1)
                bne.s   Offset_0x037CE0
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x037CD8(PC, D0), D1
                jsr     Offset_0x037CD8(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037CD8:
                dc.w    Offset_0x037CF2-Offset_0x037CD8
                dc.w    Offset_0x037D3C-Offset_0x037CD8
                dc.w    Offset_0x037D58-Offset_0x037CD8
                dc.w    Offset_0x037D6C-Offset_0x037CD8
Offset_0x037CE0:
                move.b  #$04, $0024(A0)
                move.w  #$0040, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037CF2:
                subq.b  #$01, $002A(A0)
                beq.s   Offset_0x037CFC
                bmi.s   Offset_0x037CFC
                rts
Offset_0x037CFC:
                addq.b  #$02, $0025(A0)
                move.w  $002E(A0), D0
                cmpi.w  #$000E, D0
                bcc.s   Offset_0x037D2C
                move.w  #$FC00, D2
                btst    #$00, $0001(A0)
                beq.s   Offset_0x037D18
                neg.w   D2
Offset_0x037D18:
                move.w  D2, $0010(A0)
                lsr.w   #$01, D0
                move.b  Offset_0x037D34(PC, D0), D1
                move.b  D1, $002A(A0)
                move.b  D1, $002B(A0)
                rts
Offset_0x037D2C:
                move.w  #$000B, $002A(A0)
                rts
;-------------------------------------------------------------------------------                  
Offset_0x037D34:
                dc.b    $0D, $0C, $0A, $08, $06, $04, $02, $00
;-------------------------------------------------------------------------------  
Offset_0x037D3C:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                subq.b  #$01, $002A(A0)
                beq.s   Offset_0x037D4C
                bmi.s   Offset_0x037D4C
                rts
Offset_0x037D4C:
                addq.b  #$02, $0025(A0)
                move.b  #$08, $002A(A0)
                rts
Offset_0x037D58:
                subq.b  #$01, $002A(A0)
                beq.s   Offset_0x037D62
                bmi.s   Offset_0x037D62
                rts
Offset_0x037D62:
                addq.b  #$02, $0025(A0)
                neg.w   $0010(A0)
                rts
Offset_0x037D6C:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                subq.b  #$01, $002B(A0)
                beq.s   Offset_0x037D7C
                bmi.s   Offset_0x037D7C
                rts
Offset_0x037D7C:
                tst.w   $002E(A0)
                bne.s   Offset_0x037D90
                move.w  $002C(A0), A1
                move.b  #$00, $001A(A1)
                st      $002C(A1)
Offset_0x037D90:
                addq.w  #$04, A7
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x037D96:
                jsr     (ObjectFall)                           ; Offset_0x016306
                subq.w  #$01, $002A(A0)
                bmi     J_DeleteObject_01                      ; Offset_0x036344
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Load_Sheelcracker_Craw_Obj: ; Offset_0x037DAA:                
                moveq   #$00, D1
                moveq   #$07, D6
Offset_0x037DAE:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x037E06
                move.b  #$A0, $0000(A1)  ; Carrega o objeto 0xA0 através do 0x9F 
                move.b  #$26, $0028(A1)
                move.b  #$05, $001A(A1)
                move.b  #$04, $0018(A1)
                move.w  A0, $002C(A1)
                move.w  D1, $002E(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  #$FFEC, D2
                btst    #$00, $0001(A0)
                beq.s   Offset_0x037DF2
                neg.w   D2
                tst.w   D1
                beq.s   Offset_0x037DF2
                subi.w  #$000C, D2
Offset_0x037DF2:
                add.w   D2, $0008(A1)
                move.w  $000C(A0), $000C(A1)
                subq.w  #$08, $000C(A1)
                addq.w  #$02, D1
                dbra    D6, Offset_0x037DAE
Offset_0x037E06:
                rts
;-------------------------------------------------------------------------------     
Obj_0x9F_Ptr: ; Offset_0x037E08:
                dc.l    Shellcracker_Mappings                  ; Offset_0x037E2C
                dc.w    $031C
                dc.b    $04, $05, $18, $0A                    
;------------------------------------------------------------------------------- 
Obj_0xA0_Ptr: ; Offset_0x037E12:
                dc.l    Shellcracker_Mappings                  ; Offset_0x037E2C
                dc.w    $031C
                dc.b    $04, $04, $0C, $9A    
;-------------------------------------------------------------------------------
Shellcracker_Animate_Data: ; Offset_0x037E1C
                dc.w    Offset_0x037E20-Shellcracker_Animate_Data
                dc.w    Offset_0x037E26-Shellcracker_Animate_Data
Offset_0x037E20:
                dc.b    $0E, $00, $01, $02, $FF, $00
Offset_0x037E26:
                dc.b    $0E, $00, $02, $01, $FF, $00
;-------------------------------------------------------------------------------   
Shellcracker_Mappings: ; Offset_0x037E2C:
                dc.w    Offset_0x037E38-Shellcracker_Mappings
                dc.w    Offset_0x037E5A-Shellcracker_Mappings
                dc.w    Offset_0x037E7C-Shellcracker_Mappings
                dc.w    Offset_0x037E9E-Shellcracker_Mappings
                dc.w    Offset_0x037EB8-Shellcracker_Mappings
                dc.w    Offset_0x037EC2-Shellcracker_Mappings
Offset_0x037E38:
                dc.w    $0004
                dc.l    $EC0A0018, $000CFFE0, $F8040021, $00100008
                dc.l    $F40A0000, $0000FFE8, $F40A0800, $08000000
Offset_0x037E5A:
                dc.w    $0004
                dc.l    $EC0A0018, $000CFFE0, $F8040021, $00100008
                dc.l    $F4060812, $0809FFF0, $F40A0809, $08040000
Offset_0x037E7C:
                dc.w    $0004
                dc.l    $EC0A0018, $000CFFE0, $F8040021, $00100008
                dc.l    $F40A0009, $0004FFE8, $F4060012, $00090000
Offset_0x037E9E:
                dc.w    $0003
                dc.l    $F8040021, $00100008, $F40A0000, $0000FFE8
                dc.l    $F40A0800, $08000000
Offset_0x037EB8:
                dc.w    $0001
                dc.l    $FC000023, $0011FFFC
Offset_0x037EC2:
                dc.w    $0001
                dc.l    $F40A0018, $000CFFF4                              
;===============================================================================
; Objeto 0xA0 - Subojeto do objeto 0x9F - Inimigo Sheelcracker na Metropolis
; [ Término ]   concha do inimigo
;===============================================================================  