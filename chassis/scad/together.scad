include <config.scad>
use <components/body.scad>

//cube allows all components to be visible using %
cube([d,d,d]);


%lowerBodySection();

translate([0,0,bodyLowerHeight])
	%upperBodySection();
