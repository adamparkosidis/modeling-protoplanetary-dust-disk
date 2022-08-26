#! /bin/bash

# Stores the input and output from each run and at the same time gives the output of each run as input for the next one. This is how "system snapshots" disks are taken every timestep(0.2 years)

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..11} # loop indicating 12 Months
      do
	 ./swift_mvs < mvs.in
         
          cp dump_param.dat ""$j"ος Χρόνος"/""$i"ος Μήνας"/param"$i"Mon.dat
	  nano dump_param.dat
	  cp dump_param.dat param.in
	  cp dump_param.dat ""$j"ος Χρόνος"/""$((i+1))"ος Μήνας"/param"$((i+1))"Mon.in
	  cp dump_pl.dat ""$j"ος Χρόνος"/""$i"ος Μήνας"/pl"$i"Mon.dat
	  cp dump_pl.dat pl.in
	  cp dump_pl.dat ""$j"ος Χρόνος"/""$((i+1))"ος Μήνας"/pl"$((i+1))"Mon.in
          cp dump_tp.dat ""$j"ος Χρόνος"/""$i"ος Μήνας"/tp"$i"Mon.dat
	  cp dump_tp.dat tp.in
	  cp dump_tp.dat ""$j"ος Χρόνος"/""$((i+1))"ος Μήνας"/tp"$((i+1))"Mon.in          
          echo " Τέλος "$j" χρόνος "$i" run"
			  
      done
      ./swift_mvs < mvs.in
      cp dump_param.dat ""$j"ος Χρόνος"/'12ος Μήνας'/param12Mon.dat
      cp dump_pl.dat ""$j"ος Χρόνος"/'12ος Μήνας'/pl12Mon.dat
      cp dump_tp.dat ""$j"ος Χρόνος"/'12ος Μήνας'/tp12Mon.dat
      if [ $j -lt 12 ]
      then
      nano dump_param.dat
      cp dump_param.dat param.in
      cp dump_param.dat ""$((j+1))"ος Χρόνος"/'1ος Μήνας'/param1Mon.in
      cp dump_pl.dat pl.in
      cp dump_pl.dat ""$((j+1))"ος Χρόνος"/'1ος Μήνας'/pl1Mon.in
      cp dump_tp.dat tp.in
      cp dump_tp.dat ""$((j+1))"ος Χρόνος"/'1ος Μήνας'/tp1Mon.in
      fi
    done