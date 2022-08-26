!	****************************************************************************
!	  Create a distribution of Test Particles in the plane of the planet's orbit,
!     with circular orbits and random mean anomaly.
!	****************************************************************************
!         
    
    
    program gen_TP

    include 'swift.inc'

    real*8 PI
    parameter (Pi=dacos(-1.d0))
    real, dimension(1) :: random
    integer i, ntp, ialpha, j
    real*8 amax,amin, gm,a,e,inc,capom,omega,capm,num
    real*8 x,y,z,vx,vy,vz,gm2,conv
    real*8 mpl, da
    real*8 ran,rstat(NTPMAX,NSTATR)
    integer istat(NTPMAX,NSTAT)

    open (unit=27, file='tp.txt', status='old')

    read(27,*) ntp
    read(27,*) e,inc,capom,omega

    ialpha= -1
    conv = 4.d0*PI*PI
    gm = 1
    mpl = 0
    amin = 2.5d0

    a = amin
    amax = 7.5d0
    da = (amax-amin)/10000.d0

    open(unit=26,file='tp.in',status='unknown')

    write(26,*) ntp

        do i=1,ntp
               inc=inc*PI/180.d0
               capom=capom*PI/180.d0
               omega=omega*PI/180.d0
               gm2 = (gm+mpl)*conv
               call random_number(random)
               random = random * 360.d0
               capm = random(1)
               capm = capm*PI/180.d0
               call orbel_el2xv(gm2,ialpha,a,e,inc,capom,omega,capm,x,y,z,vx,vy,vz)

        do j=1,NSTAT
               istat(i,j) = 0
        enddo

        do j=1,NSTATR
               rstat(i,j) = 0.0d0
        enddo

              write(26,*) x,y,z
              write(26,*) vx,vy,vz
              write(26,*) (istat(i,j),j=1,NSTAT)
              write(26,*) (rstat(i,j),j=1,NSTATR)
              a = a + da
        enddo
    

    close(26)
    close(27)
    end