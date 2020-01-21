library(xts)
library(lubridate)
library(raster)
library(ncdf4)

setwd("/home/salute/seasonal/procedure_data/WT_data/original_raw")

pct09=read.csv("pct09.cla",sep="",header=F)
san09=read.csv("san09_500HGT.cla",sep="",header=F)

WTS=data.frame(WT_pct09=as.factor(pct09$V5),
                          WT_san09=as.factor(san09$V5[1:14610])
                         )

rownames(WTS)=ISOdate(pct09$V1,pct09$V2,pct09$V3)

saveRDS(WTS,"WTS_df.rds")

WTS_xts=as.xts(WTS)

saveRDS(WTS_xts,"WTS_xts.rds")

times_WTS=index(WTS_xts)

saveRDS(times_WTS,"times_WTS.rds")

months_WTS=month(times_WTS)

saveRDS(months_WTS,"months_WTS.rds")

list_month_f=list()

list_month_f[[1]]=table(months_WTS,WTS$WT_pct09)
list_month_f[[2]]=table(months_WTS,WTS$WT_san09)

write.csv(as.data.frame.array(list_month_f[[1]]),file="f_WT_pct09.csv")
write.csv(as.data.frame.array(list_month_f[[2]]),file="f_WT_san09.csv")


saveRDS(list_month_f,"list_month_f_WTS.rds")

#########################################################################àà
# reading lists

WTS=readRDS("WTS_df.rds")
WTS_xts=readRDS("WTS_xts.rds")
months_WTS=readRDS("months_WTS.rds")
times_WTS=readRDS("times_WTS.rds")


###########################################################################################
# list climatological 1981-2010

temp_pct9=data.frame(mon=months_WTS[732:11688],wt=WTS$WT_pct09[732:11688])
list_WT_pct09=split(temp_pct9,temp_pct9[c('mon','wt')])
list_WT_pct09=lapply(list_WT_pct09,function(x) rownames(x))
names(list_WT_pct09)<-gsub("\\.","_",paste0("ind_wt_",names(list_WT_pct09)))
saveRDS(list_WT_pct09,"list_WT_pct09_clim_1981-2010_NEW.rds")

temp_san09=data.frame(mon=months_WTS[732:11688],wt=WTS$WT_san09[732:11688])
list_WT_san09=split(temp_san09,temp_san09[c('mon','wt')])
list_WT_san09=lapply(list_WT_san09,function(x) rownames(x))
names(list_WT_san09)<-gsub("\\.","_",paste0("ind_wt_",names(list_WT_san09)))
saveRDS(list_WT_san09,"list_WT_san09_clim_1981-2010_NEW.rds")

###########################################################################################
###########################################################################################
# list new period 1998-2018

temp_pct9=data.frame(mon=months_WTS[6941:14610],wt=WTS$WT_pct09[6941:14610])
list_WT_pct09=split(temp_pct9,temp_pct9[c('mon','wt')])
list_WT_pct09=lapply(list_WT_pct09,function(x) rownames(x))
names(list_WT_pct09)<-gsub("\\.","_",paste0("ind_wt_",names(list_WT_pct09)))
saveRDS(list_WT_pct09,"list_WT_pct09_1998-2018_NEW.rds")

temp_san09=data.frame(mon=months_WTS[6941:14610],wt=WTS$WT_san09[6941:14610])
list_WT_san09=split(temp_san09,temp_san09[c('mon','wt')])
list_WT_san09=lapply(list_WT_san09,function(x) rownames(x))
names(list_WT_san09)<-gsub("\\.","_",paste0("ind_wt_",names(list_WT_san09)))
saveRDS(list_WT_san09,"list_WT_san09_1998-2018_NEW.rds")

###########################################################################################
# list recent full 1979-2018

temp=data.frame(mon=months_WTS,wt=WTS$WT_pct09)
list_WT_WT_pct09=split(temp,temp[c('mon','wt')])
list_WT_pct09=lapply(list_WT_WT_pct09,function(x) rownames(x))
names(list_WT_pct09)<-gsub("\\.","_",paste0("ind_wt_",names(list_WT_pct09)))
saveRDS(list_WT_pct09,"list_WT_pct09_full_NEW.rds")

temp=data.frame(mon=months_WTS,wt=WTS$WT_san09)
list_WT_WT_san09=split(temp,temp[c('mon','wt')])
list_WT_san09=lapply(list_WT_WT_san09,function(x) rownames(x))
names(list_WT_san09)<-gsub("\\.","_",paste0("ind_wt_",names(list_WT_san09)))
saveRDS(list_WT_san09,"list_WT_san09_full_NEW.rds")
