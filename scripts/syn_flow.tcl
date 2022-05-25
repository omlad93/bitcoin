# after you invoked dc_shell in terminal, with: module_load SYN (then enter, and then) dc_shell (then again enter)
remove_design -all
reset_design

# i assume the tool might crush, so here the syn libs is sourced for your next run.
source ../../scripts/syn_libs_setup.tcl

#the following command does the compilation
#make sure you run it in, that you are in workspace/work1 for example or workspace/work2 ... 
analyze -format sverilog  " ../../sourcecode/rtl/VFiles/eric_clapton/reg1.v
../../sourcecode/rtl/VFiles/eric_clapton/reg4.v
../../sourcecode/rtl/VFiles/eric_clapton/mux2to1_assign.v
../../sourcecode/rtl/VFiles/eric_clapton/mux4to1_always.v
../../sourcecode/rtl/VFiles/eric_clapton/mux4to1_assign.v
../../sourcecode/rtl/VFiles/eric_clapton/mux4to1_primitives.v
../../sourcecode/rtl/VFiles/eric_clapton/eric_clapton.v
../../sourcecode/rtl/VFiles/eric_clapton/mux2to1_primitives.v
../../sourcecode/rtl/VFiles/eric_clapton/mux2to1_always.v
../../sourcecode/rtl/VFiles/sultans_of_swing/sultans_of_swing.v
../../sourcecode/rtl/VFiles/dire_straits/dire_straits.v
../../sourcecode/rtl/VFiles/wembley_88/wembley_88.v"

elaborate wembley_88
current_design
link
write_file -hierarchy -format ddc -out unmapped/wembley_88.ddc
list_designs
list_libs
check_design > ../../reports/check_design

report_timing -max_paths 20 -delay_type max  > ../../reports/report_timing_before_con_max
source ../../inputs/my_constraints.con
report_timing -max_paths 20 -delay_type max  > ../../reports/report_timing_after_con_max

#compile_ultra
compile_ultra -no_autoungroup

report_timing -max_paths 20 -delay_type max > ../../reports/report_timing_after_compile_ultra
report_constraint -all > ../../reports/report_constraint
report_area > ../../reports/report_area

write_file -hierarchy -format ddc -output mapped/wembley_88.ddc



