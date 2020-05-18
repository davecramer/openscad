echo(version=version());

module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
       
}

    l = 67;
    w = 36;
    thickness = 4;
    r=w/2;
    recessDepth=4;
    chamferLength=4;
    
        
    union() {

    color("red")
            translate([-l/2, -w/2, 0])
            cube([(l-20)/2-chamferLength, w,thickness] );

    color("red")
// figure out where 1.5 came frome        
            translate([l/2-r-1.5, -w/2, 0])
            cube([(l-20)/2-chamferLength, w,thickness] );
   
        // make the end round pieces   
    color("cyan")
        translate([l/2, 0, 0])
        cylinder(thickness,r,r);
    

    color("cyan")
        translate([-l/2, 0, 0])
        cylinder(thickness,r,r);
   
    color("blue") 
        translate([-10,-w/2,0])
        rotate(90)
        prism(w,chamferLength,recessDepth);
     
    color("blue") 
        translate([-10-thickness,-w/2,0])
        rotate(90)
        prism(w,-chamferLength,-recessDepth);   
    
    color("blue") 
        translate([10,w/2,0])
        rotate(-90)
        prism(w,chamferLength,recessDepth);
         
    color("blue") 
        translate([10+thickness,w/2,0])
        rotate(-90)
        prism(w,-chamferLength,-recessDepth); 
    color("gray")
            translate([-10, -w/2, -thickness])
            cube([(20), w,thickness] );
   }



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
