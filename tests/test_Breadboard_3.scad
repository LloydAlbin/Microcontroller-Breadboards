use <../MicrocontrollerBreadboards.scad>;

$fn = $preview ? 32 : 64;

/*
// ESP8266 (Mini) V1
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, [[22.86-1, 0, 63, 2]]],
// ESP8266 (Mini) V2
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, [[22.86-1, 0, 24, 2], [22.86-1, 24, 63-24, 1]]],
// ESP8266 (Mini) V3
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, [[22.86-1, 0, 24, 2], [7.62, 24, 63-24, 0]]],
*/

test_spec=[
        45,            // board_depth
        35,                     // board_width
        8.25,                   // board_height
        2.54,                   // pin_pitch
        0,                      // power_rail_sections
        0.9,                    // Pin Width
        5,                      // Number of pins in a row
        1.5,                    // Text Size
        1,                      // Text Thickness
        "Nimbus Sans L:Bold",   // Text Font
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", // Alphabet to use for column numbering/lettering 
        1,                      // Starting letter in Aphabet
        3,                      // 0 = off, 1 = back screw, 2 = 2mm Nut, 3 = 2mm Heat Insert, 4 = Wood Screw
        [
            [7.62, 0, 5, 0,
            false],
            [7.62, 5, 5, 0,
            true],
            [7.62, 10, 7, 0,
            false],
        ]
    ];
single_board(0, 0, test_spec);
