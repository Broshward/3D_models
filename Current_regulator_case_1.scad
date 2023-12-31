use </home/alex/3D_models/case.scad>


//$fn=100;
form_thickness=3;
lenght=90-2*form_thickness;
width=50-2*form_thickness;
height=55;

fillet=width/10;
top_increment=height/50;


cover_position=height+form_thickness/2-1;
case_cover();
//4_x() translate([lenght/2,width/2,cover_position-0.5]) cylinder(1,r=10,center=true);
//floor_case(lenght+3,width+3,form_thickness,35,32);

module case_cover() {
translate([0,0,cover_position]) rotate([180,0,0]) {
    difference(){
        case(lenght,width,height, fillet,top_increment,form_thickness);
        union() {
            cylinder(form_thickness+0.01,3,3);
            2_x() translate([25,0,0]) cylinder(form_thickness+0.01,4,4);
            2_x() translate([lenght/2,0,cover_position/2]) rotate([0,90,0]) cylinder(2*form_thickness,d=5,center=true);
        }
    }
}
    mount_d=5;
    translate([0,0,form_thickness]) 4_x() translate([lenght/2+3,width/2+3,0]) rotate(-45) {
        difference(){
            union(){
                translate([0,0,form_thickness/2]) cylinder(form_thickness*2,mount_d,mount_d,true);
                translate([0,-4,0]) cube([mount_d*2,8,form_thickness],true);
                translate([0,-5,5+form_thickness/2]) cube([mount_d*2,10,10],true);
            }
            translate([0,0,form_thickness/2]) cylinder(form_thickness*2+0.01,mount_d/2,mount_d/2,true);
            translate([0,mount_d/4,form_thickness/2]) cylinder(form_thickness*2+0.01,mount_d/2,mount_d/2,true);
            translate([0,mount_d,(6*mount_d)/2+form_thickness/2]) rotate([0,90,0]) cylinder(mount_d*2+0.01,d=6*mount_d,center=true);
        }
    }
}
module floor_case(l,w,s,pcb_l,pcb_w,pcb_s=1.5,mount_d=5){
    difference(){
        union(){
            cube([l,w,s],true);
            4_x() translate([l/2+1,w/2+1,0]) cylinder(s,mount_d,mount_d,true);
        }
        union(){
            4_x() translate([l/2+1,w/2+1,0]) cylinder(s+0.01,mount_d/2,mount_d/2,true);
            translate([0,0,height+form_thickness/2-1]) rotate([180,0,0]) case(lenght,width,height, fillet,top_increment,form_thickness+0.5);
        }        
    }
    translate([0,0,s/2+1]) pcb_stands(3,10,pcb_l,pcb_w,pcb_s);
}

module 2_x(){
    children();
    mirror([1,0,0]) children();
}

module 4_x(){
    children();
    mirror([1,0,0]) children();
    mirror([0,1,0]) {children(); mirror([1,0,0]) children();}
}


use </home/alex/3D_models/openscad-metric-nut-bolt-threads-library/ISOThreadUM2.scad>

module pcb_stands(h,d,pcb_l,pcb_w,pcb_s) {
    4_x() translate([pcb_l/2-d/5,pcb_w/2-d/5,0]) 
        union(){
            difference() {
                cylinder(h,d/2,d/2,true); 
                cylinder(h+0.01,d/4+0.1,d/4+0.1,true,$fn=30);
            }        
            translate([0,0,-h/2]) thread_in(d/2,h);
            translate([0,0,-h/2]) thread_in_ring(d/2,h,2);
            translate([0,d/4+1/2,(h/2+pcb_s/2)]) clips(3,1.5,1.5);  
            rotate([0,0,-90]) translate([0,d/4+1/2,(h/2+pcb_s/2)]) clips(3,1.5,1.5);  
        }
        
    
    
    //translate([0,0,pcb_s/2+h/2]) cube([pcb_l,pcb_w,pcb_s],true); //pcb prewiew

}

module clips(l,w,pcb_s) {
            cube([l,w,pcb_s],true);
            translate([0,0,pcb_s/2+w/4]) cylinder(w/2,w*1.1/2,w,true,$fn=20);
            translate([0,0,pcb_s/2+w/2+1]) cylinder(2,w,w/4,true,$fn=20);

}













