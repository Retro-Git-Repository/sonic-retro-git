;===============================================================================
; Objeto 0x8A - Créditos do Sonic 1
; [ Início ]
;===============================================================================
Offset_0x03E83A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03E848(PC, D0), D1
                jmp     Offset_0x03E848(PC, D1)
Offset_0x03E848:
                dc.w    Offset_0x03E84C-Offset_0x03E848
                dc.w    Offset_0x03E8BE-Offset_0x03E848
Offset_0x03E84C:
                addq.b  #$02, $0024(A0)
                move.w  #$0120, $0008(A0)
                move.w  #$00F0, $000A(A0)
                move.l  #S1_Credits_Mappings, $0004(A0)        ; Offset_0x03E8C4
                move.w  #$05A0, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.w  ($FFFFFFD4).w, D0
                move.b  D0, $001A(A0)
                move.b  #$00, $0001(A0)
                move.b  #$00, $0018(A0)
                cmpi.b  #gm_TitleScreen, (Game_Mode).w          ; $04, $FFFFF600
                bne.s   Offset_0x03E8BE
                move.w  #$0300, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$0A, $001A(A0)
                tst.b   ($FFFFFFB3).w
                beq.s   Offset_0x03E8BE
                cmpi.b  #$72, ($FFFFF604).w
                bne.s   Offset_0x03E8BE
                move.w  #$0EEE, ($FFFFFBC0).w
                move.w  #$0880, ($FFFFFBC2).w
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x03E8BE:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
S1_Credits_Mappings: ; Offset_0x03E8C4:
                dc.w    Offset_0x03E8DA-S1_Credits_Mappings
                dc.w    Offset_0x03E94C-S1_Credits_Mappings
                dc.w    Offset_0x03E9CE-S1_Credits_Mappings
                dc.w    Offset_0x03EA20-S1_Credits_Mappings
                dc.w    Offset_0x03EAE2-S1_Credits_Mappings
                dc.w    Offset_0x03EB84-S1_Credits_Mappings
                dc.w    Offset_0x03EC56-S1_Credits_Mappings
                dc.w    Offset_0x03ED10-S1_Credits_Mappings
                dc.w    Offset_0x03EE0A-S1_Credits_Mappings
                dc.w    Offset_0x03EE84-S1_Credits_Mappings
                dc.w    Offset_0x03EEC6-S1_Credits_Mappings
Offset_0x03E8DA: ; "SONIC TEAM STAFF" 
                dc.w    $000E
                dc.l    $F805002E, $0017FF88, $F8050026, $0013FF98
                dc.l    $F805001A, $000DFFA8, $F8010046, $0023FFB8
                dc.l    $F805001E, $000FFFC0, $F805003E, $001FFFD8
                dc.l    $F805000E, $0007FFE8, $F8050004, $0002FFF8
                dc.l    $F8090008, $00040008, $F805002E, $00170028
                dc.l    $F805003E, $001F0038, $F8050004, $00020048
                dc.l    $F805005C, $002E0058, $F805005C, $002E0068
Offset_0x03E94C: ; "GAME PLAN CAROL YAS"
                dc.w    $0010
                dc.l    $D8050000, $0000FF80, $D8050004, $0002FF90
                dc.l    $D8090008, $0004FFA0, $D805000E, $0007FFB4
                dc.l    $D8050012, $0009FFD0, $D8050016, $000BFFE0
                dc.l    $D8050004, $0002FFF0, $D805001A, $000D0000
                dc.l    $0805001E, $000FFFC8, $08050004, $0002FFD8
                dc.l    $08050022, $0011FFE8, $08050026, $0013FFF8
                dc.l    $08050016, $000B0008, $0805002A, $00150020
                dc.l    $08050004, $00020030, $0805002E, $00170044
Offset_0x03E9CE: ; "PROGRAM YU 2"
                dc.w    $000A
                dc.l    $D8050012, $0009FF80, $D8050022, $0011FF90
                dc.l    $D8050026, $0013FFA0, $D8050000, $0000FFB0
                dc.l    $D8050022, $0011FFC0, $D8050004, $0002FFD0
                dc.l    $D8090008, $0004FFE0, $0805002A, $0015FFE8
                dc.l    $08050032, $0019FFF8, $08050036, $001B0008
Offset_0x03EA20: ; "CHARACTER DESIGN BIGISLAND"
                dc.w    $0018
                dc.l    $D805001E, $000FFF88, $D805003A, $001DFF98
                dc.l    $D8050004, $0002FFA8, $D8050022, $0011FFB8
                dc.l    $D8050004, $0002FFC8, $D805001E, $000FFFD8
                dc.l    $D805003E, $001FFFE8, $D805000E, $0007FFF8
                dc.l    $D8050022, $00110008, $D8050042, $00210020
                dc.l    $D805000E, $00070030, $D805002E, $00170040
                dc.l    $D8010046, $00230050, $D8050000, $00000058
                dc.l    $D805001A, $000D0068, $08050048, $0024FFC0
                dc.l    $08010046, $0023FFD0, $08050000, $0000FFD8
                dc.l    $08010046, $0023FFE8, $0805002E, $0017FFF0
                dc.l    $08050016, $000B0000, $08050004, $00020010
                dc.l    $0805001A, $000D0020, $08050042, $00210030
Offset_0x03EAE2: ; "DESIGN JINYA PHENIX RIE" 
                dc.w    $0014
                dc.l    $D0050042, $0021FFA0, $D005000E, $0007FFB0
                dc.l    $D005002E, $0017FFC0, $D0010046, $0023FFD0
                dc.l    $D0050000, $0000FFD8, $D005001A, $000DFFE8
                dc.l    $0005004C, $0026FFE8, $00010046, $0023FFF8
                dc.l    $0005001A, $000D0004, $0005002A, $00150014
                dc.l    $00050004, $00020024, $20050012, $0009FFD0
                dc.l    $2005003A, $001DFFE0, $2005000E, $0007FFF0
                dc.l    $2005001A, $000D0000, $20010046, $00230010
                dc.l    $20050050, $00280018, $20050022, $00110030
                dc.l    $20010046, $00230040, $2005000E, $00070048
Offset_0x03EB84: ; "SOUND PRODUCE MASATO NAKAMURA"
                dc.w    $001A
                dc.l    $D805002E, $0017FF98, $D8050026, $0013FFA8
                dc.l    $D8050032, $0019FFB8, $D805001A, $000DFFC8
                dc.l    $D8050054, $002AFFD8, $D8050012, $0009FFF8
                dc.l    $D8050022, $00110008, $D8050026, $00130018
                dc.l    $D8050042, $00210028, $D8050032, $00190038
                dc.l    $D805001E, $000F0048, $D805000E, $00070058
                dc.l    $08090008, $0004FF88, $08050004, $0002FF9C
                dc.l    $0805002E, $0017FFAC, $08050004, $0002FFBC
                dc.l    $0805003E, $001FFFCC, $08050026, $0013FFDC
                dc.l    $0805001A, $000DFFF8, $08050004, $00020008
                dc.l    $08050058, $002C0018, $08050004, $00020028
                dc.l    $08090008, $00040038, $08050032, $0019004C
                dc.l    $08050022, $0011005C, $08050004, $0002006C
Offset_0x03EC56: ; "SOUND PROGRAM JIMITA MACKY"
                dc.w    $0017
                dc.l    $D005002E, $0017FF98, $D0050026, $0013FFA8
                dc.l    $D0050032, $0019FFB8, $D005001A, $000DFFC8
                dc.l    $D0050054, $002AFFD8, $D0050012, $0009FFF8
                dc.l    $D0050022, $00110008, $D0050026, $00130018
                dc.l    $D0050000, $00000028, $D0050022, $00110038
                dc.l    $D0050004, $00020048, $D0090008, $00040058
                dc.l    $0005004C, $0026FFD0, $00010046, $0023FFE0
                dc.l    $00090008, $0004FFE8, $00010046, $0023FFFC
                dc.l    $0005003E, $001F0004, $00050004, $00020014
                dc.l    $20090008, $0004FFD0, $20050004, $0002FFE4
                dc.l    $2005001E, $000FFFF4, $20050058, $002C0004
                dc.l    $2005002A, $00150014
Offset_0x03ED10: ; "SPECIAL TANKS FUJIO MINEGISHI PAPA"
                dc.w    $001F
                dc.l    $D805002E, $0017FF80, $D8050012, $0009FF90
                dc.l    $D805000E, $0007FFA0, $D805001E, $000FFFB0
                dc.l    $D8010046, $0023FFC0, $D8050004, $0002FFC8
                dc.l    $D8050016, $000BFFD8, $D805003E, $001FFFF8
                dc.l    $D805003A, $001D0008, $D8050004, $00020018
                dc.l    $D805001A, $000D0028, $D8050058, $002C0038
                dc.l    $D805002E, $00170048, $0005005C, $002EFFB0
                dc.l    $00050032, $0019FFC0, $0005004C, $0026FFD0
                dc.l    $00010046, $0023FFE0, $00050026, $0013FFE8
                dc.l    $00090008, $00040000, $00010046, $00230014
                dc.l    $0005001A, $000D001C, $0005000E, $0007002C
                dc.l    $00050000, $0000003C, $00010046, $0023004C
                dc.l    $0005002E, $00170054, $0005003A, $001D0064
                dc.l    $00010046, $00230074, $20050012, $0009FFF8
                dc.l    $20050004, $00020008, $20050012, $00090018
                dc.l    $20050004, $00020028
Offset_0x03EE0A: ; "PRESENTED BY SEGA"
                dc.w    $000F
                dc.l    $F8050012, $0009FF80, $F8050022, $0011FF90
                dc.l    $F805000E, $0007FFA0, $F805002E, $0017FFB0
                dc.l    $F805000E, $0007FFC0, $F805001A, $000DFFD0
                dc.l    $F805003E, $001FFFE0, $F805000E, $0007FFF0
                dc.l    $F8050042, $00210000, $F8050048, $00240018
                dc.l    $F805002A, $00150028, $F805002E, $00170040
                dc.l    $F805000E, $00070050, $F8050000, $00000060
                dc.l    $F8050004, $00020070
Offset_0x03EE84: ; "TRY AGAIN" 
                dc.w    $0008
                dc.l    $3005003E, $001FFFC0, $30050022, $0011FFD0
                dc.l    $3005002A, $0015FFE0, $30050004, $0002FFF8
                dc.l    $30050000, $00000008, $30050004, $00020018
                dc.l    $30010046, $00230028, $3005001A, $000D0030
Offset_0x03EEC6: ; "SONIC TEAM PRESENTS"
                dc.w    $0011
                dc.l    $E805002E, $0017FFB4, $E8050026, $0013FFC4
                dc.l    $E805001A, $000DFFD4, $E8010046, $0023FFE4
                dc.l    $E805001E, $000FFFEC, $E805003E, $001F0004
                dc.l    $E805000E, $00070014, $E8050004, $00020024
                dc.l    $E8090008, $00040034, $00050012, $0009FFC0
                dc.l    $00050022, $0011FFD0, $0005000E, $0007FFE0
                dc.l    $0005002E, $0017FFF0, $0005000E, $00070000
                dc.l    $0005001A, $000D0010, $0005003E, $001F0020
                dc.l    $0005002E, $00170030        
;===============================================================================
; Objeto 0x8A - Créditos do Sonic 1
; [ Término ]
;===============================================================================