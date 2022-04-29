mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

all:	clean_skip_rc comp run waveverdi

clean:
	\rm -rf simv* csrc* *.log *.fsdb *.rc *.key verdi_config_file verdiLog *.conf
clean_skip_rc:
	\rm -rf simv* csrc* *.log *.fsdb 	  *.key verdi_config_file verdiLog *.conf

comp:	sultan_full

sultan_block: 
	vcs sultans_of_swing.v ../eric_clapton/reg4.v 

sultan_full: 
	vcs sultans_of_swing.v ../eric_clapton/reg4.v ../../../tb/VFiles/sultans_of_swing/sultans_of_swing_tb.v  -kdb +vcs+fsdbon

run:
	qrsh -V -cwd -b y -q sim_light ./simv

waveverdi:
	verdi -ssf novas.fsdb
