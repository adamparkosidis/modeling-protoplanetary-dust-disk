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
frequency = np.flip(Physical_cons["c"]/wavelengths)


def Planck(nu, T):  #Define Planck's Function
    return (2*Physical_cons["h"]*nu**3/Physical_cons["c"]**2)*(1/(np.exp(Physical_cons["h"]*nu/(Physical_cons["k"]*T))-1))

def Convert_to_mJy(value): #mjansky
    return value*(10**26)

Bsun = Planck(frequency, Suns_param["temperature"])
Fl_sun = Bsun*(Suns_param["R_Sun"]/Suns_param["D"])**2 # μονοχρωματική ροή ακτινοβολίας 
Fl_sun = Convert_to_mJy(Fl_sun)


#Sun's Flux PLot
plt.figure()
plt.plot(frequency, Fl_sun,  color='black')
plt.xscale("log")
plt.yscale("log")
plt.xlabel("ν (Hz)")
plt.ylabel(r"$F_ν (mJy)$")
plt.title("Sun's Flux")
plt.grid()

def sum_over_T(nu):
   return sum((2*np.pi*data['Rmean']*Dr/Suns_param["D"]**2)*(1-np.exp(-data['Surmean']*0.3821*(nu/299792000000)**2))*Planck(nu, data['Tempedust']))

Fl_disc = [Convert_to_mJy(sum_over_T(i)) for i in frequency]

#Disc's Flux PLot
plt.figure()
plt.plot(frequency, Fl_disc, color='black')
plt.xscale("log")
plt.yscale("log")
plt.ylim([10**-1, 10**6])
plt.xlabel("ν (Hz)")
plt.ylabel(r"$F_ν (mJy)$")
plt.title("Disc's Flux")
plt.grid()

System_Fl = Fl_sun[0:]+Fl_disc[0:]

#System's Flux PLot   
plt.figure()
#plt.fill_between(wavelengths, Fl, System_Fl)
#plt.plot(wavelengths, Fl,  color='blue', linestyle="--")
plt.plot(frequency, System_Fl,  color='black')
plt.xscale("log")
plt.yscale("log")
plt.xlabel("ν (Hz)")
plt.ylabel(r"$F_ν (mJy)$")
plt.title("Systems Flux")
plt.grid()


total_Flux_sun = np.sum(np.delete(Fl_sun, -1)*(frequency[1:]-frequency[:-1]))
total_Flux_disc = np.sum(np.delete(Fl_disc, -1)*(frequency[1:]-frequency[:-1]))
    
 










