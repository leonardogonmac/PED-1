# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/leona/OneDrive/�rea de Trabalho/UnB/2022.1/PED_Trabalhos/comp_completo/comp_completo.cache/wt} [current_project]
set_property parent.project_path {C:/Users/leona/OneDrive/�rea de Trabalho/UnB/2022.1/PED_Trabalhos/comp_completo/comp_completo.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {c:/Users/leona/OneDrive/�rea de Trabalho/UnB/2022.1/PED_Trabalhos/comp_completo/comp_completo.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {{C:/Users/leona/OneDrive/�rea de Trabalho/UnB/2022.1/PED_Trabalhos/comp_completo/comp_completo.srcs/sources_1/new/comp_completo.vhd}}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/leona/OneDrive/�rea de Trabalho/UnB/2022.1/PED_Trabalhos/comp_completo/comp_completo.srcs/constrs_1/imports/Basys3/Basys3.0_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/leona/OneDrive/�rea de Trabalho/UnB/2022.1/PED_Trabalhos/comp_completo/comp_completo.srcs/constrs_1/imports/Basys3/Basys3.0_Master.xdc}}]


synth_design -top Q2 -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Q2.dcp

catch { report_utilization -file Q2_utilization_synth.rpt -pb Q2_utilization_synth.pb }
