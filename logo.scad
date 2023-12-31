/* Harmonies Worlds and SamstillingHeimar logo 3D model */

module logo(){
    linear_extrude(1) scale([0.1,0.1,0]) 
        //surface("/home/alex/3D_models/HarmoniesWorlds_1.png");
        import("HarmoniesWorlds_1.svg");
}

logo();