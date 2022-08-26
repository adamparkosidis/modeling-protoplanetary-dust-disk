#! /bin/bash

# Merges all TPs from each folder, each year and each month into the corresponding folders for TotalAfter10MyearsAllRuns.
# It then produces the final graphs for each year and month.

for j in {1..12} # loop indicating 12 Years
   do
   for i in {1..12} # loop indicating 12 Months
      do  
        cd ~/swift/test/'TotalAfter10MyearsAllRuns'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cat TP0_"$i"Monxyz.dat TP1_"$i"Monxyz.dat TP2_"$i"Monxyz.dat TP_xyz"$i"AMon.dat TP_xyz"$i"BMon.dat TP_xyz"$i"CMon.dat TPD_"$i"Monxyz.dat TPE_"$i"Monxyz.dat TPF_"$i"Monxyz.dat TPG_"$i"Monxyz.dat TPH_"$i"Monxyz.dat TPI_"$i"Monxyz.dat TPJ_"$i"Monxyz.dat TPK_"$i"Monxyz.dat TPL_"$i"Monxyz.dat >> TotalTP_xyz.dat
        gnuplot < plotDisks.in
        ps2pdf TotalTP_xyz.ps
        mv TotalTP_xyz.pdf TotalTP-"$j","$i"_xyz.pdf
        mv TotalTP-"$j","$i"_xyz.pdf ~/swift/test/'TotalAfter10MyearsAllRuns'/'All The Disks After 10Myears'
        rm TP0_"$i"Monxyz.dat TP1_"$i"Monxyz.dat TP2_"$i"Monxyz.dat TP_xyz"$i"AMon.dat TP_xyz"$i"BMon.dat TP_xyz"$i"CMon.dat TPD_"$i"Monxyz.dat TPE_"$i"Monxyz.dat TPF_"$i"Monxyz.dat TPG_"$i"Monxyz.dat TPH_"$i"Monxyz.dat TPI_"$i"Monxyz.dat TPJ_"$i"Monxyz.dat TPK_"$i"Monxyz.dat TPL_"$i"Monxyz.dat
  done
done