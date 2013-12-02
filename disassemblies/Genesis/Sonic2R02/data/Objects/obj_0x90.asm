;===============================================================================
; Objeto 0x90 -> Pedras espirrando quando o Grounder sai da parede na Aquatic
; [ Início ]     Ruin, carregado a partir do objeto 0x8D / 0x8E
;===============================================================================   
Offset_0x036614:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036622(PC, D0), D1
                jmp     Offset_0x036622(PC, D1)
Offset_0x036622:   
                dc.w    Offset_0x036626-Offset_0x036622
                dc.w    Offset_0x03665E-Offset_0x036622
Offset_0x036626:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$4509, $0002(A0)
                move.w  $002E(A0), D0
                move.b  Offset_0x036654(PC, D0), $0010(A0)
                move.b  Offset_0x036654+$01(PC, D0), $0012(A0)
                lsr.w   #$01, D0
                move.b  Offset_0x03664E(PC, D0), $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Offset_0x03664E:
                dc.b    $00, $02, $00, $01, $00, $00
;-------------------------------------------------------------------------------
Offset_0x036654:
                dc.b    $FF, $FC, $04, $FD, $02, $00, $FD, $FF, $FD, $FD
;-------------------------------------------------------------------------------
Offset_0x03665E: ; Referência também pelo objeto 0x8F - Parede que oculta o Grounder
                tst.b   $0001(A0)
                bpl     J_DeleteObject_01                      ; Offset_0x036344
                jsr     (ObjectFall)                           ; Offset_0x016306
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Load_Grounder_Rock_Obj: ; Offset_0x036672: ; Usado pelo objeto 0x8E - Grounder                                        
                moveq   #$00, D1
                moveq   #$04, D6
Offset_0x036676:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x036686
                bsr     Offset_0x036688
                dbra    D6, Offset_0x036676
Offset_0x036686:
                rts
Offset_0x036688:
                move.b  #$90, $0000(A1) ; Carrega o objeto 0x90 - Pedras que espirram durante a saída do Grounder
                move.b  #$06, $0028(A1)
                move.w  A0, $002C(A1)
                move.w  D1, $002E(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addq.w  #$02, D1
                rts
;-------------------------------------------------------------------------------                
Load_Grounder_Wall_Obj: ; Offset_0x0366AC: ; Usado pelo objeto 0x8E - Grounder                 
                moveq   #$00, D1
                moveq   #$03, D6
Offset_0x0366B0:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x0366C0
                bsr     Offset_0x0366C2
                dbra    D6, Offset_0x0366B0
Offset_0x0366C0:
                rts
Offset_0x0366C2:
                move.b  #$8F, $0000(A1) ; Carrega o objeto 0x8F - Parede que esconde o Grounder
                move.b  #$04, $0028(A1)
                move.w  A0, $002C(A1)
                move.w  D1, $002E(A1)
                move.l  $0008(A0), D0
                swap.w  D0
                moveq   #$00, D2
                move.b  Offset_0x036706(PC, D1), D2
                ext.w   D2
                add.w   D2, D0
                swap.w  D0
                move.l  D0, $0008(A1)
                move.l  $000C(A0), D0
                swap.w  D0
                moveq   #$00, D2
                move.b  Offset_0x036706+$01(PC, D1), D2
                ext.w   D2
                add.w   D2, D0
                swap.w  D0
                move.l  D0, $000C(A1)
                addq.w  #$02, D1
                rts
;-------------------------------------------------------------------------------                
Offset_0x036706:
                dc.b    $00, $EC, $10, $FC, $00, $0C, $F0, $FC
;-------------------------------------------------------------------------------                            
Obj_0x8E_Ptr: ; Offset_0x03670E:  
                dc.l    Grounder_Mappings                      ; Offset_0x03673A
                dc.w    $A509
                dc.b    $04, $05, $10, $02        
;-------------------------------------------------------------------------------   
Obj_0x8F_Ptr: ; Offset_0x036718:                   
                dc.l    Grounder_Wall_Mappings                 ; Offset_0x03674A
                dc.w    $0000
                dc.b    $84, $04, $10, $00   
;-------------------------------------------------------------------------------  
Obj_0x90_Ptr: ; Offset_0x036722:
                dc.l    Grounder_Rock_Mappings                 ; Offset_0x036744
                dc.w    $A509
                dc.b    $84, $04, $08, $00  
;-------------------------------------------------------------------------------                              
Grounder_AnimateData: ; Offset_0x03672C:  
                dc.w    Offset_0x03672E-Grounder_AnimateData
Offset_0x03672E:
                dc.b    $03, $02, $03, $04, $FF, $00
;-------------------------------------------------------------------------------                 
Grounder_AnimateData_01: ; Offset_0x036734:
                dc.w    Offset_0x036736-Grounder_AnimateData_01
Offset_0x036736:
                dc.b    $07, $00, $01, $FC
;-------------------------------------------------------------------------------
Grounder_Mappings: ; Offset_0x03673A:
                dc.w    Offset_0x03674C-Grounder_Mappings
                dc.w    Offset_0x03676E-Grounder_Mappings
                dc.w    Offset_0x036790-Grounder_Mappings
                dc.w    Offset_0x0367A2-Grounder_Mappings
                dc.w    Offset_0x0367B4-Grounder_Mappings
Grounder_Rock_Mappings: ; Offset_0x036744:
                dc.w    Offset_0x0367C6-Grounder_Rock_Mappings
                dc.w    Offset_0x0367D0-Grounder_Rock_Mappings
                dc.w    Offset_0x0367DA-Grounder_Rock_Mappings         
Grounder_Wall_Mappings: ; Offset_0x03674A:
                dc.w    Offset_0x0367E4-Grounder_Wall_Mappings                       
Offset_0x03674C:
                dc.w    $0004
                dc.l    $F4000000, $0000FFF8, $FC060001, $0000FFF0
                dc.l    $F4000800, $08000000, $FC060801, $08000000
Offset_0x03676E:
                dc.w    $0004
                dc.l    $EC000007, $0003FFF8, $F4070008, $0004FFF0
                dc.l    $EC000807, $08030000, $F4070808, $08040000
Offset_0x036790:
                dc.w    $0002
                dc.l    $EC0F0010, $0008FFF0, $0C0C0020, $0010FFF0
Offset_0x0367A2:
                dc.w    $0002
                dc.l    $EC0F0010, $0008FFF0, $0C0C0024, $0012FFF0
Offset_0x0367B4:
                dc.w    $0002
                dc.l    $EC0F0010, $0008FFF0, $0C0C0028, $0014FFF0
;-------------------------------------------------------------------------------                
Offset_0x0367C6:
                dc.w    $0001
                dc.l    $F805002C, $0016FFF8
Offset_0x0367D0:
                dc.w    $0001
                dc.l    $FC000030, $0018FFFC
Offset_0x0367DA:
                dc.w    $0001
                dc.l    $FC000031, $0018FFFC
;-------------------------------------------------------------------------------              
Offset_0x0367E4:
                dc.w    $0002
                dc.l    $F8054093, $4049FFF0, $F8054097, $404B0000
;===============================================================================
; Objeto 0x90 -> Pedras espirrando quando o Grounder sai da parede na Aquatic
; [ Término ]    Ruin, carregado a partir do objeto 0x8D / 0x8E 
;===============================================================================
