library(raster)
library(ncdf4)
setwd("/home/salute/seasonal/procedure_data/stack_eobs/stacks_eobs_wt_v20/elab_data")

#####################################################################################################################################
# vars
varsing="tn"
period_wt="clim"
eobs_version="v20"


#####################################################################################################################################
files_all=list.files(path=paste0("climatologies_",varsing),pattern =paste0("wtProb_",varsing),recursive=T,full.names = T)

res_quant=list(list(),list(),list(),
                     list(),list(),list(),
                     list(),list(),list(),
                     list(),list(),list())

#####################################################################################################################################

for ( mese in 1:12) {

      for ( j in 1:9) { 



      file=grep(paste0(period_wt,"_",j,".rds"),grep(paste0(varsing,"_",mese,"_"),files_all,value=T),value=T)
      if ( length(file) == 0) {  message( paste0("Manca ",varsing," ",mese,"_", j,"\n")); 
                                      res_quant[[mese]][[j]]=readRDS("data/template_nulltemp.rds");
                                      next;
                           }

      res_quant[[mese]][[j]]=readRDS(file);
      message( paste0(mese,"_", j,"...OK!\n"))

    }
}
#####################################################################################################################################


saveRDS(res_quant,file=paste0("fullstat_bayes_wtclim_",varsing,"_",period_wt,".rds"))

#####################################################################################################################################

period_wt="9818"

files_all=list.files(path=paste0("climatologies_",varsing),pattern =paste0("wtProb_",varsing),recursive=T,full.names = T)

res_quant=list(list(),list(),list(),
                     list(),list(),list(),
                     list(),list(),list(),
                     list(),list(),list())

#####################################################################################################################################

for ( mese in 1:12) {

      for ( j in 1:9) { 



      file=grep(paste0(period_wt,"_",j,".rds"),grep(paste0(varsing,"_",mese,"_"),files_all,value=T),value=T)
      if ( length(file) == 0) {  message( paste0("Manca ",varsing," ",mese,"_", j,"\n")); 
                                       res_quant[[mese]][[j]]=readRDS("data/template_nulltemp.rds");
                                       next;
                           }

      res_quant[[mese]][[j]]=readRDS(file);
      message( paste0(mese,"_", j,"...OK!\n"))

    }
}
#####################################################################################################################################


saveRDS(res_quant,file=paste0("fullstat_bayes_wtclim_",varsing,"_",period_wt,".rds"))
