# Thermo-mechanical-simulation-of-a-braking-disc--using-Abaqus-
This repository contains one of my personal school project concerning the study of the heating and the thermo mechanical sollicitations of a Formula Student car. 
This work was made in collaboration with my school and the student association Formul'UT.

# <p align="center">  HOW TO USE </p>

## <p align="center"> The abaqus cae file: </p>



The cae file is named “Disc_Analysis.cae” (with its .jnl file). You can find all three models :
	-	“Heat_transfer”
	-	“Thermo-Meca-No_expansion”
	-	“Thermo-Meca-No_shear”
	directly in it. If you want to use these models, make sure that you add the subroutine to the job and for the thermo-mechanical models, the HT predefined field.


  
## <p align="center"> Lap_data.xlsx excel file: </p>



This file contains the data of the lap. The first page contains the speed and acceleration data, the second one contains the braking intensity data. You can modify any data you want, as long as it respects the previous scheme.
Note: All acceleration values need to be floats and not the results from excel formulas. It is helpful for the python script From_xlsx_to_for.py that reads directly into the excel file.


 
## <p align="center"> From xlsx to Fortran python script: </p>

This code permits to modify the desired Fortran file by adding the information of the lap (from lap_data.xlsx) directly into the Fortran file.
Firstly, the code will ask you which Fortran file needs to be modified. If the lap information is already present in the subroutine file, it will ask you if you want to erase it.

Subroutines available: “SubRoutines_dflux_and_film_test.for” and “SubRoutines_utracload_and_dload.for”

Note: Sometimes, the script creates extra lines that are not releavant (not harmful) for the study, don’t hesitate to erase them directly in the subroutine file.




## <p align="center"> Subroutines files: </p>



Note: The structures of the subroutines files are very important. Do not erase these following lines:

“	  !b - Set the intervals for the brake values”

“	  !s - Set the intervals for the speed and the angle values”

“             !r”

“	  !/ ///////////// “


## <p align="center"> Plot the maxes: </p>



These scripts (“max_stress_abq.py” and “max_temp_abq.py”) were created to plot the max VM Stress and max Temperature during the lap duration.

- In order to reduce the number of computations made by the python script, we will gather the max temp value every 10 increments.

- Abaqus 2019 doesn't have matplotlib instaled natively so we need to launch a first code to get all max temp values and store them in a temporary file : "data_stress.txt" or "data_temp.txt"  .

### ->>>  PROCEDURE: 

/ FIRST STEP: /
We need to launch the script max_temp_abq.py using the Abaqus python environment in the Windows command panel (cmd):
"abaqus python max_temp_abq.py" or "abaqus python max_stress_abq.py"

/// SECOND STEP: ///
We need to launch the script max_temp_abq.py using the classic python environment in the Windows command panel (cmd):
"python max_plt.py" and pick the data file desired.



