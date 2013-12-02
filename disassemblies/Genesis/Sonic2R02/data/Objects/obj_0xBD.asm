;===============================================================================
; Objeto 0xBD - Elevadores na Wing Fortress
; [ Início ]
;===============================================================================   
Offset_0x03B8AC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03B8BA(PC, D0), D1
                jmp     Offset_0x03B8BA(PC, D1)
Offset_0x03B8BA:
                dc.w    Offset_0x03B8C0-Offset_0x03B8BA
                dc.w    Offset_0x03B8CC-Offset_0x03B8BA
                dc.w    Offset_0x03B8E2-Offset_0x03B8BA
Offset_0x03B8C0:
                addq.b  #$02, $0024(A0)
                move.w  #$0001, $002A(A0)
                rts
Offset_0x03B8CC:
                subq.w  #$01, $002A(A0)
                bne.s   Offset_0x03B8DC
                move.w  #$0040, $002A(A0)
                bsr     Offset_0x03B994
Offset_0x03B8DC:
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x03B8E2:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03B8F6(PC, D0), D1
                jsr     Offset_0x03B8F6(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03B8F6:
                dc.w    Offset_0x03B900-Offset_0x03B8F6
                dc.w    Offset_0x03B940-Offset_0x03B8F6
                dc.w    Offset_0x03B94C-Offset_0x03B8F6
                dc.w    Offset_0x03B962-Offset_0x03B8F6
                dc.w    Offset_0x03B96E-Offset_0x03B8F6
Offset_0x03B900:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$02, $001A(A0)
                subq.b  #$02, $0024(A0)
                addq.b  #$02, $0025(A0)
                move.w  #$00C7, $002A(A0)
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03B926
                move.w  #$01C7, $002A(A0)
Offset_0x03B926:
                moveq   #$00, D0
                move.b  $0028(A0), D0
                subi.b  #$7E, D0
                move.b  D0, $0028(A0)
                move.w  Offset_0x03B93C(PC, D0), $0012(A0)
                rts
Offset_0x03B93C:
                dc.w    $FF00, $0100
Offset_0x03B940:
                lea     (WFz_Elevators_Animate_Data), A1       ; Offset_0x03B9CC
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x03B94C:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03B956
                bra     Offset_0x03B976
Offset_0x03B956:
                addq.b  #$02, $0025(A0)
                move.b  #$01, $001C(A0)
                rts
Offset_0x03B962:
                lea     (WFz_Elevators_Animate_Data), A1       ; Offset_0x03B9CC
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x03B96E:
                bsr     Load_Helix_Obj                         ; Offset_0x03B432
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x03B976:
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  #$0023, D1
                move.w  #$0004, D2
                move.w  #$0005, D3
                move.w  (A7)+, D4
                jmp     (Platform_Object)                      ; Offset_0x019BA0
Offset_0x03B994:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03B9C0
                move.b  #$BD, $0000(A1)    ; Nova instância do objeto na memória
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$04, $0024(A1)
                move.b  $0028(A0), $0028(A1)
                move.b  $0001(A0), $0001(A1)
Offset_0x03B9C0:
                rts
;-------------------------------------------------------------------------------
Obj_0xBD_Ptr: ; Offset_0x03B9C2:
                dc.l    WFz_Elevators_Mappings                 ; Offset_0x03B9DC
                dc.w    $E40E
                dc.b    $04, $04, $18, $00
;-------------------------------------------------------------------------------
WFz_Elevators_Animate_Data: ; Offset_0x03B9CC:
                dc.w    Offset_0x03B9D0-WFz_Elevators_Animate_Data
                dc.w    Offset_0x03B9D6-WFz_Elevators_Animate_Data
Offset_0x03B9D0:
                dc.b    $03, $02, $01, $00, $FA, $00
Offset_0x03B9D6:
                dc.b    $01, $00, $01, $02, $FA, $00
;-------------------------------------------------------------------------------       
WFz_Elevators_Mappings: ; Offset_0x03B9DC:
                dc.w    Offset_0x03B9E2-WFz_Elevators_Mappings
                dc.w    Offset_0x03B9F4-WFz_Elevators_Mappings
                dc.w    Offset_0x03BA06-WFz_Elevators_Mappings
Offset_0x03B9E2:
                dc.w    $0002
                dc.l    $FC080000, $0000FFE8, $FC080003, $00010000
Offset_0x03B9F4:
                dc.w    $0002
                dc.l    $FC080006, $0003FFE8, $FC080806, $08030000
Offset_0x03BA06:
                dc.w    $0002
                dc.l    $FC080009, $0004FFE8, $FC080809, $08040000                                                                                                                                        
;===============================================================================
; Objeto 0xBD - Elevadores na Wing Fortress
; [ Término ]
;===============================================================================