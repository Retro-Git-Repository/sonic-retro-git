;===============================================================================
; Objeto 0x98 - Armas usadas pelos inimigos. Ex: Coco atirado pelo Coconuts
; [ Início ]
;===============================================================================    
Offset_0x037190:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03719E(PC, D0), D1
                jmp     Offset_0x03719E(PC, D1)
Offset_0x03719E:                
                dc.w    Offset_0x0371A2-Offset_0x03719E
                dc.w    Offset_0x0371A6-Offset_0x03719E
Offset_0x0371A2:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x0371A6:
                tst.b   $0001(A0)
                bpl     J_DeleteObject_01                      ; Offset_0x036344
                move.l  $002A(A0), A1                   
                jsr     (A1) ; Ponteiro inicializado pelo objeto que carregou previamente ex: Coconuts 
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------       
Nebula_Weapon: ; Offset_0x0371BA:      ; Usado pelo Objeto 0x99 - Nebula 
                bchg    #05, $0002(A0)
                jmp     (ObjectFall)                           ; Offset_0x016306
;-------------------------------------------------------------------------------  
Turtloid_Weapon: ; Offset_0x0371C6:    ; Usado pelo Objeto 0x9A - Turtloid 
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Turtloid_Weapon_Animate_Data), A1     ; Offset_0x037624
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
;-------------------------------------------------------------------------------              
Coconuts_Weapon: ; Offset_0x0371D8:    ; Usado pelo Objeto 0x9D - Coconuts 
                addi.w  #$0020, $0012(A0)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                rts  
;-------------------------------------------------------------------------------                 
Clucker_Weapon: ; Offset_0x0371E6: 
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Clucker_Weapon_Animate_Data), A1      ; Offset_0x03916A
                jmp     (AnimateSprite)                        ; Offset_0x0164CA                
;-------------------------------------------------------------------------------               
Spiny_Weapon: ; Offset_0x0371F8:       ; Usado pelo Objeto 0xA5, AxA6 - Spiny 
                addi.w  #$0020, $0012(A0)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Spiny_Weapon_Animate_Data), A1        ; Offset_0x03884A
                jmp     (AnimateSprite)                        ; Offset_0x0164CA     
;------------------------------------------------------------------------------- 
Cannon_Weapon: ; Offset_0x037210:      ; Usado pelo Objeto 0xB8 - Cannon 
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Cannon_Weapon_Animate_Data), A1       ; Offset_0x03B6C4
                jmp     (AnimateSprite)                        ; Offset_0x0164CA  
;-------------------------------------------------------------------------------  
Rexon_Fireball_Map_Ptr: ; Offset_0x037222:
                dc.l    Rexon_Mappings                         ; Offset_0x037120
                dc.w    $237E
                dc.b    $84, $04, $04, $98
;-------------------------------------------------------------------------------                   
Nebula_Bomb_Map_Ptr: ; Offset_0x03722C:                
                dc.l    Nebula_Mappings                        ; Offset_0x037360
                dc.w    $A36E
                dc.b    $84, $04, $08, $8B                  
;-------------------------------------------------------------------------------                  
Turtloid_Bullet_Map_Ptr: ; Offset_0x037236:                
                dc.l    Turtloid_Mappings                      ; Offset_0x037636
                dc.w    $038A
                dc.b    $84, $04, $04, $98                                 
;-------------------------------------------------------------------------------                
Coconuts_Coconut_Map_Ptr: ; Offset_0x037240: 
                dc.l    Coconuts_Mappings                      ; Offset_0x03787E
                dc.w    $03EE
                dc.b    $84, $04, $08, $8B   
;-------------------------------------------------------------------------------                
Asteron_Spikes_Map_Ptr: ; Offset_0x03724A:  
                dc.l    Asteron_Mappings                       ; Offset_0x0385FC
                dc.w    $8368
                dc.b    $84, $05, $04, $98               
;-------------------------------------------------------------------------------                  
Spiny_Shot_Map_Ptr: ; Offset_0x037254:
                dc.l    Spiny_Mappings                         ; Offset_0x038850
                dc.w    $252D
                dc.b    $84, $05, $04, $98     
;-------------------------------------------------------------------------------  
Grabber_Unk_Map_Ptr: ; Offset_0x03725E:
                dc.l    Grabber_Mappings                       ; Offset_0x038DB8
                dc.w    $A500
                dc.b    $84, $04, $04, $98
;-------------------------------------------------------------------------------  
Clucker_Bullet_Map_Ptr: ; Offset_0x037268:
                dc.l    Clucker_Mappings                       ; Offset_0x039176
                dc.w    $0379
                dc.b    $84, $05, $04, $98
;------------------------------------------------------------------------------- 
Metal_Sonic_Spikes_Map_Ptr: ; Offset_0x037272:
                dc.l    Metal_Sonic_Mappings                   ; Offset_0x039A72
                dc.w    $2380
                dc.b    $84, $05, $04, $98
;-------------------------------------------------------------------------------
Cannon_Bullet_Map_Ptr: ; Offset_0x03727C:
                dc.l    WFz_Cannon_Mappings                    ; Offset_0x03B6CA
                dc.w    $03AB
                dc.b    $84, $03, $04, $98                   
;===============================================================================
; Objeto 0x98 - Armas usadas pelos inimigos. Ex: Coco atirado pelo Coconuts
; [ Término ]
;===============================================================================  