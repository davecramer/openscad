/*
 * Sway Bar Spacer for Dave's Cayman
 */
$fn = 30;

PartWidth = 36.1;
PartLength = 67.1;
PartChamfer = 10.1;
PartThickness = 5.1;

HoleDiameter = 8.1;
HoleDistance = 50.1;

DentLengthTop = 20.1;
DentLengthBottom = 9.1;
DentDepth = 3.1;

union() {
    difference() {
	// Take the main profile
	Z_profile();
	// cut out the indented center and the holes for the bolts
	union() {
	    translate([0, 0, PartThickness / 2])
		cube(size=[PartWidth + 0.02, DentLengthTop, PartThickness + 0.2],
		     center = true);
	    Holes();
	}
    }

    // Add the flat bottom part
    translate([0, 0, PartThickness / 2 - DentDepth])
	cube(size=[PartWidth, DentLengthBottom, PartThickness], center=true);


    // Add the angled pieces
    Angle_part();
    mirror([0, 180, 0])
	Angle_part();
}

module Angle_part() {
    hull() {
    translate([0, DentLengthBottom / 2, PartThickness / 2 - DentDepth])
    cube(size=[PartWidth, 0.01, PartThickness], center=true);
    translate([0, DentLengthTop / 2, PartThickness / 2])
    cube(size=[PartWidth, 0.01, PartThickness], center=true);
    }
}

Z_points = [
	[-PartWidth / 2 + PartChamfer, -PartLength / 2],
	[-PartWidth / 2, -PartLength / 2 + PartChamfer],
	[-PartWidth / 2, PartLength / 2 - PartChamfer],
	[-PartWidth / 2 + PartChamfer, PartLength / 2],
	[PartWidth / 2 - PartChamfer, PartLength / 2],
	[PartWidth / 2, PartLength / 2 - PartChamfer],
	[PartWidth / 2, -PartLength / 2 + PartChamfer],
	[PartWidth / 2 - PartChamfer, -PartLength / 2],
	[-PartWidth / 2 + PartChamfer, -PartLength / 2],
    ];

module Z_profile() {
    linear_extrude(height = PartThickness) {
	difference() {
	    polygon(points = Z_points);
	    /*
	    translate([0, HoleDistance / 2])
		circle(r=HoleDiameter / 2);
	    translate([0, -HoleDistance / 2])
		circle(r=HoleDiameter / 2);
	    */
	}
    }
}

module Holes() {
    union() {
	translate([0, -HoleDistance / 2, -0.1])
	    cylinder(r = HoleDiameter / 2, h = PartThickness + 0.2);
	translate([0, HoleDistance / 2, -0.1])
	    cylinder(r = HoleDiameter / 2, h = PartThickness + 0.2);
    }
}
