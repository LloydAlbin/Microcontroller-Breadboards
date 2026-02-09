use <../MicrocontrollerBreadboards.scad>;

$fn = $preview ? 32 : 64;

/*
// ESP32 V1
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, [[25.4-1, 0, 63, 2]]],
// ESP32 V2
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, [[25.4-1, 0, 24, 2], [25.4-1, 24, 63-24, 1]]],
// ESP32 V3
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, [[25.4-1, 0, 24, 2], [7.62, 24, 63-24, 2]]],
*/

ESP32_spec=[
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
            25.4-1, 
            0, 
            63, 
            0,
            false
        ], 
    ]
];

single_board(0, 0, ESP32_spec);
