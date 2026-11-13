addi x1,x0,-1    // x1 = 0xFFFFFFFF (-1 em signed, 4.29B em unsigned)
addi x2,x0,1     // x2 = 0x00000001 (1)
bne x1,x2,8      // pula se -1 for diferente de 1 (deve pular)
beq x0,x0,0      // vai ser pulado se tiver funcionando o BNE
blt x1,x2,8      // pula se -1 for menor que 1 (deve pular)
beq x0,x0,0      // vai ser pulado se tiver funcionando o BNE
bge x2,x1,8      // pula se 1 for maior ou igual que -1 (deve pular)
beq x0,x0,0      // vai ser pulado se tiver funcionando o BGE
bltu x2,x1,8     // pula se 1 for menor que 4.29B (deve pular)
beq x0,x0,0      // vai ser pulado se tiver funcionando o BLTU
bgeu x1,x2,8     // pula se 4.29B for maior ou igual a 1 (DEVE PULAR)
beq x0,x0,0      // vai ser pulado se tiver funcionando o BGEU
addi x3,x0,255   // só chega se todos os branchs funcionarem
sw x3,1032(x0)   // LEDR = 1032
beq x0,x0,0
