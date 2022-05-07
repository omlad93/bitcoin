mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

all:	clean comp run waveverdi

clean:
	\rm -rf simv* csrc* *.log *.fsdb *.rc *.key verdi_config_file verdiLog *.conf

comp_all:	comp_wembley comp_eric comp_dire comp_sultans	


comp_wembley: 
	cd ../sourcecode/rtl/VFiles/wembley_88
	vcs name1.v name2.v name1_tb.v -kdb +vcs+fsdbon
	cd current_dir

comp_eric: 
	cd ../sourcecode/rtl/VFiles/eric_clapton
	vcs eric_clapton.v mux2to1_always.v mux2to1_assign.v mux2to1_primitives.v mux4to1_always.v mux4to1_assign.v mux4to1_primitives.v reg4.v reg1.v eric_clapton_tb.v -kdb +vcs+fsdbon
	cd current_dir

comp_dire:
	cd ../sourcecode/rtl/VFiles/dire_straits;
	vcs name1.v name2.v name1_tb.v -kdb +vcs+fsdbon
	cd current_dir

comp_sultans: 
	cd ../sourcecode/rtl/VFiles/;
	vcs sultans_of_swing.v ../eric_clapton/reg4.v ../../../tb/VFiles/sultans_of_swing/sultans_of_swing_tb.v  -kdb +vcs+fsdbon
	cd current_dir 

run:
	cd ../sourcecode/rtl/VFiles/;
	qrsh -V -cwd -b y -q sim_light ./simv
	cd current_dir 

waveverdi:
	cd ../sourcecode/rtl/VFiles/;
	verdi -ssf novas.fsdb
	cd current_dir 


