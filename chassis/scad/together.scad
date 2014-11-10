include <config.scad>
use <components/body.scad>
use <props/R-Pi.scad>
use <components/driveWheel.scad>


chassis();
translate([30,-30,40])
rotate(v=[0,0,1], a = 90)
pi();


module chassis(){

lowerBodySection();

//translate([0,0,bodyLowerHeight])
	//upperBodySection();
translate([0,wheelDrivePositionY,0])
	placedwheels();
translate([0,-wheelDrivePositionY,0])
	placedwheels();

}

module placedwheels(){
placedwheel();
mirror([1,0,0])
	placedwheel();
}

module placedwheel(){
translate([bodyWidth/2+wheelClearance,0,wheelDrivePositionZ])
	rotate(v=[0,1,0], a =90)
		rotate(v=[0,0,1], a=-$t*360)
			wheel();
}



