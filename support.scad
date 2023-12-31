h=15;
    w=21-15/2;
    d=19;
pi=3.1415926;
module support(){
    difference(){
        cylinder(h,25/2,25/2); 
        union(){
            translate([0,0,-0.01]) cylinder(15+0.02,10/2,10/2);
            translate([0,0,h-5]) cylinder(5+0.01,15/2,15/2);
        }
    }
    translate([15/2,-d/2,0]) cube([w,d,h]);
    difference(){
        translate([15/2+3,-(d+20)/2,0]) cube([w,d+20,h+15]);
        union(){
            translate([21-5-5,0,5+h]) rotate([90,0,0]) cylinder(d+20,5,5,true);
            translate([21-5-5,d/2+5,(h+10)/2]) rotate([0,0,90]) cylinder(h+10+0.01,5,5,true);
            translate([21-5-5,-(d/2+5),(h+10)/2]) rotate([0,0,90]) cylinder(h+10+0.01,5,5,true);
            translate([0,d/2+5,-0.01]) cube([11+5,10,h+20]);
            translate([0,-(d/2+15),-0.01]) cube([11+5,10,h+20]);
            translate([0,-(d+20)/2,h+5-0.01]) cube([11+5,d+20,20]);
    
    }}
}        

translate([0,0,-h]) difference(){
    support(); 
        union(){
            translate([21-5,d/2+2,7+h]) rotate([0,90,0]) cylinder(20,3.5,3.5,true);
            translate([21-5,-(d/2)-2,7+h]) rotate([0,90,0]) cylinder(20,3.5,3.5,true);
            translate([6,d/2+2,7+h]) rotate([0,90,0]) cylinder(20,6,6,true);
            translate([6,-(d/2)-2,7+h]) rotate([0,90,0]) cylinder(20,6,6,true);
    translate([5+21,0,0]) rotate([0,6/130/pi*180,0]) cube([10,d+20+10,h+40+10],true);

        }
}
    