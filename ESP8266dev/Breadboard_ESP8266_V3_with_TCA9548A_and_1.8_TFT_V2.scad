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

ESP32_spec=[
    164, 
    64, 
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
            22.86-1, 
            0, 
            11, 
            2,
            false
        ], 
        [
            7.62, 
            11, 
            63-12-14, 
            0,
            false
        ], 
        [
            53, 
            63-14, 
            14, 
            0,
            true
        ], 
    ]
];
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
    [
        [
            22.86-1-2.54-2.54, 
            0, 
            12, 
            2,
            false
        ], 
        [
            7.62, 
            12, 
            63-12-14, 
            0,
            false
        ], 
        [
            53, 
            63-14, 
            14, 
            0,
            true
        ], 
    ]
];

display_board=[
    ESP32_spec[0], 
    ESP32_spec[1]+TCA9548A_spec[1], 
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
            53, 
            0, 
            63-14, 
            0,
            true
        ],
        [
            53, 
            63-14, 
            14, 
            0,
            false
        ]
    ]
];

difference()
{
    union()
    {
        single_board(0, 0, ESP32_spec);
        single_board(0+ESP32_spec[1], 0, TCA9548A_spec);
    }
    pin_rows (0, 0+display_board[3], display_board);
}


