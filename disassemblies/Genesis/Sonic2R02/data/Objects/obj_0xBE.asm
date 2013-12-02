;===============================================================================
; Objeto 0xBE - Escotilhas que abrem e fecham na Wing Fortress
; [ Início ]
;===============================================================================   
Offset_0x03BA18:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03BA26(PC, D0), D1
                jmp     Offset_0x03BA26(PC, D1)
Offset_0x03BA26:
                dc.w    Offset_0x03BA32-Offset_0x03BA26
                dc.w    Offset_0x03BA40-Offset_0x03BA26
                dc.w    Offset_0x03BA68-Offset_0x03BA26
                dc.w    Offset_0x03BA7A-Offset_0x03BA26
                dc.w    Offset_0x03BA68-Offset_0x03BA26
                dc.w    Offset_0x03BA9E-Offset_0x03BA26
Offset_0x03BA32:
                moveq   #$00, D0
                move.b  #$82, D0
                bsr     ObjectSettings_D0                      ; Offset_0x036020
                bra     Offset_0x03B3F0
Offset_0x03BA40:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$F0, D0
                cmp.b   $0028(A0), D0
                beq.s   Offset_0x03BA54
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BA54:
                addq.b  #$02, $0024(A0)
                clr.b   $001C(A0)
                move.w  #$00A0, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BA68:
                lea     (Hatchway_Animate_Data), A1            ; Offset_0x03BAE4
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BA7A:
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03BA8A
                bsr     Offset_0x03BAB0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BA8A:
                addq.b  #$02, $0024(A0)
                move.b  #$01, $001C(A0)
                bsr     Load_Helix_Obj                         ; Offset_0x03B432
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BA9E:
                move.b  #$02, $0024(A0)
                move.w  #$0040, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BAB0:
                move.b  $001A(A0), D0
                cmpi.b  #$03, D0
                beq.s   Offset_0x03BAC2
                cmpi.b  #$04, D0
                bne     Load_Helix_Obj                         ; Offset_0x03B432
Offset_0x03BAC2:
                move.w  $0008(A0), -(A7)
                move.w  #$0023, D1
                move.w  #$0018, D2
                move.w  #$0019, D3
                move.w  (A7)+, D4
                jmp     (Platform_Object)                      ; Offset_0x019BA0
;-------------------------------------------------------------------------------
Obj_0xBE_Ptr: ; Offset_0x03BADA:
                dc.l    Hatchway_Mappings                      ; Offset_0x03BAF4
                dc.w    $E41A
                dc.b    $04, $04, $18, $00
;-------------------------------------------------------------------------------
Hatchway_Animate_Data: ; Offset_0x03BAE4:
                dc.w    Offset_0x03BAE8-Hatchway_Animate_Data
                dc.w    Offset_0x03BAEE-Hatchway_Animate_Data
Offset_0x03BAE8:
                dc.b    $05, $00, $01, $02, $03, $FC
Offset_0x03BAEE:
                dc.b    $05, $03, $02, $01, $00, $FC
;-------------------------------------------------------------------------------      
Hatchway_Mappings: ; Offset_0x03BAF4:
                dc.w    Offset_0x03BAFE-Hatchway_Mappings
                dc.w    Offset_0x03BB10-Hatchway_Mappings
                dc.w    Offset_0x03BB22-Hatchway_Mappings
                dc.w    Offset_0x03BB34-Hatchway_Mappings
                dc.w    Offset_0x03BB46-Hatchway_Mappings
Offset_0x03BAFE:
                dc.w    $0002
                dc.l    $E8090000, $0000FFE8, $E8090006, $00030000
Offset_0x03BB10:
                dc.w    $0002
                dc.l    $E809000C, $0006FFE8, $E8090012, $00090000
Offset_0x03BB22:
                dc.w    $0002
                dc.l    $E8090018, $000CFFE8, $E8090818, $080C0000
Offset_0x03BB34:
                dc.w    $0002
                dc.l    $E80E001E, $000FFFE0, $E80E081E, $080F0000
Offset_0x03BB46:
                dc.w    $0002
                dc.l    $E80E002A, $0015FFE0, $E80E082A, $08150000                                                                                                                             
;===============================================================================
; Objeto 0xBE - Escotilhas que abrem e fecham na Wing Fortress
; [ Término ]
;===============================================================================