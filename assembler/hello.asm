jal x1,16      // salto de 16 bytes, x1 = PC + 4 = 0 + 4 = 4
beq x0,x0,0    // vai ser pulado se tiver funcionando o JAL
beq x0,x0,0    // vai ser pulado se tiver funcionando o JAL
beq x0,x0,0    // vai ser pulado se tiver funcionando o JAL
addi x2,x1,24  // x2 = 4 + 24 = 28
jalr x3,x2,0   // pula para o endereço x2 = 28; x3 = PC + 4 = 20 + 4 = 24
beq x0,x0,0    // vai ser pulado se tiver funcionando o JALR
addi x4,x0,255 // apenas vai para essa linha se o JALR funcionar
sw x4,1032(x0) // LEDR = 1032
beq x0,x0,0