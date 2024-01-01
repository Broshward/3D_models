S=10; // Thickness hands
s_pcb = 2;

module hand(){
    difference(){
        translate([0,0,-S/2]) linear_extrude(S) import("PET_welding.svg");
        cylinder(10.1,3,3,true,$fn=20);
        translate([15,-19,0]) cylinder(10.1,1.5,1.5,true,$fn=20);
        translate([-65,20,0]) rotate([90,0,-3]) cylinder(20,3,3,true,$fn=20);
        translate([0,0,S/2]) rotate([0,0,55]) cube([23,23,S+0.01],true);
        difference(){   translate([-50,-10,-s_pcb/2]) cube([100,20,S/2+s_pcb]);     cylinder(s_pcb+0.01,5,5,true);    }
    
    }
}

//    translate([100,100,0]) 

    
hand();                     
/*
cube([100,20,s_pcb],true);   // PCB heater
rotate([180,0,0]) hand();
*/