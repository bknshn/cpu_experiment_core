module fib3 (
  output logic [31:0] mem_inst [199:0]
 ,output logic [31:0] mem_data [9999:0]
);

assign mem_inst[124:0] = {32'hffffffff,32'h0800006b,32'h20210001,32'h8fc10000,32'h8fdf0001,32'h23defffe,32'h0c00002f,32'h23de0002,32'hafdf0001,32'h23410000,32'h20220000,32'h205a0000,32'hafc10000,32'h20020000,32'h03e00008,32'h13800002,32'h0341e02a,32'h201a0190,32'h0800002f,32'h8fc20001,32'h20210001,32'h8fc10000,32'h8fdf0003,32'h23defffc,32'h0c00000a,32'h23de0004,32'hafdf0003,32'hc7c40002,32'hc4430000,32'h34420000,32'h3c020000,32'hc4420000,32'h34420000,32'h3c020000,32'hc4410000,32'h34420000,32'h3c020000,32'hc4400000,32'h34420000,32'h3c020000,32'h200103e8,32'h46010141,32'hc4210000,32'h34210001,32'h3c010000,32'h46010003,32'hc4210000,32'h34210003,32'h3c010000,32'h8fdf0003,32'h23defffc,32'h0c000008,32'h23de0004,32'hafdf0003,32'h46010006,32'he7c00002,32'hc0210000,32'h8fc10001,32'h46010001,32'hc4210000,32'h34210002,32'h3c010000,32'h46010003,32'hc4210000,32'h34210003,32'h3c010000,32'h8fdf0002,32'h23defffd,32'h0c000008,32'h23de0003,32'hafdf0002,32'hafc20001,32'hafc10000,32'hc0200000,32'h03e00008,32'h13800002,32'h0341e02a,32'h201a0190,32'h03e00008,32'h6c010000,32'h20010000,32'h0800000a,32'hc7c40000,32'h2021ffff,32'h8fc10001,32'h45000005,32'h4606203e,32'hc4260000,32'h34210004,32'h3c010000,32'h46031100,32'h460108c2,32'h46000082,32'hc7c00002,32'h46050040,32'hc7c50003,32'h46010002,32'hc7c10004,32'h8fdf0005,32'h23defffa,32'h0c000008,32'h23de0006,32'hafdf0005,32'he7c10004,32'he7c50003,32'he7c20002,32'hafc10001,32'he7c40000,32'h46041080,32'h46031081,32'h03e00008,32'h6c010000,32'h20010001,32'h143a0004,32'h201a0000,32'h03e00008,32'h46000000,32'h08000000,32'h68010000,32'h8fdf0000,32'h23deffff,32'h0c00006b,32'h23de0001,32'hafdf0000,32'h20010000 };
assign mem_data[4:0]={32'h40800000,32'h43c80000,32'h3fc00000,32'h3f800000,32'h00000000 };
endmodule