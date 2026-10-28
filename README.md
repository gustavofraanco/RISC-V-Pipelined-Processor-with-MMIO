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

### Etapa 01. Aritmética, Lógica e Deslocamentos (R-type) - 27/10/2026

| # | Instrução | Tipo | Opcode  | Funct3 |  Funct7  | Status |
|---|-----------|------|---------|--------|----------|:------:|
| 1 | `XOR`     | R    | 0110011 | 100    | 00000    | ✅ |
| 2 | `SLL`     | R    | 0110011 | 001    | 00000    | ✅ |
| 3 | `SRL`     | R    | 0110011 | 101    | 00000    | ✅ |
| 4 | `SRA`     | R    | 0110011 | 101    | 01000    | ✅ |
| 5 | `SLTU`    | R    | 0110011 | 011    | 00000    | ✅ |

### Etapa 02. Aritmética, Lógica e Deslocamentos com Imediatos (I-type) - 03/11/2026

| # | Instrução | Tipo | Opcode  | Funct3 |  Funct7  | Status |
|---|-----------|------|---------|--------|----------|:------:|
| 1 | `ADDI`    | R    | 0010011 | 000    |          | ❌ |
| 2 | `ANDI`    | R    | 0010011 | 111    |          | ❌ |
| 3 | `ORI`     | R    | 0010011 | 110    |          | ❌ |
| 4 | `SLTI`    | R    | 0010011 | 010    |          | ❌ |
| 5 | `SLLI`    | R    | 0010011 | 001    |          | ❌ |
| 6 | `SRLI`    | R    | 0010011 | 101    |          | ❌ |
| 7 | `SRAI`    | R    | 0010011 | 101    |          | ❌ |
