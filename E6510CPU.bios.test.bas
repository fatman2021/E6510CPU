10 a$ = "press <cr> to exit."
20 adr = 679: rem bios address 
30 gosub 200: X = 8: y=8
40 rem display message
50 for a=1 to len(a$)
60 poke adr+4,x: poke adr+8,y
70 poke adr+9,asc(mid$(a$,a,1))
80 for b=10 to 17 
90 poke adr+b,255
100 next b
110 poke adr, 5
120 x=x+9
130 next a
140 rem wait until <cr> key is pressed
150 poke adr+1,13:poke adr,7
160 rem sets 384x264x8-bit video mode
170 poke adr+3,1: poke adr+4,128
180 poke adr+7,1: poke adr+8,8
190 poke adr+12,8: poke adr,4
200 rem sets 640x480x32-bit video mode
210 poke adr+3,2: poke adr+4,128
220 poke adr+7,1: poke adr+8,224
230 poke adr+12,32: poke adr,4
240 return

10 adr=679: rem bios
20 rem imagecreate
30 poke adr+3,1: rem offset in vram
40 poke adr+7,255: rem width
50 poke adr+11,255: rem heigth
60 poke adr+19,8: rem depth
70 poke adr,9 call imagecreate
80 for x=0 to 255
90 for y=0 to 255
100 rem pset
110 poke adr+3,1: rem offset in vram
120 poke adr+7,x: rem x
130 poke adr+11,y: rem y
140 poke adr+15,x: rem color x
150 poke adr,12: rem call pset
160 next y
170 next x
180 rem put
190 poke adr+3,1: rem offset in vram
200 poke adr+7,0: rem x
210 poke adr+11,0: rem y
220 poke adr+12,0: rem method
220 poke adr,14: rem call put

10 adr=679: rem bios
20 rem string address: 53300
30 poke adr+3,208: poke adr+4,52
40 file$="TEST.BMP"
50 poke adr+8,len(file$)
60 for i=0 to len(file$)-1
70 poke 53300+I,asc(mid$(file$,i+1,1))
80 next i
90 poke adr+12,0
100 poke adr,23 : rem call bload

address D400
screenWidth, screenHeight, colorDepth, bits_perPixel, scanlineLength, refreshRate, driverName
0h           40h           80h         C0h            100h            140h         180h
mouseX, mouseY, mouseWheel, mouseButtons, mouseClip
238h    27Ah     698        2BAh          33Ah