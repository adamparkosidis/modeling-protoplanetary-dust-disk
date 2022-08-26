#! /bin/bash

# Stores the inputs for each run (12x12) in each folder (0,1,2,D,E,F,G,H,I,J,K,L) so that the NewCp.sh program can take them and output the disks "system snapshots" every timestep(0.2 years)

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run 0'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run 0'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run 1'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run 1'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run 2'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run 2'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run D'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run D'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run E'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run E'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run F'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run F'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run G'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run G'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run H'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run H'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run I'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run I'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run J'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run J'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run K'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run K'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done

for j in {1..12} # loop indicating 12 Years
   do

   for i in {1..12} # loop indicating 12 Months
      do
        cd ~/swift/test/'Run A'/""$j"ος Χρόνος"/""$i"ος Μήνας"
        cp param"$i"Mon.in ~/swift/test/'Run L'/""$j"ος Χρόνος"/""$i"ος Μήνας" 
        cd ~/swift/test/'Run L'/""$j"ος Χρόνος"/""$i"ος Μήνας"  
        cp param"$i"Mon.in param.in  
     done
  done