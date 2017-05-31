//
// Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
//
// On Wed May 31 23:01:26 CST 2017
//
// BVI format method schedule info:
// schedule datain_put  CF ( dataout_get,
// 			  getEopCount,
// 			  getSopCount,
// 			  getIdleCount,
// 			  getDataCount );
// schedule datain_put  C ( datain_put );
//
// schedule dataout_get  CF ( datain_put,
// 			   getEopCount,
// 			   getSopCount,
// 			   getIdleCount,
// 			   getDataCount );
// schedule dataout_get  C ( dataout_get );
//
// schedule getEopCount  CF ( datain_put,
// 			   dataout_get,
// 			   getEopCount,
// 			   getSopCount,
// 			   getIdleCount,
// 			   getDataCount );
//
// schedule getSopCount  CF ( datain_put,
// 			   dataout_get,
// 			   getEopCount,
// 			   getSopCount,
// 			   getIdleCount,
// 			   getDataCount );
//
// schedule getIdleCount  CF ( datain_put,
// 			    dataout_get,
// 			    getEopCount,
// 			    getSopCount,
// 			    getIdleCount,
// 			    getDataCount );
//
// schedule getDataCount  CF ( datain_put,
// 			    dataout_get,
// 			    getEopCount,
// 			    getSopCount,
// 			    getIdleCount,
// 			    getDataCount );
//
//
// Ports:
// Name                         I/O  size props
// RDY_datain_put                 O     1 reg
// dataout_get                    O   610 reg
// RDY_dataout_get                O     1 reg
// getEopCount                    O    64 reg
// RDY_getEopCount                O     1 const
// getSopCount                    O    64 reg
// RDY_getSopCount                O     1 const
// getIdleCount                   O    64 reg
// RDY_getIdleCount               O     1 const
// getDataCount                   O    64 reg
// RDY_getDataCount               O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// datain_put                     I   322 reg
// EN_datain_put                  I     1
// EN_dataout_get                 I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkStreamGearboxUp_32_64(CLK,
			       RST_N,

			       datain_put,
			       EN_datain_put,
			       RDY_datain_put,

			       EN_dataout_get,
			       dataout_get,
			       RDY_dataout_get,

			       getEopCount,
			       RDY_getEopCount,

			       getSopCount,
			       RDY_getSopCount,

			       getIdleCount,
			       RDY_getIdleCount,

			       getDataCount,
			       RDY_getDataCount);
  input  CLK;
  input  RST_N;

  // action method datain_put
  input  [321 : 0] datain_put;
  input  EN_datain_put;
  output RDY_datain_put;

  // actionvalue method dataout_get
  input  EN_dataout_get;
  output [609 : 0] dataout_get;
  output RDY_dataout_get;

  // value method getEopCount
  output [63 : 0] getEopCount;
  output RDY_getEopCount;

  // value method getSopCount
  output [63 : 0] getSopCount;
  output RDY_getSopCount;

  // value method getIdleCount
  output [63 : 0] getIdleCount;
  output RDY_getIdleCount;

  // value method getDataCount
  output [63 : 0] getDataCount;
  output RDY_getDataCount;

  // signals for module outputs
  wire [609 : 0] dataout_get;
  wire [63 : 0] getDataCount, getEopCount, getIdleCount, getSopCount;
  wire RDY_datain_put,
       RDY_dataout_get,
       RDY_getDataCount,
       RDY_getEopCount,
       RDY_getIdleCount,
       RDY_getSopCount;

  // register data_bytes
  reg [63 : 0] data_bytes;
  wire [63 : 0] data_bytes_D_IN;
  wire data_bytes_EN;

  // register eopCount
  reg [63 : 0] eopCount;
  wire [63 : 0] eopCount_D_IN;
  wire eopCount_EN;

  // register idle_cycles
  reg [63 : 0] idle_cycles;
  wire [63 : 0] idle_cycles_D_IN;
  wire idle_cycles_EN;

  // register inProgress
  reg inProgress;
  wire inProgress_D_IN, inProgress_EN;

  // register oddBeat
  reg oddBeat;
  wire oddBeat_D_IN, oddBeat_EN;

  // register sopCount
  reg [63 : 0] sopCount;
  wire [63 : 0] sopCount_D_IN;
  wire sopCount_EN;

  // register v_prev
  reg [321 : 0] v_prev;
  wire [321 : 0] v_prev_D_IN;
  wire v_prev_EN;

  // ports of submodule in_ff
  wire [321 : 0] in_ff_D_IN, in_ff_D_OUT;
  wire in_ff_CLR, in_ff_DEQ, in_ff_EMPTY_N, in_ff_ENQ, in_ff_FULL_N;

  // ports of submodule out_ff
  wire [609 : 0] out_ff_D_IN, out_ff_D_OUT;
  wire out_ff_CLR, out_ff_DEQ, out_ff_EMPTY_N, out_ff_ENQ, out_ff_FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_readPacketEven,
       WILL_FIRE_RL_readPacketOdd,
       WILL_FIRE_RL_startOfPacket;

  // inputs to muxes for submodule ports
  wire [609 : 0] MUX_out_ff_enq_1__VAL_1, MUX_out_ff_enq_1__VAL_2;
  wire MUX_inProgress_write_1__PSEL_1,
       MUX_inProgress_write_1__SEL_1,
       MUX_oddBeat_write_1__SEL_1,
       MUX_out_ff_enq_1__SEL_1;

  // remaining internal signals
  wire [511 : 0] x_data__h2272, x_data__h4220;
  wire [63 : 0] x_mask__h4221, y__h856;
  wire [5 : 0] x__h1002,
	       x__h1014,
	       x__h1026,
	       x__h1038,
	       x__h1050,
	       x__h1062,
	       x__h1074,
	       x__h1086,
	       x__h1098,
	       x__h1110,
	       x__h1122,
	       x__h1134,
	       x__h1146,
	       x__h1158,
	       x__h1170,
	       x__h1182,
	       x__h1194,
	       x__h1206,
	       x__h1218,
	       x__h1230,
	       x__h1242,
	       x__h859,
	       x__h882,
	       x__h894,
	       x__h906,
	       x__h918,
	       x__h930,
	       x__h942,
	       x__h954,
	       x__h966,
	       x__h978,
	       x__h990,
	       y__h1003,
	       y__h1015,
	       y__h1027,
	       y__h1039,
	       y__h1051,
	       y__h1063,
	       y__h1075,
	       y__h1087,
	       y__h1099,
	       y__h1111,
	       y__h1123,
	       y__h1135,
	       y__h1147,
	       y__h1159,
	       y__h1171,
	       y__h1183,
	       y__h1195,
	       y__h1207,
	       y__h1219,
	       y__h1231,
	       y__h1243,
	       y__h883,
	       y__h895,
	       y__h907,
	       y__h919,
	       y__h931,
	       y__h943,
	       y__h955,
	       y__h967,
	       y__h979,
	       y__h991;

  // action method datain_put
  assign RDY_datain_put = in_ff_FULL_N ;

  // actionvalue method dataout_get
  assign dataout_get = out_ff_D_OUT ;
  assign RDY_dataout_get = out_ff_EMPTY_N ;

  // value method getEopCount
  assign getEopCount = eopCount ;
  assign RDY_getEopCount = 1'd1 ;

  // value method getSopCount
  assign getSopCount = sopCount ;
  assign RDY_getSopCount = 1'd1 ;

  // value method getIdleCount
  assign getIdleCount = idle_cycles ;
  assign RDY_getIdleCount = 1'd1 ;

  // value method getDataCount
  assign getDataCount = data_bytes ;
  assign RDY_getDataCount = 1'd1 ;

  // submodule in_ff
  FIFO2 #(.width(32'd322), .guarded(32'd1)) in_ff(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(in_ff_D_IN),
						  .ENQ(in_ff_ENQ),
						  .DEQ(in_ff_DEQ),
						  .CLR(in_ff_CLR),
						  .D_OUT(in_ff_D_OUT),
						  .FULL_N(in_ff_FULL_N),
						  .EMPTY_N(in_ff_EMPTY_N));

  // submodule out_ff
  FIFO2 #(.width(32'd610), .guarded(32'd1)) out_ff(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(out_ff_D_IN),
						   .ENQ(out_ff_ENQ),
						   .DEQ(out_ff_DEQ),
						   .CLR(out_ff_CLR),
						   .D_OUT(out_ff_D_OUT),
						   .FULL_N(out_ff_FULL_N),
						   .EMPTY_N(out_ff_EMPTY_N));

  // rule RL_readPacketOdd
  assign WILL_FIRE_RL_readPacketOdd =
	     in_ff_EMPTY_N && (!in_ff_D_OUT[0] || out_ff_FULL_N) &&
	     inProgress &&
	     oddBeat ;

  // rule RL_readPacketEven
  assign WILL_FIRE_RL_readPacketEven =
	     in_ff_EMPTY_N && out_ff_FULL_N && inProgress && !oddBeat ;

  // rule RL_startOfPacket
  assign WILL_FIRE_RL_startOfPacket = in_ff_EMPTY_N && !inProgress ;

  // inputs to muxes for submodule ports
  assign MUX_inProgress_write_1__PSEL_1 =
	     WILL_FIRE_RL_readPacketEven || WILL_FIRE_RL_readPacketOdd ;
  assign MUX_inProgress_write_1__SEL_1 =
	     MUX_inProgress_write_1__PSEL_1 && in_ff_D_OUT[0] ;
  assign MUX_oddBeat_write_1__SEL_1 =
	     WILL_FIRE_RL_readPacketOdd && !in_ff_D_OUT[0] ;
  assign MUX_out_ff_enq_1__SEL_1 =
	     WILL_FIRE_RL_readPacketOdd && in_ff_D_OUT[0] ;
  assign MUX_out_ff_enq_1__VAL_1 =
	     { in_ff_D_OUT[321:290],
	       x_data__h2272,
	       32'd0,
	       in_ff_D_OUT[33:0] } ;
  assign MUX_out_ff_enq_1__VAL_2 =
	     { v_prev[321:290],
	       x_data__h4220,
	       x_mask__h4221,
	       v_prev[1],
	       v_prev[0] || in_ff_D_OUT[0] } ;

  // register data_bytes
  assign data_bytes_D_IN = data_bytes + y__h856 ;
  assign data_bytes_EN = MUX_inProgress_write_1__PSEL_1 ;

  // register eopCount
  assign eopCount_D_IN = eopCount + 64'd1 ;
  assign eopCount_EN = MUX_inProgress_write_1__PSEL_1 && in_ff_D_OUT[0] ;

  // register idle_cycles
  assign idle_cycles_D_IN = idle_cycles + 64'd1 ;
  assign idle_cycles_EN = !inProgress ;

  // register inProgress
  assign inProgress_D_IN = !MUX_inProgress_write_1__SEL_1 && in_ff_D_OUT[1] ;
  assign inProgress_EN =
	     (WILL_FIRE_RL_readPacketEven || WILL_FIRE_RL_readPacketOdd) &&
	     in_ff_D_OUT[0] ||
	     WILL_FIRE_RL_startOfPacket ;

  // register oddBeat
  assign oddBeat_D_IN = MUX_oddBeat_write_1__SEL_1 ? !oddBeat : !oddBeat ;
  assign oddBeat_EN =
	     WILL_FIRE_RL_readPacketOdd && !in_ff_D_OUT[0] ||
	     WILL_FIRE_RL_readPacketEven ;

  // register sopCount
  assign sopCount_D_IN = sopCount + 64'd1 ;
  assign sopCount_EN = WILL_FIRE_RL_startOfPacket && in_ff_D_OUT[1] ;

  // register v_prev
  assign v_prev_D_IN = in_ff_D_OUT ;
  assign v_prev_EN = WILL_FIRE_RL_readPacketOdd ;

  // submodule in_ff
  assign in_ff_D_IN = datain_put ;
  assign in_ff_ENQ = EN_datain_put ;
  assign in_ff_DEQ =
	     WILL_FIRE_RL_startOfPacket && !in_ff_D_OUT[1] ||
	     WILL_FIRE_RL_readPacketEven ||
	     WILL_FIRE_RL_readPacketOdd ;
  assign in_ff_CLR = 1'b0 ;

  // submodule out_ff
  assign out_ff_D_IN =
	     MUX_out_ff_enq_1__SEL_1 ?
	       MUX_out_ff_enq_1__VAL_1 :
	       MUX_out_ff_enq_1__VAL_2 ;
  assign out_ff_ENQ =
	     WILL_FIRE_RL_readPacketOdd && in_ff_D_OUT[0] ||
	     WILL_FIRE_RL_readPacketEven ;
  assign out_ff_DEQ = EN_dataout_get ;
  assign out_ff_CLR = 1'b0 ;

  // remaining internal signals
  assign x__h1002 = x__h1014 + y__h1015 ;
  assign x__h1014 = x__h1026 + y__h1027 ;
  assign x__h1026 = x__h1038 + y__h1039 ;
  assign x__h1038 = x__h1050 + y__h1051 ;
  assign x__h1050 = x__h1062 + y__h1063 ;
  assign x__h1062 = x__h1074 + y__h1075 ;
  assign x__h1074 = x__h1086 + y__h1087 ;
  assign x__h1086 = x__h1098 + y__h1099 ;
  assign x__h1098 = x__h1110 + y__h1111 ;
  assign x__h1110 = x__h1122 + y__h1123 ;
  assign x__h1122 = x__h1134 + y__h1135 ;
  assign x__h1134 = x__h1146 + y__h1147 ;
  assign x__h1146 = x__h1158 + y__h1159 ;
  assign x__h1158 = x__h1170 + y__h1171 ;
  assign x__h1170 = x__h1182 + y__h1183 ;
  assign x__h1182 = x__h1194 + y__h1195 ;
  assign x__h1194 = x__h1206 + y__h1207 ;
  assign x__h1206 = x__h1218 + y__h1219 ;
  assign x__h1218 = x__h1230 + y__h1231 ;
  assign x__h1230 = x__h1242 + y__h1243 ;
  assign x__h1242 = { 5'd0, in_ff_D_OUT[33] } ;
  assign x__h859 = x__h882 + y__h883 ;
  assign x__h882 = x__h894 + y__h895 ;
  assign x__h894 = x__h906 + y__h907 ;
  assign x__h906 = x__h918 + y__h919 ;
  assign x__h918 = x__h930 + y__h931 ;
  assign x__h930 = x__h942 + y__h943 ;
  assign x__h942 = x__h954 + y__h955 ;
  assign x__h954 = x__h966 + y__h967 ;
  assign x__h966 = x__h978 + y__h979 ;
  assign x__h978 = x__h990 + y__h991 ;
  assign x__h990 = x__h1002 + y__h1003 ;
  assign x_data__h2272 = { 256'd0, in_ff_D_OUT[289:34] } ;
  assign x_data__h4220 = { in_ff_D_OUT[289:34], v_prev[289:34] } ;
  assign x_mask__h4221 = { in_ff_D_OUT[33:2], v_prev[33:2] } ;
  assign y__h1003 = { 5'd0, in_ff_D_OUT[12] } ;
  assign y__h1015 = { 5'd0, in_ff_D_OUT[13] } ;
  assign y__h1027 = { 5'd0, in_ff_D_OUT[14] } ;
  assign y__h1039 = { 5'd0, in_ff_D_OUT[15] } ;
  assign y__h1051 = { 5'd0, in_ff_D_OUT[16] } ;
  assign y__h1063 = { 5'd0, in_ff_D_OUT[17] } ;
  assign y__h1075 = { 5'd0, in_ff_D_OUT[18] } ;
  assign y__h1087 = { 5'd0, in_ff_D_OUT[19] } ;
  assign y__h1099 = { 5'd0, in_ff_D_OUT[20] } ;
  assign y__h1111 = { 5'd0, in_ff_D_OUT[21] } ;
  assign y__h1123 = { 5'd0, in_ff_D_OUT[22] } ;
  assign y__h1135 = { 5'd0, in_ff_D_OUT[23] } ;
  assign y__h1147 = { 5'd0, in_ff_D_OUT[24] } ;
  assign y__h1159 = { 5'd0, in_ff_D_OUT[25] } ;
  assign y__h1171 = { 5'd0, in_ff_D_OUT[26] } ;
  assign y__h1183 = { 5'd0, in_ff_D_OUT[27] } ;
  assign y__h1195 = { 5'd0, in_ff_D_OUT[28] } ;
  assign y__h1207 = { 5'd0, in_ff_D_OUT[29] } ;
  assign y__h1219 = { 5'd0, in_ff_D_OUT[30] } ;
  assign y__h1231 = { 5'd0, in_ff_D_OUT[31] } ;
  assign y__h1243 = { 5'd0, in_ff_D_OUT[32] } ;
  assign y__h856 = { 58'd0, x__h859 } ;
  assign y__h883 = { 5'd0, in_ff_D_OUT[2] } ;
  assign y__h895 = { 5'd0, in_ff_D_OUT[3] } ;
  assign y__h907 = { 5'd0, in_ff_D_OUT[4] } ;
  assign y__h919 = { 5'd0, in_ff_D_OUT[5] } ;
  assign y__h931 = { 5'd0, in_ff_D_OUT[6] } ;
  assign y__h943 = { 5'd0, in_ff_D_OUT[7] } ;
  assign y__h955 = { 5'd0, in_ff_D_OUT[8] } ;
  assign y__h967 = { 5'd0, in_ff_D_OUT[9] } ;
  assign y__h979 = { 5'd0, in_ff_D_OUT[10] } ;
  assign y__h991 = { 5'd0, in_ff_D_OUT[11] } ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        data_bytes <= `BSV_ASSIGNMENT_DELAY 64'd0;
	eopCount <= `BSV_ASSIGNMENT_DELAY 64'd0;
	idle_cycles <= `BSV_ASSIGNMENT_DELAY 64'd0;
	inProgress <= `BSV_ASSIGNMENT_DELAY 1'd0;
	oddBeat <= `BSV_ASSIGNMENT_DELAY 1'd1;
	sopCount <= `BSV_ASSIGNMENT_DELAY 64'd0;
	v_prev <= `BSV_ASSIGNMENT_DELAY 322'd0;
      end
    else
      begin
        if (data_bytes_EN)
	  data_bytes <= `BSV_ASSIGNMENT_DELAY data_bytes_D_IN;
	if (eopCount_EN) eopCount <= `BSV_ASSIGNMENT_DELAY eopCount_D_IN;
	if (idle_cycles_EN)
	  idle_cycles <= `BSV_ASSIGNMENT_DELAY idle_cycles_D_IN;
	if (inProgress_EN)
	  inProgress <= `BSV_ASSIGNMENT_DELAY inProgress_D_IN;
	if (oddBeat_EN) oddBeat <= `BSV_ASSIGNMENT_DELAY oddBeat_D_IN;
	if (sopCount_EN) sopCount <= `BSV_ASSIGNMENT_DELAY sopCount_D_IN;
	if (v_prev_EN) v_prev <= `BSV_ASSIGNMENT_DELAY v_prev_D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    data_bytes = 64'hAAAAAAAAAAAAAAAA;
    eopCount = 64'hAAAAAAAAAAAAAAAA;
    idle_cycles = 64'hAAAAAAAAAAAAAAAA;
    inProgress = 1'h0;
    oddBeat = 1'h0;
    sopCount = 64'hAAAAAAAAAAAAAAAA;
    v_prev =
	322'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkStreamGearboxUp_32_64

