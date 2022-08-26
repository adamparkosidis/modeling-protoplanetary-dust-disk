#! /bin/bash

# Executes the 12x12 Run, saves the input and output from each run and at the same time takes the output of each run as input for the next one. This is how the "system snapshot" disks are taken every timestep (0.2 years). Depending on which track it runs on, we change the name 'Run x' where x=(0,1,2,D,E,F,G,H,I,J,K,L)

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..11} # loop indicating 12 Months
      do
	 ./swift_mvs < mvs.in
         
          cp dump_param.dat ""$j"ος Χρόνος"/""$i"ος Μήνας"/dump_param"$i"Mon.dat
          cd ~/swift/test/'Run 0'/""$j"ος Χρόνος"/""$((i+1))"ος Μήνας"
          mv param.in ~/swift/test/'Run 0'
          cd ~/swift/test/'Run 0'
	  cp dump_pl.dat ""$j"ος Χρόνος"/""$i"ος Μήνας"/dump_pl"$i"Mon.dat
	  cp dump_pl.dat pl.in
	  cp dump_pl.dat ""$j"ος Χρόνος"/""$((i+1))"ος Μήνας"/pl"$((i+1))"Mon.in
          cp dump_tp.dat ""$j"ος Χρόνος"/""$i"ος Μήνας"/dump_tp"$i"Mon.dat
	  cp dump_tp.dat tp.in
	  cp dump_tp.dat ""$j"ος Χρόνος"/""$((i+1))"ος Μήνας"/tp"$((i+1))"Mon.in          
          echo " Τέλος "$j" χρόνος "$i" run"
			  
      done
      ./swift_mvs < mvs.in
      cp dump_param.dat ""$j"ος Χρόνος"/'12ος Μήνας'/dump_param12Mon.dat
      cp dump_pl.dat ""$j"ος Χρόνος"/'12ος Μήνας'/dump_pl12Mon.dat
      cp dump_tp.dat ""$j"ος Χρόνος"/'12ος Μήνας'/dump_tp12Mon.dat
      if [ $j -lt 12 ]
      then
      cd ~/swift/test/'Run 0'/""$((j+1))"ος Χρόνος"/"1ος Μήνας"      
      mv param.in ~/swift/test/'Run 0'
      cd ~/swift/test/'Run 0'
      cp dump_pl.dat pl.in
      cp dump_pl.dat ""$((j+1))"ος Χρόνος"/'1ος Μήνας'/pl1Mon.in
      cp dump_tp.dat tp.in
      cp dump_tp.dat ""$((j+1))"ος Χρόνος"/'1ος Μήνας'/tp1Mon.in
      fi
    done