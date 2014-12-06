
//screwGrip();


module screwGrip(
	inset=5,
	holeRadius=10,
	thickness=10,
	depth=3,
	length=15){
	d= 0.1;
	outerRadius=holeRadius+thickness;
	difference(){
		intersection(){
			hull(){
				cylinder(h=depth,r=outerRadius);
				translate([0,-outerRadius,0])
					cube([length,outerRadius*2,depth]);
			}
			translate([-outerRadius*2,-outerRadius,0])
				cube([length+outerRadius*2,outerRadius*2,depth]);
		}
		translate([0,0,-d])
			cylinder(h=depth+2*d,r=holeRadius);
	}
}
