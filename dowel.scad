difference() {cylinder(50, 6, 6);
    union(){
        cylinder(50+0.01, 4,3);
        for(i=[0:4])
            rotate([0,0,360/4*i]) translate([0,0,10]) cube([1,10,40]);
    }
}

for(i=[0:4])
    rotate([0,0,360/4*i+35]) 
translate([6,0,0]) rotate([-2,-2.5,55]) cube([2,2,20]);
