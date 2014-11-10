include <../config.scad>

//Calculated
RollerHalfWheelWidth= (WheelWidth-WheelInnerGroveWidth)/2-WheelInnerBevelWidth;

wheel();

//%cylinder(r=WheelRadius, h=WheelWidth);
module wheel() {	
	
	runner();
	translate([0,0,WheelWidth])
	mirror([0,0,1])
		runner();

	//middle
	translate([0,0,RollerHalfWheelWidth+WheelInnerBevelWidth])
		cylinder(r=WheelRadius-WheelInnerBevelDepth, h=WheelInnerGroveWidth);
}

module runner(){
//wheel side
	translate([0,0,WheelOuterBevelWidth])
		cylinder(r=WheelRadius, h=RollerHalfWheelWidth-WheelOuterBevelWidth);

	//inner bevel
	translate([0,0,RollerHalfWheelWidth])
		cylinder(r1=WheelRadius, r2=WheelRadius-WheelInnerBevelDepth, h=WheelInnerBevelWidth);

	//outer bevel
		cylinder(r1=WheelRadius-WheelOuterBevelDepth, r2=WheelRadius, h=WheelOuterBevelWidth);
}
