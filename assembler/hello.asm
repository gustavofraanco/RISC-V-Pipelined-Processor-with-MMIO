addi x1,x0,-1
sw x1,0(x0)
sh x0,0(x0)
lw x2,0(x0)
sw x2,1032(x0)  // LEDR (LEDR = 1032)
