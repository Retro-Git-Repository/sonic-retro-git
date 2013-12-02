;===============================================================================
; Objeto 0xC6 - Robotnik correndo após o Metal Sonic ser derrotado na Death Egg
; [ Início ]
;===============================================================================     
Offset_0x03CC22:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03CC30(PC, D0), D1
                jmp     Offset_0x03CC30(PC, D1)
Offset_0x03CC30:
                dc.w    Offset_0x03CC38-Offset_0x03CC30
                dc.w    Offset_0x03CC4A-Offset_0x03CC30
                dc.w    Offset_0x03CD9E-Offset_0x03CC30
                dc.w    Offset_0x03CE0E-Offset_0x03CC30
Offset_0x03CC38:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  $0028(A0), D0
                subi.b  #$A4, D0
                move.b  D0, $0024(A0)
                rts
Offset_0x03CC4A:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03CC58(PC, D0), D1
                jmp     Offset_0x03CC58(PC, D1)
Offset_0x03CC58:
                dc.w    Offset_0x03CC62-Offset_0x03CC58
                dc.w    Offset_0x03CC86-Offset_0x03CC58
                dc.w    Offset_0x03CCB0-Offset_0x03CC58
                dc.w    Offset_0x03CCD8-Offset_0x03CC58
                dc.w    Offset_0x03CD5A-Offset_0x03CC58
Offset_0x03CC62:
                addq.b  #$02, $0025(A0)
                lea     (Offset_0x03CE46), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$03F8, $0008(A1)
                move.w  #$0160, $000C(A1)
                move.w  A0, ($FFFFF660).w
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CC86:
                bsr     Offset_0x0360FC
                addi.w  #$005C, D2
                cmpi.w  #$00B8, D2
                bcs.s   Offset_0x03CC9A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CC9A:
                addq.b  #$02, $0025(A0)
                move.w  #$0018, $002A(A0)
                move.b  #$01, $001A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CCB0:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03CCBC
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CCBC:
                addq.b  #$02, $0025(A0)
                bset    #$02, $0022(A0)
                move.w  #$0200, $0010(A0)
                move.w  #$0010, $002A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CCD8:
                cmpi.w  #$0810, $0008(A0)
                bcc.s   Offset_0x03CD22
                bsr     Offset_0x0360FC
                addi.w  #$0050, D2
                cmpi.w  #$00A0, D2
                bcc.s   Offset_0x03CCFA
                move.w  $0008(A1), D0
                addi.w  #$0050, D0
                move.w  D0, $0008(A0)
Offset_0x03CCFA:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x03CD0A
                move.w  #$0020, $002A(A0)
                bsr     Offset_0x03CD74
Offset_0x03CD0A:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Robotnik_Running_Animate_Data), A1    ; Offset_0x03CE4E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CD22:
                move.b  #$02, $001A(A0)
                clr.w   $0010(A0)
                tst.b   $0001(A0)
                bpl.s   Offset_0x03CD54
                addq.b  #$02, $0025(A0)
                move.w  #$0080, $0010(A0)
                move.w  #$FE00, $0012(A0)
                move.b  #$02, $001A(A0)
                move.w  #$0050, $002A(A0)
                bset    #$03, $0022(A0)
Offset_0x03CD54:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CD5A:
                subq.w  #$01, $002A(A0)
                bmi     J_DeleteObject_01                      ; Offset_0x036344
                addi.w  #$0010, $0012(A0)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CD74:
                lea     (Offset_0x03CE4A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.b  #$AA, $0028(A1)
                move.b  #$05, $001A(A1)
                move.w  #$FF00, $0010(A1)
                subi.w  #$0018, $000C(A1)
                move.w  #$0008, $002A(A1)
                rts
Offset_0x03CD9E:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03CDAC(PC, D0), D1
                jmp     Offset_0x03CDAC(PC, D1)
Offset_0x03CDAC:
                dc.w    Offset_0x03CDB2-Offset_0x03CDAC
                dc.w    Offset_0x03CDD2-Offset_0x03CDAC
                dc.w    Offset_0x03CDE8-Offset_0x03CDAC
Offset_0x03CDB2:
                move.w  $002C(A0), A1
                btst    #$02, $0022(A1)
                bne.s   Offset_0x03CDC8
                bsr     Offset_0x03CDF6
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CDC8:
                addq.b  #$02, $0025(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CDD2:
                bsr     Offset_0x03CDF6
                lea     (Robotnik_Running_Animate_Data_01), A1 ; Offset_0x03CE5C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03CDE8:
                lea     ($FFFFB000).w, A1
                bclr    #$05, $0022(A1)
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x03CDF6:
                move.w  $0008(A0), -(A7)
                move.w  #$0013, D1
                move.w  #$0020, D2
                move.w  #$0020, D3
                move.w  (A7)+, D4
                jmp     (SolidObject)                          ; Offset_0x019686
Offset_0x03CE0E:
                subq.w  #$01, $002A(A0)
                bmi     J_DeleteObject_01                      ; Offset_0x036344
                addi.w  #$0010, $0012(A0)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (MarkObjGone)                          ; Offset_0x016358   
;-------------------------------------------------------------------------------
Obj_0xC6_Ptr: ; Offset_0x03CE28:
                dc.l    Robotnik_Running_Mappings              ; Offset_0x03CE64
                dc.w    $0000
                dc.b    $04, $05, $18, $00
;------------------------------------------------------------------------------- 
Obj_0xC6_01_Ptr: ; Offset_0x03CE32:
                dc.l    Robotnik_Running_Automatic_Door_Map    ; Offset_0x03CF54
                dc.w    $2328
                dc.b    $04, $01, $08, $00
;-------------------------------------------------------------------------------                 
Obj_0xC6_02_Ptr: ; Offset_0x03CE3C:
                dc.l    Robotnik_Running_Mappings              ; Offset_0x03CE64
                dc.w    $0000
                dc.b    $04, $05, $04, $00
;-------------------------------------------------------------------------------    
Offset_0x03CE46:
                dc.w    $003E, $C6A8
Offset_0x03CE4A:
                dc.w    $003C, $C6AA
;-------------------------------------------------------------------------------  
Robotnik_Running_Animate_Data: ; Offset_0x03CE4E: ; Usado também objeto 0xC5 - Chefe da Wing Fortress 
                dc.w    Offset_0x03CE52-Robotnik_Running_Animate_Data
                dc.w    Offset_0x03CE58-Robotnik_Running_Animate_Data
Offset_0x03CE52:
                dc.b    $05, $02, $03, $04, $FF, $00
Offset_0x03CE58:
                dc.b    $05, $06, $07, $FF
;-------------------------------------------------------------------------------                
Robotnik_Running_Animate_Data_01: ; Offset_0x03CE5C:   
                dc.w    Offset_0x03CE5E-Robotnik_Running_Animate_Data_01
Offset_0x03CE5E:
                dc.b    $01, $00, $01, $02, $03, $FA
;-------------------------------------------------------------------------------
Robotnik_Running_Mappings: ; Offset_0x03CE64: ; Usado também objeto 0xC5 - Chefe da Wing Fortress
                dc.w    Offset_0x03CE74-Robotnik_Running_Mappings
                dc.w    Offset_0x03CE8E-Robotnik_Running_Mappings
                dc.w    Offset_0x03CEA8-Robotnik_Running_Mappings
                dc.w    Offset_0x03CED2-Robotnik_Running_Mappings
                dc.w    Offset_0x03CEF4-Robotnik_Running_Mappings
                dc.w    Offset_0x03CF16-Robotnik_Running_Mappings
                dc.w    Offset_0x03CF20-Robotnik_Running_Mappings
                dc.w    Offset_0x03CF3A-Robotnik_Running_Mappings
Offset_0x03CE74:
                dc.w    $0003
                dc.l    $E60D0500, $0280FFF0, $F60E0564, $02B2FFF0
                dc.l    $0E0D0570, $02B8FFF0
Offset_0x03CE8E:
                dc.w    $0003
                dc.l    $E60D0510, $0288FFF0, $F60E0564, $02B2FFF0
                dc.l    $0E0D0570, $02B8FFF0
Offset_0x03CEA8:
                dc.w    $0005
                dc.l    $EC040518, $028CFFE0, $E40D051A, $028DFFF0
                dc.l    $F40E0522, $0291FFF0, $0401052E, $0297FFE8
                dc.l    $04050530, $02980010
Offset_0x03CED2:
                dc.w    $0004
                dc.l    $EC040518, $028CFFE0, $E40D051A, $028DFFF0
                dc.l    $F40E0534, $029AFFF0, $0C050540, $02A0FFF8
Offset_0x03CEF4:
                dc.w    $0004
                dc.l    $EC040518, $028CFFE0, $E40E0544, $02A2FFF0
                dc.l    $FC0F0550, $02A8FFF0, $0C010560, $02B00010
Offset_0x03CF16:
                dc.w    $0001
                dc.l    $FC040562, $02B1FFF8
Offset_0x03CF20:
                dc.w    $0003
                dc.l    $E60D0508, $0284FFF0, $F60E0564, $02B2FFF0
                dc.l    $0E0D0570, $02B8FFF0
Offset_0x03CF3A:
                dc.w    $0003
                dc.l    $E70D0508, $0284FFF0, $F70E0564, $02B2FFF0
                dc.l    $0F0D0578, $02BCFFF0    
;-------------------------------------------------------------------------------
Robotnik_Running_Automatic_Door_Map: ; Offset_0x03CF54:
                dc.w    Offset_0x03CF5C-Robotnik_Running_Automatic_Door_Map
                dc.w    Offset_0x03CF7E-Robotnik_Running_Automatic_Door_Map
                dc.w    Offset_0x03CF98-Robotnik_Running_Automatic_Door_Map
                dc.w    Offset_0x03CFAA-Robotnik_Running_Automatic_Door_Map
Offset_0x03CF5C:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8, $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $10050000, $0000FFF8
Offset_0x03CF7E:
                dc.w    $0003
                dc.l    $E0050000, $0000FFF8, $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8
Offset_0x03CF98:
                dc.w    $0002
                dc.l    $E0050000, $0000FFF8, $F0050000, $0000FFF8
Offset_0x03CFAA:
                dc.w    $0001
                dc.l    $E0050000, $0000FFF8                                          
;===============================================================================
; Objeto 0xC6 - Robotnik correndo após o Metal Sonic ser derrotado na Death Egg
; [ Término ]
;===============================================================================