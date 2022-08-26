# Dynamic Perturbations in Protoplanetary Cosmic Dust Discs in the Presence of a Giant Planet: Possible Detection with ALMA

## Introduction

This repository contains documents, code and analysis from my bachelor thesis.

## Abstract

The protoplanetary discs that surround the new born stars, which consist of gas and dust, are the uterus in which new planets are born. 
The process starts with the aggregation of dust particles (of the μm range) and ends up in complete planets. The ever-increasing large mass bodies, 
as they rotate in elliptical orbits around the stars, “clear“ their orbits from smaller particles either by attaching themselves to them
or by the phenomenon of gravitational scattering. As a result, seemingly empty (of dust and gas) rings appear at the level of the disc. 
Such discs are perceived by the strong far-IR/submillimeter radiation they emit. The amount of absorbed and emitted (at longer wavelengths) radiation 
determines the temperature of the dust. In the present work we will inductively create a flat protoplanetary dust disc (without gas) in the presence of a
giant planet. We consider that the disc has depleted its gas supply. Initially, we will go through numerical simulations to examine the dynamical evolution
of the disc’s particles and then we will try to determine the disc’s surface density profile depicting the existence of the planet on
the disc via a “pointer“. We will also choose the radiation model, on whose basis we will estimate the temperature distribution in the disc, in the 
presence of the planet, for spherical particles of the same composition and size. We then study the emergent Spectral Energy Distribution (SED) that we
receive. Finally, we will produce maps with the distribution of the thermal radiation of the dust at the Millimeter/Submillimeter range and more 
specifically, at the basic frequencies of the Attacama Large Millimeter Array (ALMA), because this is the only instrument (to date) which can reveal the 
“signature“  of a giant planet at the dynamical features of far away protoplanetary discs in our Galaxy.


## SWIFT

[SWIFT](https://www.boulder.swri.edu/~hal/swift.html) was used to numerically integrate the particle trajectories.
SWIFT is designed to integrate a set of mutually gravitationally interacting bodies together with a group of test particles which feel the gravitational
influence of the massive bodies but do not affect each other or the massive bodies

## Samples

![2D-image-disk_initially](/graphs/TotalTP_Initial.png)
![2D-image-disk](/graphs/TotalTP10Myears_xyz.png)
![2D-image-disk_flux_density](/graphs/230ConvThMRS.png) 
![disk-surface-density](/graphs/SurfDens.png) 