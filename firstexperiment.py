# -*- coding: utf-8 -*-
"""
Play with a two period model of rational inattention
"""
import numpy as np
from scipy.optimize import minimize

R = 1
Rbar = 1
beta = 1
phi = 1
alpha = 1.0/3.0
theta = 1.0

def objective_attention(solution, beta, R, phi, alpha, theta, Rbar, attention=True):
    cl_0 = solution[0]
    cl_1 = solution[1]
    nl_0 = solution[2]
    nl_1 = solution[3]
    cb_0 = solution[4]
    cb_1 = solution[5]
    nb_0 = solution[6]
    nb_1 = solution[7]
    wage_0 = solution[8]
    wage_1 = solution[9]
    Y_0 = solution[10]
    Y_1 = solution[11]
    
    obj = np.array([ 1.0/cl_0 - beta * R * 1.0/cl_1,  #euler equation for lender
            cl_0 + 1/R*cl_1 - ( Y_0-wage_0*nb_0 + theta -  1.0/(R*Rbar)*theta + 1/R*(Y_1-wage_1*nb_1) ),     #budget constraint for lender
            
           # foc for hours worked
            1.0/cl_0 - 1.0/wage_0 * nl_0**phi ,
            1.0/cl_1 - 1.0/wage_1 * nl_1**phi ,
            1.0/cb_0 - 1.0/wage_0 * nb_0**phi ,
            1.0/cb_1 - 1.0/wage_1 * nb_1**phi ,
            
            #borrower is hand to mouth
            cb_0 - (wage_0*nb_0 - theta + 1.0/R*theta),
            cb_1 - (wage_1*nb_1 - theta + 1.0/Rbar*theta) ,
            
            #marginal productivity
            wage_0 - (1-alpha)*(nl_0 + nb_0)**(-alpha),
            wage_1 - (1-alpha)*(nl_1 + nb_1)**(-alpha),
            
            #production
            Y_0 -(nl_0+nb_0)**(1-alpha),
            Y_1 -(nl_1+nb_1)**(1-alpha) ])
    
    #replace euler eq if not paying attention
    if attention == False:
        obj[0] = cl_0-0.84343252
        
    return np.sum(obj**2)

        
guess = np.ones(12)

solved_objective = minimize(objective_attention, guess, args=(beta, R, phi, alpha, theta, Rbar))
solved_objective_up = minimize(objective_attention, guess, args=(beta, R+0.01, phi, alpha, theta, Rbar))

solved_objective_inatt = minimize(objective_attention, guess, args=(beta, R, phi, alpha, theta, Rbar,False))
solved_objective_inatt_up = minimize(objective_attention, guess, args=(beta, R+0.01, phi, alpha, theta, Rbar,False))

