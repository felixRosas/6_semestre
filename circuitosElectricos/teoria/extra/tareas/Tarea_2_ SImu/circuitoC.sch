*version 9.1 794723806
u 142
V? 2
I? 2
C? 3
R? 3
L? 2
PRINT? 7
@libraries
@analysis
.AC 1 3 0
+0 1
+1 0.31830
+2 0.31830
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
pageloc 1 0 4515 
@status
n 0 120:02:13:20:10:25;1584151825 e 
s 2832 120:02:13:20:10:25;1584151825 e 
e 0 120:02:13:18:55:35;1584147335 e 
*page 1 0 970 720 iA
@ports
port 63 GND_ANALOG 530 280 h
@parts
part 8 r 480 170 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=10
part 2 VAC 460 200 h
a 0 sp 0 0 0 50 hln 100 PART=VAC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 REFDES=V1
a 0 u 0 0 0 20 hcn 100 ACPHASE=0
a 0 u 13 0 -9 23 hcn 100 ACMAG=50V
part 6 r 540 250 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=5
part 5 c 620 250 h
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C2
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 u 13 0 15 25 hln 100 VALUE=3
part 7 L 620 180 h
a 0 sp 0 0 0 10 hlb 100 PART=L
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=L2012C
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=L1
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 u 13 0 15 25 hln 100 VALUE=4
part 4 c 550 180 h
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 15 25 hln 100 VALUE=2
part 77 IPRINT 620 250 u
a 0 sp 11 0 6 0 hlb 100 PART=IPRINT
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
a 0 x 0:13 0 0 0 hln 100 PKGREF=i3
a 0 xp 0 0 30 0 hcn 100 REFDES=i3
part 75 IPRINT 500 280 u
a 0 sp 11 0 6 0 hlb 100 PART=IPRINT
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
a 0 x 0:13 0 0 0 hln 100 PKGREF=i1
a 0 xp 0 0 30 0 hcn 100 REFDES=i1
part 65 IPRINT 530 170 h
a 0 sp 11 0 6 0 hlb 100 PART=IPRINT
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
a 0 x 0:13 0 0 0 hln 100 PKGREF=i0
a 0 xp 0 0 30 0 hcn 100 REFDES=i0
part 114 IPRINT 600 170 h
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
a 0 sp 11 0 6 0 hlb 100 PART=IPRINT
a 0 x 0:13 0 0 0 hln 100 PKGREF=i2
a 0 xp 0 0 30 0 hcn 100 REFDES=i2
part 3 IAC 620 220 d
a 0 sp 0:11 0 0 50 hln 100 PART=IAC
a 0 u 13 0 -8 22 hcn 100 ACMAG=2A
a 0 u 0:13 0 0 20 hcn 100 ACPHASE=0
a 0 x 0:13 0 0 0 hln 100 PKGREF=I4
a 1 xp 9 0 20 10 hcn 100 REFDES=I4
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
@conn
w 22
a 0 up 0:33 0 0 0 hln 100 V=
s 540 250 540 220 23
s 540 180 550 180 25
s 540 220 540 180 36
s 580 220 540 220 21
a 0 up 33 0 560 219 hct 100 V=
w 56
a 0 up 0:33 0 0 0 hln 100 V=
s 460 170 480 170 59
s 460 200 460 170 55
a 0 up 33 0 462 185 hlt 100 V=
w 16
a 0 up 0:33 0 0 0 hln 100 V=
s 530 170 520 170 69
a 0 up 33 0 525 169 hct 100 V=
w 30
a 0 up 0:33 0 0 0 hln 100 V=
s 460 280 460 240 53
a 0 up 33 0 462 260 hlt 100 V=
s 460 280 480 280 79
w 74
a 0 up 0:33 0 0 0 hln 100 V=
s 500 280 530 280 81
s 530 280 590 280 96
s 590 280 590 250 98
s 590 250 600 250 100
s 580 250 590 250 102
w 111
a 0 up 0:33 0 0 0 hln 100 V=
s 680 180 680 220 104
a 0 up 33 0 682 185 hlt 100 V=
s 680 220 620 220 19
a 0 up 33 0 650 219 hct 100 V=
s 650 250 680 250 31
s 680 220 680 250 38
w 132
a 0 up 0:33 0 0 0 hln 100 V=
s 620 170 620 180 131
a 0 up 33 0 622 175 hlt 100 V=
w 136
a 0 up 0:33 0 0 0 hln 100 V=
s 590 170 550 170 39
a 0 up 33 0 550 169 hct 100 V=
s 600 170 600 180 127
s 600 180 590 180 137
s 590 180 580 180 141
s 590 170 590 180 139
@junction
j 550 180
+ p 4 1
+ w 22
j 540 220
+ w 22
+ w 22
j 480 170
+ p 8 1
+ w 56
j 460 200
+ p 2 +
+ w 56
j 580 220
+ p 3 -
+ w 22
j 520 170
+ p 8 2
+ w 16
j 540 250
+ p 6 1
+ w 22
j 460 240
+ p 2 -
+ w 30
j 680 180
+ p 7 2
+ w 111
j 620 220
+ p 3 +
+ w 111
j 680 220
+ w 111
+ w 111
j 620 180
+ p 7 1
+ w 132
j 620 170
+ p 114 2
+ w 132
j 650 250
+ p 5 2
+ w 111
j 620 250
+ p 77 1
+ p 5 1
j 600 250
+ p 77 2
+ w 74
j 530 280
+ s 63
+ w 74
j 580 250
+ p 6 2
+ w 74
j 590 250
+ w 74
+ w 74
j 600 170
+ p 114 1
+ w 136
j 580 180
+ p 4 2
+ w 136
j 590 180
+ w 136
+ w 136
j 550 170
+ p 65 2
+ w 136
j 530 170
+ p 65 1
+ w 16
j 480 280
+ p 75 2
+ w 30
j 500 280
+ p 75 1
+ w 74
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
