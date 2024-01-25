s=5;
$fn=30;
difference(){
hull(){
    translate([-11,0,0]) cylinder(h=s, r=4, center=true);
    translate([11,0,0]) cylinder(h=s, r=4, center=true);
    translate([-(13+18.5)/4,-93-(37+42.5)/2,0]) cylinder(h=s, d=30-(13+18.5)/2, center=true);
    translate([(13+18.5)/4,-93-(37+42.5)/2,0]) cylinder(h=s, d=30-(13+18.5)/2, center=true);
}
    translate([-11,0,0]) cylinder(h=s+1, d=3, center=true);
    translate([11,0,0]) cylinder(h=s+1, d=3, center=true);
    translate([-11,-27,0]) cylinder(h=s+1, d=3, center=true);
    translate([11,-27,0]) cylinder(h=s+1, d=3, center=true);
    {
    translate([-(13+18.5)/4,-93,0]) cylinder(h=s+1, d=3, center=true);
    translate([(13+18.5)/4,-93,0]) cylinder(h=s+1, d=3, center=true);
    translate([-(13+18.5)/4,-93-(37+42.5)/2,0]) cylinder(h=s+1, d=3, center=true);
    translate([(13+18.5)/4,-93-(37+42.5)/2,0]) cylinder(h=s+1, d=3, center=true);
    }
}




// for biasing
//translate([0,-27/2,0]) extruder();
//translate([-13,-93-((37+42.5)/4),-16]) laser();
//translate([0,-29,0]) rotate([90,0,0]) linear_extrude(height=80,) square([30,s],true);

//module extruder() {
//    difference(){ {hull()
//    {
//    translate([-11,27/2,0]) cylinder(h=s, r=4, center=true);
//    translate([11,27/2,0]) cylinder(h=s, r=4, center=true);
//    translate([-11,-27/2,0]) cylinder(h=s, r=4, center=true);
//    translate([11,-27/2,0]) cylinder(h=s, r=4, center=true);
//    }}
//    {
//    translate([-11,27/2,0]) cylinder(h=s+1, d=3, center=true);
//    translate([11,27/2,0]) cylinder(h=s+1, d=3, center=true);
//    translate([-11,-27/2,0]) cylinder(h=s+1, d=3, center=true);
//    translate([11,-27/2,0]) cylinder(h=s+1, d=3, center=true);
//    }
//    }
//}

//module laser() {
//    difference(){ {hull()
//    {
//    translate([-(13+18.5)/4,(37+42.5)/4,0]) cylinder(h=s, d=30-(13+18.5)/2, center=true);
//    translate([(13+18.5)/4,(37+42.5)/4,0]) cylinder(h=s, d=30-(13+18.5)/2, center=true);
//    translate([-(13+18.5)/4,-(37+42.5)/4,0]) cylinder(h=s, d=30-(13+18.5)/2, center=true);
//    translate([(13+18.5)/4,-(37+42.5)/4,0]) cylinder(h=s, d=30-(13+18.5)/2, center=true);
//    }}
//    {
//    translate([-(13+18.5)/4,(37+42.5)/4,0]) cylinder(h=s+1, d=3, center=true);
//    translate([(13+18.5)/4,(37+42.5)/4,0]) cylinder(h=s+1, d=3, center=true);
//    translate([-(13+18.5)/4,-(37+42.5)/4,0]) cylinder(h=s+1, d=3, center=true);
//    translate([(13+18.5)/4,-(37+42.5)/4,0]) cylinder(h=s+1, d=3, center=true);
//    }
//    }
//}