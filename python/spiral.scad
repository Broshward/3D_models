/*  This module bends the children with size [size.x,size.y,size.z] 
*   onto spiral on the plane. When I will to know how name function 
*   which dimensions object measure the size argument will be no needing.
*   Children may be a text or another object placed on right X. X > 0.
*   r - begin radius of spiral
*   step - spiral step. 
*   scale - each turn less with scale then previous
*/
PI=3.1415926;
use <bend.scad>

module spiral(size=[100,10,1], r=50, step=0, right=false ,linstep=0, scale=1) {
    ang_step=45;
    count=r/step*360/ang_step;
    //count = 1;
    for(i=[0:1:count]){
        Rc=ang_step*i/360*step+size.y/2;
        leng = 2*PI*(Rc)*ang_step/360;
        //echo (Rc,leng);
        rotate([0,0,(0.5+ang_step)*i]) 
            translate([0,-Rc,0]) 
                rotate([0,0,-atan((step*ang_step/360)/(2*Rc*sin(ang_step/2)))])
                    translate([0,Rc,0]) 
                        rotate([0,0,-ang_step/2])
                        to_cylinder(Rc,[leng,size.y,size.z]) 
                            intersection(){
                                translate([leng/2,0,0]) cube([leng,size.y,size.z],true);
                                translate([-(i)*leng,0,0]) 
                                    children();
                            }
    }
}

text="FUAZRKXPHNIGJCYSTBEMLWOD\
FUAZRKXPHNIGJCYSTBEMLWOD\
FUAZRKXPHNIGJCYSTBEMLWOD\
FUAZRKXPHNIGJCYSTBEMLWOD";

spiral([3000,10,1],40,step=15, right=true,linstep=10)
rotate([0,90,0]) cylinder(3000,3,3);
//linear_extrude(1) text(text, size = 8, font = "New", valign = "center");