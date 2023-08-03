; Boot definition
boot:
;OxOO
  dc.l      "DOS"<<8         ; DiskType
;OxO4
  dc.l      0                ; Checksum will be added by the build 
;OxO8
  dc.l      880              ; Rootblock

;OxOc
  lea       dos(pc),a1       ;name
  jsr       -96(a6)          ;FindResident()
  tst.l     d0
  beq.b     error2           ;not found
  move.l    d0,a0
  move.l    22(a0),a0        ;DosInit sub
  moveq     #0,d0
  rts
error2:
  moveq     #-1,d0
  rts

dos:  
  dc.b      "dos.library"