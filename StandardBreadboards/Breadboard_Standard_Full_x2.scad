use <../MicrocontrollerBreadboards.scad>;

$fn = $preview ? 32 : 64;

Standard_Breadboard_Full_spec=[
    164, 
    55, 
    8.25, 
    2.54, 
    10, 
    1, 
    5, 
    1.5, 
    1, 
    "Nimbus Sans L:Bold", 
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 
    1, 
    3, 
    true,
    [
        [
            7.62, 
            0, 
            63, 
            0,
            false
        ], 
    ]
];

single_board(0, 0, Standard_Breadboard_Full_spec);
single_board(0+Standard_Breadboard_Full_spec[1], 0, Standard_Breadboard_Full_spec);
