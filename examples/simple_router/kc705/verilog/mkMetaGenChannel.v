//
// Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
//
// On Wed May 31 23:21:36 CST 2017
//
// BVI format method schedule info:
// schedule writeData_enq  CF ( next_first,
// 			     next_deq,
// 			     next_notEmpty,
// 			     start,
// 			     stop );
// schedule writeData_enq  C ( writeData_enq );
//
// schedule writeData_notFull  CF ( writeData_notFull,
// 				 next_first,
// 				 next_deq,
// 				 next_notEmpty,
// 				 start,
// 				 stop );
// schedule writeData_notFull  SB ( writeData_enq );
//
// schedule next_first  CF ( writeData_enq,
// 			  writeData_notFull,
// 			  next_first,
// 			  next_notEmpty,
// 			  start,
// 			  stop );
// schedule next_first  SB ( next_deq );
//
// schedule next_deq  CF ( writeData_enq, writeData_notFull, start, stop );
// schedule next_deq  C ( next_deq );
//
// schedule next_notEmpty  CF ( writeData_enq,
// 			     writeData_notFull,
// 			     next_first,
// 			     next_notEmpty );
// schedule next_notEmpty  SB ( next_deq );
// schedule next_notEmpty  SBR ( start, stop );
//
// schedule start  CF ( writeData_enq,
// 		     writeData_notFull,
// 		     next_first,
// 		     next_deq,
// 		     stop );
// schedule start  C ( start );
//
// schedule stop  CF ( writeData_enq,
// 		    writeData_notFull,
// 		    next_first,
// 		    next_deq,
// 		    start );
// schedule stop  C ( stop );
//
//
// Ports:
// Name                         I/O  size props
// RDY_writeData_enq              O     1 reg
// writeData_notFull              O     1 reg
// RDY_writeData_notFull          O     1 const
// next_first                     O   782 reg
// RDY_next_first                 O     1 reg
// RDY_next_deq                   O     1 reg
// next_notEmpty                  O     1 reg
// RDY_next_notEmpty              O     1 const
// RDY_start                      O     1
// RDY_stop                       O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// writeData_enq_v                I   178 reg
// start_iter                     I    32
// start_ipg                      I    32
// EN_writeData_enq               I     1
// EN_next_deq                    I     1
// EN_start                       I     1
// EN_stop                        I     1
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

module mkMetaGenChannel(CLK,
			RST_N,

			writeData_enq_v,
			EN_writeData_enq,
			RDY_writeData_enq,

			writeData_notFull,
			RDY_writeData_notFull,

			next_first,
			RDY_next_first,

			EN_next_deq,
			RDY_next_deq,

			next_notEmpty,
			RDY_next_notEmpty,

			start_iter,
			start_ipg,
			EN_start,
			RDY_start,

			EN_stop,
			RDY_stop);
  input  CLK;
  input  RST_N;

  // action method writeData_enq
  input  [177 : 0] writeData_enq_v;
  input  EN_writeData_enq;
  output RDY_writeData_enq;

  // value method writeData_notFull
  output writeData_notFull;
  output RDY_writeData_notFull;

  // value method next_first
  output [781 : 0] next_first;
  output RDY_next_first;

  // action method next_deq
  input  EN_next_deq;
  output RDY_next_deq;

  // value method next_notEmpty
  output next_notEmpty;
  output RDY_next_notEmpty;

  // action method start
  input  [31 : 0] start_iter;
  input  [31 : 0] start_ipg;
  input  EN_start;
  output RDY_start;

  // action method stop
  input  EN_stop;
  output RDY_stop;

  // signals for module outputs
  wire [781 : 0] next_first;
  wire RDY_next_deq,
       RDY_next_first,
       RDY_next_notEmpty,
       RDY_start,
       RDY_stop,
       RDY_writeData_enq,
       RDY_writeData_notFull,
       next_notEmpty,
       writeData_notFull;

  // inlined wires
  wire w_send_meta_whas;

  // register cf_verbosity
  reg [31 : 0] cf_verbosity;
  wire [31 : 0] cf_verbosity_D_IN;
  wire cf_verbosity_EN;

  // register freq_cnt
  reg [19 : 0] freq_cnt;
  wire [19 : 0] freq_cnt_D_IN;
  wire freq_cnt_EN;

  // register host_cf_verbosity
  reg [31 : 0] host_cf_verbosity;
  wire [31 : 0] host_cf_verbosity_D_IN;
  wire host_cf_verbosity_EN;

  // register host_readStarted
  reg host_readStarted;
  wire host_readStarted_D_IN, host_readStarted_EN;

  // register rg_gap
  reg [19 : 0] rg_gap;
  wire [19 : 0] rg_gap_D_IN;
  wire rg_gap_EN;

  // register rg_iter
  reg [19 : 0] rg_iter;
  reg [19 : 0] rg_iter_D_IN;
  wire rg_iter_EN;

  // ports of submodule host_outReqFifo
  wire [781 : 0] host_outReqFifo_D_IN, host_outReqFifo_D_OUT;
  wire host_outReqFifo_CLR,
       host_outReqFifo_DEQ,
       host_outReqFifo_EMPTY_N,
       host_outReqFifo_ENQ,
       host_outReqFifo_FULL_N;

  // ports of submodule host_parser
  wire [760 : 0] host_parser_meta_get;
  wire [177 : 0] host_parser_frameIn_put;
  wire [31 : 0] host_parser_set_verbosity_verbosity;
  wire host_parser_EN_frameIn_put,
       host_parser_EN_meta_get,
       host_parser_EN_set_verbosity,
       host_parser_RDY_frameIn_put,
       host_parser_RDY_meta_get;

  // ports of submodule host_pktBuff
  wire [177 : 0] host_pktBuff_readServer_readData_get,
		 host_pktBuff_writeServer_enq_v;
  wire [31 : 0] host_pktBuff_set_verbosity_verbosity;
  wire [15 : 0] host_pktBuff_readServer_readLen_get,
		host_pktBuff_readServer_readReq_put;
  wire host_pktBuff_EN_readServer_readData_get,
       host_pktBuff_EN_readServer_readLen_get,
       host_pktBuff_EN_readServer_readReq_put,
       host_pktBuff_EN_set_verbosity,
       host_pktBuff_EN_writeServer_enq,
       host_pktBuff_RDY_readServer_readData_get,
       host_pktBuff_RDY_readServer_readLen_get,
       host_pktBuff_RDY_readServer_readReq_put,
       host_pktBuff_RDY_writeServer_enq,
       host_pktBuff_writeServer_notFull;

  // ports of submodule host_pktLenFifo
  wire [15 : 0] host_pktLenFifo_D_IN, host_pktLenFifo_D_OUT;
  wire host_pktLenFifo_CLR,
       host_pktLenFifo_DEQ,
       host_pktLenFifo_EMPTY_N,
       host_pktLenFifo_ENQ,
       host_pktLenFifo_FULL_N;

  // ports of submodule host_readDataFifo
  wire [177 : 0] host_readDataFifo_D_IN, host_readDataFifo_D_OUT;
  wire host_readDataFifo_CLR,
       host_readDataFifo_DEQ,
       host_readDataFifo_EMPTY_N,
       host_readDataFifo_ENQ,
       host_readDataFifo_FULL_N;

  // ports of submodule host_readLenFifo
  wire [15 : 0] host_readLenFifo_D_IN, host_readLenFifo_D_OUT;
  wire host_readLenFifo_CLR,
       host_readLenFifo_DEQ,
       host_readLenFifo_EMPTY_N,
       host_readLenFifo_ENQ,
       host_readLenFifo_FULL_N;

  // ports of submodule host_readReqFifo
  wire [15 : 0] host_readReqFifo_D_IN, host_readReqFifo_D_OUT;
  wire host_readReqFifo_CLR,
       host_readReqFifo_DEQ,
       host_readReqFifo_EMPTY_N,
       host_readReqFifo_ENQ,
       host_readReqFifo_FULL_N;

  // ports of submodule host_verbose_ff
  wire [31 : 0] host_verbose_ff_D_IN, host_verbose_ff_D_OUT;
  wire host_verbose_ff_CLR,
       host_verbose_ff_DEQ,
       host_verbose_ff_EMPTY_N,
       host_verbose_ff_ENQ;

  // ports of submodule host_writeDataFifo
  wire [177 : 0] host_writeDataFifo_D_IN;
  wire host_writeDataFifo_CLR,
       host_writeDataFifo_DEQ,
       host_writeDataFifo_EMPTY_N,
       host_writeDataFifo_ENQ,
       host_writeDataFifo_FULL_N;

  // ports of submodule meta_in_ff
  wire [781 : 0] meta_in_ff_D_IN, meta_in_ff_D_OUT;
  wire meta_in_ff_CLR,
       meta_in_ff_DEQ,
       meta_in_ff_EMPTY_N,
       meta_in_ff_ENQ,
       meta_in_ff_FULL_N;

  // ports of submodule meta_out_ff
  wire [781 : 0] meta_out_ff_D_IN, meta_out_ff_D_OUT;
  wire meta_out_ff_CLR,
       meta_out_ff_DEQ,
       meta_out_ff_EMPTY_N,
       meta_out_ff_ENQ,
       meta_out_ff_FULL_N;

  // ports of submodule pktgen_running
  wire pktgen_running_CLR,
       pktgen_running_DEQ,
       pktgen_running_D_IN,
       pktgen_running_EMPTY_N,
       pktgen_running_ENQ,
       pktgen_running_FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_host_packetReadInProgress,
       WILL_FIRE_RL_rl_freq_ctrl,
       WILL_FIRE_RL_rl_send_metadata;

  // inputs to muxes for submodule ports
  wire [19 : 0] MUX_freq_cnt_write_1__VAL_2, MUX_rg_iter_write_1__VAL_3;
  wire MUX_host_readStarted_write_1__SEL_1,
       MUX_host_readStarted_write_1__SEL_2;

  // remaining internal signals
  reg [63 : 0] v__h10105, v__h7989, v__h9975;
  wire [19 : 0] x__h6126;
  wire freq_cnt_30_ULT_rg_gap_31___d232;

  // action method writeData_enq
  assign RDY_writeData_enq = host_pktBuff_RDY_writeServer_enq ;

  // value method writeData_notFull
  assign writeData_notFull = host_pktBuff_writeServer_notFull ;
  assign RDY_writeData_notFull = 1'd1 ;

  // value method next_first
  assign next_first = meta_out_ff_D_OUT ;
  assign RDY_next_first = meta_out_ff_EMPTY_N ;

  // action method next_deq
  assign RDY_next_deq = meta_out_ff_EMPTY_N ;

  // value method next_notEmpty
  assign next_notEmpty = meta_out_ff_EMPTY_N ;
  assign RDY_next_notEmpty = 1'd1 ;

  // action method start
  assign RDY_start = !pktgen_running_EMPTY_N && pktgen_running_FULL_N ;

  // action method stop
  assign RDY_stop = pktgen_running_EMPTY_N ;

  // submodule host_outReqFifo
  FIFO2 #(.width(32'd782), .guarded(32'd1)) host_outReqFifo(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(host_outReqFifo_D_IN),
							    .ENQ(host_outReqFifo_ENQ),
							    .DEQ(host_outReqFifo_DEQ),
							    .CLR(host_outReqFifo_CLR),
							    .D_OUT(host_outReqFifo_D_OUT),
							    .FULL_N(host_outReqFifo_FULL_N),
							    .EMPTY_N(host_outReqFifo_EMPTY_N));

  // submodule host_parser
  mkParser host_parser(.CLK(CLK),
		       .RST_N(RST_N),
		       .frameIn_put(host_parser_frameIn_put),
		       .set_verbosity_verbosity(host_parser_set_verbosity_verbosity),
		       .EN_frameIn_put(host_parser_EN_frameIn_put),
		       .EN_meta_get(host_parser_EN_meta_get),
		       .EN_set_verbosity(host_parser_EN_set_verbosity),
		       .RDY_frameIn_put(host_parser_RDY_frameIn_put),
		       .meta_get(host_parser_meta_get),
		       .RDY_meta_get(host_parser_RDY_meta_get),
		       .RDY_set_verbosity(),
		       .read_perf_info(),
		       .RDY_read_perf_info());

  // submodule host_pktBuff
  mkPacketBuffer_16 #(.param1("streamIn channel")) host_pktBuff(.CLK(CLK),
								.RST_N(RST_N),
								.readServer_readReq_put(host_pktBuff_readServer_readReq_put),
								.set_verbosity_verbosity(host_pktBuff_set_verbosity_verbosity),
								.writeServer_enq_v(host_pktBuff_writeServer_enq_v),
								.EN_writeServer_enq(host_pktBuff_EN_writeServer_enq),
								.EN_readServer_readData_get(host_pktBuff_EN_readServer_readData_get),
								.EN_readServer_readLen_get(host_pktBuff_EN_readServer_readLen_get),
								.EN_readServer_readReq_put(host_pktBuff_EN_readServer_readReq_put),
								.EN_set_verbosity(host_pktBuff_EN_set_verbosity),
								.RDY_writeServer_enq(host_pktBuff_RDY_writeServer_enq),
								.writeServer_notFull(host_pktBuff_writeServer_notFull),
								.RDY_writeServer_notFull(),
								.readServer_readData_get(host_pktBuff_readServer_readData_get),
								.RDY_readServer_readData_get(host_pktBuff_RDY_readServer_readData_get),
								.readServer_readLen_get(host_pktBuff_readServer_readLen_get),
								.RDY_readServer_readLen_get(host_pktBuff_RDY_readServer_readLen_get),
								.RDY_readServer_readReq_put(host_pktBuff_RDY_readServer_readReq_put),
								.dbg(),
								.RDY_dbg(),
								.RDY_set_verbosity());

  // submodule host_pktLenFifo
  FIFO2 #(.width(32'd16), .guarded(32'd1)) host_pktLenFifo(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(host_pktLenFifo_D_IN),
							   .ENQ(host_pktLenFifo_ENQ),
							   .DEQ(host_pktLenFifo_DEQ),
							   .CLR(host_pktLenFifo_CLR),
							   .D_OUT(host_pktLenFifo_D_OUT),
							   .FULL_N(host_pktLenFifo_FULL_N),
							   .EMPTY_N(host_pktLenFifo_EMPTY_N));

  // submodule host_readDataFifo
  FIFO2 #(.width(32'd178), .guarded(32'd1)) host_readDataFifo(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(host_readDataFifo_D_IN),
							      .ENQ(host_readDataFifo_ENQ),
							      .DEQ(host_readDataFifo_DEQ),
							      .CLR(host_readDataFifo_CLR),
							      .D_OUT(host_readDataFifo_D_OUT),
							      .FULL_N(host_readDataFifo_FULL_N),
							      .EMPTY_N(host_readDataFifo_EMPTY_N));

  // submodule host_readLenFifo
  FIFO2 #(.width(32'd16), .guarded(32'd1)) host_readLenFifo(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(host_readLenFifo_D_IN),
							    .ENQ(host_readLenFifo_ENQ),
							    .DEQ(host_readLenFifo_DEQ),
							    .CLR(host_readLenFifo_CLR),
							    .D_OUT(host_readLenFifo_D_OUT),
							    .FULL_N(host_readLenFifo_FULL_N),
							    .EMPTY_N(host_readLenFifo_EMPTY_N));

  // submodule host_readReqFifo
  FIFO2 #(.width(32'd16), .guarded(32'd1)) host_readReqFifo(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(host_readReqFifo_D_IN),
							    .ENQ(host_readReqFifo_ENQ),
							    .DEQ(host_readReqFifo_DEQ),
							    .CLR(host_readReqFifo_CLR),
							    .D_OUT(host_readReqFifo_D_OUT),
							    .FULL_N(host_readReqFifo_FULL_N),
							    .EMPTY_N(host_readReqFifo_EMPTY_N));

  // submodule host_verbose_ff
  FIFO2 #(.width(32'd32), .guarded(32'd1)) host_verbose_ff(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(host_verbose_ff_D_IN),
							   .ENQ(host_verbose_ff_ENQ),
							   .DEQ(host_verbose_ff_DEQ),
							   .CLR(host_verbose_ff_CLR),
							   .D_OUT(host_verbose_ff_D_OUT),
							   .FULL_N(),
							   .EMPTY_N(host_verbose_ff_EMPTY_N));

  // submodule host_writeDataFifo
  FIFO2 #(.width(32'd178), .guarded(32'd1)) host_writeDataFifo(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(host_writeDataFifo_D_IN),
							       .ENQ(host_writeDataFifo_ENQ),
							       .DEQ(host_writeDataFifo_DEQ),
							       .CLR(host_writeDataFifo_CLR),
							       .D_OUT(),
							       .FULL_N(host_writeDataFifo_FULL_N),
							       .EMPTY_N(host_writeDataFifo_EMPTY_N));

  // submodule meta_in_ff
  FIFO2 #(.width(32'd782), .guarded(32'd1)) meta_in_ff(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(meta_in_ff_D_IN),
						       .ENQ(meta_in_ff_ENQ),
						       .DEQ(meta_in_ff_DEQ),
						       .CLR(meta_in_ff_CLR),
						       .D_OUT(meta_in_ff_D_OUT),
						       .FULL_N(meta_in_ff_FULL_N),
						       .EMPTY_N(meta_in_ff_EMPTY_N));

  // submodule meta_out_ff
  FIFO2 #(.width(32'd782), .guarded(32'd1)) meta_out_ff(.RST(RST_N),
							.CLK(CLK),
							.D_IN(meta_out_ff_D_IN),
							.ENQ(meta_out_ff_ENQ),
							.DEQ(meta_out_ff_DEQ),
							.CLR(meta_out_ff_CLR),
							.D_OUT(meta_out_ff_D_OUT),
							.FULL_N(meta_out_ff_FULL_N),
							.EMPTY_N(meta_out_ff_EMPTY_N));

  // submodule pktgen_running
  FIFO2 #(.width(32'd1), .guarded(32'd1)) pktgen_running(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(pktgen_running_D_IN),
							 .ENQ(pktgen_running_ENQ),
							 .DEQ(pktgen_running_DEQ),
							 .CLR(pktgen_running_CLR),
							 .D_OUT(),
							 .FULL_N(pktgen_running_FULL_N),
							 .EMPTY_N(pktgen_running_EMPTY_N));

  // rule RL_rl_freq_ctrl
  assign WILL_FIRE_RL_rl_freq_ctrl =
	     meta_in_ff_EMPTY_N && pktgen_running_EMPTY_N ;

  // rule RL_rl_send_metadata
  assign WILL_FIRE_RL_rl_send_metadata =
	     meta_out_ff_FULL_N && meta_in_ff_EMPTY_N && w_send_meta_whas ;

  // rule RL_host_packetReadInProgress
  assign WILL_FIRE_RL_host_packetReadInProgress =
	     host_parser_RDY_frameIn_put && host_readDataFifo_EMPTY_N &&
	     host_writeDataFifo_FULL_N &&
	     host_readStarted ;

  // inputs to muxes for submodule ports
  assign MUX_host_readStarted_write_1__SEL_1 =
	     WILL_FIRE_RL_host_packetReadInProgress &&
	     host_readDataFifo_D_OUT[0] ;
  assign MUX_host_readStarted_write_1__SEL_2 =
	     host_readLenFifo_EMPTY_N && host_pktLenFifo_FULL_N &&
	     host_readReqFifo_FULL_N &&
	     !host_readStarted ;
  assign MUX_freq_cnt_write_1__VAL_2 =
	     freq_cnt_30_ULT_rg_gap_31___d232 ? x__h6126 : 20'd0 ;
  assign MUX_rg_iter_write_1__VAL_3 = rg_iter - 20'd1 ;

  // inlined wires
  assign w_send_meta_whas =
	     WILL_FIRE_RL_rl_freq_ctrl && !freq_cnt_30_ULT_rg_gap_31___d232 ;

  // register cf_verbosity
  assign cf_verbosity_D_IN = 32'h0 ;
  assign cf_verbosity_EN = 1'b0 ;

  // register freq_cnt
  assign freq_cnt_D_IN = EN_stop ? 20'd0 : MUX_freq_cnt_write_1__VAL_2 ;
  assign freq_cnt_EN = WILL_FIRE_RL_rl_freq_ctrl || EN_stop ;

  // register host_cf_verbosity
  assign host_cf_verbosity_D_IN = 32'h0 ;
  assign host_cf_verbosity_EN = 1'b0 ;

  // register host_readStarted
  assign host_readStarted_D_IN = !MUX_host_readStarted_write_1__SEL_1 ;
  assign host_readStarted_EN =
	     WILL_FIRE_RL_host_packetReadInProgress &&
	     host_readDataFifo_D_OUT[0] ||
	     host_readLenFifo_EMPTY_N && host_pktLenFifo_FULL_N &&
	     host_readReqFifo_FULL_N &&
	     !host_readStarted ;

  // register rg_gap
  assign rg_gap_D_IN = EN_start ? start_ipg[19:0] : 20'd0 ;
  assign rg_gap_EN = EN_start || EN_stop ;

  // register rg_iter
  always@(EN_stop or
	  EN_start or
	  start_iter or
	  WILL_FIRE_RL_rl_send_metadata or MUX_rg_iter_write_1__VAL_3)
  case (1'b1)
    EN_stop: rg_iter_D_IN = 20'd0;
    EN_start: rg_iter_D_IN = start_iter[19:0];
    WILL_FIRE_RL_rl_send_metadata: rg_iter_D_IN = MUX_rg_iter_write_1__VAL_3;
    default: rg_iter_D_IN = 20'b10101010101010101010 /* unspecified value */ ;
  endcase
  assign rg_iter_EN = WILL_FIRE_RL_rl_send_metadata || EN_start || EN_stop ;

  // submodule host_outReqFifo
  assign host_outReqFifo_D_IN =
	     { 5'd0,
	       host_pktLenFifo_D_OUT,
	       host_parser_meta_get[760:372],
	       10'd767,
	       host_parser_meta_get[361:0] } ;
  assign host_outReqFifo_ENQ =
	     host_parser_RDY_meta_get && host_pktLenFifo_EMPTY_N &&
	     host_outReqFifo_FULL_N ;
  assign host_outReqFifo_DEQ = host_outReqFifo_EMPTY_N && meta_in_ff_FULL_N ;
  assign host_outReqFifo_CLR = 1'b0 ;

  // submodule host_parser
  assign host_parser_frameIn_put = host_readDataFifo_D_OUT ;
  assign host_parser_set_verbosity_verbosity = host_verbose_ff_D_OUT ;
  assign host_parser_EN_frameIn_put = WILL_FIRE_RL_host_packetReadInProgress ;
  assign host_parser_EN_meta_get =
	     host_parser_RDY_meta_get && host_pktLenFifo_EMPTY_N &&
	     host_outReqFifo_FULL_N ;
  assign host_parser_EN_set_verbosity = host_verbose_ff_EMPTY_N ;

  // submodule host_pktBuff
  assign host_pktBuff_readServer_readReq_put = host_readReqFifo_D_OUT ;
  assign host_pktBuff_set_verbosity_verbosity = host_verbose_ff_D_OUT ;
  assign host_pktBuff_writeServer_enq_v = writeData_enq_v ;
  assign host_pktBuff_EN_writeServer_enq = EN_writeData_enq ;
  assign host_pktBuff_EN_readServer_readData_get =
	     host_pktBuff_RDY_readServer_readData_get &&
	     host_readDataFifo_FULL_N ;
  assign host_pktBuff_EN_readServer_readLen_get =
	     host_pktBuff_RDY_readServer_readLen_get &&
	     host_readLenFifo_FULL_N ;
  assign host_pktBuff_EN_readServer_readReq_put =
	     host_pktBuff_RDY_readServer_readReq_put &&
	     host_readReqFifo_EMPTY_N ;
  assign host_pktBuff_EN_set_verbosity = host_verbose_ff_EMPTY_N ;

  // submodule host_pktLenFifo
  assign host_pktLenFifo_D_IN = host_readLenFifo_D_OUT ;
  assign host_pktLenFifo_ENQ = MUX_host_readStarted_write_1__SEL_2 ;
  assign host_pktLenFifo_DEQ =
	     host_parser_RDY_meta_get && host_pktLenFifo_EMPTY_N &&
	     host_outReqFifo_FULL_N ;
  assign host_pktLenFifo_CLR = 1'b0 ;

  // submodule host_readDataFifo
  assign host_readDataFifo_D_IN = host_pktBuff_readServer_readData_get ;
  assign host_readDataFifo_ENQ =
	     host_pktBuff_RDY_readServer_readData_get &&
	     host_readDataFifo_FULL_N ;
  assign host_readDataFifo_DEQ = WILL_FIRE_RL_host_packetReadInProgress ;
  assign host_readDataFifo_CLR = 1'b0 ;

  // submodule host_readLenFifo
  assign host_readLenFifo_D_IN = host_pktBuff_readServer_readLen_get ;
  assign host_readLenFifo_ENQ =
	     host_pktBuff_RDY_readServer_readLen_get &&
	     host_readLenFifo_FULL_N ;
  assign host_readLenFifo_DEQ = MUX_host_readStarted_write_1__SEL_2 ;
  assign host_readLenFifo_CLR = 1'b0 ;

  // submodule host_readReqFifo
  assign host_readReqFifo_D_IN = host_readLenFifo_D_OUT ;
  assign host_readReqFifo_ENQ = MUX_host_readStarted_write_1__SEL_2 ;
  assign host_readReqFifo_DEQ =
	     host_pktBuff_RDY_readServer_readReq_put &&
	     host_readReqFifo_EMPTY_N ;
  assign host_readReqFifo_CLR = 1'b0 ;

  // submodule host_verbose_ff
  assign host_verbose_ff_D_IN = 32'h0 ;
  assign host_verbose_ff_ENQ = 1'b0 ;
  assign host_verbose_ff_DEQ = host_verbose_ff_EMPTY_N ;
  assign host_verbose_ff_CLR = 1'b0 ;

  // submodule host_writeDataFifo
  assign host_writeDataFifo_D_IN = host_readDataFifo_D_OUT ;
  assign host_writeDataFifo_ENQ = WILL_FIRE_RL_host_packetReadInProgress ;
  assign host_writeDataFifo_DEQ = host_writeDataFifo_EMPTY_N ;
  assign host_writeDataFifo_CLR = 1'b0 ;

  // submodule meta_in_ff
  assign meta_in_ff_D_IN = host_outReqFifo_D_OUT ;
  assign meta_in_ff_ENQ = host_outReqFifo_EMPTY_N && meta_in_ff_FULL_N ;
  assign meta_in_ff_DEQ = WILL_FIRE_RL_rl_send_metadata && rg_iter == 20'd0 ;
  assign meta_in_ff_CLR = 1'b0 ;

  // submodule meta_out_ff
  assign meta_out_ff_D_IN =
	     { meta_in_ff_D_OUT[781:372], 10'd512, meta_in_ff_D_OUT[361:0] } ;
  assign meta_out_ff_ENQ = WILL_FIRE_RL_rl_send_metadata ;
  assign meta_out_ff_DEQ = EN_next_deq ;
  assign meta_out_ff_CLR = 1'b0 ;

  // submodule pktgen_running
  assign pktgen_running_D_IN = 1'd1 ;
  assign pktgen_running_ENQ = EN_start ;
  assign pktgen_running_DEQ = EN_stop ;
  assign pktgen_running_CLR = 1'b0 ;

  // remaining internal signals
  assign freq_cnt_30_ULT_rg_gap_31___d232 = freq_cnt < rg_gap ;
  assign x__h6126 = freq_cnt + 20'd1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        freq_cnt <= `BSV_ASSIGNMENT_DELAY 20'd0;
	host_readStarted <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_gap <= `BSV_ASSIGNMENT_DELAY 20'd1;
	rg_iter <= `BSV_ASSIGNMENT_DELAY 20'd0;
      end
    else
      begin
        if (freq_cnt_EN) freq_cnt <= `BSV_ASSIGNMENT_DELAY freq_cnt_D_IN;
	if (host_readStarted_EN)
	  host_readStarted <= `BSV_ASSIGNMENT_DELAY host_readStarted_D_IN;
	if (rg_gap_EN) rg_gap <= `BSV_ASSIGNMENT_DELAY rg_gap_D_IN;
	if (rg_iter_EN) rg_iter <= `BSV_ASSIGNMENT_DELAY rg_iter_D_IN;
      end
    if (cf_verbosity_EN)
      cf_verbosity <= `BSV_ASSIGNMENT_DELAY cf_verbosity_D_IN;
    if (host_cf_verbosity_EN)
      host_cf_verbosity <= `BSV_ASSIGNMENT_DELAY host_cf_verbosity_D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cf_verbosity = 32'hAAAAAAAA;
    freq_cnt = 20'hAAAAA;
    host_cf_verbosity = 32'hAAAAAAAA;
    host_readStarted = 1'h0;
    rg_gap = 20'hAAAAA;
    rg_iter = 20'hAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_send_metadata)
	begin
	  v__h7989 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_send_metadata)
	$display("(%0d) enqueue iter=%d", v__h7989, rg_iter);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_start)
	begin
	  v__h9975 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_start)
	$display("(%0d) metagen start %d gap %d",
		 v__h9975,
		 start_iter,
		 start_ipg);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_stop)
	begin
	  v__h10105 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_stop) $display("(%0d) metagen stop", v__h10105);
  end
  // synopsys translate_on
endmodule  // mkMetaGenChannel

