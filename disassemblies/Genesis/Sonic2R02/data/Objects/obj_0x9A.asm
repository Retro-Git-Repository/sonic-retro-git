;===============================================================================
; Objeto 0x9A - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; [ Início ]
;===============================================================================    
Offset_0x0373FC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03740A(PC, D0), D1
                jmp     Offset_0x03740A(PC, D1)
Offset_0x03740A:
                dc.w    Offset_0x03740E-Offset_0x03740A
                dc.w    Offset_0x03742A-Offset_0x03740A
Offset_0x03740E:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$FF80, $0010(A0)
                bsr     Load_Turtloid_SubObj_0x9B              ; Offset_0x037514
                lea     (Turtloid_Animate_Data), A1            ; Offset_0x03762A
                move.l  A1, $002E(A0)
                bra     Load_Enemy_Boost_SubObj_0x9C           ; Offset_0x03758C
Offset_0x03742A:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x037440(PC, D0), D1
                jsr     Offset_0x037440(PC, D1)
                bsr     Offset_0x037448
                bra     Offset_0x0361AE
Offset_0x037440:
                dc.w    Offset_0x03746A-Offset_0x037440
                dc.w    Offset_0x037494-Offset_0x037440
                dc.w    Offset_0x0374B4-Offset_0x037440
                dc.w    Offset_0x0374CE-Offset_0x037440
Offset_0x037448:
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x03619C
                move.w  #$0018, D1
                move.w  #$0008, D2
                move.w  #$000E, D3
                move.w  (A7)+, D4
                jmp     (Platform_Object)                      ; Offset_0x019BA0
Offset_0x03746A:
                bsr     Offset_0x0360FC
                tst.w   D0
                bmi     Exit_Sub_01                            ; Offset_0x037512
                cmpi.w  #$0080, D2
                bcc     Exit_Sub_01                            ; Offset_0x037512
                addq.b  #$02, $0025(A0)
                move.w  #$0000, $0010(A0)
                move.b  #$04, $002A(A0)
                move.b  #$01, $001A(A0)
                rts
Offset_0x037494:
                subq.b  #$01, $002A(A0)
                bpl     Exit_Sub_01                            ; Offset_0x037512
                addq.b  #$02, $0025(A0)
                move.b  #$08, $002A(A0)
                move.w  $002C(A0), A1
                move.b  #$03, $001A(A1)
                bra     Load_Turtloid_Weapon                   ; Offset_0x0375C2
Offset_0x0374B4:
                subq.b  #$01, $002A(A0)
                bpl.s   Offset_0x0374CC
                addq.b  #$02, $0025(A0)
                move.w  #$FF80, $0010(A0)
                clr.b   $001A(A0)
                move.w  $002C(A0), A1
Offset_0x0374CC:
                rts
Offset_0x0374CE:
                rts
;===============================================================================
; Objeto 0x9A - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; [ Término ]
;===============================================================================