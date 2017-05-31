//
// Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
//
// On Wed May 31 23:52:14 CST 2017
//
// BVI format method schedule info:
// schedule writeServer_enq  CF ( readServer_readData_get,
// 			       readServer_readLen_get,
// 			       readServer_readReq_put,
// 			       dbg,
// 			       set_verbosity );
// schedule writeServer_enq  C ( writeServer_enq );
//
// schedule writeServer_notFull  CF ( writeServer_notFull,
// 				   readServer_readData_get,
// 				   readServer_readLen_get,
// 				   readServer_readReq_put,
// 				   dbg,
// 				   set_verbosity );
// schedule writeServer_notFull  SB ( writeServer_enq );
//
// schedule readServer_readData_get  CF ( writeServer_enq,
// 				       writeServer_notFull,
// 				       readServer_readLen_get,
// 				       readServer_readReq_put,
// 				       dbg,
// 				       set_verbosity );
// schedule readServer_readData_get  C ( readServer_readData_get );
//
// schedule readServer_readLen_get  CF ( writeServer_enq,
// 				      writeServer_notFull,
// 				      readServer_readData_get,
// 				      readServer_readReq_put,
// 				      dbg,
// 				      set_verbosity );
// schedule readServer_readLen_get  C ( readServer_readLen_get );
//
// schedule readServer_readReq_put  CF ( writeServer_enq,
// 				      writeServer_notFull,
// 				      readServer_readData_get,
// 				      readServer_readLen_get,
// 				      dbg,
// 				      set_verbosity );
// schedule readServer_readReq_put  C ( readServer_readReq_put );
//
// schedule dbg  CF ( writeServer_enq,
// 		   writeServer_notFull,
// 		   readServer_readData_get,
// 		   readServer_readLen_get,
// 		   readServer_readReq_put,
// 		   dbg,
// 		   set_verbosity );
//
// schedule set_verbosity  CF ( writeServer_enq,
// 			     writeServer_notFull,
// 			     readServer_readData_get,
// 			     readServer_readLen_get,
// 			     readServer_readReq_put,
// 			     dbg );
// schedule set_verbosity  SBR ( set_verbosity );
//
//
// Ports:
// Name                         I/O  size props
// RDY_writeServer_enq            O     1 reg
// writeServer_notFull            O     1 reg
// RDY_writeServer_notFull        O     1 const
// readServer_readData_get        O   106 reg
// RDY_readServer_readData_get    O     1 reg
// readServer_readLen_get         O    16 reg
// RDY_readServer_readLen_get     O     1 reg
// RDY_readServer_readReq_put     O     1 reg
// dbg                            O   256 reg
// RDY_dbg                        O     1 const
// RDY_set_verbosity              O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// writeServer_enq_v              I   106 reg
// readServer_readReq_put         I    16 reg
// set_verbosity_verbosity        I    32 reg
// EN_writeServer_enq             I     1
// EN_readServer_readReq_put      I     1
// EN_set_verbosity               I     1
// EN_readServer_readData_get     I     1
// EN_readServer_readLen_get      I     1
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

module mkPacketBuffer_8(CLK,
			RST_N,

			writeServer_enq_v,
			EN_writeServer_enq,
			RDY_writeServer_enq,

			writeServer_notFull,
			RDY_writeServer_notFull,

			EN_readServer_readData_get,
			readServer_readData_get,
			RDY_readServer_readData_get,

			EN_readServer_readLen_get,
			readServer_readLen_get,
			RDY_readServer_readLen_get,

			readServer_readReq_put,
			EN_readServer_readReq_put,
			RDY_readServer_readReq_put,

			dbg,
			RDY_dbg,

			set_verbosity_verbosity,
			EN_set_verbosity,
			RDY_set_verbosity);
  parameter param1 = "";
  input  CLK;
  input  RST_N;

  // action method writeServer_enq
  input  [105 : 0] writeServer_enq_v;
  input  EN_writeServer_enq;
  output RDY_writeServer_enq;

  // value method writeServer_notFull
  output writeServer_notFull;
  output RDY_writeServer_notFull;

  // actionvalue method readServer_readData_get
  input  EN_readServer_readData_get;
  output [105 : 0] readServer_readData_get;
  output RDY_readServer_readData_get;

  // actionvalue method readServer_readLen_get
  input  EN_readServer_readLen_get;
  output [15 : 0] readServer_readLen_get;
  output RDY_readServer_readLen_get;

  // action method readServer_readReq_put
  input  [15 : 0] readServer_readReq_put;
  input  EN_readServer_readReq_put;
  output RDY_readServer_readReq_put;

  // value method dbg
  output [255 : 0] dbg;
  output RDY_dbg;

  // action method set_verbosity
  input  [31 : 0] set_verbosity_verbosity;
  input  EN_set_verbosity;
  output RDY_set_verbosity;

  // signals for module outputs
  wire [255 : 0] dbg;
  wire [105 : 0] readServer_readData_get;
  wire [15 : 0] readServer_readLen_get;
  wire RDY_dbg,
       RDY_readServer_readData_get,
       RDY_readServer_readLen_get,
       RDY_readServer_readReq_put,
       RDY_set_verbosity,
       RDY_writeServer_enq,
       RDY_writeServer_notFull,
       writeServer_notFull;

  // inlined wires
  wire [105 : 0] memBuffer_serverAdapterB_outData_outData_wget;
  wire [1 : 0] memBuffer_serverAdapterB_s1_1_wget;
  wire memBuffer_serverAdapterA_outData_enqData_whas,
       memBuffer_serverAdapterA_writeWithResp_whas,
       memBuffer_serverAdapterB_cnt_1_whas,
       memBuffer_serverAdapterB_outData_enqData_whas,
       memBuffer_serverAdapterB_outData_outData_whas,
       memBuffer_serverAdapterB_writeWithResp_whas;

  // register cf_verbosity
  reg [31 : 0] cf_verbosity;
  wire [31 : 0] cf_verbosity_D_IN;
  wire cf_verbosity_EN;

  // register eopDeq
  reg [63 : 0] eopDeq;
  wire [63 : 0] eopDeq_D_IN;
  wire eopDeq_EN;

  // register eopEnq
  reg [63 : 0] eopEnq;
  wire [63 : 0] eopEnq_D_IN;
  wire eopEnq_EN;

  // register inPacket
  reg inPacket;
  wire inPacket_D_IN, inPacket_EN;

  // register memBuffer_serverAdapterA_cnt
  reg [2 : 0] memBuffer_serverAdapterA_cnt;
  wire [2 : 0] memBuffer_serverAdapterA_cnt_D_IN;
  wire memBuffer_serverAdapterA_cnt_EN;

  // register memBuffer_serverAdapterA_s1
  reg [1 : 0] memBuffer_serverAdapterA_s1;
  wire [1 : 0] memBuffer_serverAdapterA_s1_D_IN;
  wire memBuffer_serverAdapterA_s1_EN;

  // register memBuffer_serverAdapterA_s2
  reg [1 : 0] memBuffer_serverAdapterA_s2;
  wire [1 : 0] memBuffer_serverAdapterA_s2_D_IN;
  wire memBuffer_serverAdapterA_s2_EN;

  // register memBuffer_serverAdapterB_cnt
  reg [2 : 0] memBuffer_serverAdapterB_cnt;
  wire [2 : 0] memBuffer_serverAdapterB_cnt_D_IN;
  wire memBuffer_serverAdapterB_cnt_EN;

  // register memBuffer_serverAdapterB_s1
  reg [1 : 0] memBuffer_serverAdapterB_s1;
  wire [1 : 0] memBuffer_serverAdapterB_s1_D_IN;
  wire memBuffer_serverAdapterB_s1_EN;

  // register memBuffer_serverAdapterB_s2
  reg [1 : 0] memBuffer_serverAdapterB_s2;
  wire [1 : 0] memBuffer_serverAdapterB_s2_D_IN;
  wire memBuffer_serverAdapterB_s2_EN;

  // register outPacket
  reg outPacket;
  wire outPacket_D_IN, outPacket_EN;

  // register packetLen
  reg [15 : 0] packetLen;
  wire [15 : 0] packetLen_D_IN;
  wire packetLen_EN;

  // register rdCurrPtr
  reg [7 : 0] rdCurrPtr;
  wire [7 : 0] rdCurrPtr_D_IN;
  wire rdCurrPtr_EN;

  // register sopDeq
  reg [63 : 0] sopDeq;
  wire [63 : 0] sopDeq_D_IN;
  wire sopDeq_EN;

  // register sopEnq
  reg [63 : 0] sopEnq;
  wire [63 : 0] sopEnq_D_IN;
  wire sopEnq_EN;

  // register wrCurrPtr
  reg [7 : 0] wrCurrPtr;
  wire [7 : 0] wrCurrPtr_D_IN;
  wire wrCurrPtr_EN;

  // ports of submodule fifoEop
  wire [15 : 0] fifoEop_D_IN, fifoEop_D_OUT;
  wire fifoEop_CLR, fifoEop_DEQ, fifoEop_EMPTY_N, fifoEop_ENQ, fifoEop_FULL_N;

  // ports of submodule fifoLen
  wire [15 : 0] fifoLen_D_IN, fifoLen_D_OUT;
  wire fifoLen_CLR, fifoLen_DEQ, fifoLen_EMPTY_N, fifoLen_ENQ, fifoLen_FULL_N;

  // ports of submodule fifoReadData
  wire [105 : 0] fifoReadData_D_IN, fifoReadData_D_OUT;
  wire fifoReadData_CLR,
       fifoReadData_DEQ,
       fifoReadData_EMPTY_N,
       fifoReadData_ENQ,
       fifoReadData_FULL_N;

  // ports of submodule fifoReadReq
  wire [15 : 0] fifoReadReq_D_IN;
  wire fifoReadReq_CLR,
       fifoReadReq_DEQ,
       fifoReadReq_EMPTY_N,
       fifoReadReq_ENQ,
       fifoReadReq_FULL_N;

  // ports of submodule fifoWriteData
  wire [105 : 0] fifoWriteData_D_IN, fifoWriteData_D_OUT;
  wire fifoWriteData_CLR,
       fifoWriteData_DEQ,
       fifoWriteData_EMPTY_N,
       fifoWriteData_ENQ,
       fifoWriteData_FULL_N;

  // ports of submodule incomingReqs
  wire [113 : 0] incomingReqs_D_IN, incomingReqs_D_OUT;
  wire incomingReqs_CLR,
       incomingReqs_DEQ,
       incomingReqs_EMPTY_N,
       incomingReqs_ENQ,
       incomingReqs_FULL_N;

  // ports of submodule memBuffer_memory
  wire [105 : 0] memBuffer_memory_DIA,
		 memBuffer_memory_DIB,
		 memBuffer_memory_DOA,
		 memBuffer_memory_DOB;
  wire [7 : 0] memBuffer_memory_ADDRA, memBuffer_memory_ADDRB;
  wire memBuffer_memory_ENA,
       memBuffer_memory_ENB,
       memBuffer_memory_WEA,
       memBuffer_memory_WEB;

  // ports of submodule memBuffer_serverAdapterA_outDataCore
  wire [105 : 0] memBuffer_serverAdapterA_outDataCore_D_IN;
  wire memBuffer_serverAdapterA_outDataCore_CLR,
       memBuffer_serverAdapterA_outDataCore_DEQ,
       memBuffer_serverAdapterA_outDataCore_ENQ,
       memBuffer_serverAdapterA_outDataCore_FULL_N;

  // ports of submodule memBuffer_serverAdapterB_outDataCore
  wire [105 : 0] memBuffer_serverAdapterB_outDataCore_D_IN,
		 memBuffer_serverAdapterB_outDataCore_D_OUT;
  wire memBuffer_serverAdapterB_outDataCore_CLR,
       memBuffer_serverAdapterB_outDataCore_DEQ,
       memBuffer_serverAdapterB_outDataCore_EMPTY_N,
       memBuffer_serverAdapterB_outDataCore_ENQ,
       memBuffer_serverAdapterB_outDataCore_FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_commit_packet,
       WILL_FIRE_RL_dequeue_first_beat,
       WILL_FIRE_RL_dequeue_next_beat,
       WILL_FIRE_RL_enq_stage1,
       WILL_FIRE_RL_enqueue_first_beat,
       WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq;

  // inputs to muxes for submodule ports
  wire [7 : 0] MUX_rdCurrPtr_write_1__VAL_1;
  wire MUX_memBuffer_memory_b_put_1__SEL_1, MUX_outPacket_write_1__SEL_1;

  // remaining internal signals
  wire [15 : 0] newPacketLen__h5199;
  wire [3 : 0] x__h5288,
	       x__h5303,
	       x__h5315,
	       x__h5327,
	       x__h5339,
	       x__h5351,
	       x__h5363,
	       x__h5375,
	       y__h5304,
	       y__h5316,
	       y__h5328,
	       y__h5340,
	       y__h5352,
	       y__h5364,
	       y__h5376;
  wire [2 : 0] memBuffer_serverAdapterB_cnt_1_PLUS_IF_memBuff_ETC___d97;
  wire [1 : 0] ab__h4227;
  wire memBuffer_serverAdapterA_cnt_6_SLT_3___d171,
       memBuffer_serverAdapterB_cnt_1_SLT_3___d197;

  // action method writeServer_enq
  assign RDY_writeServer_enq = fifoWriteData_FULL_N ;

  // value method writeServer_notFull
  assign writeServer_notFull = fifoWriteData_FULL_N ;
  assign RDY_writeServer_notFull = 1'd1 ;

  // actionvalue method readServer_readData_get
  assign readServer_readData_get = fifoReadData_D_OUT ;
  assign RDY_readServer_readData_get = fifoReadData_EMPTY_N ;

  // actionvalue method readServer_readLen_get
  assign readServer_readLen_get = fifoLen_D_OUT ;
  assign RDY_readServer_readLen_get = fifoLen_EMPTY_N ;

  // action method readServer_readReq_put
  assign RDY_readServer_readReq_put = fifoReadReq_FULL_N ;

  // value method dbg
  assign dbg = { sopEnq, eopEnq, sopDeq, eopDeq } ;
  assign RDY_dbg = 1'd1 ;

  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;

  // submodule fifoEop
  FIFO2 #(.width(32'd16), .guarded(32'd1)) fifoEop(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(fifoEop_D_IN),
						   .ENQ(fifoEop_ENQ),
						   .DEQ(fifoEop_DEQ),
						   .CLR(fifoEop_CLR),
						   .D_OUT(fifoEop_D_OUT),
						   .FULL_N(fifoEop_FULL_N),
						   .EMPTY_N(fifoEop_EMPTY_N));

  // submodule fifoLen
  SizedFIFO #(.p1width(32'd16),
	      .p2depth(32'd16),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) fifoLen(.RST(RST_N),
				       .CLK(CLK),
				       .D_IN(fifoLen_D_IN),
				       .ENQ(fifoLen_ENQ),
				       .DEQ(fifoLen_DEQ),
				       .CLR(fifoLen_CLR),
				       .D_OUT(fifoLen_D_OUT),
				       .FULL_N(fifoLen_FULL_N),
				       .EMPTY_N(fifoLen_EMPTY_N));

  // submodule fifoReadData
  FIFO2 #(.width(32'd106), .guarded(32'd1)) fifoReadData(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(fifoReadData_D_IN),
							 .ENQ(fifoReadData_ENQ),
							 .DEQ(fifoReadData_DEQ),
							 .CLR(fifoReadData_CLR),
							 .D_OUT(fifoReadData_D_OUT),
							 .FULL_N(fifoReadData_FULL_N),
							 .EMPTY_N(fifoReadData_EMPTY_N));

  // submodule fifoReadReq
  FIFO2 #(.width(32'd16), .guarded(32'd1)) fifoReadReq(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(fifoReadReq_D_IN),
						       .ENQ(fifoReadReq_ENQ),
						       .DEQ(fifoReadReq_DEQ),
						       .CLR(fifoReadReq_CLR),
						       .D_OUT(),
						       .FULL_N(fifoReadReq_FULL_N),
						       .EMPTY_N(fifoReadReq_EMPTY_N));

  // submodule fifoWriteData
  FIFO2 #(.width(32'd106), .guarded(32'd1)) fifoWriteData(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(fifoWriteData_D_IN),
							  .ENQ(fifoWriteData_ENQ),
							  .DEQ(fifoWriteData_DEQ),
							  .CLR(fifoWriteData_CLR),
							  .D_OUT(fifoWriteData_D_OUT),
							  .FULL_N(fifoWriteData_FULL_N),
							  .EMPTY_N(fifoWriteData_EMPTY_N));

  // submodule incomingReqs
  FIFO2 #(.width(32'd114), .guarded(32'd1)) incomingReqs(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(incomingReqs_D_IN),
							 .ENQ(incomingReqs_ENQ),
							 .DEQ(incomingReqs_DEQ),
							 .CLR(incomingReqs_CLR),
							 .D_OUT(incomingReqs_D_OUT),
							 .FULL_N(incomingReqs_FULL_N),
							 .EMPTY_N(incomingReqs_EMPTY_N));

  // submodule localReset
  SyncReset #(.RSTDELAY(32'd1)) localReset(.CLK(CLK),
					   .IN_RST(RST_N),
					   .OUT_RST());

  // submodule memBuffer_memory
  BRAM2 #(.PIPELINED(1'd1),
	  .ADDR_WIDTH(32'd8),
	  .DATA_WIDTH(32'd106),
	  .MEMSIZE(9'd256)) memBuffer_memory(.CLKA(CLK),
					     .CLKB(CLK),
					     .ADDRA(memBuffer_memory_ADDRA),
					     .ADDRB(memBuffer_memory_ADDRB),
					     .DIA(memBuffer_memory_DIA),
					     .DIB(memBuffer_memory_DIB),
					     .WEA(memBuffer_memory_WEA),
					     .WEB(memBuffer_memory_WEB),
					     .ENA(memBuffer_memory_ENA),
					     .ENB(memBuffer_memory_ENB),
					     .DOA(memBuffer_memory_DOA),
					     .DOB(memBuffer_memory_DOB));

  // submodule memBuffer_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd106),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) memBuffer_serverAdapterA_outDataCore(.RST(RST_N),
								    .CLK(CLK),
								    .D_IN(memBuffer_serverAdapterA_outDataCore_D_IN),
								    .ENQ(memBuffer_serverAdapterA_outDataCore_ENQ),
								    .DEQ(memBuffer_serverAdapterA_outDataCore_DEQ),
								    .CLR(memBuffer_serverAdapterA_outDataCore_CLR),
								    .D_OUT(),
								    .FULL_N(memBuffer_serverAdapterA_outDataCore_FULL_N),
								    .EMPTY_N());

  // submodule memBuffer_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd106),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) memBuffer_serverAdapterB_outDataCore(.RST(RST_N),
								    .CLK(CLK),
								    .D_IN(memBuffer_serverAdapterB_outDataCore_D_IN),
								    .ENQ(memBuffer_serverAdapterB_outDataCore_ENQ),
								    .DEQ(memBuffer_serverAdapterB_outDataCore_DEQ),
								    .CLR(memBuffer_serverAdapterB_outDataCore_CLR),
								    .D_OUT(memBuffer_serverAdapterB_outDataCore_D_OUT),
								    .FULL_N(memBuffer_serverAdapterB_outDataCore_FULL_N),
								    .EMPTY_N(memBuffer_serverAdapterB_outDataCore_EMPTY_N));

  // rule RL_enqueue_first_beat
  assign WILL_FIRE_RL_enqueue_first_beat =
	     incomingReqs_EMPTY_N &&
	     memBuffer_serverAdapterA_cnt_6_SLT_3___d171 &&
	     !fifoEop_EMPTY_N &&
	     !inPacket ;

  // rule RL_commit_packet
  assign WILL_FIRE_RL_commit_packet =
	     incomingReqs_EMPTY_N &&
	     memBuffer_serverAdapterA_cnt_6_SLT_3___d171 &&
	     fifoEop_EMPTY_N &&
	     fifoLen_FULL_N &&
	     fifoEop_EMPTY_N &&
	     inPacket ;

  // rule RL_enq_stage1
  assign WILL_FIRE_RL_enq_stage1 =
	     fifoWriteData_EMPTY_N && incomingReqs_FULL_N &&
	     (!fifoWriteData_D_OUT[0] || fifoEop_FULL_N) ;

  // rule RL_dequeue_first_beat
  assign WILL_FIRE_RL_dequeue_first_beat =
	     fifoReadReq_EMPTY_N &&
	     memBuffer_serverAdapterB_cnt_1_SLT_3___d197 &&
	     !outPacket ;

  // rule RL_memBuffer_serverAdapterB_outData_setFirstEnq
  assign WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq =
	     !memBuffer_serverAdapterB_outDataCore_EMPTY_N &&
	     memBuffer_serverAdapterB_outData_enqData_whas ;

  // rule RL_dequeue_next_beat
  assign WILL_FIRE_RL_dequeue_next_beat =
	     (memBuffer_serverAdapterB_outDataCore_EMPTY_N ||
	      memBuffer_serverAdapterB_outData_enqData_whas) &&
	     memBuffer_serverAdapterB_outData_outData_whas &&
	     fifoReadData_FULL_N &&
	     (memBuffer_serverAdapterB_outData_outData_wget[0] ||
	      memBuffer_serverAdapterB_cnt_1_SLT_3___d197) &&
	     outPacket ;

  // rule RL_memBuffer_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq =
	     memBuffer_serverAdapterB_outDataCore_EMPTY_N &&
	     memBuffer_serverAdapterB_outDataCore_FULL_N &&
	     WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_enqData_whas ;

  // inputs to muxes for submodule ports
  assign MUX_memBuffer_memory_b_put_1__SEL_1 =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_outData_wget[0] ;
  assign MUX_outPacket_write_1__SEL_1 =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_outData_wget[0] ;
  assign MUX_rdCurrPtr_write_1__VAL_1 = rdCurrPtr + 8'd1 ;

  // inlined wires
  assign memBuffer_serverAdapterA_outData_enqData_whas =
	     (!memBuffer_serverAdapterA_s2[0] ||
	      memBuffer_serverAdapterA_outDataCore_FULL_N) &&
	     memBuffer_serverAdapterA_s2[1] &&
	     memBuffer_serverAdapterA_s2[0] ;
  assign memBuffer_serverAdapterA_writeWithResp_whas =
	     WILL_FIRE_RL_commit_packet ||
	     incomingReqs_EMPTY_N &&
	     memBuffer_serverAdapterA_cnt_6_SLT_3___d171 &&
	     !fifoEop_EMPTY_N &&
	     inPacket ||
	     WILL_FIRE_RL_enqueue_first_beat ;
  assign memBuffer_serverAdapterB_outData_enqData_whas =
	     (!memBuffer_serverAdapterB_s2[0] ||
	      memBuffer_serverAdapterB_outDataCore_FULL_N) &&
	     memBuffer_serverAdapterB_s2[1] &&
	     memBuffer_serverAdapterB_s2[0] ;
  assign memBuffer_serverAdapterB_outData_outData_wget =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq ?
	       memBuffer_memory_DOB :
	       memBuffer_serverAdapterB_outDataCore_D_OUT ;
  assign memBuffer_serverAdapterB_outData_outData_whas =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_setFirstEnq ||
	     memBuffer_serverAdapterB_outDataCore_EMPTY_N ;
  assign memBuffer_serverAdapterB_cnt_1_whas =
	     (MUX_memBuffer_memory_b_put_1__SEL_1 ||
	      WILL_FIRE_RL_dequeue_first_beat) &&
	     (!ab__h4227[1] || ab__h4227[0]) ;
  assign memBuffer_serverAdapterB_writeWithResp_whas =
	     MUX_memBuffer_memory_b_put_1__SEL_1 ||
	     WILL_FIRE_RL_dequeue_first_beat ;
  assign memBuffer_serverAdapterB_s1_1_wget =
	     { 1'd1, !ab__h4227[1] || ab__h4227[0] } ;

  // register cf_verbosity
  assign cf_verbosity_D_IN = set_verbosity_verbosity ;
  assign cf_verbosity_EN = EN_set_verbosity ;

  // register eopDeq
  assign eopDeq_D_IN = eopDeq + 64'd1 ;
  assign eopDeq_EN = MUX_outPacket_write_1__SEL_1 ;

  // register eopEnq
  assign eopEnq_D_IN = eopEnq + 64'd1 ;
  assign eopEnq_EN = WILL_FIRE_RL_commit_packet ;

  // register inPacket
  assign inPacket_D_IN = WILL_FIRE_RL_enq_stage1 ;
  assign inPacket_EN = WILL_FIRE_RL_commit_packet || WILL_FIRE_RL_enq_stage1 ;

  // register memBuffer_serverAdapterA_cnt
  assign memBuffer_serverAdapterA_cnt_D_IN =
	     memBuffer_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign memBuffer_serverAdapterA_cnt_EN = 1'b0 ;

  // register memBuffer_serverAdapterA_s1
  assign memBuffer_serverAdapterA_s1_D_IN =
	     { memBuffer_serverAdapterA_writeWithResp_whas, 1'b0 } ;
  assign memBuffer_serverAdapterA_s1_EN = 1'd1 ;

  // register memBuffer_serverAdapterA_s2
  assign memBuffer_serverAdapterA_s2_D_IN = memBuffer_serverAdapterA_s1 ;
  assign memBuffer_serverAdapterA_s2_EN =
	     memBuffer_serverAdapterA_s1[1] ||
	     memBuffer_serverAdapterA_s2[1] ;

  // register memBuffer_serverAdapterB_cnt
  assign memBuffer_serverAdapterB_cnt_D_IN =
	     memBuffer_serverAdapterB_cnt_1_PLUS_IF_memBuff_ETC___d97 ;
  assign memBuffer_serverAdapterB_cnt_EN =
	     memBuffer_serverAdapterB_cnt_1_whas ||
	     WILL_FIRE_RL_dequeue_next_beat ;

  // register memBuffer_serverAdapterB_s1
  assign memBuffer_serverAdapterB_s1_D_IN =
	     { memBuffer_serverAdapterB_writeWithResp_whas &&
	       memBuffer_serverAdapterB_s1_1_wget[1],
	       memBuffer_serverAdapterB_s1_1_wget[0] } ;
  assign memBuffer_serverAdapterB_s1_EN = 1'd1 ;

  // register memBuffer_serverAdapterB_s2
  assign memBuffer_serverAdapterB_s2_D_IN = memBuffer_serverAdapterB_s1 ;
  assign memBuffer_serverAdapterB_s2_EN =
	     memBuffer_serverAdapterB_s1[1] ||
	     memBuffer_serverAdapterB_s2[1] ;

  // register outPacket
  assign outPacket_D_IN = !MUX_outPacket_write_1__SEL_1 ;
  assign outPacket_EN =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_outData_wget[0] ||
	     WILL_FIRE_RL_dequeue_first_beat ;

  // register packetLen
  assign packetLen_D_IN =
	     fifoWriteData_D_OUT[0] ? 16'd0 : newPacketLen__h5199 ;
  assign packetLen_EN = WILL_FIRE_RL_enq_stage1 ;

  // register rdCurrPtr
  assign rdCurrPtr_D_IN =
	     MUX_memBuffer_memory_b_put_1__SEL_1 ?
	       MUX_rdCurrPtr_write_1__VAL_1 :
	       MUX_rdCurrPtr_write_1__VAL_1 ;
  assign rdCurrPtr_EN =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_outData_wget[0] ||
	     WILL_FIRE_RL_dequeue_first_beat ;

  // register sopDeq
  assign sopDeq_D_IN = sopDeq + 64'd1 ;
  assign sopDeq_EN = WILL_FIRE_RL_dequeue_first_beat ;

  // register sopEnq
  assign sopEnq_D_IN = sopEnq + 64'd1 ;
  assign sopEnq_EN = WILL_FIRE_RL_enqueue_first_beat ;

  // register wrCurrPtr
  assign wrCurrPtr_D_IN = wrCurrPtr + 8'd1 ;
  assign wrCurrPtr_EN = WILL_FIRE_RL_enq_stage1 ;

  // submodule fifoEop
  assign fifoEop_D_IN = newPacketLen__h5199 ;
  assign fifoEop_ENQ = WILL_FIRE_RL_enq_stage1 && fifoWriteData_D_OUT[0] ;
  assign fifoEop_DEQ = WILL_FIRE_RL_commit_packet ;
  assign fifoEop_CLR = 1'b0 ;

  // submodule fifoLen
  assign fifoLen_D_IN = fifoEop_D_OUT ;
  assign fifoLen_ENQ = WILL_FIRE_RL_commit_packet ;
  assign fifoLen_DEQ = EN_readServer_readLen_get ;
  assign fifoLen_CLR = 1'b0 ;

  // submodule fifoReadData
  assign fifoReadData_D_IN = memBuffer_serverAdapterB_outData_outData_wget ;
  assign fifoReadData_ENQ = WILL_FIRE_RL_dequeue_next_beat ;
  assign fifoReadData_DEQ = EN_readServer_readData_get ;
  assign fifoReadData_CLR = 1'b0 ;

  // submodule fifoReadReq
  assign fifoReadReq_D_IN = readServer_readReq_put ;
  assign fifoReadReq_ENQ = EN_readServer_readReq_put ;
  assign fifoReadReq_DEQ = WILL_FIRE_RL_dequeue_first_beat ;
  assign fifoReadReq_CLR = 1'b0 ;

  // submodule fifoWriteData
  assign fifoWriteData_D_IN = writeServer_enq_v ;
  assign fifoWriteData_ENQ = EN_writeServer_enq ;
  assign fifoWriteData_DEQ = WILL_FIRE_RL_enq_stage1 ;
  assign fifoWriteData_CLR = 1'b0 ;

  // submodule incomingReqs
  assign incomingReqs_D_IN = { wrCurrPtr, fifoWriteData_D_OUT } ;
  assign incomingReqs_ENQ = WILL_FIRE_RL_enq_stage1 ;
  assign incomingReqs_DEQ = memBuffer_serverAdapterA_writeWithResp_whas ;
  assign incomingReqs_CLR = 1'b0 ;

  // submodule memBuffer_memory
  assign memBuffer_memory_ADDRA = incomingReqs_D_OUT[113:106] ;
  assign memBuffer_memory_ADDRB = rdCurrPtr ;
  assign memBuffer_memory_DIA = incomingReqs_D_OUT[105:0] ;
  assign memBuffer_memory_DIB =
	     MUX_memBuffer_memory_b_put_1__SEL_1 ?
	       106'h2AAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  :
	       106'h2AAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign memBuffer_memory_WEA = 1'd1 ;
  assign memBuffer_memory_WEB = 1'd0 ;
  assign memBuffer_memory_ENA = memBuffer_serverAdapterA_writeWithResp_whas ;
  assign memBuffer_memory_ENB =
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_outData_wget[0] ||
	     WILL_FIRE_RL_dequeue_first_beat ;

  // submodule memBuffer_serverAdapterA_outDataCore
  assign memBuffer_serverAdapterA_outDataCore_D_IN = memBuffer_memory_DOA ;
  assign memBuffer_serverAdapterA_outDataCore_ENQ =
	     memBuffer_serverAdapterA_outDataCore_FULL_N &&
	     memBuffer_serverAdapterA_outData_enqData_whas ;
  assign memBuffer_serverAdapterA_outDataCore_DEQ = 1'b0 ;
  assign memBuffer_serverAdapterA_outDataCore_CLR = 1'b0 ;

  // submodule memBuffer_serverAdapterB_outDataCore
  assign memBuffer_serverAdapterB_outDataCore_D_IN = memBuffer_memory_DOB ;
  assign memBuffer_serverAdapterB_outDataCore_ENQ =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq ||
	     memBuffer_serverAdapterB_outDataCore_FULL_N &&
	     !WILL_FIRE_RL_dequeue_next_beat &&
	     memBuffer_serverAdapterB_outData_enqData_whas ;
  assign memBuffer_serverAdapterB_outDataCore_DEQ =
	     WILL_FIRE_RL_memBuffer_serverAdapterB_outData_enqAndDeq ||
	     memBuffer_serverAdapterB_outDataCore_EMPTY_N &&
	     WILL_FIRE_RL_dequeue_next_beat &&
	     !memBuffer_serverAdapterB_outData_enqData_whas ;
  assign memBuffer_serverAdapterB_outDataCore_CLR = 1'b0 ;

  // remaining internal signals
  assign ab__h4227 = 2'd0 ;
  assign memBuffer_serverAdapterA_cnt_6_SLT_3___d171 =
	     (memBuffer_serverAdapterA_cnt ^ 3'h4) < 3'd7 ;
  assign memBuffer_serverAdapterB_cnt_1_PLUS_IF_memBuff_ETC___d97 =
	     memBuffer_serverAdapterB_cnt +
	     (memBuffer_serverAdapterB_cnt_1_whas ? 3'd1 : 3'd0) +
	     (WILL_FIRE_RL_dequeue_next_beat ? 3'd7 : 3'd0) ;
  assign memBuffer_serverAdapterB_cnt_1_SLT_3___d197 =
	     (memBuffer_serverAdapterB_cnt ^ 3'h4) < 3'd7 ;
  assign newPacketLen__h5199 = packetLen + { 12'd0, x__h5288 } ;
  assign x__h5288 = x__h5303 + y__h5304 ;
  assign x__h5303 = x__h5315 + y__h5316 ;
  assign x__h5315 = x__h5327 + y__h5328 ;
  assign x__h5327 = x__h5339 + y__h5340 ;
  assign x__h5339 = x__h5351 + y__h5352 ;
  assign x__h5351 = x__h5363 + y__h5364 ;
  assign x__h5363 = x__h5375 + y__h5376 ;
  assign x__h5375 = { 3'd0, fifoWriteData_D_OUT[9] } ;
  assign y__h5304 = { 3'd0, fifoWriteData_D_OUT[2] } ;
  assign y__h5316 = { 3'd0, fifoWriteData_D_OUT[3] } ;
  assign y__h5328 = { 3'd0, fifoWriteData_D_OUT[4] } ;
  assign y__h5340 = { 3'd0, fifoWriteData_D_OUT[5] } ;
  assign y__h5352 = { 3'd0, fifoWriteData_D_OUT[6] } ;
  assign y__h5364 = { 3'd0, fifoWriteData_D_OUT[7] } ;
  assign y__h5376 = { 3'd0, fifoWriteData_D_OUT[8] } ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        eopDeq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	eopEnq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	inPacket <= `BSV_ASSIGNMENT_DELAY 1'd0;
	memBuffer_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	memBuffer_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	memBuffer_serverAdapterA_s2 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	memBuffer_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	memBuffer_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	memBuffer_serverAdapterB_s2 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	outPacket <= `BSV_ASSIGNMENT_DELAY 1'd0;
	packetLen <= `BSV_ASSIGNMENT_DELAY 16'd0;
	rdCurrPtr <= `BSV_ASSIGNMENT_DELAY 8'd0;
	sopDeq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	sopEnq <= `BSV_ASSIGNMENT_DELAY 64'd0;
	wrCurrPtr <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (eopDeq_EN) eopDeq <= `BSV_ASSIGNMENT_DELAY eopDeq_D_IN;
	if (eopEnq_EN) eopEnq <= `BSV_ASSIGNMENT_DELAY eopEnq_D_IN;
	if (inPacket_EN) inPacket <= `BSV_ASSIGNMENT_DELAY inPacket_D_IN;
	if (memBuffer_serverAdapterA_cnt_EN)
	  memBuffer_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterA_cnt_D_IN;
	if (memBuffer_serverAdapterA_s1_EN)
	  memBuffer_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterA_s1_D_IN;
	if (memBuffer_serverAdapterA_s2_EN)
	  memBuffer_serverAdapterA_s2 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterA_s2_D_IN;
	if (memBuffer_serverAdapterB_cnt_EN)
	  memBuffer_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterB_cnt_D_IN;
	if (memBuffer_serverAdapterB_s1_EN)
	  memBuffer_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterB_s1_D_IN;
	if (memBuffer_serverAdapterB_s2_EN)
	  memBuffer_serverAdapterB_s2 <= `BSV_ASSIGNMENT_DELAY
	      memBuffer_serverAdapterB_s2_D_IN;
	if (outPacket_EN) outPacket <= `BSV_ASSIGNMENT_DELAY outPacket_D_IN;
	if (packetLen_EN) packetLen <= `BSV_ASSIGNMENT_DELAY packetLen_D_IN;
	if (rdCurrPtr_EN) rdCurrPtr <= `BSV_ASSIGNMENT_DELAY rdCurrPtr_D_IN;
	if (sopDeq_EN) sopDeq <= `BSV_ASSIGNMENT_DELAY sopDeq_D_IN;
	if (sopEnq_EN) sopEnq <= `BSV_ASSIGNMENT_DELAY sopEnq_D_IN;
	if (wrCurrPtr_EN) wrCurrPtr <= `BSV_ASSIGNMENT_DELAY wrCurrPtr_D_IN;
      end
    if (cf_verbosity_EN)
      cf_verbosity <= `BSV_ASSIGNMENT_DELAY cf_verbosity_D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cf_verbosity = 32'hAAAAAAAA;
    eopDeq = 64'hAAAAAAAAAAAAAAAA;
    eopEnq = 64'hAAAAAAAAAAAAAAAA;
    inPacket = 1'h0;
    memBuffer_serverAdapterA_cnt = 3'h2;
    memBuffer_serverAdapterA_s1 = 2'h2;
    memBuffer_serverAdapterA_s2 = 2'h2;
    memBuffer_serverAdapterB_cnt = 3'h2;
    memBuffer_serverAdapterB_s1 = 2'h2;
    memBuffer_serverAdapterB_s2 = 2'h2;
    outPacket = 1'h0;
    packetLen = 16'hAAAA;
    rdCurrPtr = 8'hAA;
    sopDeq = 64'hAAAAAAAAAAAAAAAA;
    sopEnq = 64'hAAAAAAAAAAAAAAAA;
    wrCurrPtr = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (memBuffer_serverAdapterA_s2[1] &&
	  !memBuffer_serverAdapterA_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (memBuffer_serverAdapterB_s2[1] &&
	  !memBuffer_serverAdapterB_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
  end
  // synopsys translate_on
endmodule  // mkPacketBuffer_8

