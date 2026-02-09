use <../MicrocontrollerBreadboards.scad>;

$fn = $preview ? 32 : 64;
//$fn = $preview ? 32 : 64;
//$fa = 2;
//$fs = 2;

RaspberryPiPico_spec=[
    164, 
    66.2, 
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
            17.78-1, 
            0, 
            63, 
            2,
            false
        ], 
    ]
];

standard_board=[
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
        ]
    ]
];

single_board(0, 0, RaspberryPiPico_spec);
single_board(0+RaspberryPiPico_spec[1], 0, standard_board);

