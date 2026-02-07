use <../MicrocontrollerBreadboards.scad>;

$fn = $preview ? 32 : 64;

Standard_Breadboard_Mini_spec=[
    45, 
    35, 
    8.25, 
    2.54, 
    0, 
    1, 
    5, 
    1.5, 
    1, 
    "Nimbus Sans L:Bold", 
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 
    1, 
    3, 
    [
        [
            7.62, 
            0, 
            17, 
            0
        ], 
    ]
];

single_board(0, 0, Standard_Breadboard_Mini_spec);
