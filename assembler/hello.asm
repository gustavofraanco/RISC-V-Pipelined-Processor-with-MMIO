lw x1,0(x0)
lw x2,4(x0)
sltu x3,x1,x2
lw x4,1024(x0)    // SW[17:0]          (addr 0x400 = 1024)
sw x3,1032(x0)    // LEDR <= 0x3FFFF   (addr 0x408 = 1032)
