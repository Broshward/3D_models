//$fn=10;

pi=3.1415926;
module worm(type = 1, R = 8, s = 1, l=30, n = 1, ratio=220, d=2, $fn=36 )
{
    // type is tipe of teeth form [1,2]
    // R is radius of worm center 
    // s is step of teeth
    // l is length of worm
    // n is count of worm threads. (Not implemented)
    // ratio is worm-gear wheels ratio. It needs for form of worm calculate.
    // d is shaft diameter for worm wheel.
    
    h = s/(2*tan(30)); // Teeth height
    R_gear = s*ratio/(2*pi); // Big gear radius
    alfa = asin((l/2+s/2)/R_gear);
    
    difference(){
    union(){ 
    for(angle = [-alfa:360/$fn/ratio:alfa]) { // comment this for debuging worm form
//    for(angle = [-alfa:2*alfa*s/l:alfa]) { // Use this instead rotate_extrude for form debuging 
        x=R_gear*sin(angle);
        y=R+R_gear-sqrt(R_gear^2 - x^2);
        x1=x+s/2*sin(angle-30)/sin(30);
        y1=y-s/2*cos(angle-30)/sin(30);
        x2=x+s/2*sin(angle+30)/sin(30);
        y2=y-s/2*cos(angle+30)/sin(30);
            
        rotate(angle*ratio) // comment this for debuging worm form
        rotate_extrude(angle = 360/$fn+1)          
        if (type == 1) {
            rotate(90) {
                    polygon([ [x,y],[x1,y1],[x2,y2] ]);
            }
        } 
        else if (type == 2) { // Sinusoidal teeth
            rotate(90){
                translate([x,y,0]) rotate(angle)   
                    polygon([ for (j=[-180:60:180]) // Decrease the loop step for more precision
                        [j/180*s/2,cos(j)*h/2-h/2-h/10]]);
            }
        }
    
        }
        rotate_extrude(angle = 360) // The inner fill with shaft diameter, comment this for debuging
        //rotate([90,0,0]) // Use this instead rotate_extrude for form debuging 
            rotate(90) 
            polygon([ for (k=[-2*alfa*s/l-alfa:2*alfa*s/l:alfa+2*alfa*s/l]) 
             [R_gear*sin(k),R-h*1.1+R_gear*(1-cos(k))],
             [R_gear*sin(alfa),d/2],[R_gear*sin(-alfa)-h/2,d/2]]);
        }
        union(){
            translate([0,0,l]) cylinder(h=l,r=(R+R_gear),center=true);
            translate([0,0,-l]) cylinder(h=l,r=(R+R_gear),center=true);
        }
    }
}

module gear(type = 2, h=5, s=3.14, n = 110, d = 6, R_worm=20){
    t_h = s/(2*tan(30)); // Teeth height
    R_gear = s*n/(2*pi); // Big gear radius
    
    linear_extrude(h,twist = -s/R_worm)  
        union() for(angle = [-180:360/n:180]) {
        x=R_gear*sin(angle);
        y=R_gear*cos(angle);//R_gear^2 - x^2);
            
        if (type == 1) {
            rotate(90)
                translate([x,y,0]) rotate(-angle) 
                    polygon([ [0,0],[s/2*sin(-30)/sin(30),-s/2*cos(-30)/sin(30)],[s/2*sin(30)/sin(30),-s/2*cos(30)/sin(30)] ]);
        } 
        else if (type == 2) {
            rotate(90){
                translate([x,y,0]) rotate(-angle)   
                    polygon([ for (j=[-180:60:180]) 
                        [j/180*s/2,cos(j)*t_h/2-t_h/2-t_h/10]]);
            }
        }
    }
    difference(){
        cylinder(h,R_gear-t_h,R_gear-t_h,$fn=n);
        translate([0,0,-0.01]) cylinder(h+0.02,d/2,d/2,$fn=n);
    }
}

R=15;
l=40;
ratio = 110;
s=2*pi;

rotate(90){
    //The worm
    worm(type = 2, R=R , s=s, l=l, ratio=ratio, d=8, $fn=100); 

    // The gear. Uncomment for Gear+worm preview together
    translate([ratio+R-s/(2*tan(30)),5,0]) rotate([90,0,0]) {
        gear(type = 2, h=10, s=s, n = ratio, d = 200, R_worm=R);
        difference() {
            cylinder(3,r=100,$fn=ratio); 
            union(){
                translate([0,0,-0.01]) cylinder(3+0.02,r=90);
                for (i=[0:8]){
                    rotate(360/8*i) translate([95,0,-0.01]) cylinder(3+0.02,d=5);
                }
            }
    }
}    
}
    




