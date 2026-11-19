// =============================================================================
// pl_dmem.sv
// Memoria de dados -- RV32I pipelined
//
// Capacidade : 256 palavras x 32 bits = 1 KB
// Init file  : data.mif   (sintese Quartus)
//              data.hex   (simulacao ModelSim via $readmemh)
//
// Leitura  : assincrona (combinatorial) -- disponivel no estagio MEM
// Escrita  : sincrona (posedge clk, gated por MemWrite & ~mmio_sel)
// Endereco : alu_result[9:2]  (endereco de palavra de 8 bits)
// =============================================================================

`timescale 1ns / 1ps

module pl_dmem (
    input  logic        clk,
    input  logic [3:0]  MemWrite,
    input  logic [7:0]  addr,
    input  logic [31:0] WriteData,
    output logic [31:0] ReadData
);

    (* ram_init_file = "data.mif" *) logic [31:0] ram [0:255];

    // synthesis translate_off
    initial begin
        for (int i = 0; i < 256; i++) ram[i] = 32'h00000000;
        $readmemh("data.hex", ram);
    end
    // synthesis translate_on

    logic [31:0] next_word;

    always_comb begin
        next_word = ram[addr];
        if (MemWrite[0]) next_word[7:0]   = WriteData[7:0];
        if (MemWrite[1]) next_word[15:8]  = WriteData[15:8];
        if (MemWrite[2]) next_word[23:16] = WriteData[23:16];
        if (MemWrite[3]) next_word[31:24] = WriteData[31:24];
    end

    always_ff @(posedge clk) begin
        if (|MemWrite) begin
            ram[addr] <= next_word;
        end
    end

    assign ReadData = ram[addr];

endmodule
