module core (
  input logic CLK,
  input logic SW_W,
  input logic SW_E,
  output logic [7:0] LED
);
  localparam OP_ZERO = 6'b0;
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
  localparam OP_LUI=   6'b001111;

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

  localparam OP_FPU = 6'b010001;
  localparam FPU_OP_SPECIAL = 2'b10;
        
  localparam FPU_ADD  = 6'b000000;
  localparam FPU_SUB  = 6'b000001;
  localparam FPU_MUL  = 6'b000010;
  localparam FPU_DIV  = 6'b000011;
  localparam FPU_MOV  = 6'b000110;

  localparam REG_LEN = 32;
  logic [31:0] pc=32'b0;
  logic [1:0] status = 2'b0;
  localparam INIT = 2'b00;
  localparam RUN  = 2'b01;
  //%r30がスタックポインタ0x0 %r31がフレームポインタ0x40000
  logic [31:0] reg_data [31:0];
  logic [31:0] freg_data [31:0];
  integer i;
  initial begin
    for(i=1;i<30;i=i+1)
      reg_data[i]=32'b0;
    // ここにメモリの初期化（mem[12'h001]=16'h1234;など）を書く．
    reg_data[0]=32'b0;
    reg_data[30]=32'b0;
    reg_data[31]=32'h00000040;
  end
      //= {32'h00040, 32'h0,{29{32'bx}},32'b0};
  // 右側からよみこまれる
  //logic [31:0] mem_inst [47:0] = {32'h03e00008 ,32'h00410820 ,32'h8fc20004 ,32'h8fdf000c ,32'h23defff0 ,32'h0c000012 ,32'h23de0010 ,32'hafdf000c ,32'h20410000 ,32'hafc10004 ,32'h00621022 ,32'h8fc30000 ,32'h20020002 ,32'h8fdf0004 ,32'h23defff8 ,32'h0c000012 ,32'h23de0008 ,32'hafdf0004 ,32'h20410000 ,32'hafc10000 ,32'h00221022 ,32'h20020001 ,32'h03e00008 ,32'h20010001 ,32'h14220003 ,32'h20020001 ,32'h03e00008 ,32'h20010001 ,32'h14220003 ,32'h20020000 ,32'h68010000 ,32'h8fdf0004 ,32'h23defff8 ,32'h6c010000 ,32'h00010a02 ,32'h6c010000 ,32'h00010a02 ,32'h6c010000 ,32'h00010a02 ,32'h6c010000 ,32'h23de0008 ,32'hafdf0004 ,32'h8fdf0004 ,32'h23defff8 ,32'h0c000012 ,32'h23de0008 ,32'hafdf0004 ,32'h20010014 };
  logic [31:0] mem_inst [43:0];
  fib3 fib3(mem_inst);
  //logic [31:0] mem_inst [2:0] = {32'hFFFFFFFF ,32'h6C010000 ,32'h20010003 };
  logic [31:0] mem_data [499:0];
  //add,addi,sub,srl,beq,bne,jal,jr,lw,sw,in,outが必要 
  //and,andi,or,ori,nor,sll
  //$fread(file, inst, 0, 16); 
  logic[31:0] inst;

  int count =0;
  logic flg=0;
  logic CLK2=1;
  logic [31:0]TMP_L1 =32'b0;
  logic [31:0]TMP_L2 =32'b0;

  //logic [2:0] TMP_L =3'b0;
  //logic [2:0] TMP_R =3'b0;
  always @(posedge CLK ) begin
    if (count >= 200000000) begin
      count <= 0;
      CLK2<=~CLK2;
    end else   count <= count+1;
  end

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
  fdiv fdiv(
    .aclk(CLK),
    .s_axis_a_tvalid(1'b1),
    .s_axis_a_tdata(freg_data[inst[15:11]]),
    .s_axis_b_tvalid(1'b1),
    .s_axis_b_tdata(freg_data[inst[20:16]]),
    .m_axis_result_tdata(fdiv_out)
  );

  assign inst = mem_inst[pc];

  always @(posedge CLK) begin
    if (SW_W && status == INIT) begin 
      status <= RUN;
        //TMP_L<=3'b111;
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
              endcase
          endcase

        OP_ADDI:begin reg_data[inst[20:16]]<=reg_data[inst[25:21]]+{{16{inst[15]}},inst[15:0]}; end
        OP_JAL: reg_data[31] <=pc+1;
        OP_LW:  reg_data[inst[20:16]]<=mem_data[reg_data[inst[25:21]]+inst[15:0]];//data_mem_
        OP_SW:  mem_data[reg_data[inst[25:21]]+inst[15:0]]<=reg_data[inst[20:16]];//mem_data[inst[25:21]+inst[15:0]]
        OP_ANDI:reg_data[inst[20:16]]<=reg_data[inst[25:21]]&{16'b0,inst[15:0]};
        OP_ORI: reg_data[inst[20:16]]<=reg_data[inst[25:21]]|{16'b0,inst[15:0]};
        OP_SLTI:reg_data[inst[20:16]]<=(reg_data[inst[25:21]]<= {{16{inst[15]}},inst[15:0]} );
        OP_LUI: reg_data[inst[20:16]]<=inst[15:0]<<16;
      endcase       

      if ( (inst[31:26]==OP_BEQ &&(reg_data[inst[25:21]] == reg_data[inst[20:16]] ) )||
           (inst[31:26]==OP_BNE &&(reg_data[inst[25:21]] != reg_data[inst[20:16]] ) ) )
        pc <= pc+$signed(inst[15:0]);
      else if (inst[31:26]==OP_JAL) pc <= inst[25:0];
      else if ( (inst[31:26]==OP_ZERO && inst[5:0]== FUN_JR)  ||
                (inst[31:26]==OP_ZERO && inst[5:0]== FUN_JALR) ) pc<=reg_data[inst[25:21]];
      else if (inst[31:26]==OP_IN ) begin pc<=pc+1;end
      else if (inst[31:26]==OP_OUT ) begin pc<=pc+1;end
      else if (inst[31:26]==OP_J   ) begin pc<=inst[25:0];status<=INIT; end

    else
      pc <=pc+1;
      TMP_L1  <= mem_inst[1];   
      TMP_L2  <= reg_data[1];   
      //TMP_L  = TMP_L1[2:0];   
      //TMP_R  = TMP_L1[2:0];
    end
  end

  assign LED[7]  =CLK2;
  assign LED[6:6]=TMP_L1[0:0];
  assign LED[5:0]=TMP_L2[5:0];
endmodule
