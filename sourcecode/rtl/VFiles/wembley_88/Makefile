mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))


# From Scratch
all: clean comp run waveverdi

# Clean Simulation Files
clean:
	rm -rf simv* csrc* *.log *.fsdb *.rc *.key verdi_config_file verdiLog *.conf

# Compile Block & Testbench
comp: 
	vcs wembley_88.v ../sultans_of_swing/sultans_of_swing.v ../eric_clapton/eric_clapton.v ../dire_straits/dire_straits.v ../eric_clapton/reg4.v ../eric_clapton/reg1.v ../eric_clapton/mux4to1_always.v ../eric_clapton/mux4to1_primitives.v ../eric_clapton/mux4to1_assign.v  ../../../tb/VFiles/wembley_88/wembley_88_tb.v  -kdb +vcs+fsdbon

# Run Simulation
run: 
	qrsh -V -cwd -b y -q sim_light ./simv

# Show Waves via Verdi
waveverdi: 
	verdi -ssf novas.fsdb

# Clean but leave .rc files (for saving signals)
clean_skip_rc: 
	rm -rf simv* csrc* *.log *.fsdb *.key verdi_config_file verdiLog *.conf

# All version for usingh `clean_skip_rc`
tb: clean_skip_rc comp run waveverdi

# Compile Block (no Testbench)
block_only: 
	vcs wembley_88.v ../eric_clapton/reg4.v  

# Run Simulation (no Verdi): Usefull if Testbench has prints
print: clean_skip_rc comp run


