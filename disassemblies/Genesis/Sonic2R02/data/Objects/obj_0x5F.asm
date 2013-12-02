;===============================================================================
; Objeto 0x5F - Palavra "START" com bandeiras no início do Special Stage 
; [ Início ]
;===============================================================================  
Offset_0x007092:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0070A0(PC, D0), D1
                jmp     Offset_0x0070A0(PC, D1)
Offset_0x0070A0:
                dc.w    Offset_0x0070EE-Offset_0x0070A0
                dc.w    Offset_0x007130-Offset_0x0070A0
                dc.w    Offset_0x00715E-Offset_0x0070A0
                dc.w    Offset_0x0070AC-Offset_0x0070A0
                dc.w    Offset_0x0071EE-Offset_0x0070A0
                dc.w    Offset_0x0071BE-Offset_0x0070A0
Offset_0x0070AC:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                bsr     CalcSine                               ; Offset_0x003370
                muls.w  $0014(A0), D0
                muls.w  $0014(A0), D1
                asr.w   #$08, D0
                asr.w   #$08, D1
                add.w   D1, $0008(A0)
                add.w   D0, $000C(A0)
                cmpi.w  #$0000, $0008(A0)
                blt     Offset_0x0071E8
                cmpi.w  #$0100, $0008(A0)
                bgt     Offset_0x0071E8
                cmpi.w  #$0000, $000C(A0)
                blt     Offset_0x0071E8
Offset_0x0070E8:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0070EE:
                tst.b   ($FFFFFE00).w
                beq.s   Offset_0x0070FE
                move.w  #$0008, D0
                jsr     (Offset_0x0357FA)
Offset_0x0070FE:
                move.w  #$0080, $0008(A0)
                move.w  #$FFC0, $000C(A0)
                move.w  #$0100, $0012(A0)
                move.l  #Flags_START_Mappings, $0004(A0)       ; Offset_0x0071F0
                move.w  #$038A, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$01, $0018(A0)
                move.b  #$02, $0024(A0)
Offset_0x007130:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                cmpi.w  #$0048, $000C(A0)
                blt     Offset_0x0070E8
                move.w  #$0000, $0012(A0)
                move.w  #$0048, $000C(A0)
                move.b  #$04, $0024(A0)
                move.b  #$0F, $002A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00715E:
                subq.b  #$01, $002A(A0)
                bne.s   Offset_0x0070E8
                moveq   #$06, D6
                lea     (Left_Flag_Map), A2                    ; Offset_0x00723C
                moveq   #$02, D3
                move.w  #$0008, $0014(A0)
                move.b  #$06, $0024(A0)
Offset_0x00717A:
                bsr     Offset_0x006F30
                bne.s   Offset_0x0071AC
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x007186:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x007186
                move.b  D3, $001A(A1)
                addq.w  #$01, D3
                move.w  #$FFD8, D2
                move.w  $0008(A2), D1
                bsr     CalcAngle                              ; Offset_0x003608
                move.b  D0, $0026(A1)
                lea     $000A(A2), A2
Offset_0x0071AC:
                dbra    D6, Offset_0x00717A
                move.b  #$0A, $0024(A0)
                move.w  #$001E, $002A(A0)
                rts
Offset_0x0071BE:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x0071E6
                tst.b   ($FFFFFE00).w
                beq.s   Offset_0x0071D6
                move.w  #$000A, D0
                jsr     (Offset_0x0357FA)
                bra.s   Offset_0x0071DC
Offset_0x0071D6:
                jsr     (Offset_0x035738)
Offset_0x0071DC:
                st      ($FFFFDB23).w
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x0071E6:
                rts
Offset_0x0071E8:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x0071EE:
                rts
;-------------------------------------------------------------------------------                
Flags_START_Mappings: ; Offset_0x0071F0:
                dc.w    Flags_START_Map-Flags_START_Mappings   ; Offset_0x007202
                dc.w    Left_Flag_Map-Flags_START_Mappings     ; Offset_0x00723C
                dc.w    Left_Flag_Map-Flags_START_Mappings     ; Offset_0x00723C
                dc.w    S_Map-Flags_START_Mappings             ; Offset_0x007246
                dc.w    T_Map-Flags_START_Mappings             ; Offset_0x007250
                dc.w    A_Map-Flags_START_Mappings             ; Offset_0x00725A
                dc.w    R_Map-Flags_START_Mappings             ; Offset_0x007264
                dc.w    T_Map_2-Flags_START_Mappings           ; Offset_0x00726E
                dc.w    Right_Flag_Map-Flags_START_Mappings    ; Offset_0x007278
Flags_START_Map: ; Offset_0x007202:      
                dc.w    $0007
                dc.l    $000FA000, $A000FFB8, $0007A010, $A008FFD8
                dc.l    $0007A018, $A00CFFE8, $0007A020, $A010FFF8
                dc.l    $0007A028, $A0140008, $0007A018, $A00C0018
                dc.l    $000FA800, $A8000028                                                          
Left_Flag_Map: ; Offset_0x00723C:
                dc.w    $0001
                dc.l    $000FA000, $A000FFB8
S_Map: ; Offset_0x007246:
                dc.w    $0001
                dc.l    $0007A010, $A008FFD8
T_Map: ; Offset_0x007250:
                dc.w    $0001
                dc.l    $0007A018, $A00CFFE8
A_Map: ; Offset_0x00725A:
                dc.w    $0001
                dc.l    $0007A020, $A010FFF8
R_Map: ; Offset_0x007264:
                dc.w    $0001
                dc.l    $0007A028, $A0140008
T_Map_2: ; OOffset_0x00726E:
                dc.w    $0001
                dc.l    $0007A018, $A00C0018
Right_Flag_Map: ; Offset_0x007278:
                dc.w    $0001
                dc.l    $000FA800, $A8000028
;===============================================================================
; Objeto 0x5F - Palavra "START" com bandeiras no início do Special Stage 
; [ Término ]
;===============================================================================  