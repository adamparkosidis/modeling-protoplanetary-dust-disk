#!/usr/bin/env python3

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Circle
from astropy.convolution import convolve, Gaussian2DKernel
from mpl_toolkits.axes_grid1.anchored_artists import AnchoredAuxTransformBox
data = pd.read_csv("TotalTP_xyz.csv", sep=';') 



Physical_cons = {
    
    "h" : 6.6261*(10**-27), # Planck's constant [erg/sec]
    "c" : 2.99792*(10**10), # light speed [cm/sec]
    "k" : 1.3807*(10**(-16)), # Boltzmann's constant [erg/K]

    }

System_param = {
    
    "R_Sun" : 6.955/1495.9, # Sun's radious [AU]
    "D" : 100*206265, # Distance of Sun-Disc [AU]
    "temperature" : 5777.62, # Sun's Temperature [K]
    "x_max" : 20.4, # disc's radius in AU
    "npixels" : 200,
    "M_TestP" : 1.746*10**(24) # Test Particle's mass in g units 
    }

Units = {
    
    "AU" : 1.4959*10**13, # cm
    "rad" : 206265 # 1 rad to arcsec
    
    }


x_max_arcsec = System_param["x_max"]*Units["rad"]/System_param["D"] # disc's radius in arcsec
Pixel_size_arcsec = 2*x_max_arcsec/System_param["npixels"]
Pixel_Area = (2*System_param["x_max"]*Units["AU"]/System_param["npixels"])**2 # Pixel's Surface in cm^2


def Pixelization(x_axis_lim, num_pixels):
     x_points = np.linspace(-x_axis_lim, x_axis_lim, num_pixels) 
     return x_points
 

x_points = Pixelization(System_param["x_max"], System_param["npixels"]) # AU
y_points = Pixelization(System_param["x_max"], System_param["npixels"]) # AU

x_points2 = Pixelization(x_max_arcsec, System_param["npixels"]) # arcsec
y_points2 = Pixelization(x_max_arcsec, System_param["npixels"]) # arcsec


def Pixel_r(x,y) :
    return np.sqrt(x**2 + y**2) 


x_mean = (x_points[:-1] + x_points[1:])/2 # AU
y_mean = (y_points[:-1] + y_points[1:])/2 # AU
x_mean2 = (x_points2[:-1] + x_points2[1:])/2 # arcsec
y_mean2 = (y_points2[:-1] + y_points2[1:])/2 # arcsec


r = [Pixel_r(i,j) for i in x_mean for j in y_mean ]
   
r_pixel = np.array(r).reshape(199,199)
Temp_pixel = 377.54*(r_pixel)**(-1/3)


calc_TP = np.zeros((System_param["npixels"]-1, System_param["npixels"]-1))


def Find_TP(x,y):
      for i in range(System_param["npixels"]-1): 
         if np.logical_and(x_points2[i]<x, x<x_points2[i+1]): 
                for j in range(System_param["npixels"]-1):                    
                    if np.logical_and(y_points2[j]<y, y<y_points2[j+1]):                          
                        calc_TP[i,j]+=1
                        return  calc_TP 
  

    
TP_xy = np.array(data) * Units["rad"]/System_param["D"]  # arcsec  

for q in range(len(TP_xy[:,0])):
    particles_num = Find_TP(TP_xy[q,0],TP_xy[q,1])


Surf_Density = particles_num*System_param["M_TestP"]/Pixel_Area # g/cm^2


frequency = np.array([870.*10**9, 650.*10**9, 460.*10**9, 325.*10**9, 230.*10**9]) # Frequency values in GHz
th = np.array([0.0352, 0.0471, 0.0459, 0.0278, 0.0417]) # ALMA resolution (FWHM) in arcsec with θ_MRS > 0.408
th2 = np.array([0.0122, 0.0183]) # ALMA resolution (FWHM) in arcsec with θ_MRS < 0.408,  325 and 230 gHz

def Planck(nu, Temp):  #Define Planck's Function
    return (2*Physical_cons["h"]*nu**3/Physical_cons["c"]**2)*(1/(np.exp(Physical_cons["h"]*nu/(Physical_cons["k"]*Temp))-1))

Gaussian_Beam = {
    
    "Domega" : 1.133*th[0]**2, # Gaussian Beam in arcsec^2
    "dev" : th[0]/(2*np.sqrt((2*np.log(2)))),
   
    }

gaussian_input = Gaussian_Beam["dev"]/Pixel_size_arcsec

Pixels_Plane = np.zeros((System_param["npixels"]-1, System_param["npixels"]-1))

Pixels_Plane[:] = np.nan

In_Disk_pixels = (np.array(np.where(r_pixel <= 20.4))).transpose()  #pixels inside disc's radious


def Calc_Disc_Flux(x,y):
    Pixels_Plane[x,y] = (1-np.exp(-Surf_Density[x,y]*0.3821*(frequency[0]/299792000000)**2))*Planck(frequency[0], Temp_pixel[x,y])                
    Pixels_Plane[x,y] = Pixels_Plane[x,y]*10**26 # Flux to mJy/sr           
    return Pixels_Plane

Disc_Flux = Calc_Disc_Flux(In_Disk_pixels[:,0],In_Disk_pixels[:,1])

def Convert_to_mJybeam(result):  # Flux to mJy/beam    
     Disc_Flux = Gaussian_Beam["Domega"]*result/(4.25*10**10)
     return Disc_Flux

Final_result = Convert_to_mJybeam(Disc_Flux)


fig, ax = plt.subplots()
# "extent" defines the corners of the image
extent = [x_points2.min(), x_points2.max(), y_points2.min(), y_points2.max()]
im = ax.imshow(Final_result, origin='lower', interpolation='none', extent=extent, cmap='hot')
ax.set_xlabel("x(arcsec)")
ax.set_ylabel("y(arcsec)")
ax.set_title("2D Image of the Disc at 870GHz(200x200)-Unconvolved")
clb = fig.colorbar(im, ax=ax)
clb.set_label("Flux Density (mJy/beam)", rotation=-90, labelpad=20)
box = AnchoredAuxTransformBox(ax.transData, loc='upper right')
a_cirle = Circle((0.2, 0.2), th[0]/2)  # in data coordinates!
box.drawing_area.add_artist(a_cirle)
ax.add_artist(box)
plt.show()

gauss_kernel = Gaussian2DKernel(x_stddev=gaussian_input)
Final_result = convolve(Final_result, gauss_kernel)
Log_Final_result = np.log10(Final_result)


fig, ax = plt.subplots()
# "extent" defines the corners of the image
extent = [x_points2.min(), x_points2.max(), y_points2.min(), y_points2.max()]
#vmin = 80.0 
#vmax = 0.0
im = ax.imshow(Final_result, origin='lower', interpolation='none', extent=extent, cmap='hot')#, vmin=vmin, vmax=vmax)
#ax.set_xlim(-0.216/2, 0.216/2) # θ_MRS
#ax.set_ylim(-0.216/2, 0.216/2) # θ_MRS
ax.set_xlabel("x(arcsec)")
ax.set_ylabel("y(arcsec)")
ax.set_title("2D Image of the Disc at 870GHz(200x200)")
clb = fig.colorbar(im, ax=ax)
clb.set_label("Flux Density (mJy/beam)", rotation=-90, labelpad=20)
box = AnchoredAuxTransformBox(ax.transData, loc='upper right')
a_cirle = Circle((0.2, 0.2), th[0]/2)  # in data coordinates!
box.drawing_area.add_artist(a_cirle)
ax.add_artist(box)
plt.show()


fig, ax = plt.subplots()
# "extent" defines the corners of the image
extent = [x_points2.min(), x_points2.max(), y_points2.min(), y_points2.max()]
vmin = 2.3
vmax = 1.6
im = ax.imshow(Log_Final_result, origin='lower', interpolation='none', extent=extent, cmap='hot', vmin=vmin, vmax=vmax)
#ax.set_xlim(-0.216/2, 0.216/2) # θ_MRS
#ax.set_ylim(-0.216/2, 0.216/2) # θ_MRS
ax.set_xlabel("x(arcsec)")
ax.set_ylabel("y(arcsec)")
ax.set_title("2D Image of the Disc at 870GHz(200x200)")
clb = fig.colorbar(im, ax=ax)
clb.set_label("Log Flux Density (mJy/beam)", rotation=-90, labelpad=20)
box = AnchoredAuxTransformBox(ax.transData, loc='upper right')
a_cirle = Circle((0.2, 0.2), th[0]/2)  # in data coordinates!
box.drawing_area.add_artist(a_cirle)
ax.add_artist(box)
plt.show()

