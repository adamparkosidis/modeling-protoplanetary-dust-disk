#! /bin/bash

# Combines the final x,y,z from the three runs (A,B,C) into one document,TotalTP_xyz.dat

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
	     cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
	     cp TP_xyz"$i"Μon.dat TP_xyz"$i"AMon.dat
	     cp TP_xyz"$i"AMon.dat  ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
	     cd ~/swift/test/'Run B'/""$j"ος Χρόνος"/""$i"ος Μήνας"
	     cp TP_xyz"$i"Μon.dat TP_xyz"$i"BMon.dat
	     cp TP_xyz"$i"BMon.dat ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
	     cd ~/swift/test/'Run C'/""$j"ος Χρόνος"/""$i"ος Μήνας"
             cp TP_xyz"$i"Μon.dat TP_xyz"$i"CMon.dat
	     cp TP_xyz"$i"CMon.dat ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
	     sed -n '6p' pl"$i"Mon.dat > ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"/Jup_xyz.dat
	     cd  ~/swift/test/'TotalAfter10Myears'/""$j"ος Χρόνος"/""$i"ος Μήνας"
	     cat TP_xyz"$i"AMon.dat TP_xyz"$i"BMon.dat TP_xyz"$i"CMon.dat >> TotalTP_xyz.dat
      done
      done