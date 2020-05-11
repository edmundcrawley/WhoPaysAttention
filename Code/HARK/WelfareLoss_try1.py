
# First calculate consumption and utility with no shock
sigma = 2
years = 41
half_life = 2.5 #half life of R shock in years
R = 1.0/0.97*np.ones(years-1)
#R = 1.0/0.9*np.ones(years-1)
beta = 1.0/R

beta_discount = np.ones(years)
R_discount = np.ones(years)
C_ratio = np.ones(years)
for i in range(years-1):
    beta_discount[i+1] = beta_discount[i]*beta[i]
    R_discount[i+1] = R_discount[i]/R[i]
    C_ratio[i+1] = (beta_discount[i+1]/R_discount[i+1])**(1.0/sigma)
income = 100.0*np.ones(years)
#income[30:] = 25
PV_income = np.sum(income*R_discount)
PV_C_ratio = np.sum(C_ratio*R_discount)
Consumption = C_ratio *PV_income/PV_C_ratio
Utility = np.sum((Consumption**(1.0-sigma)/(1-sigma)) * beta_discount)

# Now shock interest rates and see what happens
R_shock = np.ones(years-1)
for i in np.array(range(years-2))+1:
    R_shock[i] = R_shock[i-1]*(0.5**(1.0/half_life))
    
    
num_points = 41
min_shock = -0.04
max_shock = 0.04

#R_shock = np.array([(1.5-1/0.9),0,0] )
#num_points = 3
#min_shock = -1
#max_shock = 1

R_shock_size = np.linspace(min_shock, max_shock, num_points)
Utility_shocks = np.zeros(num_points)
Cons_cost = np.zeros(num_points)
Cons_initial = np.zeros(num_points)
Cons_40 = np.zeros(num_points)
PV_income_ratio = np.zeros(num_points)
for j in range(num_points):
    this_R = R+R_shock*R_shock_size[j]
    this_R_discount = np.ones(years)
    this_C_ratio = np.ones(years)
    for i in range(years-1):
        this_R_discount[i+1] = this_R_discount[i]/this_R[i]
        this_C_ratio[i+1] = (beta_discount[i+1]/this_R_discount[i+1])**(1.0/sigma)
    this_PV_income = np.sum(income*this_R_discount)
    this_PV_C_ratio = np.sum(this_C_ratio*this_R_discount)
    this_Consumption = this_C_ratio *this_PV_income/this_PV_C_ratio
    Utility_shocks[j] = np.sum((this_Consumption**(1.0-sigma))/(1-sigma) * beta_discount)
    Cons_cost[j] = ((Utility_shocks[j]/Utility)**(1.0/(1.0-sigma))-1.0)*100
    Cons_initial[j] = this_Consumption[0]
    Cons_40[j] = this_Consumption[40]
    PV_income_ratio[j] = (this_PV_income/PV_income-1.0)*100
    
Lifetime_C_cost_percent_of_income = PV_income/income[0]*Cons_cost

#Refinance value
#Mortgage face value paying fixed amount of a number of years
#How much do you get from refinancing
face_value = income[0]
payment_schedule_ratio = np.zeros(years-1)
tenure = 20
payment_schedule_ratio[0:tenure] = 1.0
PV_payment_schedule_ratio = np.sum(payment_schedule_ratio*R_discount[1:])
payment_schedule = payment_schedule_ratio*face_value/PV_payment_schedule_ratio

refinance_value = np.zeros(num_points)
for j in range(num_points):
    this_R = R+R_shock*R_shock_size[j]
    this_R_discount = np.ones(years)
    for i in range(years-1):
        this_R_discount[i+1] = this_R_discount[i]/this_R[i]
    this_PV_payment_schedule = np.sum(payment_schedule*this_R_discount[1:])
    refinance_value[j] = np.max([((this_PV_payment_schedule-face_value)/income[0])*100,0])
    
plt.plot(R_shock_size*100,Lifetime_C_cost_percent_of_income)  
plt.plot(R_shock_size*100,refinance_value)  
plt.title("Cost of Ignoring Interest Rate Changes")
plt.legend(["Ignore Intertemporal Substitution","Ignore Refinancing"])
plt.xlabel("Interest Rate Change")
plt.ylabel("Lifetime Cost as Percent of Annual Income")
plt.savefig("Figures/CostofInattention.pdf")
#plt.figure()
plt.plot(R_shock_size*100,(Cons_initial/Consumption[0]-1)*100)
plt.plot(R_shock_size*100,PV_income_ratio)

plt.plot(R_shock_size*100,(Cons_initial/Consumption[0]-1)*100)
plt.plot(R_shock_size*100,(Cons_40/Consumption[0]-1)*100)


