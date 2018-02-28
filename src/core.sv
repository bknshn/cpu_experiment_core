module core #(
parameter FILE_PATH = "/home/tansei/is/cpu/cpu_experiment_core/src/bin/mandelbrot_data.bin"
) 
  (input logic CLK,
  input logic SW_W,
  input logic SW_E,
  output logic [7:0] LED
);
  // inst[31:26]
  localparam OP_ZERO = 6'b00000;
    // inst[5:0]
    localparam FUN_ADD = 6'b100000;
    localparam FUN_SUB = 6'b100010;
    localparam FUN_SRL = 6'b000010;
    localparam FUN_JR  = 6'b001000;

    localparam FUN_AND = 6'b100100;
    localparam FUN_OR  = 6'b100101;
    localparam FUN_NOR = 6'b100111;
    localparam FUN_SLL = 6'b000000;
    localparam FUN_SLT = 6'b101010;
    localparam FUN_JALR= 6'b001001;

  localparam OP_ADDI = 6'b001000;
  localparam OP_BEQ =  6'b000100;
  localparam OP_BNE =  6'b000101;
  localparam OP_JAL =  6'b000011;
  localparam OP_LW  =  6'b100011;
  localparam OP_SW  =  6'b101011;
  localparam OP_IN  =  6'b011010;
  localparam OP_OUT =  6'b011011;
  localparam OP_J   =  6'b000010;

  localparam OP_ANDI=  6'b001100;
  localparam OP_ORI =  6'b001101;
  localparam OP_SLTI=  6'b001010;
  localparam OP_LUI =  6'b001111;
 
  localparam OP_LW_S=  6'b110001;
  localparam OP_SW_S=  6'b111001;

  localparam OP_CEQ =  6'b110010;
  localparam OP_CLT =  6'b111100;
  localparam OP_CLE =  6'b111110;
    

  localparam OP_FPU = 6'b010001;
    // inst[25:24]
    localparam FPU_OP_SPECIAL = 2'b10;
      // inst[5:0]
      localparam FPU_ADD  = 6'b000000;
      localparam FPU_SUB  = 6'b000001;
      localparam FPU_MUL  = 6'b000010;
      localparam FPU_DIV  = 6'b000011;
      localparam FPU_MOV  = 6'b000110;
   localparam OP_FCON = 2'b01;
        
  logic [31:0] pc=32'b0;
  logic [1:0] status = 2'b0;
  localparam INIT = 2'b00;
  localparam RUN  = 2'b01;

  // レジスタ
  //%r30がスタックポインタ0x0 %r31がフレームポインタ0x40000
  logic [31:0] reg_data [31:0];
  logic [31:0] freg_data [31:0];
  logic [7:0]  freg_cond;
  initial begin
    reg_data [31:30]={32'h00000040,32'h0};
    reg_data[0]=32'h0;
  end;

  // 命令メモリ
  logic [31:0] mem_inst [199:0];
   //fib3 fib3(mem_inst);
   //fib fib(mem_inst);   
   mandelbrot mandelbrot(mem_inst);
  //minrt minrt(mem_inst);

  // 現在の命令
  logic[31:0] inst;
  assign inst = mem_inst[pc];

  // データメモリ
  parameter MAX_MEM =200;
  logic [31:0] mem_data [MAX_MEM-1:0];
  //fib,fib3は44命令 mandelbrotは125命令 minrtは9366命令

  //ファイルの入出力
  integer fd=0;
  integer readsize=0;
  integer point_read=0;
  initial begin
  $display(FILE_PATH);  
  fd = $fopen(FILE_PATH,"r");
      if (fd!=0) begin
          while (1) begin
            readsize = $fread(mem_data,fd,point_read,10);
            point_read+=readsize>>2;
            if (readsize==0) break;
          end  
      end
  $fclose(fd);
  end

  int count =0;
  logic flg=0;
  logic CLK2=1;
  logic [31:0]TMP_L1 =32'b0;
  logic [31:0]TMP_L2 =32'b0;

  // 遅いクロックの生成
  always @(posedge CLK ) begin
    if (count >= 80000000) begin
      count <= 0;
      CLK2<=~CLK2;
    end else   count <= count+1;
  end

  // FPUのIPコアの接続
  logic[31:0] fadd_fsub_out;
  fadd_fsub fadd_fsub(
    .s_axis_a_tvalid(1'b1),
    .s_axis_a_tdata(freg_data[inst[15:11]]),
    .s_axis_b_tvalid(1'b1),
    .s_axis_b_tdata(freg_data[inst[20:16]]),
    .s_axis_operation_tvalid(1'b1),
    .s_axis_operation_tdata({7'b0000000, inst[0]}),
    .m_axis_result_tdata(fadd_fsub_out)
  );
  logic[31:0] fmul_out;
  fmul fmul(
    .s_axis_a_tvalid(1'b1),
    .s_axis_a_tdata(freg_data[inst[15:11]]),
    .s_axis_b_tvalid(1'b1),
    .s_axis_b_tdata(freg_data[inst[20:16]]),
    .m_axis_result_tdata(fmul_out)
  );
  logic[31:0] fdiv_out;
  logic fdiv_valid = 0;
  fdiv fdiv(
    .aclk(CLK),
    .s_axis_a_tvalid(1'b1),
    .s_axis_a_tdata(freg_data[inst[15:11]]),
    .s_axis_b_tvalid(1'b1),
    .s_axis_b_tdata(freg_data[inst[20:16]]),
    .m_axis_result_tvalid(fdiv_valid),
    .m_axis_result_tdata(fdiv_out)
  );

  always @(posedge CLK) begin
    if (SW_W && status == INIT) begin 
      status <= RUN;
    end
    else if (status == RUN) begin
      case(inst[31:26])
        OP_ZERO:
          case(inst[5:0])
            FUN_ADD: reg_data[inst[15:11]]<=reg_data[inst[25:21]]+reg_data[inst[20:16]];
            FUN_SUB: reg_data[inst[15:11]]<=reg_data[inst[25:21]]+reg_data[inst[20:16]];
            FUN_SRL: reg_data[inst[15:11]]<=reg_data[inst[20:16]]>>inst[10:6];
            FUN_AND: reg_data[inst[15:11]]<=reg_data[inst[25:21]]&reg_data[inst[20:16]];
            FUN_OR : reg_data[inst[15:11]]<=reg_data[inst[25:21]]|reg_data[inst[20:16]];
            FUN_NOR: reg_data[inst[15:11]]<=~(reg_data[inst[25:21]]|reg_data[inst[20:16]]);
            FUN_SLL: reg_data[inst[15:11]]<=reg_data[inst[20:16]]<<inst[10:6];
            FUN_SLT: reg_data[inst[15:11]]<=(reg_data[inst[25:21]]<=reg_data[inst[20:16]]);
            FUN_JALR:reg_data[31] <=pc+1;
          endcase
        OP_FPU:
          case (inst[25:24])
            FPU_OP_SPECIAL:
              case (inst[5:0])
                FPU_ADD : freg_data[inst[10:6]] <= fadd_fsub_out;
                FPU_SUB : freg_data[inst[10:6]] <= fadd_fsub_out;
                FPU_MUL : freg_data[inst[10:6]] <= fmul_out;
                FPU_DIV : freg_data[inst[10:6]] <= fdiv_out; // !!!遅延あり？
                FPU_MOV : freg_data[inst[10:6]] <= freg_data[inst[20:16]];
                OP_CEQ :  freg_cond[inst[10:8]] <=( freg_data[inst[20:16]] == freg_data[inst[15:11]]);
                OP_CLT :  freg_cond[inst[10:8]] <=( freg_data[inst[20:16]] <  freg_data[inst[15:11]]);
                OP_CLE :  freg_cond[inst[10:8]] <=( freg_data[inst[20:16]] <= freg_data[inst[15:11]]);
              endcase
          endcase

        OP_ADDI:reg_data[inst[20:16]]<=reg_data[inst[25:21]]+{{16{inst[15]}},inst[15:0]};
        OP_JAL: reg_data[31] <=pc+1;
        OP_LW:  reg_data[inst[20:16]]<=mem_data[reg_data[inst[25:21]]+inst[15:0]];//data_mem_
        OP_SW:  mem_data[reg_data[inst[25:21]]+inst[15:0]]<=reg_data[inst[20:16]];//reg_data[inst[25:21]]+inst[15:0]
        OP_ANDI:reg_data[inst[20:16]]<=reg_data[inst[25:21]]&{16'b0,inst[15:0]};
        OP_ORI: reg_data[inst[20:16]]<=reg_data[inst[25:21]]|{16'b0,inst[15:0]};
        OP_SLTI:reg_data[inst[20:16]]<= $signed(reg_data[inst[25:21]])<= $signed(inst[15:0]) ;
        OP_LUI: reg_data[inst[20:16]]<=inst[15:0]<<16;
        OP_LW_S:freg_data[inst[20:16]]<=mem_data[reg_data[inst[25:21]]+inst[15:0]];//data_mem_
        OP_SW_S:mem_data[reg_data[inst[25:21]]+inst[15:0]]<=freg_data[inst[20:16]];//reg_data[inst[25:21]]+inst[15:0]
      endcase       
      // PCの操作
      if ( (inst[31:26]==OP_BEQ &&(reg_data[inst[25:21]] == reg_data[inst[20:16]] ) )||
           (inst[31:26]==OP_BNE &&(reg_data[inst[25:21]] != reg_data[inst[20:16]] ) )||
           (inst[31:26]==OP_FPU &&(inst[25:24]== OP_FCON ) && (freg_cond[inst[20:18]]==inst[16]) ) )
        pc <= pc+$signed(inst[15:0]);
      else if (inst[31:26]==OP_JAL) pc <= inst[25:0];
      else if ( (inst[31:26]==OP_ZERO && inst[5:0]== FUN_JR)  ||
                (inst[31:26]==OP_ZERO && inst[5:0]== FUN_JALR) ) pc<=reg_data[inst[25:21]];
      else if (inst[31:26]==OP_J   ) begin pc<=inst[25:0];status<=INIT; end
      else begin // PCを1増やす系
        if (inst[31:26]==OP_FPU && inst[5:0]==FPU_DIV) begin
          if (fdiv_valid) pc <= pc+1;
        end else pc <=pc+1;
      end
    end

    TMP_L1  <= mem_inst[1];   
    TMP_L2  <= reg_data[1]; 

       
  end

  assign LED[7]  =CLK2;
  assign LED[6:6]=TMP_L1[0:0];
  assign LED[5:0]=TMP_L2[5:0];
endmodule
