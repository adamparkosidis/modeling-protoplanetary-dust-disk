#! /bin/bash

# Converts Cartesian to Polar for all disks, scans them and at the same time plots the mean number of paricles as a function of disk radius with errors and curves Nmax_ri, Nmin_ri
for j in {1..12} # loop για τα 12 Χρόνια
   do

   for i in {1..12} # loop indicating 12 Months
      do      
             cp xyToRTh ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"             
             cp ScanDisk2FixedA ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
             cp ScanDisk2FixedB  ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
             cp ScanDisk2FixedC  ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
             cp ArMeanRi  ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
             cp plotMeanNri.in  ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
             cd ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
             ./xyToRTh
   	     ./ScanDisk2FixedA
             ./ScanDisk2FixedB
             ./ScanDisk2FixedC              
             ./ArMeanRi
              gnuplot < plotMeanNri.in
              ps2pdf MeanNri.ps 
               cd ~/swift/test/'TotalAfter10Myears'
 	     
      done
      done