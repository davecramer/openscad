echo(version=version());

module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
       
}

    l = 60;
    w = 20;
    h = 2;
    r=w/2;
    
    color("red")
        translate([0, 0, 0])
            cube([l, w,h], center = true);

// using the scale parameter a frustum can be constructed
    color("cyan"){
        translate([l/2, 0, 0])
        cylinder(h,r,r, center = true);
    }

    color("cyan"){
        translate([-l/2, 0, 0])
        cylinder(h,r,r, center = true);
    }

    color("blue") 
        translate([-10,-w/2,-h])
        rotate(90)
        prism(w,4,2, center=true);
    
    color("blue") 
        translate([10,w/2,-h])
        rotate(-90)
        prism(w,4,2, center=true);
        

// Written in 2015 by Torsten Paul <Torsten.Paul@gmx.de>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
