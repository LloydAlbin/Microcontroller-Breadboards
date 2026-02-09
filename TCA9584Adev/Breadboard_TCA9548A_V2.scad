use <../MicrocontrollerBreadboards.scad>;

$fn = $preview ? 32 : 64;

TCA9548A_spec=[
    164, 
    60, 
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
    false,
    [
        [
            22.86-1-2.54-2.54, 
            0, 
            12, 
            1,
            false
        ], 
        [
            7.62, 
            12, 
            63-12, 
            0,
            false
        ], 
    ]
];

single_board(0, 0, TCA9548A_spec);
