/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    input s,
    input co,
    output reg a,
    output reg b,
    output reg ci
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_adderInput_a;
  wire [1-1:0] M_adderInput_b;
  wire [1-1:0] M_adderInput_ci;
  wire [1-1:0] M_adderInput_error;
  reg [1-1:0] M_adderInput_s;
  reg [1-1:0] M_adderInput_co;
  adderInput_2 adderInput (
    .clk(clk),
    .rst(rst),
    .s(M_adderInput_s),
    .co(M_adderInput_co),
    .a(M_adderInput_a),
    .b(M_adderInput_b),
    .ci(M_adderInput_ci),
    .error(M_adderInput_error)
  );
  
  always @* begin
    a = 1'h0;
    b = 1'h0;
    ci = 1'h0;
    if (!M_adderInput_error) begin
      a = M_adderInput_a;
      b = M_adderInput_b;
      ci = M_adderInput_ci;
    end
    M_adderInput_s = s;
    M_adderInput_co = co;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    io_led = 24'h000000;
    io_led[0+7-:8] = {4'h8{M_adderInput_a}};
    io_led[8+7-:8] = {4'h8{M_adderInput_b}};
    io_led[16+7-:8] = {4'h8{M_adderInput_ci}};
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
endmodule
