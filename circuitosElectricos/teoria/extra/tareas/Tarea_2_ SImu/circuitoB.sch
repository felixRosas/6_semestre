*version 9.1 1703335898
u 60
V? 3
R? 3
L? 2
C? 2
PRINT? 4
@libraries
@analysis
.AC 1 1 0
+0 1
+1 0.318309
+2 0.318309
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 3223 
@status
n 0 120:02:11:17:45:04;1583970304 e 
s 2832 120:02:11:20:46:21;1583981181 e 
*page 1 0 970 720 iA
@ports
port 44 GND_ANALOG 540 280 h
@parts
part 2 VAC 470 220 h
a 0 sp 0 0 0 50 hln 100 PART=VAC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 REFDES=V1
a 0 u 13 0 -9 23 hcn 100 ACMAG=13V
a 0 u 0 0 0 20 hcn 100 ACPHASE=0
part 3 VAC 560 190 v
a 0 sp 0 0 0 50 hln 100 PART=VAC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 20 10 hcn 100 REFDES=V2
a 0 u 13 0 -9 23 hcn 100 ACMAG=20V
a 0 u 0 0 0 20 hcn 100 ACPHASE=60
part 4 R 490 190 h
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=4
part 5 R 660 250 v
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=2
part 7 c 620 250 v
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 15 25 hln 100 VALUE=0.5
part 6 L 540 210 d
a 0 sp 0 0 0 10 hlb 100 PART=L
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=L2012C
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=L1
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 u 13 0 15 25 hln 100 VALUE=2
part 59 VPRINT1 620 190 h
a 0 sp 0 0 0 40 hlb 100 PART=VPRINT1
a 0 a 0:13 0 0 0 hln 100 PKGREF=PRINT3
a 0 ap 0 0 30 0 hcn 100 REFDES=PRINT3
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
part 58 VPRINT1 540 190 h
a 0 sp 0 0 0 40 hlb 100 PART=VPRINT1
a 0 a 0:13 0 0 0 hln 100 PKGREF=PRINT2
a 0 ap 0 0 30 0 hcn 100 REFDES=PRINT2
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
@conn
w 9
a 0 up 0:33 0 0 0 hln 100 V=
s 490 190 470 190 8
s 470 190 470 220 10
a 0 up 33 0 472 205 hlt 100 V=
w 22
a 0 up 0:33 0 0 0 hln 100 V=
s 470 260 470 280 21
s 620 280 660 280 33
s 620 250 620 280 31
s 540 280 620 280 36
a 0 up 33 0 580 279 hct 100 V=
s 540 270 540 280 34
s 660 280 660 250 25
s 470 280 540 280 57
w 51
a 0 up 0:33 0 0 0 hln 100 V=
s 530 190 540 190 12
s 540 190 560 190 54
s 540 190 540 210 52
a 0 up 33 0 542 200 hlt 100 V=
w 15
a 0 up 0:33 0 0 0 hln 100 V=
s 600 190 620 190 14
s 620 190 660 190 20
a 0 up 33 0 640 189 hct 100 V=
s 620 220 620 190 18
s 660 190 660 210 16
@junction
j 490 190
+ p 4 1
+ w 9
j 530 190
+ p 4 2
+ w 51
j 620 190
+ w 15
+ w 15
j 620 220
+ p 7 2
+ w 15
j 620 250
+ p 7 1
+ w 22
j 620 280
+ w 22
+ w 22
j 540 280
+ w 22
+ w 22
j 660 210
+ p 5 2
+ w 15
j 660 250
+ p 5 1
+ w 22
j 540 270
+ p 6 2
+ w 22
j 540 280
+ s 44
+ w 22
j 470 220
+ p 2 +
+ w 9
j 470 260
+ p 2 -
+ w 22
j 560 190
+ p 3 +
+ w 51
j 600 190
+ p 3 -
+ w 15
j 540 210
+ p 6 1
+ w 51
j 540 190
+ w 51
+ w 51
j 540 190
+ p 58 1
+ w 51
j 620 190
+ p 59 1
+ w 15
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
