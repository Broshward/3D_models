// Case without floor.
$fn=100;
form_thickness=1.8;
lenght=207-2*form_thickness;
width=140-2*form_thickness;
height=78;

fillet=width/10;
top_increment=height/50;


//case(lenght-fillet,width-fillet,height, fillet,top_increment,form_thickness);
case(lenght,width,height, fillet,top_increment,form_thickness);

module corner_area(height, fillet, top_increment, thickness) {   // Outside area
    union() {
        cylinder(height-fillet, r1=fillet+thickness, r2=fillet+thickness+top_increment);
        sphere(fillet+thickness);
    }
}

module case(lenght, width, height, fillet, top_increment, thickness) {
	difference() {
		hull(){
			translate([(lenght-2*fillet)/2,(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, 0);
            translate([(lenght-2*fillet)/2,-(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, 0);
			translate([-(lenght-2*fillet)/2,-(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, 0);
			translate([-(lenght-2*fillet)/2,(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, 0);
		} 
		translate([0,0,0.01]) hull(){
			translate([(lenght-2*fillet)/2,(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, -thickness);
			translate([(lenght-2*fillet)/2,-(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, -thickness);
			translate([-((lenght-2*fillet)/2),-(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, -thickness);
			translate([-(lenght-2*fillet)/2,(width-2*fillet)/2,fillet])  
                corner_area(height, fillet, top_increment, -thickness);
		} 
	}
}


