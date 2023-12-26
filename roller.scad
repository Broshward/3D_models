l=50;
d=20;
bearing_d=20;
bearing_dd=14;
bearing_l=10;
    case_w=bearing_d+2*bearing_l;
    case_l=2*d+2*bearing_l+2;
    case_s=3;

$fn=30;

module thor(D,d){
    rotate_extrude() 
        translate([D/2,0,0])circle(d=d,$fn=30);
}

module roller(){
    difference(){
        cylinder(l,d/2,d/2);
        union(){
            translate([0,0,15]) thor(d,3);
            translate([0,0,18.2]) thor(d,2.5);
            translate([0,0,21]) thor(d,2.2);
            translate([0,0,25]) thor(d,2);
            translate([0,0,30]) thor(d,1.75);
            translate([0,0,35]) thor(d,1.70);
            translate([0,0,35+1.8]) thor(d,1.75);
            translate([0,0,35+3.65]) thor(d,1.8);
            translate([0,0,-0.01]) difference(){cylinder(bearing_l,21,21);cylinder(bearing_l,bearing_dd/2,bearing_dd/2);}
            translate([0,0,l-10+0.01]) difference(){cylinder(bearing_l,21,21);cylinder(bearing_l,bearing_dd/2,bearing_dd/2);}
            translate([0,0,-0.01]) cylinder(l+0.02,4,4);
        }
    }
}


module case(bearing_d, bearing_l, l, w, s){
    h=bearing_l+s;
    difference(){
        translate([-w/2-1,-w/2,bearing_l-h]) cube([l,w,h]);
        hull() {translate([d,0,0]) cylinder(bearing_l,bearing_d/2,d/2);
        cylinder(20,d/2,d/2);}
        walls();
    }
    
}

module case_left(bearing_d, bearing_l, l,w,s){
    h=bearing_l+s;
    difference(){
        case(bearing_d, bearing_l, l,w,s);
        translate([-w/2-1-0.01,-w/2-0.01,0])cube([l/2+1+0.02,w+0.02,h+0.02]);
        translate([-w/2-0.01,-(bearing_l/2-w/2),bearing_l/2]) rotate([0,90,0]) cylinder(l+0.02,2.5,2.5);
        translate([-w/2-0.01,bearing_l/2-w/2,bearing_l/2]) rotate([0,90,0]) cylinder(l+0.02,2.5,2.5);
        translate([l-w/2-1-bearing_l/2,0,-s-0.01]) cylinder(h+0.02,3.5,3.5);
        hull(){
            translate([-w/2-1+bearing_l/2,0,-s-0.01]) cylinder(h+0.02,3.5,3.5);
            translate([-w/2+bearing_l/2,0,-s-0.01]) cylinder(h+0.02,3.5,3.5);
        }

    }
}
module case_right(bearing_d, bearing_l, l,w,s){
    h=bearing_l+s;
    difference(){
        intersection(){
            case(bearing_d, bearing_l, l,w,s);
            translate([-w/2-1-0.01,-w/2-0.01,0+0.01])cube([l/2+0.02,w+0.02,h+0.02]);
        }
        translate([-w/2-0.01,bearing_l/2-w/2,bearing_l/2]) rotate([0,90,0]) cylinder(l+0.02,3.5,3.5);
        translate([-w/2-0.01,-(bearing_l/2-w/2),bearing_l/2]) rotate([0,90,0]) cylinder(l+0.02,3.5,3.5);
        translate([-w/2-1+bearing_l/2,0,-s-0.01]) cylinder(h+0.02,3.5,3.5);
    }
}
module walls(){
    dh=2;
    h=l-2*bearing_l+2*dh;
    difference(){
        translate([case_l-case_w/2-bearing_l-1+0.01,-(case_w-2*bearing_l)/2,bearing_l-dh]) cube([bearing_l,case_w-2*bearing_l,h]);
        translate([case_l-case_w/2-1-bearing_l/2,0,bearing_l-dh-0.01]) cylinder(h+0.02,2.5,2.5);
    }
    difference(){
        translate([-case_w/2-1-0.01,-(case_w-2*bearing_l)/2,bearing_l-dh]) cube([bearing_l,case_w-2*bearing_l,h]);
        translate([-case_w/2-1+bearing_l/2,0,bearing_l-dh-0.01]) cylinder(h+0.02,2.5,2.5);
    }
        
}

roller($fn=100);
//translate([d,0,0]) roller();

case_left(bearing_d, bearing_l, case_l, case_w, case_s);
case_right(bearing_d, bearing_l, case_l, case_w, case_s);
//translate([0,0,l]) rotate([180,0,0]) case_left(bearing_d, bearing_l, case_l, case_w, case_s);
//translate([0,0,l]) rotate([180,0,0]) case_right(bearing_d, bearing_l, case_l, case_w, case_s);

//walls();

use </home/alex/3D_models/openscad-metric-nut-bolt-threads-library/ISOThreadUM2.scad>
//thread_in_ring(8,25,2);
//thread_in(8,25);


















