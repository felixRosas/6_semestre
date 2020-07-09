*version 9.1 281994324
u 96
I? 3
R? 3
L? 2
C? 2
E? 2
PRINT? 3
@libraries
@analysis
.AC 1 1 0
+0 1
+1 0.3183098862
+2 0.3183098862
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
pageloc 1 0 3539 
@status
c 120:02:11:19:55:53;1583978153
n 0 120:02:11:19:55:57;1583978157 e 
s 2832 120:02:11:19:55:57;1583978157 e 
*page 1 0 970 720 iA
@ports
port 65 GND_ANALOG 420 210 h
port 92 bubble 510 160 v
a 1 x 3 0 10 10 hcn 100 LABEL=A
port 93 bubble 510 170 v
a 1 x 3 0 10 10 hcn 100 LABEL=B
port 73 bubble 420 140 d
a 1 x 3 0 10 4 hcn 100 LABEL=A
port 71 bubble 420 200 d
a 1 x 3 0 10 4 hcn 100 LABEL=B
@parts
part 5 R 540 120 u
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=4
part 7 C 430 120 h
a 0 sp 0 0 0 10 hlb 100 PART=C
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 15 25 hln 100 VALUE=0.2
part 4 R 420 180 v
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=2
part 75 VPRINT1 480 120 h
a 0 sp 0 0 0 40 hlb 100 PART=VPRINT1
a 0 a 0:13 0 0 0 hln 100 PKGREF=PRINT2
a 0 ap 0 0 30 0 hcn 100 REFDES=PRINT2
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
part 45 E 510 160 h
a 0 s 11 0 10 34 hln 100 PART=E
a 0 a 0:13 0 0 0 hln 100 PKGREF=E1
a 1 ap 9 0 10 4 hln 100 REFDES=E1
a 0 u 0 0 0 10 hln 100 GAIN=3
part 3 IAC 360 140 h
a 0 sp 0:11 0 0 50 hln 100 PART=IAC
a 0 a 0:13 0 0 0 hln 100 PKGREF=I2
a 1 ap 9 0 20 10 hcn 100 REFDES=I2
a 0 u 13 0 -8 22 hcn 100 ACMAG=10
a 0 u 0:13 0 0 20 hcn 100 ACPHASE=0
part 74 VPRINT1 420 120 h
a 0 sp 0 0 0 40 hlb 100 PART=VPRINT1
a 0 a 0:13 0 0 0 hln 100 PKGREF=PRINT1
a 0 ap 0 0 30 0 hcn 100 REFDES=PRINT1
a 0 u 0 0 0 30 hcn 100 AC=yes
a 0 u 0 0 0 20 hlb 100 MAG=yes
a 0 u 0 0 0 30 hlb 100 PHASE=yes
part 6 L 480 140 d
a 0 sp 0 0 0 10 hlb 100 PART=L
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=L2012C
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=L1
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 u 13 0 15 25 hln 100 VALUE=2
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
@conn
w 56
a 0 up 0:33 0 0 0 hln 100 V=
s 420 140 420 120 12
s 430 120 420 120 8
s 420 120 360 120 14
a 0 up 33 0 390 119 hct 100 V=
s 360 120 360 140 10
w 44
a 0 up 0:33 0 0 0 hln 100 V=
s 500 120 480 120 25
s 480 120 480 140 29
s 480 120 460 120 31
a 0 up 33 0 470 119 hct 100 V=
w 48
a 0 up 0:33 0 0 0 hln 100 V=
s 550 210 550 170 19
s 480 210 550 210 34
a 0 up 33 0 515 209 hct 100 V=
s 480 200 480 210 32
s 360 210 420 210 38
s 360 180 360 210 15
s 420 210 480 210 64
s 420 180 420 200 67
s 420 200 420 210 72
w 91
a 0 up 0:33 0 0 0 hln 100 V=
s 550 160 550 120 46
a 0 up 33 0 552 140 hlt 100 V=
s 550 120 540 120 21
@junction
j 480 200
+ p 6 2
+ w 48
j 480 210
+ w 48
+ w 48
j 480 140
+ p 6 1
+ w 44
j 480 120
+ w 44
+ w 44
j 540 120
+ p 5 1
+ w 91
j 500 120
+ p 5 2
+ w 44
j 360 180
+ p 3 -
+ w 48
j 420 210
+ s 65
+ w 48
j 420 200
+ s 71
+ w 48
j 460 120
+ p 7 2
+ w 44
j 550 170
+ p 45 4
+ w 48
j 550 160
+ p 45 3
+ w 91
j 510 170
+ s 93
+ p 45 2
j 510 160
+ s 92
+ p 45 1
j 480 120
+ p 75 1
+ w 44
j 420 120
+ w 56
+ w 56
j 420 140
+ p 4 2
+ w 56
j 430 120
+ p 7 1
+ w 56
j 360 140
+ p 3 +
+ w 56
j 420 140
+ s 73
+ w 56
j 420 180
+ p 4 1
+ w 48
j 420 140
+ s 73
+ p 4 2
j 420 120
+ p 74 1
+ w 56
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
