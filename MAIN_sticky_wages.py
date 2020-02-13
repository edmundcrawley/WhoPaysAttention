import numpy as np
from matplotlib import pyplot as plt
from dolo import *  # load the dolo library
from dolo.algos.perfect_foresight import deterministic_solve
from pathlib import Path
figure_dir = Path('./Figures/')
table_dir = Path('./Tables/')


#################################################
# Sticky Wages
#################################################          
TANKmodel = yaml_import("TANK_sticky_wages.yaml")   # import the model
T=20
# First calculate with no attention
TANKmodel.set_calibration(attention=0.0)
dr_pert = approximate_controls(TANKmodel, order=1)
irf = response(TANKmodel,dr_pert, 'eps_nu', T)
irf_fwd = response(TANKmodel,dr_pert,'eps_fwd_guid',T)

# Now calculate with attention
TANKmodel.set_calibration(attention=1.0)
dr_pert_att = approximate_controls(TANKmodel, order=1)
irf_att = response(TANKmodel,dr_pert_att, 'eps_nu',T)
irf_fwd_att = response(TANKmodel, dr_pert_att, 'eps_fwd_guid',T)

plt.plot(irf.sel(V='y_gap'))
plt.plot(irf_att.sel(V='y_gap'))

plt.plot(irf.sel(V='r_real'))
plt.plot(irf_att.sel(V='r_real'))
plt.xlabel('Quarter')
plt.ylabel('Real Interest Rate')
plt.legend(['Inattention','Attention'])
plt.title('Real Interest Rate')
plt.savefig(figure_dir/'real_rate.pdf')

plt.plot(irf.sel(V='pi_p'))
plt.plot(irf_att.sel(V='pi_p'))

plt.plot(irf.sel(V='i'))
plt.plot(irf_att.sel(V='i'))

#sim=deterministic_solve(TANKmodel,shocks=[[1.0],[0]],T=100)

plt.plot(irf.sel(V='y_gap'))
plt.plot(irf.sel(V='pi_w'))
plt.plot(irf.sel(V='w_gap'))
plt.plot(irf.sel(V='i'))
plt.plot(irf.sel(V='r_real'))
plt.plot(irf.sel(V='pi_p'))
plt.plot(irf.sel(V='pi_w'))
plt.plot(irf.sel(V='c_K'))
plt.plot(irf.sel(V='c_R'))
plt.plot(irf.sel(V='n_R'))
plt.plot(irf.sel(V='w_real'))

plt.plot(irf_fwd.sel(V='y_gap'))
plt.plot(irf_fwd.sel(V='pi_w'))
plt.plot(irf_fwd.sel(V='i'))
plt.plot(irf_fwd.sel(V='r_real'))
plt.plot(irf_fwd.sel(V='eps_fwd_guid'))
#################################################
