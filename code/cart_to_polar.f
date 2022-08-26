!	****************************************************************************
!	  Switch from Cartesian elements to Polar coordinates 
!	****************************************************************************

    program xart_to_polar

    implicit none

    integer i
    real*8 x,y,z,r,Th,rad,Dr

    open(unit=34,file='TotalTP_xyz.dat',status='old')
    open(unit=35,file='TotalTP_RTh.dat',status='unknown')
    open(unit=36,file='Jup_xyz.dat',status='unknown')

    read(34,*) x,y,z
    r = sqrt(x*x+y*y)
    Th = Atan2(y,x)
    rad = Th
    Th = Th*180.d0/PI
    Th = dmod(Th,360.d0)

    if (Th .lt. 0.d0) then
      Th = Th + 360.d0
    endif

    print*, "Jupiter's angle(degree/rad) and radius are:",Th,rad,r
    write(36,*) x,y,z,Th,rad,r

        do i=2,17295
               read(34,*) x,y,z
               r = sqrt(x*x+y*y)
               Th = Atan2(y,x)
               rad = Th
               Th = Th*180.d0/PI
               Th = dmod(Th,360.d0)
        if (Th .lt. 0.d0) then
             Th = Th + 360.d0
        endif
        write(35,*) x,y,z,Th,rad,r
        enddo
    close(34)
    close(35)
    close(36)

    end
