module test(
output logic [31:0] reg_data[31:0]
);
  logic [31:0] reg_data[31:0];
  
    assign reg_data [31:30]={32'h00000040,32'h0};
    assign reg_data [29:1]={32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0,32'h0};
    assign reg_data[0]=32'h0;
endmodule