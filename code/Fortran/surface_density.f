!	****************************************************************************
!	  Calculates the disk surface density profile in g/cm^2
!	****************************************************************************

    program surface_density
    
    implicit none

    character(len=50) :: f1  
    character(len=80) :: f2 

    real, dimension(120) :: MeanAv
    real, dimension(120) :: radius
    real, dimension(120) :: Variance
    real, dimension(120) :: VarianceSurDen
    real, dimension(120) :: maxNri
    real, dimension(120) :: minNri
    real, dimension(120) :: Area
    real, dimension(120) :: Density
    real, dimension(120) :: DensityPerc
    real, dimension(120) :: maxSr
    real, dimension(120) :: minSr
    real, dimension(120) :: DustT

    real*8 PI
    parameter (Pi=dacos(-1.d0))

    integer i 
    real*8 MassDisk,cm,Rmean,g
    
    f1 ="(1f5.2,9(3x,f11.8))"
    f2 ="(1f6.3,1(3x,f6.3),4(3x,E16.5),1(3x,f10.5))"

    open(unit=39,file='ArMeanRi.dat',status='old') 
    open(unit=40,file='SurfaceDensity.dat',status='unknown')
    
    cm = (1.4959d0**2)*(10**26) ! AU to cm
    MassDisk = 5.3135E22 ! gramms
    Rmean = 0.d0

    do i=1, 120
       read(39,f1) radius(i),MeanAv(i),Variance(i),maxNri(i),minNri(i),Density(i),VarianceSurDen(i),maxSr(i),minSr(i),DensityPerc(i)  
       Rmean = (Rmean + radius(i))/2.d0
       g = Rmean**(1d0/3d0)
       DustT(i) = 377.54d0/g ! Μέση Θερμοκρασία κάθε δακτυλίου
       Density(i) = (Density(i)/cm)*MassDisk ! Μέση Επιφανειακή Πυκνότητα κάθε δακτυλίου
       VarianceSurDen(i) = (VarianceSurDen(i)/cm)*MassDisk
       maxSr(i) = (maxSr(i)/cm)*MassDisk
       minSr(i) = (minSr(i)/cm)*MassDisk     
       write(40,f2) radius(i),Rmean,Density(i),maxSr(i),minSr(i),VarianceSurDen(i),DustT(i)
       Rmean = radius(i)
    enddo

    close(39)
    close(40)

    
    end