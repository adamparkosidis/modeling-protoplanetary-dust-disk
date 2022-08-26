#!/usr/bin/env python3

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
data = pd.read_csv("data.csv", sep=';') 


Physical_cons = {
    
    "h" : 6.6261*(10**-27), # Planck's constant [erg/sec]
    "c" : 2.99792*(10**10), # light speed [cm/sec]
    "k" : 1.3807*(10**(-16)), # Boltzmann's constant [erg/K]

    }

Suns_param = {
    
    "R_Sun" : 6.955/1495.9, # Sun's radious [AU]
    "D" : 100*206265, # Distance of Sun-Disc [AU]
    "temperature" : 5777.62 # Sun's Temperature [K]
    
    }

Dr = 0.17 # Width of the rings [AU]
wavelengths = np.logspace(np.log10(10**(-5)), np.log10(0.3), num=1000) #cm


def B(lamda, T):  #Define Planck's Function
    return (2*Physical_cons["h"]*Physical_cons["c"]**2/lamda**5)*(1/(np.exp(Physical_cons["h"]*Physical_cons["c"]/(lamda*Physical_cons["k"]*T))-1))

Bl_sun = B(wavelengths, Suns_param["temperature"])
Fl_sun = Bl_sun*(Suns_param["R_Sun"]/Suns_param["D"])**2 # Sun's Monochromatic Flux 
lFl_sun = wavelengths*Bl_sun*(Suns_param["R_Sun"]/Suns_param["D"])**2 # λFλ


#Sun's Flux PLot
plt.figure()
plt.plot(wavelengths, Fl_sun, color='black')
plt.ylim([10**-20, 10**-4])
plt.xscale("log")
plt.yscale("log")
plt.xlabel("λ (cm)")
plt.ylabel(r"$F_λ (erg/cm^2 \; sec \; cm$)")
plt.title("Sun's Monochromatic Flux")
plt.grid()

def sum_over_T(lamda):
    return sum((2*np.pi*data['Rmean']*Dr/Suns_param["D"]**2)*(1-np.exp(-data['Surmean']*0.003821/lamda**2))*B(lamda, data['Tempedust']))
 

Fl_disc = [sum_over_T(i) for i in wavelengths]
lFl_disc = wavelengths * Fl_disc # λFλ


#Disc's Flux PLot
plt.figure()
plt.plot(wavelengths, Fl_disc, color='black')
plt.ylim([10**-14, 10**-4])
plt.xscale("log")
plt.yscale("log")
plt.xlabel("λ (cm)")
plt.ylabel(r"$F_λ (erg/cm^2 \; sec \; cm$)")
plt.title("Disc's Monochromatic Flux")
plt.grid()

System_Fl = Fl_sun[0:]+Fl_disc[0:]
System_lFl = lFl_sun[0:]+lFl_disc[0:]

#System's SED PLot   
plt.figure()
#plt.fill_between(wavelengths, lFl_sun, System_lFl)
#plt.plot(wavelengths, lFl_sun,  color='blue', linestyle="--")
plt.plot(wavelengths, System_lFl,  color='black')
plt.ylim([10**-15, 10**-7])
plt.xscale("log")
plt.yscale("log")
plt.xlabel("λ (cm)")
plt.ylabel(r"$λF_λ (erg/cm^2 \; sec$)")
plt.title("System's SED")
plt.grid()
    

total_Flux_sun = np.sum(np.delete(Fl_sun, -1)*(wavelengths[1:]-wavelengths[:-1]))
total_Flux_disc = np.sum(np.delete(Fl_disc, -1)*(wavelengths[1:]-wavelengths[:-1]))









