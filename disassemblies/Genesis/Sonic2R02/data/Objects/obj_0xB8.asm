;===============================================================================
; Objeto 0xB8 - Canhão na Wing Fortress
; [ Início ]
;===============================================================================   
Offset_0x03B5E2:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B5F0(PC, D0), D1
                jmp     Offset_0x03B5F0(PC, D1)
Offset_0x03B5F0:
                dc.w    Offset_0x03B5F6-Offset_0x03B5F0
                dc.w    Offset_0x03B5FA-Offset_0x03B5F0
                dc.w    Offset_0x03B628-Offset_0x03B5F0
Offset_0x03B5F6:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x03B5FA:
                tst.b   $0001(A0)
                bpl.s   Offset_0x03B612
                bsr     Offset_0x0360FC
                tst.w   D1
                beq.s   Offset_0x03B612
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x03B618
Offset_0x03B612:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B618:
                addq.b  #$02, $0024(A0)
                move.w  #$0002, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B628:
                bsr     Offset_0x0360FC
                moveq   #$00, D6
                addi.w  #$0020, D2
                cmpi.w  #$0040, D2
                bcs.s   Offset_0x03B63E
                move.w  D0, D6
                lsr.w   #$01, D6
                addq.w  #$01, D6
Offset_0x03B63E:
                move.b  D6, $001A(A0)
                subq.w  #$01, $002A(A0)
                bne.s   Offset_0x03B652
                move.w  #$0060, $002A(A0)
                bsr     Offset_0x03B658
Offset_0x03B652:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B658:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03B6AC
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Arma dos inimigos
                move.b  #$03, $001A(A1)
                move.b  #$8E, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                lea     (Cannon_Weapon), A2                    ; Offset_0x037210
                move.l  A2, $002A(A1)
                moveq   #$00, D0
                move.b  $001A(A0), D0
                lsl.w   #$02, D0
                lea     Offset_0x03B6AE(PC, D0), A2
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D0, $0008(A1)
                move.b  (A2)+, D0
                ext.w   D0
                add.w   D0, $000C(A1)
                move.b  (A2)+, $0010(A1)
                move.b  (A2)+, $0012(A1)
Offset_0x03B6AC:
                rts
;-------------------------------------------------------------------------------                
Offset_0x03B6AE:
                dc.b    $00, $18, $00, $01, $EF, $10, $FF, $01, $11, $10, $01, $01
;-------------------------------------------------------------------------------  
Obj_0xB8_Ptr: ; Offset_0x03B6BA:
                dc.l    WFz_Cannon_Mappings                    ; Offset_0x03B6CA
                dc.w    $03AB
                dc.b    $04, $04, $10, $00
;-------------------------------------------------------------------------------  
Cannon_Weapon_Animate_Data: ; Offset_0x03B6C4:
                dc.w    Offset_0x03B6C6-Cannon_Weapon_Animate_Data
Offset_0x03B6C6:
                dc.b    $02, $03, $04, $FF                
;-------------------------------------------------------------------------------
WFz_Cannon_Mappings; ; Offset_0x03B6CA:
                dc.w    Offset_0x03B6D4-WFz_Cannon_Mappings
                dc.w    Offset_0x03B6F6-WFz_Cannon_Mappings
                dc.w    Offset_0x03B710-WFz_Cannon_Mappings
                dc.w    Offset_0x03B72A-WFz_Cannon_Mappings
                dc.w    Offset_0x03B734-WFz_Cannon_Mappings
Offset_0x03B6D4:
                dc.w    $0004
                dc.l    $F007E000, $E000FFF0, $F007E008, $E0040000
                dc.l    $0E00E010, $E008FFF8, $0E00E011, $E0080000
Offset_0x03B6F6:
                dc.w    $0003
                dc.l    $F007E000, $E000FFF0, $F007E008, $E0040000
                dc.l    $0405E012, $E009FFEB
Offset_0x03B710:
                dc.w    $0003
                dc.l    $F007E000, $E000FFF0, $F007E008, $E0040000
                dc.l    $0405E812, $E8090005
Offset_0x03B72A:
                dc.w    $0001
                dc.l    $FC008016, $800BFFFC
Offset_0x03B734:
                dc.w    $0001
                dc.l    $FC008017, $800BFFFC                                                                        
;===============================================================================
; Objeto 0xB8 - Canhão na Wing Fortress
; [ Término ]
;===============================================================================