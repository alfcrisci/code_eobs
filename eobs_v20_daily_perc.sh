######### PERCENTILI GIORNALIERI ###################################

cdo ydaypctl,90 rr_ens_mean_0.1deg_reg_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_v20.0e.nc rr_daily_q90_all.nc
cdo ydaypctl,95 rr_ens_mean_0.1deg_reg_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_v20.0e.nc rr_daily_q95_all.nc
cdo ydaypctl,99 rr_ens_mean_0.1deg_reg_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_v20.0e.nc rr_daily_q99_all.nc

cdo ydaypctl,90 rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc rr_daily_q90_1981-2010.nc
cdo ydaypctl,95 rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc rr_daily_q95_1981-2010.nc
cdo ydaypctl,99 rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc rr_daily_q99_1981-2010.nc

cdo ydaypctl,90 rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc rr_daily_q90_1998-2018.nc
cdo ydaypctl,95 rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc rr_daily_q95_1998-2018.nc
cdo ydaypctl,99 rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc -ydaymin rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc -ydaymax rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc rr_daily_q99_1998-2018.nc
