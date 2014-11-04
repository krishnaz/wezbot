
//Stated
Width=35;
Radius=20;
InnerGroveWidth=6;
InnerGroveDepth= 3;
InnerGroveBevel=2;
OuterBevelWidth=2;
OuterBevelDepth=1;
d=1;

$fn=20;

//Calculated
RollerHalfWidth= (Width-InnerGroveWidth)/2-InnerGroveBevel;

wheel();

//%cylinder(r=Radius, h=Width);
module wheel() {	
	
	runner();
	translate([0,0,Width])
	mirror([0,0,1])
		runner();

	//middle
	translate([0,0,RollerHalfWidth+InnerGroveBevel])
		cylinder(r=Radius-InnerGroveDepth, h=InnerGroveWidth);
}

module runner(){
//wheel side
	translate([0,0,OuterBevelWidth])
		cylinder(r=Radius, h=RollerHalfWidth-OuterBevelWidth);

	//inner bevel
	translate([0,0,RollerHalfWidth])
		cylinder(r1=Radius, r2=Radius-InnerGroveDepth, h=InnerGroveBevel);

	//outer bevel
		cylinder(r1=Radius-OuterBevelDepth, r2=Radius, h=OuterBevelWidth);
}