module uart (
  input logic CLK,
  input logic SW_W,
  input logic SW_E,
  input logic UART_RX,
  output logic UART_TX,
  output logic [7:0] LED
);
  // out命令用
  logic awvalid = 1'b0;
  logic awready;
  logic wvalid = 1'b0;
  logic wready;
  logic bvalid;
  logic bready = 1'b1;
  logic [1:0] bresp = 2'b01;  // 初期値は10(失敗)と00(成功)以外に設定

  // in命令用
  logic arvalid = 1'b1;  // loopbackでは初期値1
  logic arready;
  logic rvalid;
  logic rready = 1'b1;  // loopbackでは初期値1
  logic [1:0] rresp = 2'b01;  // 初期値は10(失敗)と00(成功)以外に設定
  logic [31:0] rdata;

  // 遅いクロックの生成
  int count = 0;
  logic CLK2 = 1;
  always @(posedge CLK) begin
    if (count >= 80000000) begin
      count <= 0;
      CLK2<=~CLK2;
    end else   count <= count+1;
  end

  logic [6:0] read_counter = 0;  // デバッグ用
  assign LED[6:0] = read_counter;
  assign LED[7] = CLK2;

  // out命令用
  always @(posedge CLK2) begin
    if (rresp==2'b00) begin
      awvalid <= 1'b1;
      wvalid <= 1'b1;
    end
    if (awvalid && awready) begin
      awvalid <= 1'b0;
    end
    if (wvalid && wready) begin
      wvalid <= 1'b0;
    end
    if (!bready) begin
      bready <= 1'b1;
    end
    if (bvalid && bready) begin
      bready <= 1'b0;
    end
    if (bresp==2'b10) begin
      awvalid <= 1'b1;
      wvalid <= 1'b1;
    end
  end

  // in命令用
  always @(posedge CLK2) begin
    if (rresp==2'b00) begin
      arvalid <= 1'b1;
      rready <= 1'b1;
    end
    if (arvalid && arready) begin
      arvalid <= 1'b0;
    end
    if (rvalid && rready) begin
      rready <= 1'b0;
      read_counter <= read_counter + 1;
    end
    if (rresp==2'b10) begin
      arvalid <= 1'b1;
      rready <= 1'b1;
    end
  end

  logic interrupt;
  logic [31:0] wdata;
  assign wdata = rdata;
  axi_uartlite_0 axi_uartlite_0 (
    // sender
    .s_axi_aclk(CLK2),        // input wire s_axi_aclk
    .s_axi_aresetn(1'b1),  // input wire s_axi_aresetn
    .interrupt(interrupt),          // output wire interrupt
    .s_axi_awaddr(4'h4),    // input wire [3 : 0] s_axi_awaddr */
    .s_axi_awvalid(awvalid),  // input wire s_axi_awvalid
    .s_axi_awready(awready),  // output wire s_axi_awready
    .s_axi_wdata(wdata),      // input wire [31 : 0] s_axi_wdata
    .s_axi_wstrb(4'b0001),      // input wire [3 : 0] s_axi_wstrb
    .s_axi_wvalid(wvalid),    // input wire s_axi_wvalid
    .s_axi_wready(wready),    // output wire s_axi_wready
    .s_axi_bresp(bresp),      // output wire [1 : 0] s_axi_bresp (fail:10, succeed: 00)
    .s_axi_bvalid(bvalid),    // output wire s_axi_bvalid
    .s_axi_bready(bready),    // input wire s_axi_bready

    // receiver
    .s_axi_araddr(4'h0),    // input wire [3 : 0] s_axi_araddr */
    .s_axi_arvalid(arvalid),  // input wire s_axi_arvalid */
    .s_axi_arready(arready),  // output wire s_axi_arready */
    .s_axi_rdata(rdata),      // output wire [31 : 0] s_axi_rdata */
    .s_axi_rresp(rresp),      // output wire [1 : 0] s_axi_rresp (fail:10, succeed: 00) */
    .s_axi_rvalid(rvalid),    // output wire s_axi_rvalid */
    .s_axi_rready(rready),    // input wire s_axi_rready */

    .rx(UART_RX),                        // input wire rx
    .tx(UART_TX)                        // output wire tx
  );

endmodule
