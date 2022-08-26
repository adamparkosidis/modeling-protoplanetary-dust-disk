!	****************************************************************************
!	  Filters out the non active test particles and keeps the active ones
!	****************************************************************************
   

        program activeTP						
	
	 implicit none
         
         real*8 x, y, z, ux, uy, uz
         integer i, j, l, ntp, k
         integer, dimension(1:53) :: pointer1
         real, dimension(1:53) :: pointer2

         open (unit=30, file='notActiveTP_tp.dat', status='unknown')
         open (unit=29, file='TP_xyz.dat', status='unknown')
         open (unit=28, file='dump_tp.dat', status='old')

	 read(28,*) ntp
         i = 2

        do while (i <= 50985) 
           read(28,*) x, y ,z
           read(28,*) ux, uy ,uz
           read(28,*) pointer1
           read(28,*) pointer2
           if (pointer1(1) .eq. 0) then
            write(29,*) x, y, z
           else
            write(30,*) x, y, z
           endif
           i = i + 17
        enddo
        close(28)
        close(30)
        close(29)
       end