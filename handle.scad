difference(){
union(){
translate([0,0,3]) cylinder(14,5.5,4.75);
cylinder(3,7.5,7);  
translate([0,0,17]) cylinder(1,4.75,1);
}

translate([0,0,-0.1])
union(){
cylinder(5,6.5,2.5);  
//cylinder(1.2,6.5,6);
//translate([0,0,1.2])cylinder(0.8,6,4.25);    
//translate([0,0,2])cylinder(1.2,4.25,4);
//translate([0,0,3.2])cylinder(0.9,4,2);  
$fn=30;
difference() {
    cylinder(15,2.3,2.2);
    {translate([-5,1.5,10])cube(10,10,15);}}
    translate([0,0,15])cylinder(1,2.5,0);
}
}

