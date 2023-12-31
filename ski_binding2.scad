use </home/alex/3D_models/roller.scad>
w=100;
l=25;
h=20;

d=4;
d_bolt=5;


difference(){
    bind();
    translate([0,-60,0]) thor(130,12);
    union(){
        translate([0,-6,0]) cylinder(h+0.01,d_bolt/2,d_bolt/2,true,$fn=20);
        translate([0,-6,h/2-3/2+0.01]) cylinder(3,5,5,true);
        translate([w/3+5,4,0]){cylinder(h+0.01,d_bolt/2,d_bolt/2,true,$fn=20);translate([0,0,h/2-3/2+0.01]) cylinder(3,5,5,true);}
        translate([-w/3-5,4,0]){cylinder(h+0.01,d_bolt/2,d_bolt/2,true,$fn=20);translate([0,0,h/2-3/2+0.01]) cylinder(3,5,5,true);}
    }
    translate([0,l/2-h/2,0])difference(){
        translate([0,h/4+0.01,h/4+0.01]) cube([w+0.01,h/2,h/2],true);
        rotate([0,90,0]) cylinder(w+0.02,h/2,h/2,true);
    }

}    
    
module bind(){
    
    cube([w,l,h],true);
    difference(){
        translate([0,l/2+h/4,-h/4+1]) cube([w,h/2,h/2+2],true);
        translate([0,l/2+h/2,2]) rotate([0,90,0]) cylinder(w+0.02,h/2,h/2,true);
    }
    mirror([0,1,0]) difference(){
        translate([0,l/2+h/4,-h/4+1]) cube([w,h/2,h/2+2],true);
        translate([0,l/2+h/2,2]) rotate([0,90,0]) cylinder(w+0.02,h/2,h/2,true);
    }
}