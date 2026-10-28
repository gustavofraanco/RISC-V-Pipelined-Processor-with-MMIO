# RV32I Pipelined Base Project

Processador RISC-V de **32** bits (RV32I) com pipeline de **5** estágios implementado em SystemVerilog, baseado nas seções 4.6 a 4.10 de *Computer Organization and Design: RISC-V Edition* (Patterson & Hennessy). O projeto tem como plataforma alvo a placa **DE2-115** (Intel Cyclone IV E). A atualização do README será baseada nos acompanhamentos semanais do projeto; serão implementadas algumas instruções que não estão presentes no código-base fornecido.

## Instruções suportadas

| # | Instrução | Tipo | Opcode  | Status |
|---|-----------|------|---------|:------:|
| 1 | `ADD`     | R    | 0110011 | ✅ |
| 2 | `SUB`     | R    | 0110011 | ✅ |
| 3 | `OR`      | R    | 0110011 | ✅ |
| 4 | `AND`     | R    | 0110011 | ✅ |
| 5 | `SLT`     | R    | 0110011 | ✅ |
| 6 | `LW`      | I    | 0000011 | ✅ |
| 7 | `SW`      | S    | 0100011 | ✅ |
| 8 | `BEQ`     | B    | 1100011 | ✅ |

## Resumo de cobertura do ISA RV32I

| Categoria          | Total ISA | Implementadas | Faltando |
|--------------------|:---------:|:-------------:|:--------:|
| R-type             | 10        | 10            | 0        |
| I-type aritmético  | 9         | 0             | 9        |
| I-type load        | 5         | 1 (LW)        | 4        |
| S-type             | 3         | 1 (SW)        | 2        |
| B-type             | 6         | 1 (BEQ)       | 5        |
| U-type             | 2         | 0             | 2        |
| J-type             | 2         | 0             | 2        |
| **Total**          | **37**    | **13**        | **24**   |

## Instruções a implementar

### Etapa 01. Aritmética, lógica e deslocamentos (R-type) - 27/10/2026

| # | Instrução | Tipo | Opcode  | Funct3 |  Funct7  | Status |
|---|-----------|------|---------|--------|----------|:------:|
| 1 | `XOR`     | R    | 0110011 | 100    | 00000    | ✅ |
| 2 | `SLL`     | R    | 0110011 | 001    | 00000    | ✅ |
| 3 | `SRL`     | R    | 0110011 | 101    | 00000    | ✅ |
| 4 | `SRA`     | R    | 0110011 | 101    | 01000    | ✅ |
| 5 | `SLTU`    | R    | 0110011 | 011    | 00000    | ✅ |

### Etapa 02. Aritmética, lógica e deslocamentos com imediatos (I-type) - 03/11/2026

| # | Instrução | Tipo | Opcode  | Funct3 |  Funct7  | Status |
|---|-----------|------|---------|--------|----------|:------:|
| 1 | `ADDI`    | R    | 0010011 | 000    |          | ❌ |
| 2 | `ANDI`    | R    | 0010011 | 111    |          | ❌ |
| 3 | `ORI`     | R    | 0010011 | 110    |          | ❌ |
| 4 | `SLTI`    | R    | 0010011 | 010    |          | ❌ |
| 5 | `SLLI`    | R    | 0010011 | 001    |          | ❌ |
| 6 | `SRLI`    | R    | 0010011 | 101    |          | ❌ |
| 7 | `SRAI`    | R    | 0010011 | 101    |          | ❌ |

### Etapa 02. Imediato superior (U-type) - 03/11/2026

| # | Instrução | Tipo | Opcode  | Status |
|---|-----------|------|---------|:------:|
| 1 | `LUI`     | U    | 0110111 | ❌ |
| 2 | `AUIPC`   | U    | 0010111 | ❌ |

### Etapa 03. Acesso à memória — loads (I-type) - 10/11/2026

| # | Instrução | Tipo | Opcode  | Status |
|---|-----------|------|---------|:------:|
| 1 | `LB`      | I    | 0000011 | ❌ |
| 2 | `LH`      | I    | 0000011 | ❌ |
| 3 | `LBU`     | I    | 0000011 | ❌ |
| 4 | `LHU`     | I    | 0000011 | ❌ |

### Etapa 03. Acesso à memória — stores (S-type) - 10/11/2026

| # | Instrução | Tipo | Opcode  | Status |
|---|-----------|------|---------|:------:|
| 1 | `SB`      | S    | 0100011 | ❌ |
| 2 | `SH`      | S    | 0100011 | ❌ |

### Etapa 03. Desvios condicionais (B-type) - 10/11/2026

| # | Instrução | Tipo | Opcode  | Status |
|---|-----------|------|---------|:------:|
| 1 | `BNE`     | B    | 1100011 | ❌ |
| 2 | `BLT`     | B    | 1100011 | ❌ |
| 3 | `BGE`     | B    | 1100011 | ❌ |
| 4 | `BLTU`    | B    | 1100011 | ❌ |
| 5 | `BGEU`    | B    | 1100011 | ❌ |

### Etapa 03. Jumps (J-type) - 10/11/2026

| # | Instrução | Tipo | Opcode  | Status |
|---|-----------|------|---------|:------:|
| 1 | `JAL`     | J    | 1101111 | ❌ |
| 2 | `JALR`    | I    | 1100111 | ❌ |

## Arquitetura

### Pipeline de 5 estágios

```
+------+     +------+     +------+     +------+     +------+
|  IF  | --> |  ID  | --> |  EX  | --> | MEM  | --> |  WB  |
+------+     +------+     +------+     +------+     +------+
  Busca      Decode       Execução     Memória     Write-back
  instrução  Regs         ALU          dmem/MMIO   Regfile
             Sign-ext     Branch
```

**Registradores de pipeline:** `IF/ID`, `ID/EX`, `EX/MEM`, `MEM/WB` (definidos em `pl_pipe_pkg.sv`).

### Tratamento de hazards

| Hazard | Mecanismo | Detalhe |
|--------|-----------|---------|
| RAW (dado) | Forwarding | EX/MEM → EX e MEM/WB → EX (`pl_forward.sv`) |
| Load-use | Stall | 1 bolha inserida em ID/EX (`pl_hazard.sv`) |
| Branch taken | Flush | 2 NOPs (IF e ID) na resolução em EX (`pl_datapath.sv`) |

**Resolução de branch no estágio EX:** quando `BEQ` é tomado, o PC retorna ao alvo e os dois estágios anteriores são esvaziados. O custo é de 2 ciclos de penalidade por branch tomado.

**Banco de registradores com escrita em negedge:** a escrita ocorre na borda de descida do clock, garantindo que o estágio ID leia o valor atualizado no próximo posedge sem necessidade de forwarding WB→ID explícito.

### Mapa de memória

| Endereço (byte) | Tamanho | Acesso | Descrição |
|-----------------|---------|--------|-----------|
| `0x000 – 0x3FC` | 256 × 32 b | R/W | Memória de dados (`pl_dmem`) |
| `0x400` | 32 b | R | SW\[17:0\] — chaves deslizantes |
| `0x404` | 32 b | R | KEY\[3:0\] — botões push |
| `0x408` | 32 b | W | LEDR\[17:0\] — LEDs vermelhos |
| `0x40C` | 32 b | W | LEDG\[8:0\] — LEDs verdes |
| `0x410` | 32 b | R/W | UART RS-232 (8N1, 9600 baud) |
| `0x414` | 32 b | R | Contador de ciclos de clock (32 bits, reset em 0) |
