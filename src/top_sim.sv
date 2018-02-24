module top_sim (
  output logic CLK,
  output logic SW_W,
  output logic SW_E
);

  parameter STEP = 10;
  parameter CLKNUM = 10000;
   
  always begin
    CLK =0;
    #(STEP/2);
    CLK =1;
    #(STEP/2);
  end
  core  core(.CLK(CLK),.SW_W(SW_W),.SW_E(SW_E));   
  initial begin
    SW_W =0;
    SW_E=0;
    #(STEP*5) SW_W = 1;
    #(STEP*2)  SW_W = 0;
    #(STEP*CLKNUM)
    $stop;
  end
endmodule
