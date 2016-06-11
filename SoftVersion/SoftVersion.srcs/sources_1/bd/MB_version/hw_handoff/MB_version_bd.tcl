
################################################################
# This is a generated script based on design: MB_version
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source MB_version_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a100tcsg324-2

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name MB_version

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set an [ create_bd_port -dir O -from 7 -to 0 an ]
  set btnC [ create_bd_port -dir I btnC ]
  set btnCpuReset [ create_bd_port -dir I btnCpuReset ]
  set clk [ create_bd_port -dir I clk ]
  set led [ create_bd_port -dir O -from 15 -to 0 led ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]
  set sw [ create_bd_port -dir I -from 3 -to 0 sw ]

  # Create instance: DC32_0, and set properties
  set DC32_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:DC32:1.0 DC32_0 ]

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {0} \
CONFIG.C_ALL_INPUTS_2 {1} \
CONFIG.C_ALL_OUTPUTS {1} \
CONFIG.C_GPIO2_WIDTH {16} \
CONFIG.C_GPIO_WIDTH {20} \
CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio_0

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_0 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_A {Always_Enabled} \
CONFIG.Enable_B {Always_Enabled} \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.Port_B_Clock {100} \
CONFIG.Port_B_Enable_Rate {100} \
CONFIG.Port_B_Write_Rate {50} \
CONFIG.Read_Width_A {16} \
CONFIG.Read_Width_B {16} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {16} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_0

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
 ] $clk_wiz_1

  # Create instance: clock_divider_0, and set properties
  set clock_divider_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:clock_divider:1.0 clock_divider_0 ]

  # Create instance: imparE_0, and set properties
  set imparE_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:imparE:1.0 imparE_0 ]
  set_property -dict [ list \
CONFIG.L {16} \
CONFIG.M {16} \
 ] $imparE_0

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]
  set_property -dict [ list \
CONFIG.C_USE_UART {1} \
 ] $mdm_1

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_CACHE_BYTE_SIZE {8192} \
CONFIG.C_DCACHE_BYTE_SIZE {8192} \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_I_LMB {1} \
CONFIG.C_USE_DCACHE {1} \
CONFIG.C_USE_ICACHE {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {2} \
CONFIG.NUM_SI {3} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create instance: sendImpar_0, and set properties
  set sendImpar_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:sendImpar:1.0 sendImpar_0 ]
  set_property -dict [ list \
CONFIG.L {16} \
CONFIG.M {16} \
 ] $sendImpar_0

  # Create instance: unroll_0, and set properties
  set unroll_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:unroll:1.0 unroll_0 ]
  set_property -dict [ list \
CONFIG.address_bits {4} \
CONFIG.data_width {16} \
 ] $unroll_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {16} \
CONFIG.IN1_WIDTH {16} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
CONFIG.IN0_WIDTH {12} \
CONFIG.IN1_WIDTH {4} \
 ] $xlconcat_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create instance: xlconstant_3, and set properties
  set xlconstant_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {12} \
 ] $xlconstant_3

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {3} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {20} \
CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {19} \
CONFIG.DIN_TO {4} \
CONFIG.DIN_WIDTH {20} \
CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_1

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins microblaze_0/M_AXI_DC] [get_bd_intf_pins microblaze_0_axi_periph/S01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins microblaze_0/M_AXI_IC] [get_bd_intf_pins microblaze_0_axi_periph/S02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_mdm_axi [get_bd_intf_pins mdm_1/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]

  # Create port connections
  connect_bd_net -net DC32_0_segments [get_bd_ports seg] [get_bd_pins DC32_0/segments]
  connect_bd_net -net DC32_0_select_display [get_bd_ports an] [get_bd_pins DC32_0/select_display]
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins blk_mem_gen_0/doutb] [get_bd_pins unroll_0/data_in]
  connect_bd_net -net btnC_1 [get_bd_ports btnC] [get_bd_pins clock_divider_0/reset] [get_bd_pins unroll_0/rst]
  connect_bd_net -net btnCpuReset_1 [get_bd_ports btnCpuReset] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins clk_wiz_1/clk_in1]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net clock_divider_0_divided_clk [get_bd_pins clock_divider_0/divided_clk] [get_bd_pins sendImpar_0/clk]
  connect_bd_net -net imparE_0_completed [get_bd_pins imparE_0/completed] [get_bd_pins sendImpar_0/compt]
  connect_bd_net -net imparE_0_count [get_bd_pins imparE_0/count] [get_bd_pins sendImpar_0/nrimpars] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net imparE_0_saida [get_bd_pins imparE_0/saida] [get_bd_pins sendImpar_0/data]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins DC32_0/clk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins blk_mem_gen_0/clkb] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins clock_divider_0/clk] [get_bd_pins mdm_1/S_AXI_ACLK] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_axi_periph/S01_ACLK] [get_bd_pins microblaze_0_axi_periph/S02_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk] [get_bd_pins unroll_0/clk]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins mdm_1/S_AXI_ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins microblaze_0_axi_periph/S01_ARESETN] [get_bd_pins microblaze_0_axi_periph/S02_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net sendImpar_0_imparData [get_bd_ports led] [get_bd_pins axi_gpio_0/gpio2_io_i] [get_bd_pins sendImpar_0/imparData] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net unroll_0_addr [get_bd_pins blk_mem_gen_0/addrb] [get_bd_pins unroll_0/addr]
  connect_bd_net -net unroll_0_completed [get_bd_pins imparE_0/rest] [get_bd_pins unroll_0/completed]
  connect_bd_net -net unroll_0_data_out [get_bd_pins imparE_0/entrada] [get_bd_pins unroll_0/data_out]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins DC32_0/data_in] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins blk_mem_gen_0/wea] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins blk_mem_gen_0/web] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_pins xlconcat_1/In0] [get_bd_pins xlconstant_3/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins blk_mem_gen_0/dina] [get_bd_pins xlslice_1/Dout]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x4000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x4000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x1000 -offset 0x41400000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mdm_1/S_AXI/Reg] SEG_mdm_1_Reg
  create_bd_addr_seg -range 0x1000 -offset 0x41400000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs mdm_1/S_AXI/Reg] SEG_mdm_1_Reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port btnC -pg 1 -y 450 -defaultsOSRD
preplace port btnCpuReset -pg 1 -y 90 -defaultsOSRD
preplace port clk -pg 1 -y 170 -defaultsOSRD
preplace portBus sw -pg 1 -y 380 -defaultsOSRD
preplace portBus an -pg 1 -y 690 -defaultsOSRD
preplace portBus led -pg 1 -y 460 -defaultsOSRD
preplace portBus seg -pg 1 -y 740 -defaultsOSRD
preplace inst imparE_0 -pg 1 -lvl 3 -y 480 -defaultsOSRD
preplace inst xlslice_0 -pg 1 -lvl 2 -y 10 -defaultsOSRD
preplace inst clock_divider_0 -pg 1 -lvl 3 -y 640 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 1 -y 340 -defaultsOSRD
preplace inst xlslice_1 -pg 1 -lvl 2 -y -70 -defaultsOSRD
preplace inst xlconstant_1 -pg 1 -lvl 1 -y 460 -defaultsOSRD
preplace inst xlconstant_2 -pg 1 -lvl 1 -y -460 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 8 -y 190 -defaultsOSRD
preplace inst xlconstant_3 -pg 1 -lvl 3 -y 740 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 5 -y 650 -defaultsOSRD
preplace inst DC32_0 -pg 1 -lvl 6 -y 630 -defaultsOSRD
preplace inst axi_gpio_0 -pg 1 -lvl 2 -y -240 -defaultsOSRD
preplace inst xlconcat_1 -pg 1 -lvl 4 -y 730 -defaultsOSRD
preplace inst blk_mem_gen_0 -pg 1 -lvl 2 -y 390 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 5 -y -10 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 3 -y -20 -defaultsOSRD
preplace inst sendImpar_0 -pg 1 -lvl 4 -y 540 -defaultsOSRD
preplace inst rst_clk_wiz_1_100M -pg 1 -lvl 7 -y 150 -defaultsOSRD
preplace inst clk_wiz_1 -pg 1 -lvl 3 -y 270 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 8 -y -170 -defaultsOSRD
preplace inst unroll_0 -pg 1 -lvl 2 -y 610 -defaultsOSRD
preplace netloc xlconstant_1_dout 1 1 1 150
preplace netloc microblaze_0_mdm_axi 1 4 5 NJ 400 NJ 400 NJ 400 NJ 400 2530
preplace netloc xlconstant_2_dout 1 1 2 NJ -460 510
preplace netloc xlslice_1_Dout 1 1 2 190 70 480
preplace netloc imparE_0_completed 1 3 1 960
preplace netloc btnCpuReset_1 1 0 7 NJ 90 NJ 90 NJ 90 NJ 90 NJ 90 N 90 1830
preplace netloc btnC_1 1 0 3 NJ 410 160 680 NJ
preplace netloc microblaze_0_Clk 1 1 7 170 60 500 110 950 110 1230 110 1540 110 1820 40 2210
preplace netloc xlconcat_1_dout 1 4 1 1240
preplace netloc sendImpar_0_imparData 1 4 5 NJ 460 NJ 460 NJ 460 NJ 460 N
preplace netloc microblaze_0_M_AXI_DC 1 3 5 NJ 0 NJ 60 NJ 60 N 60 2190
preplace netloc microblaze_0_ilmb_1 1 3 5 970 -180 NJ -180 NJ -180 NJ -180 NJ
preplace netloc microblaze_0_axi_dp 1 3 5 NJ -80 NJ -80 NJ -80 N -80 2220
preplace netloc imparE_0_saida 1 3 1 950
preplace netloc unroll_0_data_out 1 2 1 480
preplace netloc DC32_0_select_display 1 6 3 N 620 NJ 620 NJ
preplace netloc xlconcat_0_dout 1 5 1 1550
preplace netloc xlconstant_0_dout 1 1 1 160
preplace netloc axi_gpio_0_gpio_io_o 1 1 2 210 -160 480
preplace netloc clk_1 1 0 3 NJ 170 NJ 170 480
preplace netloc rst_clk_wiz_1_100M_interconnect_aresetn 1 7 1 2170
preplace netloc rst_clk_wiz_1_100M_bus_struct_reset 1 7 1 2160
preplace netloc microblaze_0_axi_periph_M01_AXI 1 1 8 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 NJ 240 NJ 390 2520
preplace netloc microblaze_0_M_AXI_IC 1 3 5 NJ 20 NJ 70 NJ 10 N 10 2200
preplace netloc unroll_0_addr 1 1 2 200 230 470
preplace netloc rst_clk_wiz_1_100M_peripheral_aresetn 1 1 7 NJ 100 NJ 100 NJ 100 NJ 100 NJ 30 N 30 2180
preplace netloc rst_clk_wiz_1_100M_mb_reset 1 2 6 NJ 70 NJ 70 NJ 80 NJ 50 N 50 2170
preplace netloc clk_wiz_1_locked 1 3 4 NJ 190 NJ 190 NJ 190 NJ
preplace netloc clock_divider_0_divided_clk 1 3 1 980
preplace netloc microblaze_0_dlmb_1 1 3 5 950 -200 NJ -200 NJ -200 NJ -200 NJ
preplace netloc DC32_0_segments 1 6 3 NJ 640 NJ 640 2520
preplace netloc blk_mem_gen_0_doutb 1 1 1 210
preplace netloc microblaze_0_debug 1 2 4 NJ -110 NJ -110 NJ -110 NJ
preplace netloc unroll_0_completed 1 2 1 490
preplace netloc mdm_1_debug_sys_rst 1 5 2 1530 20 1840
preplace netloc xlconstant_3_dout 1 3 1 950
preplace netloc imparE_0_count 1 3 1 970
preplace netloc xlslice_0_Dout 1 1 2 210 80 470
levelinfo -pg 1 -50 80 340 730 1100 1400 1690 2000 2370 2560 -top -500 -bot 790
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


