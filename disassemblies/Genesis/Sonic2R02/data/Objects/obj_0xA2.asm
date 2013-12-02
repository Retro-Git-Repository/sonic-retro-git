;===============================================================================
; Objeto 0xA2 - Sub-objeto usado pelo inimigo Slicer na Metropolis
; [ Início ]    Facas que são atiradas no jogador
;===============================================================================  
Offset_0x037FCE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x037FDC(PC, D0), D1
                jmp     Offset_0x037FDC(PC, D1)
Offset_0x037FDC:
                dc.w    Offset_0x037FE2-Offset_0x037FDC
                dc.w    Offset_0x037FEC-Offset_0x037FDC
                dc.w    Offset_0x038058-Offset_0x037FDC
Offset_0x037FE2:
                bsr     ObjectSettings                         ; Offset_0x03601A
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037FEC:
                tst.b   $0001(A0)
                bpl     J_DeleteObject_01                      ; Offset_0x036344
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03804E
                move.w  $002C(A0), A1
                cmpi.b  #$A1, (A1)
                bne.s   Offset_0x03804E
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03802A(PC, D0), D1
                jsr     Offset_0x03802A(PC, D1)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Slicer_Pincers_Animate_Data), A1      ; Offset_0x038116
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03802A:
                dc.w    Offset_0x03802C-Offset_0x03802A
Offset_0x03802C:
                bsr     Offset_0x0360FC                                           
                move.w  Offset_0x03804A(PC, D0), D2
                add.w   D2, $0010(A0)
                move.w  Offset_0x03804A(PC, D1), D2
                add.w   D2, $0012(A0)
                move.w  #$0200, D0
                move.w  D0, D1
                bra     Offset_0x036140
Offset_0x03804A:
                dc.w    $FFF0, $0010
Offset_0x03804E:
                addq.b  #$02, $0024(A0)
                move.w  #$0060, $002A(A0)
Offset_0x038058:
                subq.w  #$01, $002A(A0)
                bmi     J_DeleteObject_01                      ; Offset_0x036344
                jsr     (ObjectFall)                           ; Offset_0x016306
                lea     (Slicer_Pincers_Animate_Data), A1      ; Offset_0x038116
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------    
Load_Slicer_Pincers_Obj: ; Offset_0x038078:                
                lea     $003C(A0), A2
                moveq   #$00, D1
                moveq   #$01, D6
Offset_0x038080:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0380F6
                move.b  #$A2, $0000(A1)  ; Carrega o objeto 0xA2 através do 0xA1
                move.b  #$2A, $0028(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$05, $001A(A1)
                move.b  #$04, $0018(A1)
                move.w  #$0078, $002A(A1)
                move.w  A0, $002C(A1)
                move.w  A1, (A2)+
                move.w  #$FE00, D0
                btst    #$00, $0001(A1)
                beq.s   Offset_0x0380C6
                neg.w   D0
                bset    #$00, $0022(A1)
Offset_0x0380C6:
                move.w  D0, $0010(A1)
                lea     Offset_0x0380F8(PC, D1), A3
                move.b  (A3)+, D0
                ext.w   D0
                btst    #$00, $0001(A1)
                beq.s   Offset_0x0380DC
                neg.w   D0
Offset_0x0380DC:
                add.w   $0008(A0), D0
                move.w  D0, $0008(A1)
                move.b  (A3)+, D0
                ext.w   D0
                add.w   $000C(A0), D0
                move.w  D0, $000C(A1)
                addq.w  #$02, D1
                dbra    D6, Offset_0x038080
Offset_0x0380F6:
                rts
;-------------------------------------------------------------------------------                
Offset_0x0380F8:
                dc.b    $06, $00, $F0, $00   
;-------------------------------------------------------------------------------
Obj_0xA1_Ptr: ; Offset_0x0380FC:
                dc.l    Slicer_Mappings                        ; Offset_0x03811E
                dc.w    $243C
                dc.b    $04, $05, $10, $06       
;-------------------------------------------------------------------------------
Obj_0xA2_Ptr: ; Offset_0x038106:
                dc.l    Slicer_Mappings                        ; Offset_0x03811E
                dc.w    $243C
                dc.b    $04, $04, $10, $9A    
;------------------------------------------------------------------------------- 
Slicer_Animate_Data: ; Offset_0x038110:
                dc.w    Offset_0x038112-Slicer_Animate_Data
Offset_0x038112:
                dc.b    $13, $00, $02, $FF
;-------------------------------------------------------------------------------
Slicer_Pincers_Animate_Data: ; Offset_0x038116:
                dc.w    Offset_0x038118-Slicer_Pincers_Animate_Data
Offset_0x038118:
                dc.b    $03, $05, $06, $07, $08, $FF
;------------------------------------------------------------------------------- 
Slicer_Mappings: ; Offset_0x03811E:                
                dc.w    Offset_0x038130-Slicer_Mappings
                dc.w    Offset_0x03816A-Slicer_Mappings
                dc.w    Offset_0x0381A4-Slicer_Mappings
                dc.w    Offset_0x0381DE-Slicer_Mappings
                dc.w    Offset_0x038218-Slicer_Mappings
                dc.w    Offset_0x038232-Slicer_Mappings
                dc.w    Offset_0x038244-Slicer_Mappings
                dc.w    Offset_0x038256-Slicer_Mappings
                dc.w    Offset_0x038268-Slicer_Mappings
Offset_0x038130:
                dc.w    $0007
                dc.l    $F904001A, $000DFFF4, $0100001C, $000EFFF4
                dc.l    $F0090000, $0000FFF0, $00090006, $0003FFF0
                dc.l    $0001000C, $00060008, $F704001A, $000DFFE0
                dc.l    $FF00001C, $000EFFE0
Offset_0x03816A:
                dc.w    $0007
                dc.l    $F804001A, $000DFFF4, $0000001C, $000EFFF4
                dc.l    $F0090000, $0000FFF0, $0009000E, $0007FFF0
                dc.l    $0001000C, $00060008, $F804001A, $000DFFE0
                dc.l    $0000001C, $000EFFE0
Offset_0x0381A4:
                dc.w    $0007
                dc.l    $F704001A, $000DFFF4, $FF00001C, $000EFFF4
                dc.l    $F0090000, $0000FFF0, $00090014, $000AFFF0
                dc.l    $0001000C, $00060008, $F904001A, $000DFFE0
                dc.l    $0100001C, $000EFFE0
Offset_0x0381DE:
                dc.w    $0007
                dc.l    $E004181E, $180FFFF4, $E800181D, $180EFFFC
                dc.l    $F0090000, $0000FFF0, $00090006, $0003FFF0
                dc.l    $0001000C, $00060008, $E004181E, $180FFFE0
                dc.l    $E800181D, $180EFFE8
Offset_0x038218:
                dc.w    $0003
                dc.l    $F0090000, $0000FFF0, $00090006, $0003FFF0
                dc.l    $0001000C, $00060008
Offset_0x038232:
                dc.w    $0002
                dc.l    $F004001A, $000DFFF0, $F800001C, $000EFFF0
Offset_0x038244:
                dc.w    $0002
                dc.l    $0000001D, $000EFFF0, $0804001E, $000FFFF0
Offset_0x038256:
                dc.w    $0002
                dc.l    $0000181C, $180E0008, $0804181A, $180D0000
Offset_0x038268:
                dc.w    $0002
                dc.l    $F004181E, $180F0000, $F800181D, $180E0008
;===============================================================================
; Objeto 0xA2 - Sub-objeto usado pelo inimigo Slicer na Metropolis
; [ Término ]   Facas que são atiradas no jogador
;===============================================================================  