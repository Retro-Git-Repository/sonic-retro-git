;===============================================================================
; Objeto 0xAB - Inimigo Grabber na Chemical Plant
; [ Início ]    Objeto vinculado ao 0xA7
;===============================================================================                                                                
Offset_0x038C38:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038C46(PC, D0), D1
                jmp     Offset_0x038C46(PC, D1)
Offset_0x038C46:
                dc.w    Offset_0x038C4A-Offset_0x038C46
                dc.w    Offset_0x038C4E-Offset_0x038C46
Offset_0x038C4A:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x038C4E:
                jmp     (MarkObjGone)                          ; Offset_0x016358  
;-------------------------------------------------------------------------------
Obj_0xA7_Sub: ; Offset_0x038C54:
                move.w  $0034(A0), A1
                move.w  (A1), D0
                tst.b   $0031(A0)
                beq.s   Offset_0x038C7E
                subq.b  #$01, $0037(A0)
                beq.s   Offset_0x038C92
                move.b  $0036(A0), D1
                andi.b  #$0C, D0
                beq.s   Offset_0x038C7C
                cmp.b   D1, D0
                beq.s   Offset_0x038C7C
                move.b  D0, $0036(A0)
                addq.b  #$01, $0038(A0)
Offset_0x038C7C:
                rts
Offset_0x038C7E:
                andi.b  #$0C, D0
                beq.s   Offset_0x038C7C
                nop
                st      $0031(A0)
                move.b  D0, $0036(A0)
                nop
                rts
Offset_0x038C92:
                cmpi.b  #$04, $0038(A0)
                bcs.s   Offset_0x038CC2
                move.b  #$0A, $0025(A0)
                clr.w   $0012(A0)
                clr.b   $0020(A0)
                move.w  $0032(A0), A2
                move.b  #$00, $002A(A2)
                bset    #$01, $0022(A2)
                move.b  #$00, $001C(A2)
                clr.w   $0032(A0)
Offset_0x038CC2:
                move.b  #$20, $0037(A0)
                clr.b   $0031(A0)
                clr.b   $0038(A0)
                rts
;-------------------------------------------------------------------------------    
Obj_0xA7_Sub_01: ; Offset_0x038CD2:                
                subq.b  #$01, $002A(A0)
                bne.s   Offset_0x038CEA
                move.b  $002B(A0), $002A(A0)
                subq.b  #$01, $002B(A0)
                beq.s   Offset_0x038CEC
                bchg    #05, $0002(A0)
Offset_0x038CEA:
                rts
Offset_0x038CEC:
                move.b  #$27, $0000(A0)
                move.b  #$02, $0024(A0)
                bset    #$05, $0002(A0)
                move.w  $0032(A0), D0
                beq.s   Offset_0x038D18
                move.w  D0, A2
                move.b  #$00, $002A(A2)
                bset    #$01, $0022(A2)
                move.b  #$0B, $0020(A0)
Offset_0x038D18:
                rts
;-------------------------------------------------------------------------------    
Obj_0xA7_Sub_02: ; Offset_0x038D1A:                
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x038D26
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x038D26:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x038D40
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x038D40:
                lea     ($FFFFFC00).w, A3
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x038D52
                bclr    #$07, $02(A3, D0)
Offset_0x038D52:
                tst.b   $0030(A0)
                beq.s   Offset_0x038D68
                move.w  $0032(A0), A3
                move.b  #$00, $002A(A3)
                bset    #$01, $0022(A3)
Offset_0x038D68:
                moveq   #$00, D6
                move.b  $002D(A0), D6
Offset_0x038D6E:
                move.w  (A2)+, A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                dbra    D6, Offset_0x038D6E
                bra     J_DeleteObject_01                      ; Offset_0x036344
;-------------------------------------------------------------------------------                   
Load_Grabber_Sub_Obj_0xA9: ; Offset_0x038D7E:
                dc.w    $003E, $A93A
;-------------------------------------------------------------------------------
Load_Grabber_Sub_Obj_0xA8: ; Offset_0x038D82:
                dc.w    $003C, $A838
;-------------------------------------------------------------------------------    
Load_Grabber_Sub_Obj_0xAA: ; Offset_0x038D86:
                dc.w    $003A, $AA3C
;------------------------------------------------------------------------------- 
Obj_0xA7_Ptr: ; Offset_0x038D8A:
                dc.l    Grabber_Mappings                       ; Offset_0x038DB8
                dc.w    $A500
                dc.b    $04, $04, $10, $0B                    
;------------------------------------------------------------------------------- 
Obj_0xA8_Ptr: ; Offset_0x038D94:
                dc.l    Grabber_Mappings                       ; Offset_0x038DB8
                dc.w    $A500
                dc.b    $04, $01, $10, $D7
;------------------------------------------------------------------------------- 
Obj_0xA9_Ptr: ; Offset_0x038D9E:
                dc.l    Grabber_Mappings                       ; Offset_0x038DB8
                dc.w    $A500
                dc.b    $04, $04, $04, $00
;------------------------------------------------------------------------------- 
Obj_0xAA_Ptr: ; Offset_0x038DA8:
                dc.l    Grabber_Mappings_01                    ; Offset_0x038DC6
                dc.w    $A500
                dc.b    $04, $05, $04, $00
;-------------------------------------------------------------------------------                  
Grabber_Animate_Data: ; Offset_0x038DB2:
                dc.w    Offset_0x038DB4-Grabber_Animate_Data
Offset_0x038DB4:
                dc.b    $07, $00, $01, $FF   
;------------------------------------------------------------------------------- 
Grabber_Mappings: ; Offset_0x038DB8:
                dc.w    Offset_0x038DD8-Grabber_Mappings
                dc.w    Offset_0x038DF2-Grabber_Mappings
                dc.w    Offset_0x038E0C-Grabber_Mappings
                dc.w    Offset_0x038E16-Grabber_Mappings
                dc.w    Offset_0x038E20-Grabber_Mappings
                dc.w    Offset_0x038E2A-Grabber_Mappings
                dc.w    Offset_0x038E34-Grabber_Mappings
Grabber_Mappings_01: ; Offset_0x038DC6:
                dc.w    Offset_0x038E3E-Grabber_Mappings_01
                dc.w    Offset_0x038E48-Grabber_Mappings_01
                dc.w    Offset_0x038E52-Grabber_Mappings_01
                dc.w    Offset_0x038E64-Grabber_Mappings_01
                dc.w    Offset_0x038E76-Grabber_Mappings_01
                dc.w    Offset_0x038EAA-Grabber_Mappings_01
                dc.w    Offset_0x038E90-Grabber_Mappings_01
                dc.w    Offset_0x038ECC-Grabber_Mappings_01
                dc.w    Offset_0x038ECC-Grabber_Mappings_01                
Offset_0x038DD8:
                dc.w    $0003
                dc.l    $F8010000, $0000FFE5, $F80D0002, $0001FFED
                dc.l    $0809001D, $000EFFF1
Offset_0x038DF2:
                dc.w    $0003
                dc.l    $F8010000, $0000FFE5, $F80D0002, $0001FFED
                dc.l    $080D0023, $0011FFF1
Offset_0x038E0C:
                dc.w    $0001
                dc.l    $FC00000A, $0005FFFC
Offset_0x038E16:
                dc.w    $0001
                dc.l    $F809000F, $0007FFF9
Offset_0x038E20:
                dc.w    $0001
                dc.l    $F80D0015, $000AFFF9
Offset_0x038E2A:
                dc.w    $0001
                dc.l    $FC00002B, $0015FFFC
Offset_0x038E34:
                dc.w    $0001
                dc.l    $FC00002C, $0016FFFC
;-------------------------------------------------------------------------------
Offset_0x038E3E:
                dc.w    $0001
                dc.l    $0001000B, $0005FFFC
Offset_0x038E48:
                dc.w    $0001
                dc.l    $0003000B, $0005FFFC
Offset_0x038E52:
                dc.w    $0002
                dc.l    $0001000B, $0005FFFC, $1003000B, $0005FFFC
Offset_0x038E64:
                dc.w    $0002
                dc.l    $0003000B, $0005FFFC, $2003000B, $0005FFFC
Offset_0x038E76:
                dc.w    $0003
                dc.l    $0001000B, $0005FFFC, $1003000B, $0005FFFC
                dc.l    $3003000B, $0005FFFC
Offset_0x038E90:
                dc.w    $0003
                dc.l    $0003000B, $0005FFFC, $2003000B, $0005FFFC
                dc.l    $4003000B, $0005FFFC
Offset_0x038EAA:
                dc.w    $0004
                dc.l    $0001000B, $0005FFFC, $1003000B, $0005FFFC
                dc.l    $3003000B, $0005FFFC, $5003000B, $0005FFFC
Offset_0x038ECC:
                dc.w    $0004
                dc.l    $0003000B, $0005FFFC, $2003000B, $0005FFFC
                dc.l    $4003000B, $0005FFFC, $6003000B, $0005FFFC 
;------------------------------------------------------------------------------- 
Unk_Map_Offset_0x038EEE: ; Mapeamento não referenciado no ponteiro
                dc.w    $0005
                dc.l    $0001000B, $0005FFFC, $1003000B, $0005FFFC
                dc.l    $3003000B, $0005FFFC, $5003000B, $0005FFFC
                dc.l    $7003000B, $0005FFFC                                                                 
;===============================================================================
; Objeto 0xAB - Inimigo Grabber na Chemical Plant
; [ Término ]   Objeto vinculado ao 0xA7
;===============================================================================