/*
 * Sway Bar Spacer for Dave's Cayman
 */
$fn = 60;

PartWidth = 36;
PartLength = 67;
PartChamfer = 10;
PartThickness = 10;

HoleDiameter = 8;
HoleDistance = 50;

BushingDiameter = 40;
BushingIndent = 5;
IndentLength = 9;

// Drill holes
difference() {
    // Cut out the space for the bushing from the main part
    difference() {
	// Build a union of the main polygon and the block extending
	// into the indentation of the mounting bracket
	union() {
	    // Main polygon
	    Z_profile();

	    // Block
	    translate([-PartWidth / 2, -IndentLength / 2, PartThickness - 0.1])
		cube([PartWidth, IndentLength, BushingIndent + 0.1], center = false);
	}

	// Circular cut out for the bushing
	translate([0, 0, -BushingDiameter / 2 + BushingIndent])
	    rotate([0, 90, 0])
	    cylinder(r = BushingDiameter / 2, h = PartWidth + 2, center = true);
    }
    // The drill holes
    Holes();
}

Z_points = [
	[-PartWidth / 2 + PartChamfer, -PartLength / 2],
	[-PartWidth / 2, -PartLength / 2 + PartChamfer],
	[-PartWidth / 2, PartLength / 2 - PartChamfer],
	[-PartWidth / 2 + PartChamfer, PartLength / 2],
	[PartWidth / 2 - PartChamfer, PartLength / 2],
	[PartWidth / 2, PartLength / 2 - PartChamfer],
	[PartWidth / 2, -PartLength / 2 + PartChamfer],
	[PartWidth / 2 - PartChamfer, -PartLength / 2]
    ];

module Z_profile() {
    linear_extrude(height = PartThickness) {
        polygon(points = Z_points);
    }
}

module Holes() {
    translate([0, -HoleDistance / 2, -0.1])
	cylinder(r = HoleDiameter / 2, h = 20);
    translate([0, HoleDistance / 2, -0.1])
	cylinder(r = HoleDiameter / 2, h = 20);
}


