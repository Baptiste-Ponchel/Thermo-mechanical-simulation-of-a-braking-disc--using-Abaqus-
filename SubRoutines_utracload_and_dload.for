	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
				  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  !!!!!!!!!!!!!!! ULTRACLOAD SUBROUTINE !!!!!!!!!!!!!!!!!
				  !!!!!!!!!!!!!!!!!!!!!! (ABAQUS) !!!!!!!!!!!!!!!!!!!!!!!
				  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	  
	  SUBROUTINE UTRACLOAD(ALPHA, T_USER, KSTEP, KINC, TIME,
     1 NOEL, NPT, COORDS, DIRCOS, JLTYP, SNAME)
C
      INCLUDE 'ABA_PARAM.INC'
C
C	  !------------------------------------------------!
C	        !!!!!!! DECLARING VARIABLES !!!!!!
C	  !------------------------------------------------!
C	  
C	  !!! Abaqus variables
      DIMENSION T_USER(3), TIME(2), COORDS(3), DIRCOS(3,3)
      CHARACTER*80 SNAME
C	  
C	  !!! Model variables
	  real(8) :: pad_number_of_nodes
C		
C	  !!! Physical variables
	  real(8) :: a,b,c
	  real(8) :: tire_radius,N,friction_coef
C	  
C	  !!! Quiete variables in the program
	  real, dimension(3) :: Node_coordinates_rotated
C	  
C	  !!! Declaring the changing variables for motion of the pad  !!!!
	  real(8) :: angle_i, speed_i, brake_i
	  COMMON /PHYBLOCK/ angle_i, speed_i, brake_i
C	  
C	  !!! To enter :
	  tire_radius = 320
	  friction_coef = 0.4
	  N = 8178
C	  
	  pad_number_of_nodes = 339 !Use the code "Get_number_pad_nodes.py" to get the number of node for one pad
	  total_nb_nodes = 14234
C	  
C	  !------------------------------------------------!
C	  !!!!!!! GET VARIABLES FORM THE VARIABLES FILE !!!!!!
C	  !------------------------------------------------!
C	  
C	  !Defined by the "from_xlsx_to_for.py" file, do not modify
C	  
	  angle_i = 0
C	  
	  !b - Set the intervals for the brake values
      !r
      IF((TIME(2) .LE. 1.2416666666666667) .AND. (TIME(2) .GT. 0)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 2.0334523809523812) .AND. (TIME(2) .GT. 1.2416666666666667)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 2.8252380952380953) .AND. (TIME(2) .GT. 2.0334523809523812)) THEN
        brake_i = -1.2629679747406408*TIME(2) + 3.568185235302963
      ENDIF
      IF((TIME(2) .LE. 5.207071428571428) .AND. (TIME(2) .GT. 2.8252380952380953)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 7.886633928571428) .AND. (TIME(2) .GT. 5.207071428571428)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 8.574758928571429) .AND. (TIME(2) .GT. 7.886633928571428)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 9.262883928571428) .AND. (TIME(2) .GT. 8.574758928571429)) THEN
        brake_i = -1.4532243415077215*TIME(2) + 13.46104839756067
      ENDIF
      IF((TIME(2) .LE. 10.346217261904762) .AND. (TIME(2) .GT. 9.262883928571428)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 11.795342261904763) .AND. (TIME(2) .GT. 10.346217261904762)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 12.858907835675232) .AND. (TIME(2) .GT. 11.795342261904763)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 13.9224734094457) .AND. (TIME(2) .GT. 12.858907835675232)) THEN
        brake_i = -0.9402335170128528*TIME(2) + 13.090376139281055
      ENDIF
      IF((TIME(2) .LE. 17.928723409445745) .AND. (TIME(2) .GT. 13.9224734094457)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 21.8201707778668) .AND. (TIME(2) .GT. 17.928723409445745)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 23.0538216506934) .AND. (TIME(2) .GT. 21.8201707778668)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 24.28747252352) .AND. (TIME(2) .GT. 23.0538216506934)) THEN
        brake_i = -0.8106021095812554*TIME(2) + 19.687476463962092
      ENDIF
      IF((TIME(2) .LE. 26.121124725235216) .AND. (TIME(2) .GT. 24.28747252352)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 27.471342116539564) .AND. (TIME(2) .GT. 26.121124725235216)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 28.198298638278683) .AND. (TIME(2) .GT. 27.471342116539564)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 28.9252551600178) .AND. (TIME(2) .GT. 28.198298638278683)) THEN
        brake_i = -1.3755980861244237*TIME(2) + 39.7895256387811
      ENDIF
      IF((TIME(2) .LE. 32.93150516001783) .AND. (TIME(2) .GT. 28.9252551600178)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 35.437393317912566) .AND. (TIME(2) .GT. 32.93150516001783)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 36.52075046076973) .AND. (TIME(2) .GT. 35.437393317912566)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 37.6041076036269) .AND. (TIME(2) .GT. 36.52075046076973)) THEN
        brake_i = -0.9230566361178667*TIME(2) + 34.71072106881814
      ENDIF
      IF((TIME(2) .LE. 40.993107603626854) .AND. (TIME(2) .GT. 37.6041076036269)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 43.135964746484) .AND. (TIME(2) .GT. 40.993107603626854)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 43.8281903562401) .AND. (TIME(2) .GT. 43.135964746484)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 44.5204159659962) .AND. (TIME(2) .GT. 43.8281903562401)) THEN
        brake_i = -1.444615723408935*TIME(2) + 64.3148929171843
      ENDIF
      IF((TIME(2) .LE. 45.58291596599619) .AND. (TIME(2) .GT. 44.5204159659962)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 46.80916596599619) .AND. (TIME(2) .GT. 45.58291596599619)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 47.2296659659962) .AND. (TIME(2) .GT. 46.80916596599619)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 47.6501659659962) .AND. (TIME(2) .GT. 47.2296659659962)) THEN
        brake_i = -2.3781212841854704*TIME(2) + 113.31787387870568
      ENDIF
      IF((TIME(2) .LE. 48.19302310885334) .AND. (TIME(2) .GT. 47.6501659659962)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 52.243023108853336) .AND. (TIME(2) .GT. 48.19302310885334)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 53.52539152990567) .AND. (TIME(2) .GT. 52.243023108853336)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 54.807759950958) .AND. (TIME(2) .GT. 53.52539152990567)) THEN
        brake_i = -0.7798071003490429*TIME(2) + 42.739480363982956
      ENDIF
      IF((TIME(2) .LE. 55.4702599509586) .AND. (TIME(2) .GT. 54.807759950958)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 57.46960205622176) .AND. (TIME(2) .GT. 55.4702599509586)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 58.40323667160638) .AND. (TIME(2) .GT. 57.46960205622176)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 59.336871286991) .AND. (TIME(2) .GT. 58.40323667160638)) THEN
        brake_i = -1.0710828235391003*TIME(2) + 63.55470363804649
      ENDIF
      IF((TIME(2) .LE. 59.80829985841956) .AND. (TIME(2) .GT. 59.336871286991)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 61.647530627650326) .AND. (TIME(2) .GT. 59.80829985841956)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. 62.35820562765031) .AND. (TIME(2) .GT. 61.647530627650326)) THEN
        brake_i = 1
      ENDIF
      IF((TIME(2) .LE. 63.068880627650294) .AND. (TIME(2) .GT. 62.35820562765031)) THEN
        brake_i = -1.4071129559925666*TIME(2) + 88.74503905111533
      ENDIF
      IF((TIME(2) .LE. 64.01888062765033) .AND. (TIME(2) .GT. 63.068880627650294)) THEN
        brake_i = 0
      ENDIF
      IF((TIME(2) .LE. None) .AND. (TIME(2) .GT. 64.01888062765033)) THEN
        brake_i = 0
      ENDIF
	  !/ /////////////
	  
	  !s - Set the intervals for the speed and the angle values
      !r
      do j=1,2
        IF((TIME(2) .LE. 1.242) .AND. (TIME(2) .GT. 0)) THEN
             speed_i = 36.242*TIME(2) + (35.0)
             angle_i = angle_i + abs(((speed_i - 35)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((80 - 35)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 2.825) .AND. (TIME(2) .GT. 1.242)) THEN
             speed_i = -22.102*TIME(2) + (107.450684)
             angle_i = angle_i + abs(((speed_i - 80)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((45 - 80)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 5.207) .AND. (TIME(2) .GT. 2.825)) THEN
             speed_i = 45
             angle_i = angle_i + abs(((speed_i - 45)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((45 - 45)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 7.887) .AND. (TIME(2) .GT. 5.207)) THEN
             speed_i = 14.928*TIME(2) + (-32.730096)
             angle_i = angle_i + abs(((speed_i - 45)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((85 - 45)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 9.263) .AND. (TIME(2) .GT. 7.887)) THEN
             speed_i = -29.064*TIME(2) + (314.22776799999997)
             angle_i = angle_i + abs(((speed_i - 85)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((45 - 85)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 10.346) .AND. (TIME(2) .GT. 9.263)) THEN
             speed_i = 45
             angle_i = angle_i + abs(((speed_i - 45)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((45 - 45)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 11.795) .AND. (TIME(2) .GT. 10.346)) THEN
             speed_i = 27.603*TIME(2) + (-240.58063800000002)
             angle_i = angle_i + abs(((speed_i - 45)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((85 - 45)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 13.922) .AND. (TIME(2) .GT. 11.795)) THEN
             speed_i = -28.677*TIME(2) + (423.245215)
             angle_i = angle_i + abs(((speed_i - 85)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 85)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 17.929) .AND. (TIME(2) .GT. 13.922)) THEN
             speed_i = 24
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 21.82) .AND. (TIME(2) .GT. 17.929)) THEN
             speed_i = 19.53*TIME(2) + (-326.15337)
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((100 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 24.287) .AND. (TIME(2) .GT. 21.82)) THEN
             speed_i = -30.803*TIME(2) + (772.1214600000001)
             angle_i = angle_i + abs(((speed_i - 100)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 100)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 26.121) .AND. (TIME(2) .GT. 24.287)) THEN
             speed_i = 24
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 27.471) .AND. (TIME(2) .GT. 26.121)) THEN
             speed_i = 34.069*TIME(2) + (-865.916349)
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((70 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 28.925) .AND. (TIME(2) .GT. 27.471)) THEN
             speed_i = -31.639*TIME(2) + (939.1549689999999)
             angle_i = angle_i + abs(((speed_i - 70)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 70)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 32.932) .AND. (TIME(2) .GT. 28.925)) THEN
             speed_i = 24
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 35.437) .AND. (TIME(2) .GT. 32.932)) THEN
             speed_i = 30.329*TIME(2) + (-974.7946280000001)
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((100 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 37.604) .AND. (TIME(2) .GT. 35.437)) THEN
             speed_i = -32.307*TIME(2) + (1244.863159)
             angle_i = angle_i + abs(((speed_i - 100)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((30 - 100)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 40.993) .AND. (TIME(2) .GT. 37.604)) THEN
             speed_i = 30
             angle_i = angle_i + abs(((speed_i - 30)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((30 - 30)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 43.136) .AND. (TIME(2) .GT. 40.993)) THEN
             speed_i = 16.333*TIME(2) + (-639.5386689999999)
             angle_i = angle_i + abs(((speed_i - 30)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((65 - 30)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 44.52) .AND. (TIME(2) .GT. 43.136)) THEN
             speed_i = -29.615*TIME(2) + (1342.47264)
             angle_i = angle_i + abs(((speed_i - 65)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 65)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 45.583) .AND. (TIME(2) .GT. 44.52)) THEN
             speed_i = 24
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 46.809) .AND. (TIME(2) .GT. 45.583)) THEN
             speed_i = 29.358*TIME(2) + (-1314.225714)
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((60 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 47.65) .AND. (TIME(2) .GT. 46.809)) THEN
             speed_i = -29.727*TIME(2) + (1451.491143)
             angle_i = angle_i + abs(((speed_i - 60)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((35 - 60)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 48.193) .AND. (TIME(2) .GT. 47.65)) THEN
             speed_i = 35
             angle_i = angle_i + abs(((speed_i - 35)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((35 - 35)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 52.243) .AND. (TIME(2) .GT. 48.193)) THEN
             speed_i = 16.049*TIME(2) + (-738.4494569999999)
             angle_i = angle_i + abs(((speed_i - 35)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((100 - 35)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 54.808) .AND. (TIME(2) .GT. 52.243)) THEN
             speed_i = -29.633*TIME(2) + (1648.116819)
             angle_i = angle_i + abs(((speed_i - 100)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 100)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 55.47) .AND. (TIME(2) .GT. 54.808)) THEN
             speed_i = 24
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((24 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 57.47) .AND. (TIME(2) .GT. 55.47)) THEN
             speed_i = 38.013*TIME(2) + (-2084.5811099999996)
             angle_i = angle_i + abs(((speed_i - 24)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((100 - 24)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 59.337) .AND. (TIME(2) .GT. 57.47)) THEN
             speed_i = -34.81*TIME(2) + (2100.5307000000003)
             angle_i = angle_i + abs(((speed_i - 100)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((35 - 100)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 59.808) .AND. (TIME(2) .GT. 59.337)) THEN
             speed_i = 35
             angle_i = angle_i + abs(((speed_i - 35)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((35 - 35)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 61.648) .AND. (TIME(2) .GT. 59.808)) THEN
             speed_i = 35.341*TIME(2) + (-2078.674528)
             angle_i = angle_i + abs(((speed_i - 35)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((100 - 35)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 63.069) .AND. (TIME(2) .GT. 61.648)) THEN
             speed_i = -35.178*TIME(2) + (2268.653344)
             angle_i = angle_i + abs(((speed_i - 100)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((50 - 100)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. 64.019) .AND. (TIME(2) .GT. 63.069)) THEN
             speed_i = 50
             angle_i = angle_i + abs(((speed_i - 50)/2) + 35)/(tire_radius*3.6/1000)
             exit
        ELSE
             angle_i = angle_i + abs(((50 - 50)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

        IF((TIME(2) .LE. None) .AND. (TIME(2) .GT. 64.019)) THEN
             speed_i = 35.341*TIME(2) + (-2212.495479)
             angle_i = angle_i + abs(((speed_i - 50)/2) + 35)/(tire_radius*3.6)
             exit
        ELSE
             angle_i = angle_i + abs(((None - 50)/2) + 35)/(tire_radius*3.6/1000)
        ENDIF

      end do
	  !/ /////////////

	  !------------------------------------------------!
	  !!!!!!! DEFINE THE BRAKE INTENSITY FOR THE NODES !!!!!!
	  !------------------------------------------------!
	  
	  X=Coords(1)
	  Y=Coords(2)
	  Z=Coords(3)
	  
	  a = 27.0
	  b = 35.0
	  c = 86.0
	  
	  angle_i =  modulo(angle_i, 2*3.1416)
	 
	  Node_coordinates_rotated(1) = COS(angle_i)* X + SIN(angle_i)* Y
	  Node_coordinates_rotated(2) = -SIN(angle_i)* X + COS(angle_i)* Y
      Node_coordinates_rotated(3) = Z

	  IF ((Node_coordinates_rotated(1) .LE. (b/2))  .AND. (Node_coordinates_rotated(1) .GE. (-b/2))) THEN
		  IF ((Node_coordinates_rotated(2) .LE. (a+c)) .AND. (Node_coordinates_rotated(2) .GE. (c))) THEN
			ALPHA = brake_i*(N*friction_coef/(a*b))
			
			!Alpha in N/mm2
		  ELSE
			ALPHA = 0
		  ENDIF
	  ELSE
		  ALPHA = 0
	  ENDIF

      RETURN
      END
	  
	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	  
				  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				  !!!!!!!!!!!!!!!!! DLOAD SUBROUTINE !!!!!!!!!!!!!!!!!!!!
				  !!!!!!!!!!!!!!!!!!!!!! (ABAQUS) !!!!!!!!!!!!!!!!!!!!!!!
				  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	 
				  
      SUBROUTINE DLOAD(F,KSTEP,KINC,TIME,NOEL,NPT,LAYER,KSPT,
     1 COORDS,JLTYP,SNAME)
C
      INCLUDE 'ABA_PARAM.INC'
	  
C	  !------------------------------------------------!
C	        !!!!!!! DECLARING VARIABLES !!!!!!
C	  !------------------------------------------------!
C	  
C	  !!! Abaqus variables
      DIMENSION TIME(2), COORDS (3)
      CHARACTER*80 SNAME
C	  
C	  !!!! Declaring variables for the command read !!!! -> Get Angle,Speed,Brake
	  real(8) :: angle_i, speed_i, brake_i
	  COMMON /PHYBLOCK/ angle_i, speed_i, brake_i
C	  	  
C	  !!! Physical variables
	  real(8) :: a,b,c
	  real(8) :: N
	  
C	  !!! Quiete variables in the program
	  real, dimension(3) :: Node_coordinates_rotated
C	  
C	  !!! To enter :
	  N = 8178
C	  
C	  
C	  !------------------------------------------------!
C	  !!!!!!! DEFINE THE BRAKE INTENSITY FOR THE NODES !!!!!!
C	  !------------------------------------------------!
C	  
C	  
	  X=Coords(1)
	  Y=Coords(2)
	  Z=Coords(3)
C	  
	  a = 27.0
	  b = 35.0
	  c = 86.0
C	  
	  angle_i =  modulo(angle_i, 2*3.1416)
	 
	  Node_coordinates_rotated(1) = COS(angle_i)* X + SIN(angle_i)* Y
	  Node_coordinates_rotated(2) = -SIN(angle_i)* X + COS(angle_i)* Y
      Node_coordinates_rotated(3) = Z

	  IF ((Node_coordinates_rotated(1) .LE. (b/2))  .AND. (Node_coordinates_rotated(1) .GE. (-b/2))) THEN
		  IF ((Node_coordinates_rotated(2) .LE. (a+c)) .AND. (Node_coordinates_rotated(2) .GE. (c))) THEN
			F = brake_i*N/(a*b)		
			!F in N/mm2
		  ELSE
			F = 0
		  ENDIF
	  ELSE
		  F = 0
	  ENDIF

      RETURN
      END
	  