mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))


# Clean, Compile, Run and open Verdi
all:	
	clean comp run waveverdi

# Remove Simulation files
clean:
	\rm -rf simv* csrc* *.log *.fsdb *.rc *.key verdi_config_file verdiLog *.conf

# Compile block & dependent bocks & TestBench
comp:
	vcs sultans_of_swing.v ../eric_clapton/reg4.v ../../../tb/VFiles/sultans_of_swing/sultans_of_swing_tb.v  -kdb +vcs+fsdbon

# Run simulation
run:
	qrsh -V -cwd -b y -q sim_light ./simv

# Open Verdi
waveverdi:
	verdi -ssf novas.fsdb

#
# Modifications
#

# Like all but leaves signals.rc from previous run
tb:
	clean_skip_rc comp run waveverdi

#like comp but only for block, no TestBench
block_only: 
	vcs sultans_of_swing.v ../eric_clapton/reg4.v  

# Like tb but without opening verdi (Usefull if TestBench has prints)
print:
	clean_skip_rc comp run

# Clean all simulation files execpt *.rc (saving signals.rc fot tb_bench)
clean_skip_rc: 
	\rm -rf simv* csrc* *.log *.fsdb 	  *.key verdi_config_file verdiLog *.conf
