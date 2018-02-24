module top (
  input logic CLK_P,
  input logic CLK_N,
  input logic SW_W,
  output logic SW_E,
  output logic[7:0] LED
);
  logic CLK;
  IBUFGDS ibufgds(.I(CLK_P), .IB(CLK_N), .O(CLK));
  //clk_wiz_0 clk_wiz_0(.clk_in1(CLK_P),  .clk_out1(CLK));
  //assign LED[7]  =CLK2;
  //assign LED[7:0]= 8'b11010101;
  core  core(.CLK(CLK),.SW_W(SW_W),.SW_E(SW_E),.LED(LED));
endmodule
