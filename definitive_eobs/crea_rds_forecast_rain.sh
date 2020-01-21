#!/bin/bash -l

cd /home/salute/seasonal/procedure_data/stack_eobs/stacks_eobs_wt_v20/elab_data

/usr/bin/Rscript aa_extraction_rain_clim.r    
/usr/bin/Rscript aa_extraction_rain_98_18.r 

	
echo "Procedura crea rds for forecast"





