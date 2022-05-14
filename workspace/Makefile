mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))


all:	clean comp_all run waveverdi

clean:
	\rm -rf simv* csrc* *.log *.fsdb *.rc *.key verdi_config_file verdiLog *.conf

comp_all:	comp_wembley comp_eric comp_dire comp_sultans	


comp_wembley: 
	# cd ../sourcecode/rtl/VFiles/wembley_88/
	vcs  ../sourcecode/rtl/VFiles/eric_clapton/reg4.v ../sourcecode/rtl/VFiles/eric_clapton/reg1.v ../sourcecode/rtl/VFiles/eric_clapton/mux4to1_always.v ../sourcecode/rtl/VFiles/eric_clapton/mux4to1_primitives.v ../sourcecode/rtl/VFiles/eric_clapton/mux4to1_assign.v ../sourcecode/rtl/VFiles/sultans_of_swing/sultans_of_swing.v ../sourcecode/rtl/VFiles/eric_clapton/eric_clapton.v ../sourcecode/rtl/VFiles/dire_straits/dire_straits.v  ../sourcecode/rtl/VFiles/wembley_88/wembley_88.v ../sourcecode/tb/VFiles/wembley_88/wembley_88_tb.v  -kdb +vcs+fsdbon
	# cd current_dir

comp_eric: 
	# cd ../sourcecode/rtl/VFiles/eric_clapton/
	vcs ../sourcecode/rtl/VFiles/eric_clapton/eric_clapton.v ../sourcecode/rtl/VFiles/eric_clapton/mux2to1_always.v ../sourcecode/rtl/VFiles/eric_clapton/mux2to1_assign.v ../sourcecode/rtl/VFiles/eric_clapton/mux2to1_primitives.v ../sourcecode/rtl/VFiles/eric_clapton/mux4to1_always.v ../sourcecode/rtl/VFiles/eric_clapton/mux4to1_assign.v ../sourcecode/rtl/VFiles/eric_clapton/mux4to1_primitives.v ../sourcecode/rtl/VFiles/eric_clapton/reg4.v ../sourcecode/rtl/VFiles/eric_clapton/reg1.v ../sourcecode/tb/VFiles/eric_clapton/eric_clapton_tb.v -kdb +vcs+fsdbon
	# cd current_dir

comp_dire:
	# cd ../sourcecode/rtl/VFiles/dire_straits/;
	vcs ../sourcecode/rtl/VFiles/dire_straits/dire_straits.v  ../sourcecode/tb/VFiles/dire_straits/dire_straits_tb.v  -kdb +vcs+fsdbon
	# cd current_dir

comp_sultans: 
	# cd ../sourcecode/rtl/VFiles/sultans_of_swing;
	vcs ../sourcecode/rtl/VFiles/sultans_of_swing/sultans_of_swing.v  ../sourcecode/rtl/VFiles/eric_clapton/reg4.v ../sourcecode/tb/VFiles/sultans_of_swing/sultans_of_swing_tb.v  -kdb +vcs+fsdbon
	# cd current_dir 

run:
	cd ../sourcecode/rtl/VFiles/;
	qrsh -V -cwd -b y -q sim_light ./simv
	cd current_dir 

waveverdi:
	cd ../sourcecode/rtl/VFiles/;
	verdi -ssf novas.fsdb
	cd current_dir 


