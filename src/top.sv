module top (
  input logic CLK_P,
  input logic CLK_N,
  input logic SW_W,
  output logic SW_E,
  output logic[7:0] LED
);
  logic CLK;
  IBUFGDS ibufgds(.I(CLK_P), .IB(CLK_N), .O(CLK));
  core  core(.CLK(CLK),.SW_W(SW_W),.SW_E(SW_E),.LED(LED));
endmodule
