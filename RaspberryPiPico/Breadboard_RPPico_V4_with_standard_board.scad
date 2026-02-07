use <../MicrocontrollerBreadboards.scad>;

$fn = $preview ? 32 : 64;

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
    [
        [
            17.78-1, 
            0, 
            24, 
            2
        ], 
        [
            7.62, 
            24, 
            63-24, 
            0
        ]
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
    [
        [
            7.62, 
            0, 
            63, 
            0
        ]
    ]
];

single_board(0, 0, RaspberryPiPico_spec);
single_board(0+RaspberryPiPico_spec[1], 0, standard_board);
