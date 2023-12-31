difference(){
    union(){
        translate([0,0,3]) cylinder(14,5.5,4.75);
        cylinder(3,7.5,7);  
        translate([0,0,17]) cylinder(1,4.75,1);
    }

    translate([0,0,-0.1])
        union(){
            //cylinder(5,6.5,2.5);  
            cylinder(2,6.5,6);
            //translate([0,0,1.2-0.01])cylinder(0.8,6,4.25);    
            translate([0,0,2-0.01])cylinder(2,6,1.5);
            translate([0,0,4-0.02])cylinder(5,1.5,1.5);  
            
            $fn=30;
            /*difference() {
                cylinder(15,2.3,2.2);
                translate([-5,1.5,10])cube([10,10,15]);
            }*/
            //translate([0,0,15])cylinder(1,2.5,0);
        }
}
translate([0,0,4+5-1]) cube([0.6,4,2],true);

