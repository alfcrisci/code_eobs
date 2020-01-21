######### PERCENTILI GIORNALIERI ###################################

#cdo -gtc,0 -topo,ni96 lsm_gme96.grb
#cdo -f nc reduce,lsm_gme96.grb temp_gme96.grb tempOnLand_gme96.nc

#cdo gtc,0 rr_ens_mean_0.1deg_reg_v20.0e.nc gp0m_ens_mean_0.1deg_reg_v20.0e.nc
#cdo div rr_ens_mean_0.1deg_reg_v20.0e.nc gp0m_ens_mean_0.1deg_reg_v20.0e.nc rr_masked_0.nc
#cdo timpctl,90 rr_masked_0.nc -timmin rr_masked_0.nc -timmax rr_masked_0.nc rr_masked_90p.nc
#cdo timpctl,95 rr_masked_0.nc -timmin rr_masked_0.nc -timmax rr_masked_0.nc rr_masked_95p.nc
#cdo timpctl,99 rr_masked_0.nc -timmin rr_masked_0.nc -timmax rr_masked_0.nc rr_masked_99p.nc

#cdo gtc,0 rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc gp0m_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc
cdo div  rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc gp0m_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc rr_masked_0_1981-2010.nc
cdo timpctl,90 rr_masked_0_1981-2010.nc -timmin rr_masked_0_1981-2010.nc -timmax rr_masked_0_1981-2010.nc rr_masked_90p_1981-2010.nc
cdo timpctl,95 rr_masked_0_1981-2010.nc -timmin rr_masked_0_1981-2010.nc -timmax rr_masked_0_1981-2010.nc rr_masked_95p_1981-2010.nc
cdo timpctl,99 rr_masked_0_1981-2010.nc -timmin rr_masked_0_1981-2010.nc -timmax  rr_masked_0_1981-2010.nc rr_masked_99p_1981-2010.nc

#cdo gtc,0 rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc gp0m_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc
cdo div  rr_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc gp0m_ens_mean_0.1deg_reg_1998-2018_v20.0e.nc rr_masked_0_1998-2018.nc
cdo timpctl,90 rr_masked_0_1998-2018.nc -timmin rr_masked_0_1998-2018.nc -timmax rr_masked_0_1998-2018.nc rr_masked_90p_1998-2018.nc
cdo timpctl,95 rr_masked_0_1998-2018.nc -timmin rr_masked_0_1998-2018.nc -timmax rr_masked_0_1998-2018.nc rr_masked_95p_1998-2018.nc
cdo timpctl,99 rr_masked_0_1998-2018.nc -timmin rr_masked_0_1998-2018.nc -timmax  rr_masked_0_1998-2018.nc rr_masked_99p_1998-2018.nc
