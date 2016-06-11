# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.cache/wt [current_project]
set_property parent.project_path D:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths {
  d:/ECT-UA/CR/tarefa19_1/clockDivider
  d:/ECT-UA/CR/tarefa19_1/sendImpar
  {c:/Users/Rui Oliveira/Dropbox/testePraticoCR/REPOSITORY/DisplayControl32inputs}
  d:/ECT-UA/CR/tarefa19_1/unroll
  d:/ECT-UA/CR/tarefa19_1/checkImpar
  d:/ECT-UA/CR/tarefa19_1/imparE
} [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
add_files D:/ECT-UA/CR/tarefa19_1/16de16bits.coe
add_files D:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/hardversion.bd
set_property used_in_implementation false [get_files -all d:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/ip/hardversion_blk_mem_gen_0_0/hardversion_blk_mem_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/ip/hardversion_unroll_0_0/src/Nexys4_Master.xdc]
set_property used_in_implementation false [get_files -all d:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/ip/hardversion_imparE_0_0/src/Nexys4_Master.xdc]
set_property used_in_implementation false [get_files -all d:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/ip/hardversion_sendImpar_0_0/src/Nexys4_Master.xdc]
set_property used_in_implementation false [get_files -all D:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/hardversion_ooc.xdc]
set_property is_locked true [get_files D:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/hardversion.bd]

read_vhdl -library xil_defaultlib D:/ECT-UA/CR/tarefa19_1/hardwareVersion/hardwareVersion.srcs/sources_1/bd/hardversion/hdl/hardversion_wrapper.vhd
read_xdc D:/ECT-UA/CR/Nexys4_Master.xdc
set_property used_in_implementation false [get_files D:/ECT-UA/CR/Nexys4_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top hardversion_wrapper -part xc7a100tcsg324-2
write_checkpoint -noxdef hardversion_wrapper.dcp
catch { report_utilization -file hardversion_wrapper_utilization_synth.rpt -pb hardversion_wrapper_utilization_synth.pb }
