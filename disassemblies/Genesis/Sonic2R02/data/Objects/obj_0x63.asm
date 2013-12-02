;===============================================================================
; Objeto 0x63 - Sombra do Sonic, Miles, bombas e anéis no Special Stage
; [ Início ]
;===============================================================================   
Offset_0x033AFC:
                move.l  $0038(A0), A1
                cmpa.l  #$FFFFB000, A1
                bne.s   Offset_0x033B16
                move.l  #$FFFFB000, A1
                bsr.s   Offset_0x033B28
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x033B16:
                move.l  #$FFFFB040, A1
                bsr.s   Offset_0x033B28
                bsr     Offset_0x033C14
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x033B28:
                cmpi.b  #$02, $0024(A1)
                beq     Offset_0x033B64
                bsr     Obj_0x63_Offset_0x03375E               ; Offset_0x03375E
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  $0034(A1), D1
                muls.w  #$00CC, D1
                swap.w  D1
                add.w   ($FFFFF73E).w, D1
                move.w  D1, $0008(A0)
                muls.w  $0034(A1), D0
                asr.l   #$08, D0
                add.w   ($FFFFF740).w, D0
                move.w  D0, $000C(A0)
                bra     Offset_0x033B76
Offset_0x033B64:
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  $0026(A1), $0026(A0)
Offset_0x033B76:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                subi.b  #$10, D0
                lsr.b   #$05, D0
                move.b  D0, D1
                lsl.w   #$03, D0
                lea     Offset_0x033BD4(PC), A2
                adda.w  D0, A2
                move.w  (A2)+, $0002(A0)
                move.w  (A2)+, D0
                add.w   D0, $0008(A0)
                move.w  (A2)+, D0
                add.w   D0, $000C(A0)
                move.b  (A2)+, $001A(A0)
                move.b  $0001(A0), D0
                andi.b  #$FC, D0
                or.b    (A2)+, D0
                move.b  D0, $0001(A0)
                tst.b   $0026(A0)
                bpl.s   Offset_0x033BD2
                cmpi.b  #$03, D1
                beq.s   Offset_0x033BC0
                cmpi.b  #$07, D1
                bne.s   Offset_0x033BC4
Offset_0x033BC0:
                addq.b  #$03, $001A(A0)
Offset_0x033BC4:
                move.w  ($FFFFF740).w, D1
                sub.w   $000C(A0), D1
                add.w   D1, D1
                add.w   D1, $000C(A0)
Offset_0x033BD2:
                rts   
;-------------------------------------------------------------------------------                                
Offset_0x033BD4:
                dc.w    $6262, $0014, $0014
                dc.b    $01, $01
                dc.w    $623C, $0000, $0018
                dc.b    $00, $00
                dc.w    $6262, $FFEC, $0014
                dc.b    $01, $00
                dc.w    $629C, $FFEC, $0000
                dc.b    $02, $00
                dc.w    $6262, $FFEC, $FFEC
                dc.b    $07, $00
                dc.w    $623C, $0000, $FFE8
                dc.b    $09, $00
                dc.w    $6262, $0014, $FFEC
                dc.b    $07, $01
                dc.w    $629C, $0014, $0000
                dc.b    $02, $01
;-------------------------------------------------------------------------------
Offset_0x033C14:
                cmpi.b  #$01, $001C(A1)
                bne.s   Offset_0x033C38
                move.b  $0022(A1), D1
                andi.w  #$0003, D1
                cmpi.b  #$02, D1
                bcc.s   Offset_0x033C38
                move.b  Offset_0x033C3A(PC, D1), D0
                ext.w   D0
                add.w   D0, $0008(A0)
                subq.w  #$04, $000C(A0)
Offset_0x033C38:
                rts     
;-------------------------------------------------------------------------------              
Offset_0x033C3A:
                dc.b    $04, $FC                ; 4, -4       
;-------------------------------------------------------------------------------      
Sonic_In_SS_AnimateData: ; Offset_0x033C3C:
                dc.w    Offset_0x033C46-Sonic_In_SS_AnimateData
                dc.w    Offset_0x033C4C-Sonic_In_SS_AnimateData
                dc.w    Offset_0x033C56-Sonic_In_SS_AnimateData
                dc.w    Offset_0x033C5C-Sonic_In_SS_AnimateData
                dc.w    Offset_0x033C60-Sonic_In_SS_AnimateData
Offset_0x033C46:
                dc.b    $03, $00, $01, $02, $03, $FF
Offset_0x033C4C:
                dc.b    $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $FF
Offset_0x033C56:
                dc.b    $03, $0C, $0D, $0E, $0F, $FF
Offset_0x033C5C:
                dc.b    $01, $10, $11, $FF
Offset_0x033C60:
                dc.b    $03, $00, $04, $0C, $04, $00, $04, $0C, $04, $FF
;-------------------------------------------------------------------------------      
Sonic_In_SS_Mappings: ; Offset_0x033C6A:
                dc.w    Offset_0x033C8E-Sonic_In_SS_Mappings
                dc.w    Offset_0x033CA8-Sonic_In_SS_Mappings
                dc.w    Offset_0x033CC2-Sonic_In_SS_Mappings
                dc.w    Offset_0x033CDC-Sonic_In_SS_Mappings
                dc.w    Offset_0x033CF6-Sonic_In_SS_Mappings
                dc.w    Offset_0x033D18-Sonic_In_SS_Mappings
                dc.w    Offset_0x033D42-Sonic_In_SS_Mappings
                dc.w    Offset_0x033D6C-Sonic_In_SS_Mappings
                dc.w    Offset_0x033D96-Sonic_In_SS_Mappings
                dc.w    Offset_0x033DB8-Sonic_In_SS_Mappings
                dc.w    Offset_0x033DE2-Sonic_In_SS_Mappings
                dc.w    Offset_0x033E0C-Sonic_In_SS_Mappings
                dc.w    Offset_0x033E3E-Sonic_In_SS_Mappings
                dc.w    Offset_0x033E58-Sonic_In_SS_Mappings
                dc.w    Offset_0x033E72-Sonic_In_SS_Mappings
                dc.w    Offset_0x033E8C-Sonic_In_SS_Mappings
                dc.w    Offset_0x033EA6-Sonic_In_SS_Mappings
                dc.w    Offset_0x033EC8-Sonic_In_SS_Mappings
Offset_0x033C8E:
                dc.w    $0003
                dc.l    $E40F8000, $8000FFF0, $040A8010, $8008FFF0
                dc.l    $04018019, $800C0008
Offset_0x033CA8:
                dc.w    $0003
                dc.l    $E40A8000, $8000FFF2, $FC0D8009, $8004FFF0
                dc.l    $0C058011, $8008FFF7
Offset_0x033CC2:
                dc.w    $0003
                dc.l    $E40E8000, $8000FFF0, $FC0D800C, $8006FFF0
                dc.l    $0C098014, $800AFFF0
Offset_0x033CDC:
                dc.w    $0003
                dc.l    $E40A8800, $8800FFF6, $FC0D8009, $8004FFF0
                dc.l    $0C098011, $8008FFF8
Offset_0x033CF6:
                dc.w    $0004
                dc.l    $E40A8000, $8000FFEC, $E4038009, $80040004
                dc.l    $EC01800D, $8006000C, $FC0E800F, $8007FFE4
Offset_0x033D18:
                dc.w    $0005
                dc.l    $E4098000, $8000FFF4, $EC018006, $8003000C
                dc.l    $F40D8008, $8004FFEC, $040D8010, $8008FFE6
                dc.l    $14008018, $800CFFEE
Offset_0x033D42:
                dc.w    $0005
                dc.l    $E4048000, $8000FFFB, $EC0E8002, $8001FFEC
                dc.l    $EC02800E, $8007000C, $04068011, $8008FFE7
                dc.l    $04058017, $800BFFF7
Offset_0x033D6C:
                dc.w    $0005
                dc.l    $E4048000, $8000FFFC, $EC0F8002, $8001FFEC
                dc.l    $EC028012, $8009000C, $04008015, $800AFFE4
                dc.l    $0C058016, $800BFFEA
Offset_0x033D96:
                dc.w    $0004
                dc.l    $E4058000, $8000FFFC, $EC038004, $8002000C
                dc.l    $F40E8008, $8004FFEC, $0C058014, $800AFFEC
Offset_0x033DB8:
                dc.w    $0005
                dc.l    $E4058000, $8000FFFC, $EC028004, $8002000C
                dc.l    $F40D8007, $8003FFEC, $040D800F, $8007FFE8
                dc.l    $EC008017, $800BFFF4
Offset_0x033DE2:
                dc.w    $0005
                dc.l    $E4098000, $8000FFFB, $F4018006, $8003000E
                dc.l    $F40D8008, $8004FFEE, $040D8010, $8008FFE7
                dc.l    $14008018, $800CFFEF
Offset_0x033E0C:
                dc.w    $0006
                dc.l    $E4008000, $80000002, $EC0D8001, $8000FFF4
                dc.l    $FC008009, $8004000C, $0401800A, $8005FFE4
                dc.l    $FC07800C, $8006FFEC, $FC068014, $800AFFFC
Offset_0x033E3E:
                dc.w    $0003
                dc.l    $F0068000, $8000FFE8, $08008006, $8003FFF0
                dc.l    $F00F8007, $8003FFF8
Offset_0x033E58:
                dc.w    $0003
                dc.l    $F0068000, $8000FFE8, $F1038006, $8003FFF8
                dc.l    $F00B800A, $80050000
Offset_0x033E72:
                dc.w    $0003
                dc.l    $F1028000, $8000FFE8, $F0028003, $8001FFF0
                dc.l    $F00F8006, $8003FFF8
Offset_0x033E8C:
                dc.w    $0003
                dc.l    $F8068000, $8000FFE8, $EF038006, $8003FFF8
                dc.l    $F00B800A, $80050000
Offset_0x033EA6:
                dc.w    $0004
                dc.l    $EC078000, $8000FFF0, $0C048008, $8004FFF0
                dc.l    $EC078800, $88000000, $0C048808, $88040000
Offset_0x033EC8:
                dc.w    $0004
                dc.l    $EC078000, $8000FFF0, $0C048008, $8004FFF0
                dc.l    $EC078800, $88000000, $0C048808, $88040000       
;-------------------------------------------------------------------------------  
SS_Objects_Shadow_Mappings: ; Offset_0x033EEA:
                dc.w    SS_Sonic_Miles_Shadow_00_Map-SS_Objects_Shadow_Mappings    ; Offset_0x033F80
                dc.w    SS_Sonic_Miles_Shadow_45_Map-SS_Objects_Shadow_Mappings    ; Offset_0x033FE4
                dc.w    SS_Sonic_Miles_Shadow_90_Map-SS_Objects_Shadow_Mappings    ; Offset_0x034048
                dc.w    SS_Bombs_Rings_Shadow_9x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F76
                dc.w    SS_Bombs_Rings_Shadow_9x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033FDA
                dc.w    SS_Bombs_Rings_Shadow_9x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x03403E
                dc.w    SS_Bombs_Rings_Shadow_8x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F6C
                dc.w    SS_Bombs_Rings_Shadow_8x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033FD0
                dc.w    SS_Bombs_Rings_Shadow_8x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x034034
                dc.w    SS_All_Shadow_7x_00_Map-SS_Objects_Shadow_Mappings         ; Offset_0x033F62
                dc.w    SS_All_Shadow_7x_45_Map-SS_Objects_Shadow_Mappings         ; Offset_0x033FC6
                dc.w    SS_All_Shadow_7x_90_Map-SS_Objects_Shadow_Mappings         ; Offset_0x03402A
                dc.w    SS_Bombs_Rings_Shadow_6x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F58
                dc.w    SS_Bombs_Rings_Shadow_6x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033FBC
                dc.w    SS_Bombs_Rings_Shadow_6x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x034020
                dc.w    SS_Bombs_Rings_Shadow_5x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F4E
                dc.w    SS_Bombs_Rings_Shadow_5x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033FB2
                dc.w    SS_Bombs_Rings_Shadow_5x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x034016
                dc.w    SS_Bombs_Rings_Shadow_4x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F44
                dc.w    SS_Bombs_Rings_Shadow_4x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033FA8
                dc.w    SS_Bombs_Rings_Shadow_4x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x03400C
                dc.w    SS_Bombs_Rings_Shadow_3x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F3A
                dc.w    SS_Bombs_Rings_Shadow_3x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F9E
                dc.w    SS_Bombs_Rings_Shadow_3x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x034002
                dc.w    SS_Bombs_Rings_Shadow_2x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F30
                dc.w    SS_Bombs_Rings_Shadow_2x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F94
                dc.w    SS_Bombs_Rings_Shadow_2x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x033FF8
                dc.w    SS_Bombs_Rings_Shadow_1x_00_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F26
                dc.w    SS_Bombs_Rings_Shadow_1x_45_Map-SS_Objects_Shadow_Mappings ; Offset_0x033F8A
                dc.w    SS_Bombs_Rings_Shadow_1x_90_Map-SS_Objects_Shadow_Mappings ; Offset_0x033FEE
SS_Bombs_Rings_Shadow_1x_00_Map: ; Offset_0x033F26:
                dc.w    $0001
                dc.l    $FC008000, $8000FFFC
SS_Bombs_Rings_Shadow_2x_00_Map: ; Offset_0x033F30:
                dc.w    $0001
                dc.l    $FC008001, $8000FFFC
SS_Bombs_Rings_Shadow_3x_00_Map: ; Offset_0x033F3A:
                dc.w    $0001
                dc.l    $FC048002, $8001FFF8
SS_Bombs_Rings_Shadow_4x_00_Map: ; Offset_0x033F44:
                dc.w    $0001
                dc.l    $FC048004, $8002FFF8
SS_Bombs_Rings_Shadow_5x_00_Map: ; Offset_0x033F4E:
                dc.w    $0001
                dc.l    $FC048006, $8003FFF8
SS_Bombs_Rings_Shadow_6x_00_Map: ; Offset_0x033F58:
                dc.w    $0001
                dc.l    $FC088008, $8004FFF4
SS_All_Shadow_7x_00_Map: ; Offset_0x033F62:
                dc.w    $0001
                dc.l    $FC08800B, $8005FFF4
SS_Bombs_Rings_Shadow_8x_00_Map: ; Offset_0x033F6C:
                dc.w    $0001
                dc.l    $F80D800E, $8007FFF0
SS_Bombs_Rings_Shadow_9x_00_Map: ; Offset_0x033F76:
                dc.w    $0001
                dc.l    $F80D8016, $800BFFF0
SS_Sonic_Miles_Shadow_00_Map: ; Offset_0x033F80:
                dc.w    $0001
                dc.l    $F80D801E, $800FFFF0
SS_Bombs_Rings_Shadow_1x_45_Map: ; Offset_0x033F8A:    
                dc.w    $0001
                dc.l    $FC008000, $8000FFFC
SS_Bombs_Rings_Shadow_2x_45_Map: ; Offset_0x033F94:
                dc.w    $0001
                dc.l    $FC008001, $8000FFFC
SS_Bombs_Rings_Shadow_3x_45_Map: ; Offset_0x033F9E:
                dc.w    $0001
                dc.l    $FC008002, $8001FFFC
SS_Bombs_Rings_Shadow_4x_45_Map: ; Offset_0x033FA8:
                dc.w    $0001
                dc.l    $F8058003, $8001FFF8
SS_Bombs_Rings_Shadow_5x_45_Map: ; Offset_0x033FB2:
                dc.w    $0001
                dc.l    $F8058007, $8003FFF8
SS_Bombs_Rings_Shadow_6x_45_Map: ; Offset_0x033FBC:
                dc.w    $0001
                dc.l    $F405800B, $8005FFFC
SS_All_Shadow_7x_45_Map: ; Offset_0x033FC6:
                dc.w    $0001
                dc.l    $F40A800F, $8007FFF4
SS_Bombs_Rings_Shadow_8x_45_Map: ; Offset_0x033FD0:
                dc.w    $0001
                dc.l    $F40A8018, $800CFFF4
SS_Bombs_Rings_Shadow_9x_45_Map: ; Offset_0x033FDA:
                dc.w    $0001
                dc.l    $F00A8021, $8010FFF8
SS_Sonic_Miles_Shadow_45_Map: ; Offset_0x033FE4:
                dc.w    $0001
                dc.l    $F00F802A, $8015FFF0
SS_Bombs_Rings_Shadow_1x_90_Map: ; Offset_0x033FEE:
                dc.w    $0001
                dc.l    $FC008000, $8000FFFC
SS_Bombs_Rings_Shadow_2x_90_Map: ; Offset_0x033FF8:
                dc.w    $0001
                dc.l    $FC008001, $8000FFFC
SS_Bombs_Rings_Shadow_3x_90_Map: ; Offset_0x034002:
                dc.w    $0001
                dc.l    $F8018002, $8001FFFC
SS_Bombs_Rings_Shadow_4x_90_Map: ; Offset_0x03400C:
                dc.w    $0001
                dc.l    $F8018004, $8002FFFC
SS_Bombs_Rings_Shadow_5x_90_Map: ; Offset_0x034016:
                dc.w    $0001
                dc.l    $F8018006, $8003FFFC
SS_Bombs_Rings_Shadow_6x_90_Map: ; Offset_0x034020:
                dc.w    $0001
                dc.l    $F4028008, $8004FFFC
SS_All_Shadow_7x_90_Map: ; Offset_0x03402A:
                dc.w    $0001
                dc.l    $F402800B, $8005FFFC
SS_Bombs_Rings_Shadow_8x_90_Map: ; Offset_0x034034:
                dc.w    $0001
                dc.l    $F402800E, $8007FFFC
SS_Bombs_Rings_Shadow_9x_90_Map: ; Offset_0x03403E:
                dc.w    $0001
                dc.l    $F0038011, $8008FFFC
SS_Sonic_Miles_Shadow_90_Map: ; Offset_0x034048:
                dc.w    $0001
                dc.l    $F0038015, $800AFFFC
;-------------------------------------------------------------------------------                         
Sonic_In_SS_Dyn_Script:
Miles_In_SS_Dyn_Script: ; Offset_0x034052:
                dc.w    Offset_0x0340C4-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x0340CC-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x0340D4-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x0340DC-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x0340E4-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x0340EE-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x0340FA-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034106-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034112-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03411C-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034128-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034134-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034142-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03414A-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034152-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03415A-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034162-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034168-Sonic_In_SS_Dyn_Script
;-------------------------------------------------------------------------------                
                dc.w    Offset_0x03416E-Miles_In_SS_Dyn_Script   
                dc.w    Offset_0x034176-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x034180-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x03418A-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x034196-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x03419E-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341A8-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341B4-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341BE-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341C8-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341D4-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341E0-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341EA-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341F0-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341F8-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x0341FE-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x034206-Miles_In_SS_Dyn_Script
                dc.w    Offset_0x03420A-Miles_In_SS_Dyn_Script                   
;-------------------------------------------------------------------------------                 
                dc.w    Offset_0x03420E-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034210-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034212-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034214-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034216-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034218-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03421A-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03421C-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03421E-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034220-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034222-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034224-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034226-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034228-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03422A-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03422C-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x03422E-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034230-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034232-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034234-Sonic_In_SS_Dyn_Script
                dc.w    Offset_0x034236-Sonic_In_SS_Dyn_Script                   
Offset_0x0340C4:
                dc.w    $00003
                dc.w    $F000, $8100, $1190
Offset_0x0340CC:
                dc.w    $0003
                dc.w    $81B0, $7240, $32C0
Offset_0x0340D4:
                dc.w    $0003
                dc.w    $B300, $73C0, $5440
Offset_0x0340DC:
                dc.w    $0003
                dc.w    $81B0, $74A0, $5520
Offset_0x0340E4:
                dc.w    $0004
                dc.w    $8000, $3090, $10D0, $B0F0
Offset_0x0340EE:
                dc.w    $0005
                dc.w    $51B0, $1210, $7230, $72B0, $0330
Offset_0x0340FA:
                dc.w    $0005
                dc.w    $1340, $B360, $2420, $5450, $34B0
Offset_0x034106:
                dc.w    $0005
                dc.w    $14F0, $F510, $2610, $0640, $3650
Offset_0x034112:
                dc.w    $0004
                dc.w    $3690, $36D0, $B710, $37D0
Offset_0x03411C:
                dc.w    $0005
                dc.w    $3810, $2850, $7880, $7900, $0980
Offset_0x034128:
                dc.w    $0005
                dc.w    $5990, $19F0, $7A10, $7A90, $0B10
Offset_0x034134:
                dc.w    $0006
                dc.w    $0B20, $7B30, $0BB0, $1BC0, $7BE0, $5C60
Offset_0x034142:
                dc.w    $0003
                dc.w    $5000, $0060, $F070
Offset_0x03414A:
                dc.w    $0003
                dc.w    $5170, $31D0, $B210
Offset_0x034152:
                dc.w    $0003
                dc.w    $22D0, $2300, $F330
Offset_0x03415A:
                dc.w    $0003
                dc.w    $5430, $3490, $B210
Offset_0x034162:
                dc.w    $0002
                dc.w    $7000, $1080
Offset_0x034168:
                dc.w    $0002
                dc.w    $70A0, $1080
;-------------------------------------------------------------------------------                
Offset_0x03416E:
                dc.w    $0003
                dc.w    $8000, $5090, $00F0
Offset_0x034176:
                dc.w    $0004
                dc.w    $3100, $5140, $31A0, $31E0
Offset_0x034180:
                dc.w    $0004
                dc.w    $3220, $5260, $32C0, $3300
Offset_0x03418A:
                dc.w    $0005
                dc.w    $3100, $5140, $3340, $3380, $03C0
Offset_0x034196:
                dc.w    $0003
                dc.w    $3000, $7040, $70C0
Offset_0x03419E:
                dc.w    $0004
                dc.w    $1140, $7160, $81E0, $1270
Offset_0x0341A8:
                dc.w    $0005
                dc.w    $0290, $22A0, $72D0, $0350, $5360
Offset_0x0341B4:
                dc.w    $0004
                dc.w    $03C0, $F3D0, $04D0, $14E0
Offset_0x0341BE:
                dc.w    $0004
                dc.w    $3500, $3540, $7580, $5600
Offset_0x0341C8:
                dc.w    $0005
                dc.w    $0660, $7670, $06F0, $7700, $1780
Offset_0x0341D4:
                dc.w    $0005
                dc.w    $07A0, $B7B0, $0870, $3880, $18C0
Offset_0x0341E0:
                dc.w    $0004
                dc.w    $08E0, $B8F0, $09B0, $79C0
Offset_0x0341EA:
                dc.w    $0002
                dc.w    $8000, $7090
Offset_0x0341F0:
                dc.w    $0003
                dc.w    $3110, $0150, $B160
Offset_0x0341F8:
                dc.w    $0002
                dc.w    $1220, $F240
Offset_0x0341FE:
                dc.w    $0003
                dc.w    $2340, $2370, $B160
Offset_0x034206:
                dc.w    $0001
                dc.w    $7000
Offset_0x03420A:
                dc.w    $0001
                dc.w    $7080   
;-------------------------------------------------------------------------------                
Offset_0x03420E:
                dc.w    $5000
Offset_0x034210:
                dc.w    $8060
Offset_0x034212:
                dc.w    $50F0
Offset_0x034214:
                dc.w    $5150
Offset_0x034216:
                dc.w    $71B0
Offset_0x034218:
                dc.w    $8230
Offset_0x03421A:
                dc.w    $82C0
Offset_0x03421C:
                dc.w    $8000
Offset_0x03421E:
                dc.w    $5090
Offset_0x034220:
                dc.w    $50F0
Offset_0x034222:
                dc.w    $7150
Offset_0x034224:
                dc.w    $B1D0
Offset_0x034226:
                dc.w    $8290
Offset_0x034228:
                dc.w    $8320
Offset_0x03422A:
                dc.w    $5000
Offset_0x03422C:
                dc.w    $8060
Offset_0x03422E:
                dc.w    $50F0
Offset_0x034230:
                dc.w    $5150
Offset_0x034232:
                dc.w    $71B0
Offset_0x034234:
                dc.w    $8230
Offset_0x034236:
                dc.w    $82C0                                                                       
;===============================================================================
; Objeto 0x63 - Sombra do Sonic, Miles, bombas e anéis no Special Stage
; [ Término ]
;===============================================================================  