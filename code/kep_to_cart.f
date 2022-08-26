!	****************************************************************************
!	  Switch from Keplerian elements to Cartesians using subroutine orbel_el2xv
!	****************************************************************************
!       Inpout masses are in Msun units and outpout masses in Msun*4π^2

    program kep_to_cart						
	
    implicit none

	real*8 PI
	parameter (Pi=dacos(-1.d0))

	integer ialpha,nb,i					! ialpha: conic section (+1 or 0 or -1), nb: number of bodies (star & planets)
	real*8 gm,a,e,inc,capom,omega,capm			! set in subroutine orbel_el2xv
	real*8 x,y,z,vx,vy,vz,gm2,conv					
	real*8 mpl						! Planet Mass			
	
	ialpha= -1
      
        conv = 4.d0*PI*PI

	open(unit=12,file='pl.in',status='unknown')

	open (unit=15, file='pl.txt', status='old')

	read(15,*) nb
	read(15,*) gm

	write(12,*) nb
	write(12,*) gm*conv
	write(12,*) 0.d0, 0.d0, 0.d0
	write(12,*) 0.d0, 0.d0, 0.d0
	
	do i=2, nb
            read(15,*) mpl,a,e,inc,capom,omega,capm
		    inc=inc*PI/180.d0
		    capom=capom*PI/180.d0
		    omega=omega*PI/180.d0
		    capm=capm*PI/180.d0
		    gm2 = (gm+mpl)*conv

	        call orbel_el2xv(gm2,ialpha,a,e,inc,capom,omega,capm,x,y, z,vx,vy,vz)

		    write(12,*) mpl*conv
		    write(12,*) x,y,z
		    write(12,*) vx,vy,vz

	enddo

	close(15)

	close(12)

	end 

