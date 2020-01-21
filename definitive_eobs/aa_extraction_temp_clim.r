library(raster)
library(ncdf4)


#####################################################################################################################################
# vars

#period_monthly="1998-2018"
#period_wt="_san09_9818"
eobs_version="v20"
period_monthly="1981-2010"
period_wt_files="_san09_clim"
period_wt="clim"
Qwt_stat = "N"
#####################################################################################################################################
# setup directories

setwd(paste0("/home/salute/seasonal/procedure_data/stack_eobs/stacks_eobs_wt_",eobs_version,"/elab_data/"))

all_wt=c(paste0("/home/salute/seasonal/procedure_data/stack_eobs/stacks_eobs_wt_",eobs_version))

stack_eobs_month=c(paste0("/home/salute/seasonal/procedure_data/stack_eobs/stacks_monthly/eobs_",eobs_version,""))

#####################################################################################################################################
# listing wt and months file stacks

files_all=list.files(path=all_wt,pattern ="all.*nc",recursive=T,full.names = T)

files_all_month=list.files(path=stack_eobs_month,pattern ="nc",recursive=T,full.names = T)

#####################################################################################################################################

e <- extent(-30,30,30,70) # final extent 

#####################################################################################################################################
# Functions and namimg

estrai_wt=function(x) as.numeric(sub(".nc.rds","",sub(".*wt.*_","",x)))

prain=function(x,val=0) {length(which(x>val))/length(x)}



qp_on_rain=function(x) { res=x[which(x>0)];
                                    p_rain=(length(which(x>0))/length(x))*100;
                                    p_norain=100-p_rain;
                                    c(p_rain,p_norain,as.numeric(quantile(res,probs=c(0.05,0.10,0.33,0.50,0.66,0.75,0.90,0.95),na.rm=T)))
}

qp_on_temp=function(x) { 
                                    c(as.numeric(quantile(x,probs=c(0.05,0.10,0.33,0.50,0.66,0.75,0.90,0.95),na.rm=T)))
}


#####################################################################################################################
# thermal parameters

vars=c("tg","tx","tn")

#####################################################################################################################################


i=0 # index vars

for ( varsing in vars) {
i=i+1;

dir_CLIM=paste0("climatologies_",varsing)

dir.create(dir_CLIM)




#####################################################################################################################################
 
for ( mese in 1:12) {


 #####################################################################################################################################
 # stack monthly

  file_monthly=grep(paste0(".*",varsing,".*",period_monthly,".*","stack_",mese,".nc"),files_all_month,value=T)
  
  clim_stack=brick(file_monthly)
  
  message(paste("Reading climatology of ",mese," ", file_monthly,"...."))
  
  
  temp_month_clim=calc(clim_stack,qp_on_temp)
  
  names(temp_month_clim)=c("Q_5","Q_10","Q_33","Q_50","Q_66","Q_75","Q_90","Q_95")
  temp_month_clim=readAll(temp_month_clim)
  saveRDS(temp_month_clim,file=paste0(dir_CLIM,"/","statsbayes_clim_",varsing,"_",mese,"_",period_monthly,".rds"))

  message(paste("\n..fatto!"))

   #####################################################################################################################################

  index_stacks=grep(paste0("_",mese,"_"),grep(period_wt_files,grep(varsing,files_all,value=T),value=T),value=T)
  
  wt_stack=lapply(index_stacks,stack)
  
  message(paste("Reading WT of ",mese," ",index_stacks,"....\n"))

   #####################################################################################################################################
   # Calcolo delle soglie dei quantili per tipo di tempo
   if ( Qwt_stat == "Y") {
    message(paste("Begin calculus quantiles....\n"))
    temp_wt_temp=lapply(wt_stack,
                                      FUN=function(x) { if (nlayers(x)==1) {  res=stack(x[[1]],x[[1]],x[[1]],x[[1]],x[[1]],x[[1]],x[[1]],x[[1]]);
                                                                                                names(res)=c("Q_5","Q_10","Q_33","Q_50","Q_66","Q_75","Q_90","Q_95");
                                                                                                return(res)
                                                                                              } 
                                                             else             
                                                                                              {  res=calc(x,qp_on_temp);
                                                                                                 names(res)=c("Q_5","Q_10","Q_33","Q_50","Q_66","Q_75","Q_90","Q_95");
                                                                                                 return(res)
                                                                                          }
                                                            }
                                    ) 

   message(paste("......done!\n"))
  


   saveRDS(temp_wt_temp,file=paste0(dir_CLIM,"/","statsbayes_wt_clim_",varsing,"_",mese,"_",period_wt,".rds"))
    
   message(paste("\nSaving ..done!"))

  }
   #####################################################################################################################################
   # retrieve number of existing WT and numerical indexing 

    id_wt=as.numeric(gsub("[^0-9]", "",regmatches( index_stacks,regexpr("[0-9]+.nc", index_stacks))))

   
  #####################################################################################################################################
  # Prob Quantile calculation respect to the month stats
 

     for ( j in 1:length(id_wt)) { 
      reswtq=list() 
      zzindex=1
      jj=id_wt[j]
      for ( z in 1:8) { pp=stack(wt_stack[[j]],temp_month_clim[[z]])
                           reswtq[[zzindex]]=calc(pp,fun=function(x,...) { ind=length(x)-1;
                                                                                                Lna=length(which(is.na(x[1:ind])))
                                                                                                res=sum(as.numeric(x[1:ind])>=as.numeric(x[length(x)]))
                                                                                                res=ifelse(Lna>ind*0.3,NA,res)
                                                                                                res=ifelse(is.na(res/ind),NA,res/ind)
                                                                                                return(res)
                                                                                              }       
                                                            );
      
      zzindex=zzindex+1
      }


      ##############################################################################################################
      # Save in format rds

        finwtq=stack(reswtq)
        names(finwtq)=c("PQ_5","PQ_10","PQ_33","PQ_50","PQ_66","PQ_75","PQ_90","PQ_95")
        finwtq=readAll(finwtq)
        saveRDS(finwtq,file=paste0(dir_CLIM,"/","statsbayes_wtProb_",varsing,"_",mese,"_",period_wt,"_",id_wt[j],".rds"))
                                    
     ##############################################################################################################
      

 
   } # loop wt
  }  # loop mese

   message(paste("Mese ",varsing,"_",mese,"..fatto!"))
} # loop var



 
 







