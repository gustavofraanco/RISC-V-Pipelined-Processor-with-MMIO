# RISC-V (RV32I) Pipeline - Projeto

* Processador RISC-V de **32** bits (RV32I) com pipeline de **5** estágios implementado em SystemVerilog, baseado nas seções 4.6 a 4.10 de *Computer Organization and Design: RISC-V Edition* (Patterson & Hennessy). O projeto tem como plataforma alvo a placa **DE2-115** (Intel Cyclone IV E). A atualização do README será baseada nos acompanhamentos semanais do projeto; serão implementadas algumas instruções que não estão presentes no código-base fornecido.

## Instruções Pré-Existentes

## Instruções Implementadas

### Etapa 01. Aritmética, Lógica e Deslocamentos (R-type) - 27/10/2026

| # | Instrução | Tipo | Opcode  | Funct3 |  Funct7  |
|---|-----------|------|---------|--------|:--------:|
| 1 |   `XOR`   |   R  | 0110011 |   100  |  00000   |
| 2 |   `SLL`   |   R  | 0110011 |   001  |  00000   |
| 3 |   `SRL`   |   R  | 0110011 |   101  |  00000   |
| 4 |   `SRA`   |   R  | 0110011 |   101  |  01000   |
| 5 |   `SLTU`  |   R  | 0110011 |   011  |  00000   |

### Etapa 02. Aritmética, Lógica e Deslocamentos com Imediatos (I-type) - 03/11/2026

| # | Instrução | Tipo | Opcode  | Funct3 |  Funct7  |
|---|-----------|------|---------|--------|:--------:|
| 1 |   `ADDI`  |   R  | 0010011 |   000  |          |
| 2 |   `ANDI`  |   R  | 0010011 |   111  |          |
| 3 |   `ORI`   |   R  | 0010011 |   110  |          |
| 4 |   `SLTI`  |   R  | 0010011 |   010  |          |
| 5 |   `SLLI`  |   R  | 0010011 |   001  |          |
| 6 |   `SRLI`  |   R  | 0010011 |   101  |          |
| 7 |   `SRAI`  |   R  | 0010011 |   101  |          |
