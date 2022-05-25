set ADDITIONAL_SEARCH_PATH   "/tools/synopsys/lib/SAED32_EDK/lib/stdcell_hvt/db_nldm 
			      /tools/synopsys/lib/SAED32_EDK/tech/star_rcxt
	 	   	      /tools/synopsys/lib/SAED32_EDK/tech/milkyway
			      /tools/synopsys/lib/SAED32_EDK/lib/stdcell_hvt/ndm"    ;#  Directories containing logic libraries


set my_target_libs [ls ../../libraries/syn_libs/*.db]
set link_library $my_target_libs
set target_library $my_target_libs





