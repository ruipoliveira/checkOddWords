
################################################################
# This is a generated script based on design: hardversion
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
# source hardversion_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a100tcsg324-2

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name hardversion

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
  set clk [ create_bd_port -dir I clk ]
  set led [ create_bd_port -dir O -from 15 -to 0 led ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]

  # Create instance: DC32_0, and set properties
  set DC32_0 [ create_bd_cell -type ip -vlnv ua.pt:user:DC32:1.0 DC32_0 ]

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 blk_mem_gen_0 ]
  set_property -dict [ list \
CONFIG.Byte_Size {9} \
CONFIG.Coe_File {../../../../../../../16de16bits.coe} \
CONFIG.Enable_32bit_Address {false} \
CONFIG.Enable_A {Always_Enabled} \
CONFIG.Load_Init_File {true} \
CONFIG.Memory_Type {Single_Port_ROM} \
CONFIG.Port_A_Write_Rate {0} \
CONFIG.Read_Width_A {16} \
CONFIG.Read_Width_B {16} \
CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
CONFIG.Use_Byte_Write_Enable {false} \
CONFIG.Use_RSTA_Pin {false} \
CONFIG.Write_Depth_A {16} \
CONFIG.Write_Width_A {16} \
CONFIG.Write_Width_B {16} \
CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_0

  # Create instance: clock_divider_0, and set properties
  set clock_divider_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:clock_divider:1.0 clock_divider_0 ]

  # Create instance: imparE_0, and set properties
  set imparE_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:imparE:1.0 imparE_0 ]
  set_property -dict [ list \
CONFIG.L {16} \
CONFIG.M {16} \
 ] $imparE_0

  # Create instance: sendImpar_0, and set properties
  set sendImpar_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:sendImpar:1.0 sendImpar_0 ]
  set_property -dict [ list \
CONFIG.L {16} \
CONFIG.M {16} \
 ] $sendImpar_0

  # Create instance: unroll_0, and set properties
  set unroll_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:unroll:1.0 unroll_0 ]
  set_property -dict [ list \
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
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
CONFIG.CONST_WIDTH {12} \
 ] $xlconstant_0

  # Create port connections
  connect_bd_net -net DC32_0_segments [get_bd_ports seg] [get_bd_pins DC32_0/segments]
  connect_bd_net -net DC32_0_select_display [get_bd_ports an] [get_bd_pins DC32_0/select_display]
  connect_bd_net -net blk_mem_gen_0_douta [get_bd_pins blk_mem_gen_0/douta] [get_bd_pins unroll_0/data_in]
  connect_bd_net -net btnC_1 [get_bd_ports btnC] [get_bd_pins clock_divider_0/reset] [get_bd_pins unroll_0/rst]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins DC32_0/clk] [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins clock_divider_0/clk] [get_bd_pins unroll_0/clk]
  connect_bd_net -net clock_divider_0_divided_clk [get_bd_pins clock_divider_0/divided_clk] [get_bd_pins sendImpar_0/clk]
  connect_bd_net -net imparE_0_completed [get_bd_pins imparE_0/completed] [get_bd_pins sendImpar_0/compt]
  connect_bd_net -net imparE_0_count [get_bd_pins imparE_0/count] [get_bd_pins sendImpar_0/nrimpars] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net imparE_0_saida [get_bd_pins imparE_0/saida] [get_bd_pins sendImpar_0/data]
  connect_bd_net -net sendImpar_0_imparData [get_bd_ports led] [get_bd_pins sendImpar_0/imparData] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net unroll_0_addr [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins unroll_0/addr]
  connect_bd_net -net unroll_0_completed [get_bd_pins imparE_0/rest] [get_bd_pins unroll_0/completed]
  connect_bd_net -net unroll_0_data_out [get_bd_pins imparE_0/entrada] [get_bd_pins unroll_0/data_out]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins DC32_0/data_in] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_1/In0] [get_bd_pins xlconstant_0/dout]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port btnC -pg 1 -y 0 -defaultsOSRD
preplace port clk -pg 1 -y 120 -defaultsOSRD
preplace portBus an -pg 1 -y 10 -defaultsOSRD
preplace portBus led -pg 1 -y -130 -defaultsOSRD
preplace portBus seg -pg 1 -y 30 -defaultsOSRD
preplace inst imparE_0 -pg 1 -lvl 3 -y -150 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 4 -y 30 -defaultsOSRD
preplace inst clock_divider_0 -pg 1 -lvl 3 -y 10 -defaultsOSRD
preplace inst DC32_0 -pg 1 -lvl 7 -y 20 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 6 -y 10 -defaultsOSRD
preplace inst xlconcat_1 -pg 1 -lvl 5 -y 30 -defaultsOSRD
preplace inst blk_mem_gen_0 -pg 1 -lvl 1 -y 20 -defaultsOSRD
preplace inst sendImpar_0 -pg 1 -lvl 4 -y -130 -defaultsOSRD
preplace inst unroll_0 -pg 1 -lvl 2 -y -160 -defaultsOSRD
preplace netloc imparE_0_completed 1 3 1 490
preplace netloc btnC_1 1 0 3 NJ -70 NJ -70 NJ
preplace netloc xlconcat_1_dout 1 5 1 970
preplace netloc sendImpar_0_imparData 1 4 4 N -130 970 -130 NJ -130 NJ
preplace netloc imparE_0_saida 1 3 1 500
preplace netloc unroll_0_data_out 1 2 1 N
preplace netloc xlconstant_0_dout 1 4 1 780
preplace netloc xlconcat_0_dout 1 6 1 1170
preplace netloc DC32_0_select_display 1 7 1 N
preplace netloc clk_1 1 0 7 -270 110 NJ -50 NJ -50 NJ -50 NJ -50 NJ -50 NJ
preplace netloc unroll_0_addr 1 0 3 NJ -90 NJ -90 NJ
preplace netloc clock_divider_0_divided_clk 1 3 1 NJ
preplace netloc blk_mem_gen_0_douta 1 0 2 NJ -160 NJ
preplace netloc DC32_0_segments 1 7 1 N
preplace netloc unroll_0_completed 1 2 1 N
preplace netloc imparE_0_count 1 3 2 NJ -210 770
levelinfo -pg 1 -290 -110 140 380 650 880 1080 1320 1490 -top -310 -bot 640
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


