include <../config.scad>

lowerBodySection();
//translate([0,0,bodyLowerHeight])upperBodySection();
cube([1,1,1]);

module lowerBodySection(){
holloweAngledBlockSection(
		length=bodyLength, 
		width=bodyWidth, 
	 	height=bodyLowerHeight,
	 	insetFronty=bodyLowerFrontSlopeLength,
	 	insetFrontz=bodyLowerFrontSlopeHeight, 
	 	insetBacky=bodyLowerBackSlopeLength,
	 	insetBackz=bodyLowerBackSlopeHeight);
	   // pillars
		
		translate([0,0,bodyLowerHeight-10])
		for(index=[0:len(holeLocations)-1]){
			translate(holeLocations[index]){	
				difference(){
				cylinder(h=10,r=6);
				translate([0,0,-d])
					cylinder(h=10+2*d,r=2);
				}
			}
		}
}

module upperBodySection(){
	difference(){
		union(){
		translate([0,0,bodyUpperHeight])
			mirror([0,0,1])
				holloweAngledBlockSection(
						length=bodyLength, 
						width=bodyWidth, 
					 	height=bodyUpperHeight,
					 	insetFronty=bodyUpperFrontSlopeLength,
					 	insetFrontz=bodyUpperFrontSlopeHeight, 
					 	insetBacky=bodyUpperBackSlopeLength,
					 	insetBackz=bodyUpperBackSlopeHeight);
			// pillars
			for(index=[0:len(holeLocations)-1]){
				translate(holeLocations[index]){
					cylinder(h=bodyUpperHeight,r=6);
				}
			}
		}	
		//cut outs
		for(index=[0:len(holeLocations)-1]){
				translate(holeLocations[index]){
					screwCutout(height=bodyUpperHeight, radius=6);				
				}
					
		}
	}
}

module screwCutout(radius=6, innerRadius=2, screwRadius=0.5, ,wallThickness =1, height=20){
		translate([0,0,wallThickness]){
			cylinder(h=height+d,r=innerRadius);
		}
		translate([0,0,-d]){
			cylinder(h=height+d,r=screwRadius);
		}
		translate([0,0,height-5]){
			cylinder(h=5+d,r2=radius, r1=innerRadius);
		}
}

module holloweAngledBlockSection(
		length, 
		width, 
		height,
		insetFronty,
		insetFrontz,
		insetBacky,
		insetBackz){
	difference(){
		angledBlockSection(length=length, 
					 width=width, 
					 height=height,
					 insetFronty=insetFronty,
					 insetFrontz=insetFrontz, 
					 insetBacky=insetBacky,
					 insetBackz=insetBackz);
	
		translate([0,0,bodyThickness+d])
			angledBlockSection(length=length-bodyThickness*2, 
					 width=width-bodyThickness*2, 
					 height=height-bodyThickness,
					 insetFronty=insetFronty,
					 insetFrontz=insetFrontz, 
					 insetBacky=insetBacky,
					 insetBackz=insetBackz);
	}
}

module angledBlockSection(length, 
								 width, 
								 height,
								 insetFronty,
								 insetFrontz,
								 insetBacky,
								 insetBackz){
	hull(){
		//bottom front
		translate([-width/2,-d+length/2-insetFronty,0])
			cube([width,d,d]);

		//bottom back
		translate([-width/2,-length/2+insetBacky,0])
			cube([width,d,d]);

		//front
		translate([-width/2,-d+length/2,insetFrontz])
			cube([width,d,d]);

		//back
		translate([-width/2,-length/2,insetBackz])
			cube([width,d,d]);
		
		//upper front
		translate([-width/2,-d+length/2,height-d])
			cube([width,d,d]);

		//upper back
		translate([-width/2,-length/2,height-d])
			cube([width,d,d]);
	}
}

