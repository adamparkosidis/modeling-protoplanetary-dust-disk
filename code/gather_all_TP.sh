#! /bin/bash

# Copies activeTP.f, runs it on every folder and every 12x12 folders and copies TP_xyz.dat from every month of every folder (0,1,2,D,E,F,G,H,I,J,K,L) and collects them in the TotalAfter10MyearsAllRuns folder for the 12x12 plots

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run 0'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run 0'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run 0'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TP0_"$i"Monxyz.dat
        cp TP0_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done


for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run 1'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run 1'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run 1'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TP1_"$i"Monxyz.dat
        cp TP1_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run 2'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run 2'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run 2'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TP2_"$i"Monxyz.dat
        cp TP2_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run D'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run D'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run D'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPD_"$i"Monxyz.dat
        cp TPD_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run E'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run E'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run E'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPE_"$i"Monxyz.dat
        cp TPE_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run F'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run F'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run F'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPF_"$i"Monxyz.dat
        cp TPF_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run G'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run G'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run G'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPG_"$i"Monxyz.dat
        cp TPG_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run H'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run H'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run H'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPH_"$i"Monxyz.dat
        cp TPH_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run I'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run I'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run I'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPI_"$i"Monxyz.dat
        cp TPI_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run J'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run J'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run J'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPJ_"$i"Monxyz.dat
        cp TPJ_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run K'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run K'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run K'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPK_"$i"Monxyz.dat
        cp TPK_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run L'/'Run των 10M years'
        cp activeTP ~/swift/test/'Run L'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cd ~/swift/test/'Run L'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp dump_tp"$i"Mon.dat dump_tp.dat
        ./activeTP
        rm dump_tp.dat
        rm notActiveTP_tp.dat
        mv TP_xyz.dat TPL_"$i"Monxyz.dat
        cp TPL_"$i"Monxyz.dat ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
     done
  done