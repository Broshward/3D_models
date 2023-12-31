difference() {
    union(){
        cube([60,30,5],true);
        translate([60/2+4,0,0]) cylinder(5,d=15,center=true);
        mirror([1,0,0]) translate([60/2+4,0,0]) cylinder(5,d=15,center=true);
    }
    union(){
        translate([0,0,-5/2+3.2/2+3.2]) cube([51,22,3.2+0.01],true);
        cylinder(5+0.01,d=10,center=true);
        translate([60/2+4,0,0]) cylinder(5+0.01,d=5,center=true);
        mirror([1,0,0]) translate([60/2+4,0,0]) cylinder(5+0.01,d=5,center=true);        
    }
}