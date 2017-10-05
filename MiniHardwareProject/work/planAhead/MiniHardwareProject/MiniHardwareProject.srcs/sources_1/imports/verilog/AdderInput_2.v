/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adderInput_2 (
    input clk,
    input rst,
    output reg a,
    output reg b,
    output reg ci,
    input s,
    input co,
    output reg error
  );
  
  
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_3 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  reg [26:0] M_state_changer_d, M_state_changer_q = 1'h0;
  localparam ZERO_state = 4'd0;
  localparam ONE_state = 4'd1;
  localparam TWO_state = 4'd2;
  localparam THREE_state = 4'd3;
  localparam FOUR_state = 4'd4;
  localparam FIVE_state = 4'd5;
  localparam SIX_state = 4'd6;
  localparam SEVEN_state = 4'd7;
  localparam ERROR_state = 4'd8;
  
  reg [3:0] M_state_d, M_state_q = ZERO_state;
  
  always @* begin
    M_state_d = M_state_q;
    M_state_changer_d = M_state_changer_q;
    
    a = 1'h0;
    b = 1'h0;
    ci = 1'h0;
    error = 1'h0;
    M_edge_detector_in = M_state_changer_q[26+0-:1];
    M_state_changer_d = M_state_changer_q + 1'h1;
    
    case (M_state_q)
      ZERO_state: begin
        a = 1'h0;
        b = 1'h0;
        ci = 1'h0;
        if (M_edge_detector_out) begin
          if (co == 1'h0 && s == 1'h0) begin
            M_state_d = ONE_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      ONE_state: begin
        a = 1'h1;
        b = 1'h0;
        ci = 1'h0;
        if (M_edge_detector_out) begin
          if (co == 1'h0 && s == 1'h1) begin
            M_state_d = TWO_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      TWO_state: begin
        a = 1'h0;
        b = 1'h1;
        ci = 1'h0;
        if (M_edge_detector_out) begin
          if (co == 1'h0 && s == 1'h1) begin
            M_state_d = THREE_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      THREE_state: begin
        a = 1'h1;
        b = 1'h1;
        ci = 1'h0;
        if (M_edge_detector_out) begin
          if (co == 1'h1 && s == 1'h0) begin
            M_state_d = FOUR_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      FOUR_state: begin
        a = 1'h0;
        b = 1'h0;
        ci = 1'h1;
        if (M_edge_detector_out) begin
          if (co == 1'h0 && s == 1'h1) begin
            M_state_d = FIVE_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      FIVE_state: begin
        a = 1'h1;
        b = 1'h0;
        ci = 1'h1;
        if (M_edge_detector_out) begin
          if (co == 1'h1 && s == 1'h0) begin
            M_state_d = SIX_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      SIX_state: begin
        a = 1'h0;
        b = 1'h1;
        ci = 1'h1;
        if (M_edge_detector_out) begin
          if (co == 1'h1 && s == 1'h0) begin
            M_state_d = SEVEN_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      SEVEN_state: begin
        a = 1'h1;
        b = 1'h1;
        ci = 1'h1;
        if (M_edge_detector_out) begin
          if (co == 1'h1 && s == 1'h1) begin
            M_state_d = ZERO_state;
          end else begin
            M_state_d = ERROR_state;
          end
        end
      end
      ERROR_state: begin
        error = 1'h1;
        a = M_state_changer_q[26+0-:1];
        b = M_state_changer_q[26+0-:1];
        ci = M_state_changer_q[26+0-:1];
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_changer_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_state_changer_q <= M_state_changer_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
