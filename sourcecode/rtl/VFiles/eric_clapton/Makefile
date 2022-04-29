all:	clean comp run waveverdi

clean:
	\rm -rf simv* csrc* *.log *.fsdb *.rc *.key verdi_config_file verdiLog *.conf
comp: 
	vcs eric_clapton.v mux2to1_always.v mux2to1_assign.v mux2to1_primitives.v mux4to1_always.v mux4to1_assign.v mux4to1_primitives.v reg4.v ../../../tb/VFiles/eric_clapton/eric_clapton_tb.v -kdb +vcs+fsdbon
run:
	qrsh -V -cwd -b y -q sim_light ./simv

waveverdi:
	verdi -ssf novas.fsdb



