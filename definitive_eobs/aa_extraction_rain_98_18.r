library(raster)
library(ncdf4)

#####################################################################################################################################
# vars

varsing="rr"
period_monthly="1998-2018"
period_wt_files="9818"
period_wt="9818"
eobs_version="v20"
Qwt_stat ="N"
#####################################################################################################################################
# setup directories

setwd(paste0("/home/salute/seasonal/procedure_data/stack_eobs/stacks_eobs_wt_",eobs_version,"/elab_data/"))

dir.create("climatologies_rr")

all_wt=c(paste0("/home/salute/seasonal/procedure_data/stack_eobs/stacks_eobs_wt_",eobs_version))

stack_eobs_month=c(paste0("/home/salute/seasonal/procedure_data/stack_eobs/stacks_monthly/eobs_",eobs_version,""))

#####################################################################################################################################
# listing wt and months file stacks

files_all=list.files(path=all_wt,pattern ="all.*nc",recursive=T,full.names = T)

files_all_month=list.files(path=stack_eobs_month,pattern ="nc",recursive=T,full.names = T)



#####################################################################################################################################
# Functions and namimg

e <- extent(-30,30,30,70) # final extent 

estrai_wt=function(x) as.numeric(sub(".nc.rds","",sub(".*wt.*_","",x)))

prain=function(x,val=0) {length(which(x>val))/length(x) }

qp_on_rain=function(x) { res=x[which(x>0)];   
                                    p_rain=(length(which(x>0))/length(x))*100;
                                    p_norain=100-p_rain;
                                    c(p_rain,p_norain,as.numeric(quantile(res,probs=c(0.05,0.10,0.33,0.50,0.66,0.75,0.90,0.95),na.rm=T)))
                                 }

qp_on_temp=function(x) { 
                                  c(as.numeric(quantile(x,probs=c(0.05,0.10,0.33,0.50,0.66,0.75,0.90,0.95),na.rm=T)))
 }


#####################################################################################################################################

for ( mese in 1:12) {

  # stack monthly

  file_monthly=grep(paste0(".*",varsing,".*",period_monthly,".*","stack_",mese,".nc"),files_all_month,value=T)
  
  clim_stack=brick(file_monthly)

  message(paste("Reading climatology of ",mese," ", file_monthly,"...."))

  temp_month_clim=calc(clim_stack, qp_on_rain)

  
  names(temp_month_clim)=c("P_GP_R_WT","P_GP_month","Q_5","Q_10","Q_33","Q_50","Q_66","Q_75","Q_90","Q_95")


  saveRDS(readAll(temp_month_clim),file=paste0("climatologies_",varsing,"/","statsbayes_month_",varsing,"_",mese,"_",period_monthly,".rds"))

  message(paste("\n..fatto!"))

  #####################################################################################################################################
  # retrieve number of existing WT and numerical indexing 

    index_stacks=grep(paste0("_",mese,"_"),grep(period_wt_files,grep(varsing,files_all,value=T),value=T),value=T)
 
    id_wt=as.numeric(gsub("[^0-9]", "",regmatches( index_stacks,regexpr("[0-9]+.nc",  index_stacks))))
 
    message(paste("Reading WT of ",mese," ",index_stacks,"....\n"))
    wt_stack=lapply(index_stacks,stack)
    message(paste("......done!\n"))
   #####################################################################################################################################
    
  if ( Qwt_stat == "Y") {
   message(paste("Begin calculus quantiles....\n"))
  
  temp_wt_rain=lapply(wt_stack,function(x) { res=calc(x,qp_on_rain);
                                                                    names(res)=c("P_GP_R_WT","P_GP_month","Q_5","Q_10","Q_33","Q_50","Q_66","Q_75","Q_90","Q_95")
                                                                   return(res)
                                                                })
  message(paste("......done!\n"))
  

  
  names(temp_wt_rain)=paste0("WT_Q_",id_wt)

  saveRDS(temp_wt_rain,file=paste0("climatologies_",varsing,"/","statsbayes_wt_clim_",varsing,"_",mese,"_",period_wt,".rds"))

  message(paste("\n..fatto!"))
 }

 #####################################################################################################################################
   # retrieve number of existing WT and numerical indexing 

    id_wt=as.numeric(gsub("[^0-9]", "",regmatches( index_stacks,regexpr("[0-9]+.nc", index_stacks))))

 #####################################################################################################################################
 # Prob Quantile calculation respect to the month stats
  for ( j in 1:length(id_wt)) { 
                         reswtq=list()  
                         zzindex=1

                         for ( z in 3:10) {
                                                pp=stack(wt_stack[[j]],temp_month_clim[[z]])
                                               
                                                 reswtq[[zzindex]]=calc(pp,fun=function(x,...) { ind=length(x)-1;
                                                                                                                       res=sum(as.numeric(x[1:ind])>as.numeric(x[length(x)]))
                                                                                                                       Lna=length(which(is.na(x[1:ind])))
                                                                                                                       res=ifelse(is.na(res/ind),0,res/ind)
                                                                                                                      res=ifelse(Lna==ind,NA,res)
                                                                                                                      return(res)
                                                                                                                 });
                                                                      
                                                zzindex=zzindex+1
                                               }

   
                          prain_temp=calc(wt_stack[[j]],prain)
                          finwtq=stack(prain_temp,temp_month_clim[[1]],stack(reswtq))
                          names(finwtq)=c("P_GP_R_WT","P_GP_month","PQ_5","PQ_10","PQ_33","PQ_50","PQ_66","PQ_75","PQ_90","PQ_95")
                          saveRDS(readAll(finwtq),file=paste0("climatologies_",varsing,"/","statsbayes_wtProb_",varsing,"_",mese,"_",period_wt,"_",id_wt[j],".rds"))

                          Sys.sleep(1)
                         
       } # loop in wt
    
   
      message(paste("Mese ",mese,"..fatto!"))

    } # loop in mese

     

#####################################################################################################################

