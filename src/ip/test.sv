module test(
output [31:0]reg_data[31:0]
);
  integer i;
  initial begin
    for(i=1;i<30;i=i+1)
      reg_data[i]=32'b0;
    // ここにメモリの初期化（mem[12'h001]=16'h1234;など）を書く．
    reg_data[0]=32'b0;
    reg_data[30]=32'b0;
    reg_data[31]=32'h00000040;
  end
endmodule
