use </home/alex/3D_models/roller.scad>

D_roll=74;

l=15;
w=28;
h=18;


translate([8,10,8]) fix(1.7);
mirror([1,0,0]) translate([8,10,8]) fix(3);
difference(){
    stator();
    translate([8,10,8]) fix(0,wid=6,h1=10+1,h2=7+1);
    translate([8+5-0.01,10,8]) fix(0,h1=10-4,h2=7-4);
    mirror([1,0,0]){
            translate([8,10,8]) fix(0,wid=6,h1=10+2,h2=7+2);
        translate([8+5-0.01,10,8]) fix(0,h1=10-3,h2=7-3);
    }

}

module stator(){
    difference(){
        cube([w,l,h*2],true);
        translate([0,0,-D_roll/2]) rotate([0,90,0]) cylinder(w+0.01,d=74,center=true,$fn=50);
        cylinder(h*2+0.01,d=5,center=true);
        //translate([0,0,h/2-3]) cylinder(h=3+0.01,d=11);    
    }
}

module fix(filament_d=1.7,len=30,wid=5,h1=10,h2=7) {
    difference(){
        hull(){
            translate([0,-len,0]) rotate([0,90,0]) cylinder(wid,d=h1,center=true);
            rotate([0,90,0]) cylinder(wid,d=h2,center=true);    
        }
        translate([-(wid/2-filament_d/2),0,0]) rotate([0,0,asin((wid-filament_d)/(len/2))]) {
            translate([0,0,h2/2]) rotate([90-asin((h1-h2)/2/len),0,0]) translate([0,0,0]) cylinder(len,d=filament_d,center=true,$fn=10);
            mirror([0,0,1]) translate([0,0,h2/2]) rotate([90-asin((h1-h2)/2/len),0,0]) translate([0,0,0]) cylinder(len,d=filament_d,center=true,$fn=10);
        }
        translate([-(wid/2-filament_d/2),0,0]) rotate([0,0,asin((wid-filament_d)/(len/2))]) 
            translate([0,-len/2,0])  
            difference(){
                rotate([0,90,0]) thor((h1+h2)/2,1.2*filament_d);
                translate([0,((h1+h2)/2+filament_d)/2,0]) 
                    cube([1.2*filament_d+0.01,(h1+h2)/2+filament_d/2,(h1+h2)/2+filament_d],true);
            }
        translate([wid/2-filament_d/2,-len/2,0]) rotate([0,90,0]) difference(){
            cylinder(filament_d+0.01,d=(h1+h2)/2+1.5*filament_d,center=true);           
            cylinder(filament_d+0.01,d=(h1+h2)/2,center=true);
            translate([0,((h1+h2)/2+filament_d)/2,0]) 
                cube([h1+filament_d,(h1+h2)/2+filament_d,1.2*filament_d+0.01],true);
        }
    }
    
}










