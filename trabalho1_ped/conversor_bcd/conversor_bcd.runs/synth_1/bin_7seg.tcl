# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/conversor_bcd/conversor_bcd.cache/wt [current_project]
set_property parent.project_path E:/conversor_bcd/conversor_bcd.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib E:/conversor_bcd/conversor_bcd.srcs/sources_1/new/conv_bcd.vhd
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/leona/OneDrive/?rea de Trabalho/UnB/2022.1/Pr?tica de Eletr?nica Digital 1/Projetos Vivado/Trabalho 3/Basys3_2_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/leona/OneDrive/?rea de Trabalho/UnB/2022.1/Pr?tica de Eletr?nica Digital 1/Projetos Vivado/Trabalho 3/Basys3_2_Master.xdc}}]


synth_design -top bin_7seg -part xc7a35tcpg236-1


write_checkpoint -force -noxdef bin_7seg.dcp

catch { report_utilization -file bin_7seg_utilization_synth.rpt -pb bin_7seg_utilization_synth.pb }
