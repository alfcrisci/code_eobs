#cdo cat pp_0.25deg_reg_1950-1964_v17.0.nc pp_0.25deg_reg_1965-1979_v17.0.nc  pp_0.25deg_reg_1980-1994_v17.0.nc pp_0.25deg_reg_1995-2010_v17.0.nc  pp_0.25deg_reg_2011-2017_v17.0.nc pp_0.25deg_reg_1950-2017_v17.0.nc
#cdo cat rr_0.25deg_reg_1950-1964_v17.0.nc rr_0.25deg_reg_1965-1979_v17.0.nc  rr_0.25deg_reg_1980-1994_v17.0.nc rr_0.25deg_reg_1995-2010_v17.0.nc  rr_0.25deg_reg_2011-2017_v17.0.nc rr_0.25deg_reg_1950-2017_v17.0.nc
#cdo cat tg_0.25deg_reg_1950-1964_v17.0.nc tg_0.25deg_reg_1965-1979_v17.0.nc  tg_0.25deg_reg_1980-1994_v17.0.nc tg_0.25deg_reg_1995-2010_v17.0.nc  tg_0.25deg_reg_2011-2017_v17.0.nc tg_0.25deg_reg_1950-2017_v17.0.nc
#cdo cat tx_0.25deg_reg_1950-1964_v17.0.nc tx_0.25deg_reg_1965-1979_v17.0.nc  tx_0.25deg_reg_1980-1994_v17.0.nc tx_0.25deg_reg_1995-2010_v17.0.nc  tx_0.25deg_reg_2011-2017_v17.0.nc tx_0.25deg_reg_1950-2017_v17.0.nc 
#cdo cat tn_0.25deg_reg_1950-1964_v17.0.nc tn_0.25deg_reg_1965-1979_v17.0.nc  tn_0.25deg_reg_1980-1994_v17.0.nc tn_0.25deg_reg_1995-2010_v17.0.nc  tn_0.25deg_reg_2011-2017_v17.0.nc tn_0.25deg_reg_1950-2017_v17.0.nc

############################################
#SI VA AD ELABORARE IL FILE ORIGINALE DOPO I VARI CAT: "rr_ens_mean_0.1deg_reg_v20.0e.nc"                                       
cdo seldate,1981-01-01,2010-12-31 pp_ens_mean_0.1deg_reg_v20.0e.nc pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc
cdo seldate,1981-01-01,2010-12-31 rr_ens_mean_0.1deg_reg_v20.0e.nc rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc
cdo seldate,1981-01-01,2010-12-31 tx_ens_mean_0.1deg_reg_v20.0e.nc tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc
cdo seldate,1981-01-01,2010-12-31 tn_ens_mean_0.1deg_reg_v20.0e.nc tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc
cdo seldate,1981-01-01,2010-12-31 tg_ens_mean_0.1deg_reg_v20.0e.nc tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc

############################################

cdo gtc,0 rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc gp0m_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc

cdo monsum rr_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc rr_monthly_normal_sum_1981-2010.nc
cdo monsum gp0m_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc gp0m_monthly_normal_sum_1981-2010.nc

############################################

cdo ymonpctl,50 rr_monthly_normal_sum_1981-2010.nc -ymonmin rr_monthly_normal_sum_1981-2010.nc -ymonmax rr_monthly_normal_sum_1981-2010.nc rr_monthly_normal_q50_1981-2010.nc
cdo ymonpctl,33 rr_monthly_normal_sum_1981-2010.nc -ymonmin rr_monthly_normal_sum_1981-2010.nc -ymonmax rr_monthly_normal_sum_1981-2010.nc rr_monthly_normal_q33_1981-2010.nc
cdo ymonpctl,66 rr_monthly_normal_sum_1981-2010.nc -ymonmin rr_monthly_normal_sum_1981-2010.nc -ymonmax rr_monthly_normal_sum_1981-2010.nc rr_monthly_normal_q66_1981-2010.nc
cdo ymonmean rr_monthly_normal_sum_1981-2010.nc rr_monthly_normal_mean_1981-2010.nc

cdo ymonmean gp0m_monthly_normal_sum_1981-2010.nc gp0m_monthly_normal_mean_1981-2010.nc
cdo ymonpctl,50 gp0m_monthly_normal_sum_1981-2010.nc -ymonmin gp0m_monthly_normal_sum_1981-2010.nc -ymonmax gp0m_monthly_normal_sum_1981-2010.nc gp0m_monthly_normal_q50_1981-2010.nc
cdo ymonpctl,33 gp0m_monthly_normal_sum_1981-2010.nc -ymonmin gp0m_monthly_normal_sum_1981-2010.nc -ymonmax gp0m_monthly_normal_sum_1981-2010.nc gp0m_monthly_normal_q33_1981-2010.nc
cdo ymonpctl,66 gp0m_monthly_normal_sum_1981-2010.nc -ymonmin gp0m_monthly_normal_sum_1981-2010.nc -ymonmax gp0m_monthly_normal_sum_1981-2010.nc gp0m_monthly_normal_q66_1981-2010.nc

cdo ymonmean tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tg_monthly_normal_mean_1981-2010.nc
cdo ymonpctl,50 tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tg_monthly_normal_q50_1981-2010.nc
cdo ymonpctl,33 tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tg_monthly_normal_q33_1981-2010.nc
cdo ymonpctl,66 tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tg_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tg_monthly_normal_q66_1981-2010.nc

cdo ymonmean tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tx_monthly_normal_mean_1981-2010.nc
cdo ymonpctl,50 tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tx_monthly_normal_q50_1981-2010.nc
cdo ymonpctl,33 tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tx_monthly_normal_q33_1981-2010.nc
cdo ymonpctl,66 tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tx_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tx_monthly_normal_q66_1981-2010.nc

cdo ymonmean tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tn_monthly_normal_mean_1981-2010.nc
cdo ymonpctl,50 tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tn_monthly_normal_q50_1981-2010.nc
cdo ymonpctl,33 tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tn_monthly_normal_q33_1981-2010.nc
cdo ymonpctl,66 tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax tn_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc tn_monthly_normal_q66_1981-2010.nc

cdo ymonmean pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc pp_monthly_normal_mean_1981-2010.nc
cdo ymonpctl,50 pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc pp_monthly_normal_q50_1981-2010.nc
cdo ymonpctl,33 pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc pp_monthly_normal_q33_1981-2010.nc
cdo ymonpctl,66 pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmin pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc -ymonmax pp_ens_mean_0.1deg_reg_1981-2010_v20.0e.nc pp_monthly_normal_q66_1981-2010.nc
