
/*  This module bends the children with size [size.x,size.y,size.z] 
*   onto cylindrical surface. When I will to know how name function 
*   which dimensions object measure the size will be no needing.
*   Children may be a text or another object placed on right X. X > 0.
*   r - cylinder radius
*   step - spiral step. This may be to create threads various forms 
*   and dimensions.
*   module to_cylinder don't make cylinder self. 
*   View examples for details)
*/
PI=3.1415926;

module to_cylinder(r,size=[100,100,10],step=0,on_left=false) {
    ang_step = $fn!=0 ? 360/$fn : 2*r*sin($fa/2) > $fs ? $fa : 2*asin($fs/(2*r)); // angle step
    len_step = 2*r*sin(ang_step/2); // len step
    count = size.x/len_step; // Steps count 
    h_step =  step / (360/ang_step); // Step for Y. When spiral bending
    len_scale = (sqrt(len_step^2+h_step^2)+sqrt((size.y/2*sin(ang_step))^2+(size.y/2*sin(atan(h_step/len_step)))^2))/len_step; // When need for spiral bending, it is little stretching)
    for (i=[0:1:count]) {
        rotate([0,0,ang_step*i])
        translate([0,-r,h_step*i])
        rotate([0,-atan(h_step/len_step),0])
        scale([len_scale,1,1])
        intersection(){
            cube([len_step,size.y,size.z],true);
            translate([-(len_step/2+len_step*i),0,0]) children();
        }
    }
}

/*
//Cylinder on cylinder
cylinder(40,30,30);
rotate([0,90,0]) cylinder(1000,1,1,$fn=10);
to_cylinder(30,[1000,2,2],10) rotate([0,90,0]) cylinder(1000,1,1,$fn=10);
*/
/*
//Text on cylinder
s="Hello worlds Hello Harmonies Worlds Hello SamstillingHeimar))";
cylinder(40,30,30);
rotate([90,0,0]) linear_extrude(1) text(s, size = 14, font = "Liberation Sans");
to_cylinder(30,[1000,2,14],20) translate([0,0,-7]) rotate([90,0,0]) linear_extrude(1) text(s, size = 14, font = "Liberation Sans");
*/
/*
// Logo on cylinder
module logo(){
    linear_extrude(1) scale([0.1,0.1,0]) 
        //surface("/home/alex/3D_models/HarmoniesWorlds_1.png");
        import("HarmoniesWorlds_1.svg");
}

cylinder(50,50,50,true);
translate([0,0,-17]) translate([0,0,17]) rotate([90,0,0])logo();
to_cylinder(50,[20,2,30]) translate([0,0,-17]) rotate([90,0,0])logo();
*/
















