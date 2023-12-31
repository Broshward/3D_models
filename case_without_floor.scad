// Case without floor.
$fn=100;
form_thickness=1;
lenght=60;
width=50;
height=40;

fillet=width/10;
top_increment=height/100;

difference() {
    case();
    translate([-lenght/2,-width/2,0]) cube([lenght,width,form_thickness+0.02]);
}

module corner_area(thickness) {   // Outside area
    union() {
        cylinder(height-fillet, r1=fillet+thickness, r2=fillet+thickness+top_increment);
        sphere(fillet+thickness);
    }
}

module case() {
	difference() {
		hull(){
			translate([(lenght-fillet)/2,(width-fillet)/2,fillet])  
                corner_area(0);
            translate([(lenght-fillet)/2,-(width-fillet)/2,fillet])  
                corner_area(0);
			translate([-(lenght-fillet)/2,-(width-fillet)/2,fillet])  
                corner_area(0);
			translate([-(lenght-fillet)/2,(width-fillet)/2,fillet])  
                corner_area(0);
		} 
		translate([0,0,0.01]) hull(){
			translate([(lenght-fillet)/2,(width-fillet)/2,fillet])  
                corner_area(-form_thickness);
			translate([(lenght-fillet)/2,-(width-fillet)/2,fillet])  
                corner_area(-form_thickness);
			translate([-((lenght-fillet)/2),-(width-fillet)/2,fillet])  
                corner_area(-form_thickness);
			translate([-(lenght-fillet)/2,(width-fillet)/2,fillet])  
                corner_area(-form_thickness);
		} 
	}
}


