vlib work
vlib msim

vlib msim/microblaze_v9_5_3
vlib msim/xil_defaultlib
vlib msim/lmb_v10_v3_0_7
vlib msim/lmb_bram_if_cntlr_v4_0_7
vlib msim/blk_mem_gen_v8_3_1
vlib msim/axi_lite_ipif_v3_0_3
vlib msim/mdm_v3_2_4
vlib msim/lib_cdc_v1_0_2
vlib msim/proc_sys_reset_v5_0_8
vlib msim/interrupt_control_v3_1_3
vlib msim/axi_gpio_v2_0_9
vlib msim/generic_baseblocks_v2_1_0
vlib msim/axi_infrastructure_v1_1_0
vlib msim/axi_register_slice_v2_1_7
vlib msim/fifo_generator_v13_0_1
vlib msim/axi_data_fifo_v2_1_6
vlib msim/axi_crossbar_v2_1_8
vlib msim/axi_protocol_converter_v2_1_7

vmap microblaze_v9_5_3 msim/microblaze_v9_5_3
vmap xil_defaultlib msim/xil_defaultlib
vmap lmb_v10_v3_0_7 msim/lmb_v10_v3_0_7
vmap lmb_bram_if_cntlr_v4_0_7 msim/lmb_bram_if_cntlr_v4_0_7
vmap blk_mem_gen_v8_3_1 msim/blk_mem_gen_v8_3_1
vmap axi_lite_ipif_v3_0_3 msim/axi_lite_ipif_v3_0_3
vmap mdm_v3_2_4 msim/mdm_v3_2_4
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_8 msim/proc_sys_reset_v5_0_8
vmap interrupt_control_v3_1_3 msim/interrupt_control_v3_1_3
vmap axi_gpio_v2_0_9 msim/axi_gpio_v2_0_9
vmap generic_baseblocks_v2_1_0 msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_7 msim/axi_register_slice_v2_1_7
vmap fifo_generator_v13_0_1 msim/fifo_generator_v13_0_1
vmap axi_data_fifo_v2_1_6 msim/axi_data_fifo_v2_1_6
vmap axi_crossbar_v2_1_8 msim/axi_crossbar_v2_1_8
vmap axi_protocol_converter_v2_1_7 msim/axi_protocol_converter_v2_1_7

vcom -work microblaze_v9_5_3 -64 -93 \
"../../../ipstatic/microblaze_v9_5/hdl/microblaze_v9_5_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ip/MB_version_microblaze_0_0/sim/MB_version_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_7 -64 -93 \
"../../../ipstatic/lmb_v10_v3_0/hdl/vhdl/lmb_v10.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ip/MB_version_dlmb_v10_0/sim/MB_version_dlmb_v10_0.vhd" \
"../../../bd/MB_version/ip/MB_version_ilmb_v10_0/sim/MB_version_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_7 -64 -93 \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_funcs.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_primitives.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/xor18.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parity.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/parityenable.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/checkbit_handler.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/correct_one_bit.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/pselect.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/pselect_mask.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/axi_interface.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_mux.vhd" \
"../../../ipstatic/lmb_bram_if_cntlr_v4_0/hdl/vhdl/lmb_bram_if_cntlr.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ip/MB_version_dlmb_bram_if_cntlr_0/sim/MB_version_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/MB_version/ip/MB_version_ilmb_bram_if_cntlr_0/sim/MB_version_ilmb_bram_if_cntlr_0.vhd" \

vcom -work blk_mem_gen_v8_3_1 -64 -93 \
"../../../ipstatic/blk_mem_gen_v8_3/simulation/blk_mem_gen_v8_3.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ip/MB_version_lmb_bram_0/sim/MB_version_lmb_bram_0.vhd" \

vcom -work axi_lite_ipif_v3_0_3 -64 -93 \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/ipif_pkg.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/pselect_f.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/address_decoder.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/slave_attachment.vhd" \
"../../../ipstatic/axi_lite_ipif_v3_0/hdl/src/vhdl/axi_lite_ipif.vhd" \

vcom -work mdm_v3_2_4 -64 -93 \
"../../../ipstatic/mdm_v3_2/hdl/vhdl/mdm_primitives.vhd" \
"../../../ipstatic/mdm_v3_2/hdl/vhdl/arbiter.vhd" \
"../../../ipstatic/mdm_v3_2/hdl/vhdl/srl_fifo.vhd" \
"../../../ipstatic/mdm_v3_2/hdl/vhdl/bus_master.vhd" \
"../../../ipstatic/mdm_v3_2/hdl/vhdl/jtag_control.vhd" \
"../../../ipstatic/mdm_v3_2/hdl/vhdl/mdm_core.vhd" \
"../../../ipstatic/mdm_v3_2/hdl/vhdl/mdm.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ip/MB_version_mdm_1_0/sim/MB_version_mdm_1_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../bd/MB_version/ip/MB_version_clk_wiz_1_0/MB_version_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/MB_version/ip/MB_version_clk_wiz_1_0/MB_version_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../ipstatic/lib_cdc_v1_0/hdl/src/vhdl/cdc_sync.vhd" \

vcom -work proc_sys_reset_v5_0_8 -64 -93 \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/upcnt_n.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/sequence_psr.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/lpf.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/proc_sys_reset.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ip/MB_version_rst_clk_wiz_1_100M_0/sim/MB_version_rst_clk_wiz_1_100M_0.vhd" \
"../../../bd/MB_version/hdl/MB_version.vhd" \
"../../../bd/MB_version/ip/MB_version_blk_mem_gen_0_0/sim/MB_version_blk_mem_gen_0_0.vhd" \

vcom -work interrupt_control_v3_1_3 -64 -93 \
"../../../ipstatic/interrupt_control_v3_1/hdl/src/vhdl/interrupt_control.vhd" \

vcom -work axi_gpio_v2_0_9 -64 -93 \
"../../../ipstatic/axi_gpio_v2_0/hdl/src/vhdl/gpio_core.vhd" \
"../../../ipstatic/axi_gpio_v2_0/hdl/src/vhdl/axi_gpio.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ip/MB_version_axi_gpio_0_0/sim/MB_version_axi_gpio_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_and.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_and.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_latch_or.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry_or.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_carry.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_command_fifo.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_mask.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_mask.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_sel.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator_static.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_comparator.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux_enc.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_mux.v" \
"../../../ipstatic/generic_baseblocks_v2_1/hdl/verilog/generic_baseblocks_v2_1_nto1_mux.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axi2vector.v" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_axic_srl_fifo.v" \
"../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog/axi_infrastructure_v1_1_vector2axi.v" \

vlog -work axi_register_slice_v2_1_7 -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axic_register_slice.v" \
"../../../ipstatic/axi_register_slice_v2_1/hdl/verilog/axi_register_slice_v2_1_axi_register_slice.v" \

vcom -work fifo_generator_v13_0_1 -64 -93 \
"../../../ipstatic/fifo_generator_v13_0/simulation/fifo_generator_vhdl_beh.vhd" \
"../../../ipstatic/fifo_generator_v13_0/hdl/fifo_generator_v13_0_rfs.vhd" \

vlog -work axi_data_fifo_v2_1_6 -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_fifo_gen.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_srl_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axic_reg_srl_fifo.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_ndeep_srl.v" \
"../../../ipstatic/axi_data_fifo_v2_1/hdl/verilog/axi_data_fifo_v2_1_axi_data_fifo.v" \

vlog -work axi_crossbar_v2_1_8 -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter_sasd.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_arbiter.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_addr_decoder.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_arbiter_resp.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar_sasd.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_crossbar.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_decerr_slave.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_si_transactor.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_splitter.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_mux.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_wdata_router.v" \
"../../../ipstatic/axi_crossbar_v2_1/hdl/verilog/axi_crossbar_v2_1_axi_crossbar.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../bd/MB_version/ip/MB_version_xbar_0/sim/MB_version_xbar_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MB_version/ipshared/xilinx.com/xlslice_v1_0/xlslice.vhd" \
"../../../bd/MB_version/ip/MB_version_xlslice_0_0/sim/MB_version_xlslice_0_0.vhd" \
"../../../bd/MB_version/ip/MB_version_xlslice_1_0/sim/MB_version_xlslice_1_0.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/xlconstant_v1_1/xlconstant.vhd" \
"../../../bd/MB_version/ip/MB_version_xlconstant_0_0/sim/MB_version_xlconstant_0_0.vhd" \
"../../../bd/MB_version/ip/MB_version_xlconstant_1_0/sim/MB_version_xlconstant_1_0.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/unroll_v1_0/unroll.srcs/sources_1/new/unroll.vhd" \
"../../../bd/MB_version/ip/MB_version_unroll_0_0/sim/MB_version_unroll_0_0.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/impare_v1_0/imparE.srcs/sources_1/new/imparE.vhd" \
"../../../bd/MB_version/ip/MB_version_imparE_0_0/sim/MB_version_imparE_0_0.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/sendimpar_v1_0/sendImpar.srcs/sources_1/new/sendImpar.vhd" \
"../../../bd/MB_version/ip/MB_version_sendImpar_0_0/sim/MB_version_sendImpar_0_0.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/clock_divider_v1_0/clockDivider.vhd" \
"../../../bd/MB_version/ip/MB_version_clock_divider_0_0/sim/MB_version_clock_divider_0_0.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/dc32_v1_0/segment_decoder.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/dc32_v1_0/disp.vhd" \
"../../../bd/MB_version/ip/MB_version_DC32_0_0/sim/MB_version_DC32_0_0.vhd" \
"../../../bd/MB_version/ipshared/xilinx.com/xlconcat_v2_1/xlconcat.vhd" \
"../../../bd/MB_version/ip/MB_version_xlconcat_0_0/sim/MB_version_xlconcat_0_0.vhd" \
"../../../bd/MB_version/ip/MB_version_xlconcat_1_0/sim/MB_version_xlconcat_1_0.vhd" \
"../../../bd/MB_version/ip/MB_version_xlconstant_3_0/sim/MB_version_xlconstant_3_0.vhd" \

vlog -work axi_protocol_converter_v2_1_7 -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_a_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axilite_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_r_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_w_axi3_conv.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b_downsizer.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_decerr_slave.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_simple_fifo.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wrap_cmd.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_incr_cmd.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_wr_cmd_fsm.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_rd_cmd_fsm.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_cmd_translator.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_b_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_r_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_aw_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s_ar_channel.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_b2s.v" \
"../../../ipstatic/axi_protocol_converter_v2_1/hdl/verilog/axi_protocol_converter_v2_1_axi_protocol_converter.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" "+incdir+../../../ipstatic/axi_infrastructure_v1_1/hdl/verilog" \
"../../../bd/MB_version/ip/MB_version_auto_pc_0/sim/MB_version_auto_pc_0.v" \
"../../../bd/MB_version/ip/MB_version_auto_pc_1/sim/MB_version_auto_pc_1.v" \

vlog -work xil_defaultlib "glbl.v"

