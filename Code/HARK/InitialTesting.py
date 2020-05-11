# Initial imports and notebook setup, click arrow to show

import HARK.ConsumptionSaving.ConsIndShockModel as cShksModl        # The consumption-saving micro model
import HARK.SolvingMicroDSOPs.Calibration.EstimationParameters as Params    # Parameters for the consumer type and the estimation
from HARK.utilities import plotFuncsDer, plotFuncs              # Some tools
import pandas as pd 

import numpy as np
from matplotlib import pyplot as plt


# %% {"code_folding": [0]}
# Set up default values for CRRA, DiscFac, and simulation variables in the dictionary 
Params.init_consumer_objects["CRRA"]= 2.00            # Default coefficient of relative risk aversion (rho)
Params.init_consumer_objects["DiscFac"]= 0.97         # Default intertemporal discount factor (beta)
Params.init_consumer_objects["PermGroFacAgg"]= 1.0    # Aggregate permanent income growth factor 
Params.init_consumer_objects["aNrmInitMean"]=10.0   # Mean of log initial assets 
Params.init_consumer_objects["aNrmInitStd"]= 1.0      # Standard deviation of log initial assets
Params.init_consumer_objects["pLvlInitMean"]= 0.0     # Mean of log initial permanent income 
Params.init_consumer_objects["pLvlInitStd"]= 0.0      # Standard deviation of log initial permanent income

Params.init_consumer_objects["Rfree"]= [1.03]*65      # Standard deviation of log initial permanent income
#Params.init_consumer_objects["Rfree"]= 1.03

# %%
# Make an instance of a lifecycle consumer to be used for estimation
LifeCyclePop = cShksModl.IndShockConsumerType(**Params.init_consumer_objects)
LifeCyclePop.addToTimeVary("Rfree")

# %% {"code_folding": [0]}
# Solve and simulate the model (ignore the "warning" message)
LifeCyclePop.solve()                            # Obtain consumption rules by age 
LifeCyclePop.unpackcFunc()                      # Expose the consumption rules

# Which variables do we want to track
LifeCyclePop.track_vars = ['aNrmNow','pLvlNow','mNrmNow','cNrmNow','TranShkNow']

LifeCyclePop.T_sim = 120                        # Nobody lives to be older than 145 years (=25+120)
LifeCyclePop.initializeSim()                    # Construct the age-25 distribution of income and assets
LifeCyclePop.simulate()                         # Simulate a population behaving according to this model

C_orig = LifeCyclePop.cNrmNow_hist*LifeCyclePop.pLvlNow_hist

for i in range(65):
    LifeCyclePop.Rfree[i] = LifeCyclePop.Rfree[i] + 0.02*0.95**i

#LifeCyclePop.Rfree = [1.05]*65
#LifeCyclePop.Rfree = 1.05
LifeCyclePop.T_sim = 120                        # Nobody lives to be older than 145 years (=25+120)
LifeCyclePop.initializeSim()                    # Construct the age-25 distribution of income and assets
LifeCyclePop.simulate()                         # Simulate a population behaving according to this model

C_inatt = LifeCyclePop.cNrmNow_hist*LifeCyclePop.pLvlNow_hist

LifeCyclePop.solve()                            # Obtain consumption rules by age 
LifeCyclePop.unpackcFunc()                      # Expose the consumption rules

LifeCyclePop.T_sim = 120                        # Nobody lives to be older than 145 years (=25+120)
LifeCyclePop.initializeSim()                    # Construct the age-25 distribution of income and assets
LifeCyclePop.simulate()                         # Simulate a population behaving according to this model

C_att = LifeCyclePop.cNrmNow_hist*LifeCyclePop.pLvlNow_hist

C_mean_inatt = np.mean(C_inatt,1)
C_mean_att = np.mean(C_att,1)
C_mean_orig = np.mean(C_orig,1)

max = 56
plt.plot(C_mean_inatt[0:max])
plt.plot(C_mean_att[0:max])
plt.plot(C_mean_orig[0:max])

print('Consumption as a function of market resources while working:')
mMin = min([LifeCyclePop.solution[t].mNrmMin for t in range(LifeCyclePop.T_cycle)])
plotFuncs(LifeCyclePop.cFunc[:LifeCyclePop.T_retire],mMin,50000)





