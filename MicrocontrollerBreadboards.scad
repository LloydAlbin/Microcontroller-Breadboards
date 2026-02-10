// 2.54 = 0.01"
// 7.62 = 0.03"
// 25.4mm = 1"


/*
TODO LIST:

1) Add Wood Screws
2) Add 2mm Nut
3) Add Back Screw
4) Add Top Lettering
5) Y access center power rails
6) Y access center pins
7) Move Heat Inserts to back of board
8) Add Tabs on top and right
9) Add Tan Inserts on bottom and left
10 Create back
11) Add variables for back to main board
12) Make work on a multi-color 3D printer ????
15) Add Power Rail Full Length Cut Out
16) Add Power Rail Row Tab
16) Add Pin Row Tab
*/



//$fn = $preview ? 32 : 64;

preview_adjustment = 0.001; // This fixed the preview, but does not make a difference in the final item.
global_text_size = 1.0;
global_text_thickness = 1;
global_text_font = "Nimbus Sans L:Bold";
global_alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
global_starting_letter = 1;


// Positions in the array
board_depth_pos = 0;
board_width_pos = 1;
board_height_pos = 2;
pin_pitch_pos=3;
power_rail_sections_pos=4;
pin_width_pos=5;
number_of_pins_pos=6;
text_size_pos=7;
text_thickness_pos=8;
text_font_pos=9;
alphabet_pos=10;
starting_letter_pos=11;
mount_type_pos=12;
center_rail_pos=13;
pin_layout_pos=14;
// Positions in the pin layout sub-array
gap_pos=0;
starting_row_pos=1;
number_of_rows_pos=2;
center_item_pos=3;
skip_rows_pos=4;

// These boards are for testing all the sections of the code
// or for testing your 3D printer.
test_board_specs=[
// Test Board #1
    [
        (15+1)*2.54,            // board_depth
        68,                     // board_width
        8.25,                   // board_height
        2.54,                   // pin_pitch
        2,                      // power_rail_sections
        1,                      // Pin Width is value-0.1 x value-0.1
        5,                      // Number of pins in a row
        global_text_size,       // Text Size
        global_text_thickness,  // Text Thickness
        global_text_font,       // Text Font
        global_alphabet,        // Alphabet to use for column numbering/lettering
        global_starting_letter, // Starting letter in Aphabet
        3, // 0 = off, 1 = back screw, 2 = 2mm Nut, 3 = 2mm Heat Insert, 4 = Wood Screw
        false,                  // False = No Center Rail, True = Center Rail
        [
            [
                25.4-1, // gap
                0,      // starting_row
                2,      // number_of_rows 
                0,      // 0 = off, 1 = center row, 2 = cut out
                false,  // false = display rows, true = hide rows
            ],
            [25.4-1, 2, 3, 1, false], 
            [25.4-1, 5, 7, 2, false],
            [7.62, 12, 3, 0, false],
        ]
    ],
// Test Board #2
    [
        (9+1)*2.54, // board_depth
        68, // board_width
        8.25, // board_height
        2.54, // pin_pitch
        1, // power_rail_sections
        1, // Pin Width
        5, // Number of pins in a row
        global_text_size, // Text Size
        global_text_thickness, // Text Thickness
        global_text_font, // Text Font
        global_alphabet, // Alphabet to use for column numbering/lettering
        27, // Starting letter in Aphabet
        3, // 0 = off, 1 = back screw, 2 = 2mm Nut, 3 = 2mm Heat Insert, 4 = Wood Screw
        true,                  // False = No Center Rail, True = Center Rail
        [
            [25.4-1, 0, 5, 0, false],
            [7.62, 5, 4, 0, false],
        ]
    ],
// Test Board #3
[45, 35, 8.25, 2.54, 0, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, 
        true,                  // False = No Center Rail, True = Center Rail
        [[7.62, 0, 17, 0, false]]],
];

// This is where you define the board styles
all_board_specs=[
// Standard Board (Full Size)
[164, 55, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[7.62, 0, 63, 0, false]]],
// Standard Board (1/2 Size)
[81.5, 55, 8.25, 2.54, 5, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[7.62, 0, 30, 0, false]]],
// Standard Board (Mini Size)
[45, 35, 8.25, 2.54, 0, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[7.62, 0, 17, 0, false]]],
// Raspberry PI Pico / Waveshare ESP32-P4-WIFI6
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[17.78-1, 0, 24, 2, false], [7.62, 24, 63-24, 0, false]]],
// ESP32 V1
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[25.4-1, 0, 63, 2, false]]],
// ESP32 V2
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, false, [[25.4-1, 0, 24, 2, false], [25.4-1, 24, 63-24, 1, false]]],
// ESP32 V3
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[25.4-1, 0, 24, 2, false], [7.62, 24, 63-24, 2, false]]],
// ESP8266 (Mini) V1
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[22.86-1, 0, 63, 2, false]]],
// ESP8266 (Mini) V2
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, false, [[22.86-1, 0, 24, 2, false], [22.86-1, 24, 63-24, 1, false]]],
// ESP8266 (Mini) V3
[(63+1)*2.54, 54.2, 8.25, 2.54, 10, 1, 5, global_text_size, global_text_thickness, global_text_font, global_alphabet, global_starting_letter, 3, true, [[22.86-1, 0, 24, 2, false], [7.62, 24, 63-24, 0, false]]],
];

//multi_board(x, y, all_board_specs[board_number], dups_x, dups_y);

board_examples(0);
//multi_board(0, 0, all_board_specs[0], 0, 0);
//multi_board(0, 0, test_board_specs[0], 0, 0);
//pin_rows(0, 0, test_board_specs[0]);
//pin_row(0, 0, 7.62, false, test_board_specs[2]);
//power_rail(test_board_specs[0][pin_pitch_pos]+.1, test_board_specs[0][pin_pitch_pos]*3, test_board_specs[0]);
/*
pin_rows(0, 0, [
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
            25.4-1, 
            0, 
            24, 
            2
        ], 
        [
            25.4-1, 
            24, 
            63-24, 
            1
        ], 
    ]
]);
*/

// Module: board_examples()
// Usage:
//   board_examples(example);
// Description:
//   A pre-defined set of board examples showing how to use this library
// Arguments:
//   example = Example Number
// Example(3D):
//   board_examples(0);
module board_examples(example)
{
    if (example == 0)
    {
        // Mini test Board that test every feature
        multi_board(0, 0, test_board_specs[0], 0, 0);
        multi_board(0, 50, test_board_specs[1], 0, 0);
        multi_board(0, 100, test_board_specs[2], 0, 0);
    }
    else if (example == 1)
    {
        // Standard Board
        multi_board(0, 0, all_board_specs[0], 0, 0);
    }
    else if (example == 2)
    {
        // Standard Board
        multi_board(0, 0, all_board_specs[1], 0, 0);
    }
    else if (example == 3)
    {
        // Standard Board
        multi_board(0, 0, all_board_specs[2], 0, 0);
    }
    else if (example == 4)
    {
        // Raspberry PI Pico / Waveshare ESP32-P4-WIFI6
        multi_board(0, 0, all_board_specs[3], 0, 0);
    }
    else if (example == 5)
    {
        // Combo Board Example
        // Remeber to put them ordered from right to left as you are look at the bottom and not the top
        // Standard Board (Right)
        multi_board(0, 0, all_board_specs[3], 0, 0);
        // Raspberry PI Pico / Waveshare ESP32-P4-WIFI6 (Left)
        multi_board(all_board_specs[3][board_width_pos], 0, all_board_specs[0], 0, 0);
    }
}


// Module: multi_board_backing()
// Usage:
//   multi_board_backing(x, y, board_specs, dups_x, dups_y);
// Description:
//   Creates an set of a bread board backings.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
//   dups_x = Number of boards across
//   dups_y = Number of boards tall
// Example(3D):
//   multi_board_backing(0, 0, all_board_specs[0], 0, 0); // Single
//   multi_board_backing(0, 0, all_board_specs[0], 2, 0); // two wide
// Used By: board_examples(),
module multi_board_backing(x, y, board_specs, dups_x, dups_y)
{
}

// Module: multi_board()
// Usage:
//   multi_board(x, y, board_specs, dups_x, dups_y);
// Description:
//   Creates an set of a bread board.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
//   dups_x = Number of boards across
//   dups_y = Number of boards tall
// Example(3D):
//   multi_board(0, 0, all_board_specs[0], 0, 0); // Single
//   multi_board(0, 0, all_board_specs[0], 2, 0); // two wide
// Used By: single_board(),
module multi_board(x, y, board_specs, dups_x, dups_y)
{
    board_depth=board_specs[board_depth_pos];
    board_width=board_specs[board_width_pos];
    
    for (board_x = [0 : 1 : dups_x])
    {
        start_x=board_x*board_width;
        for (board_y = [0 : 1 : dups_y])
        {
            start_y=board_y*board_depth;
            union()
            {
                single_board(x+start_x, y+start_y, board_specs);
            }
        }
    }
}

// Module: single_board_backing()
// Usage:
//   single_board_backing(x, y, board_specs);
// Description:
//   Creates an individual bread board backing.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
// Example(3D):
//   single_board_backing(0, 0, all_board_specs[0]);
// Used By: multi_board_backing(),
module single_board_backing(x, y, board_specs)
{
    board_depth=board_specs[board_depth_pos];
    board_width=board_specs[board_width_pos];

}

// Module: single_board()
// Usage:
//   single_board(x, y, board_specs);
// Description:
//   Creates an individual bread board.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
// Example(3D):
//   single_board(0, 0, all_board_specs[0]);
// Used By: multi_board(),
module single_board(x, y, board_specs)
{
    board_depth=board_specs[board_depth_pos];
    board_width=board_specs[board_width_pos];
    board_height=board_specs[board_height_pos];
    pin_width=board_specs[pin_width_pos];
    pin_pitch=board_specs[pin_pitch_pos];
    power_rail_sections=board_specs[power_rail_sections_pos];
    mount_type=board_specs[mount_type_pos];
    board_center=board_width/2;

    union()
    {
        color("lightgray")
        difference()
        {
            // Board
            translate ([x,y,0])
            cube([board_width,board_depth,board_height]);

            if (board_specs[center_rail_pos])
            {
                // Middle cut-out
                translate ([x+((board_width-2)/2), y-preview_adjustment, board_height-3.4])
                cube([2,board_depth+(preview_adjustment*2),3.4+preview_adjustment]);
            }

            // Pin Rows
            pin_rows (x, y, board_specs);

            // Left Power Rail
            power_rail(x+pin_pitch+.1, y+pin_pitch*3, board_specs);

            // Right Power Rail
            power_rail(x+board_width-pin_pitch-pin_pitch-pin_width-.1, y+pin_pitch*3, board_specs);
            
            render()
            {
                union()
                {
                    if (power_rail_sections > 0)
                    {
                        if (mount_type == 1)
                        {
                            // Back Screw
                        }
                        else if (mount_type == 2)
                        {
                            // 2mm Nut
                        }
                        else if (mount_type == 3)
                        {
                            // Heat Insert
                            
                            // Bottom Left Heat Insert
                            translate([x+4,y+3,6])
                            rotate([180,0,0])
                            eee_stud(
                                x=0,
                                y=0,
                                sh=6,
                                off=0,
                                oil=6,
                                maxid=3.2,
                                ted=2.8+0.30,
                                rmwt=0
                            );
                            
                            // Bottom Right Heat Insert
                            translate([x+board_width-4,y+3,6])
                            rotate([180,0,0])
                            eee_stud(
                                x=0,
                                y=0,
                                sh=6,
                                off=0,
                                oil=6,
                                maxid=3.2,
                                ted=2.8+0.30,
                                rmwt=0
                            );
                            
                            // Top Left Heat Insert
                            translate([x+4,y+board_depth-3,6])
                            rotate([180,0,0])
                            eee_stud(
                                x=0,
                                y=0,
                                sh=6,
                                off=0,
                                oil=6,
                                maxid=3.2,
                                ted=2.8+0.30,
                                rmwt=0
                            );
                            
                            // Top Right Heat Insert
                            translate([x+board_width-4,y+board_depth-3,6])
                            rotate([180,0,0])
                            eee_stud(
                                x=0,
                                y=0,
                                sh=6,
                                off=0,
                                oil=6,
                                maxid=3.2,
                                ted=2.8+0.30,
                                rmwt=0
                            );
                        }
                        else if (mount_type == 4)
                        {
                            // Wood Screw
                        }
                    }
                    else
                    {
                        if (mount_type == 1)
                        {
                            // Back Screw
                        }
                        else if (mount_type == 2)
                        {
                            // 2mm Nut
                        }
                        else if (mount_type == 3)
                        {
                            // Heat Insert
                            // Bottom Center Heat Insert
                            translate([board_center,y+4,4])
                            rotate([180,0,0])
                            eee_stud(
                                x=0,
                                y=0,
                                sh=4,
                                off=0,
                                oil=4,
                                maxid=3.2,
                                ted=2.8+0.30,
                                rmwt=0
                            );

                            // Top Center Heat Insert
                            translate([board_center,y+board_depth-4,4])
                            rotate([180,0,0])
                            eee_stud(
                                x=0,
                                y=0,
                                sh=4,
                                off=0,
                                oil=4,
                                maxid=3.2,
                                ted=2.8+0.30,
                                rmwt=0
                            );
                        }
                        else if (mount_type == 4)
                        {
                            // Wood Screw
                        }
                    }
                }
            }
        }
        if (power_rail_sections > 0)
        {
            // Left Power Rail
            power_rail_text(x+pin_pitch-.1, y+pin_pitch*3, board_specs);

            // Right Power Rail
            power_rail_text(x+board_width-pin_pitch-pin_pitch-pin_width-.2, y+pin_pitch*3, board_specs);
        }
        
        pin_rows_text(x, y+pin_pitch-.4, board_specs);

        debug=false;
        if (debug == true)
        {
            color("green")
            translate([x,y+pin_pitch*3,board_height])
            cube([pin_pitch,pin_pitch,.5]);

            color("green")
            translate([x+board_width-pin_pitch,y+pin_pitch*3,board_height])
            cube([pin_pitch,pin_pitch,.5]);
        }
    }
}

// Module: power_rail()
// Usage:
//   power_rail(x, y, board_specs);
// Description:
//   Creates the power rail on the left and right of the board.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
// Example(3D):
//   power_rail(2.54, 2.54, board_specs=all_board_specs[0]);
// Used By: single_board(),
module power_rail(x, y, board_specs)
{
    pin_pitch=board_specs[pin_pitch_pos];
    power_rail_sections=board_specs[power_rail_sections_pos];

    union()
    {
        for (section = [0 : 1 : power_rail_sections-1])
        {
            for (ny = [y+(section*pin_pitch*6) : pin_pitch : y+(section*pin_pitch*6)+.1+((5-1)*pin_pitch)])
            {
                pin_hole (x, ny, board_specs);
            }
            translate ([x-.5, (y+(section*pin_pitch*6))-.5, 0-preview_adjustment])
            cube([2,12.16,7.4+preview_adjustment]);

            translate ([x-.5, (y+(section*pin_pitch*6))-1.5, 0-preview_adjustment])
            cube([2, 14.16, 1.7+preview_adjustment]);
        }

        translate ([x-.5, y-1.5, 0-preview_adjustment])
        cube([2, 14.16+((power_rail_sections-1)*pin_pitch*6), 1.1+preview_adjustment]);



        for (section = [0 : 1 : power_rail_sections-1])
        {
            for (ny = [y+(section*pin_pitch*6) : pin_pitch : y+(section*pin_pitch*6)+.1+((5-1)*pin_pitch)])
            {
                pin_hole (x+pin_pitch, ny, board_specs);
            }
            translate ([x+pin_pitch-.5, (y+(section*pin_pitch*6))-.5, 0-preview_adjustment])
            cube([2,12.16,7.4+preview_adjustment]);

            translate ([x+pin_pitch-.5, (y+(section*pin_pitch*6))-1.5, 0-preview_adjustment])
            cube([2, 14.16, 1.7+preview_adjustment]);
        }

        translate ([x+pin_pitch-.5, y-1.5, 0-preview_adjustment])
        cube([2, 14.16+((power_rail_sections-1)*pin_pitch*6), 1.1+preview_adjustment]);
    }
}

// Module: power_rail_text()
// Usage:
//   power_rail_text(x, y, board_specs);
// Description:
//   Creates the +/- and power rail color bars.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
// Example(3D):
//   power_rail_text(2.54, 2.54, board_specs=all_board_specs[0]);
// Used By: single_board(),
module power_rail_text(x, y, board_specs)
{
    board_depth=board_specs[board_depth_pos];
    board_width=board_specs[board_width_pos];
    board_height=board_specs[board_height_pos];
    pin_pitch=board_specs[pin_pitch_pos];
    power_rail_sections=board_specs[power_rail_sections_pos];

    text_size = board_specs[text_size_pos];
    text_thickness = board_specs[text_thickness_pos];
    text_font = board_specs[text_font_pos];

    union()
    {
        // Bottom +/-
        color("blue")
        text_render(x, y-pin_pitch, board_height-text_thickness, text_thickness+preview_adjustment, text_size, text_font, "-");
        color("red")
        text_render(x+pin_pitch, y-pin_pitch, board_height-text_thickness, text_thickness+preview_adjustment, text_size, text_font, "+");

        section = power_rail_sections-1;
        ny = y+(section*pin_pitch*6)+.1+((5-1)*pin_pitch);

        // Top +/-
        color("blue")
        text_render(x, ny+pin_pitch, board_height-text_thickness, text_thickness+preview_adjustment, text_size, text_font, "-");
        color("red")
        text_render(x+pin_pitch, ny+pin_pitch, board_height-text_thickness, text_thickness+preview_adjustment, text_size, text_font, "+");

        rail_depth = (section*pin_pitch*6)+.1+((5-1)*pin_pitch);

        // Color Rail +
        color("blue")
        translate ([x-1, y, board_height-text_thickness])
        cube([.2,rail_depth+1,text_thickness+preview_adjustment]);
        
        // Color Rail -
        color("red")
        translate ([x+pin_pitch+1+1, y, board_height-text_thickness])
        cube([.2,rail_depth+1,text_thickness+preview_adjustment]);
    }
}

// Module: pin_rows_text()
// Usage:
//   pin_rows_text(x, y, board_specs);
// Description:
//   Creates the lettering at the top and bottom of the board.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
// Example(3D):
//   pin_rows_text(2.54, 2.54, board_specs=all_board_specs[0]);
// Used By: single_board(),
module pin_rows_text(x, y, board_specs)
{
    board_width=board_specs[board_width_pos];
    board_height=board_specs[board_height_pos];
    pin_pitch=board_specs[pin_pitch_pos];
    row_specs=board_specs[pin_layout_pos];

    number_of_pins=board_specs[number_of_pins_pos];
    pin_width=board_specs[pin_width_pos];

    idx=0;
    gap=row_specs[idx][gap_pos];
    starting_row=row_specs[idx][starting_row_pos];
    number_of_rows=row_specs[idx][number_of_rows_pos];

    text_size = board_specs[text_size_pos];
    text_thickness = board_specs[text_thickness_pos];
    text_font = board_specs[text_font_pos];

    // TODO:
    // SETUP CENTEREING THE SAME WAY AS FOR pin_rows()

    board_center=x+(board_width/2);
    start_x1=board_center-(gap/2)-(((number_of_pins-1)*pin_pitch)+pin_width);
    
    alphabet = board_specs[alphabet_pos];
    letter_1 = board_specs[starting_letter_pos];


    for (x_off = [0 : number_of_pins-1])
    {
        ny = y+(starting_row*pin_pitch);
        color("gray")
        text_render(start_x1+(x_off*pin_pitch), ny-((pin_pitch/3)*2), board_height-text_thickness, text_thickness+preview_adjustment, text_size, text_font, alphabet[letter_1-1+x_off]);
    }
    
    // 'ofs' will be a new list containing the cumulative sums
    ofs = [ for (o = 0, i = 0; i <= len(board_specs[pin_layout_pos]); o = o + (board_specs[pin_layout_pos][i][center_item_pos] == 1 ? 1 : 0), i = i + 1) o ];

    letter_2 = letter_1 + number_of_pins;
    if (ofs[len(ofs)-1] > 0)
    {
        start_x3=board_center-((((number_of_pins-1)*pin_pitch)+1)/2);

        for (x_off = [0 : number_of_pins-1])
        {
            ny = y+(starting_row*pin_pitch);
            color("gray")
            text_render(start_x3+(x_off*pin_pitch), ny-((pin_pitch/3)*2), board_height-text_thickness, text_thickness+preview_adjustment, text_size, text_font, alphabet[letter_2-1+x_off]);
        }
    }

    letter_3 = letter_2 + (ofs[len(ofs)-1]>0 ? number_of_pins : 0);
    start_x2=board_center+(gap/2);

    for (x_off = [0 : number_of_pins-1])
    {
        ny = y+(starting_row*pin_pitch);
        color("gray")
        text_render(start_x2+(x_off*pin_pitch), ny-((pin_pitch/3)*2), board_height-text_thickness, text_thickness+preview_adjustment, text_size, text_font, alphabet[letter_3-1+x_off]);
    }

}

// Module: pin_rows()
// Usage:
//   pin_rows(x, y, board_specs);
// Description:
//   Creates a set of pin rows.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
// Example(3D):
//   pin_row(2.54, 2.54, board_specs=all_board_specs[0]);
// Used By: single_board(),
module pin_rows(x, y, board_specs)
{
    //render()
    union()
    {
        board_depth=board_specs[board_depth_pos];
        board_width=board_specs[board_width_pos];
        board_height=board_specs[board_height_pos];
        pin_pitch=board_specs[pin_pitch_pos];
        row_specs=board_specs[pin_layout_pos];
        number_of_pins=board_specs[number_of_pins_pos];
        pin_width=board_specs[pin_width_pos];
        row_width = (((number_of_pins-1)*2)*pin_pitch)+pin_width;
        
        
        //echo(board_height=board_height);

        row_gap=row_specs[0][gap_pos];
        row_width2 = row_width + row_specs[0][gap_pos];
        //total_number_of_rows=row_specs[0][number_of_rows_pos];
        // 'ofs' will be a new list containing the cumulative sums
        // THIS LINE IS GIVING A WARNING BUT THE PREVIOUS TWO DON'T GIVE THE WARNING
        ofs = [ for (o = 0, i = 0; i <= len(board_specs[pin_layout_pos]); o = o + (board_specs[pin_layout_pos][i][number_of_rows_pos] == undef ? 0 : board_specs[pin_layout_pos][i][number_of_rows_pos]), i = i + 1) o ];
        //echo (ofs=ofs);
        total_number_of_rows=ofs[len(ofs)-1];
        //total_number_of_rows=get_sum(board_specs[pin_layout_pos], number_of_rows_pos);
        //echo (total_number_of_rows=total_number_of_rows);
        total_rows_height = ((total_number_of_rows-1) * pin_pitch) + pin_width;
        start_row_y = (board_depth-total_rows_height)/2;

        debug=false;
        if (debug)
        {
            difference()
            {
                // Board Edge
                color("red")
                translate([0,0,board_height])
                cube([board_width,board_depth,1]);
                translate([.5,.5,board_height-preview_adjustment])
                cube([board_width-1,board_depth-1,1+(preview_adjustment*2)]);
            }

            translate([(board_width-row_width2)/2,(board_depth-total_rows_height)/2,0])
            difference()
            {
                // Width of first row of pins
                color("blue")
                translate([0,0,board_height])
                cube([row_width2,total_rows_height,1]);

                translate([.5,.5,board_height-preview_adjustment])
                cube([row_width2-1,total_rows_height-1,1+(preview_adjustment*2)]);
            }
            
            // First row gap
            color("green")
            translate([(board_width-row_gap)/2,((board_depth-total_rows_height)/2)+1,board_height])
            cube([row_gap,1,1]);

            // Center
            color("orange")
            translate([(board_width-.7)/2,0,board_height])
            cube([.7,board_depth,1]);
        }
        

        for (idx = [0 : len(row_specs)-1])
        {
            gap=row_specs[idx][gap_pos];
            starting_row=row_specs[idx][starting_row_pos];
            number_of_rows=row_specs[idx][number_of_rows_pos];
            center_item=row_specs[idx][center_item_pos];
            skip_rows=row_specs[idx][skip_rows_pos];

            //current_number_of_rows=ofs[idx];
            current_number_of_rows=0;
            //echo (current_number_of_rows=current_number_of_rows);
            
            nsx=(board_width-(row_width+gap))/2;
            nsy = start_row_y;


            //echo (board_width=board_width, row_width_with_gap=(row_width+gap));
            //echo (board_depth=board_depth, rows_height=rows_height);
            //echo (nsx=nsx, nsy=nsy);

            if (skip_rows == false)
            {
                translate([x+nsx,y+nsy,0])
                union()
                {
                    for (row_num = [0 : 1 : number_of_rows-1])
                    {
                        ny=((starting_row+row_num)*pin_pitch);
                        //echo (idx=idx, center_item=center_item);
                        //echo (idx=idx, center_item=(center_item == 1 ? true : false));
                        pin_row (0, ny, gap, (center_item == 1 ? true : false), board_specs);
                    }
                    
                    if (center_item==2)
                    {
                        board_center=(row_width+gap)/2;

                        translate ([board_center-((gap-(pin_pitch*2))/2), y+((starting_row+1)*pin_pitch), 0-preview_adjustment])
                        //roundedcube(gap-(pin_pitch*2), (number_of_rows-3)*pin_pitch, board_height, 0);
                        roundedcube(gap-(pin_pitch*2), (number_of_rows-3)*pin_pitch, board_height+(preview_adjustment*2), 3);
                    }
                }
            }
        }
    }
}

// Module: pin_row()
// Usage:
//   pin_row(x, y, gap, center_row, board_specs);
// Description:
//   Creates an row of pin holes.
// Arguments:
//   x = x position
//   y = y position
//   gap = gap between left and right pin rows
//   center_row = true/false if there should be a center row
//   board_specs = An individual board spec
// Example(3D):
//   pin_row(2.54, 2.54, 7.62, false, board_specs=all_board_specs[0]);
// Used By: pin_rows(),
module pin_row(x, y, gap, center_row, board_specs)
{
    union()
    {
        board_width=board_specs[board_width_pos];
        pin_pitch=board_specs[pin_pitch_pos];

        number_of_pins=board_specs[number_of_pins_pos];
        pin_width=board_specs[pin_width_pos];
        board_center=x+(board_width/2);
        
        // Left Row
        start_x1=0;
        for (col_pin = [0 : 1 : number_of_pins-1])
        {
            nx = start_x1+(col_pin*pin_pitch);
            pin_hole (nx, y, board_specs);
        }
        translate ([start_x1-.5, y-.5, 0-preview_adjustment])
        cube([12.16, 2, 7.4+preview_adjustment]);

        translate ([start_x1-1.5, y-.5, 0-preview_adjustment])
        cube([14.16, 2, 1.95+preview_adjustment]);

        // Right Row
        start_x2=start_x1+((number_of_pins-1)*pin_pitch)+gap;
        for (nx = [start_x2 : pin_pitch : start_x2+.1+((number_of_pins-1)*pin_pitch)])
        {
            pin_hole (nx, y, board_specs);
        }
      
        translate ([start_x2-.5, y-.5, 0-preview_adjustment])
        cube([12.16, 2, 7.4+preview_adjustment]);

        translate ([start_x2-1.5, y-.5, 0-preview_adjustment])
        cube([14.16, 2, 1.95+preview_adjustment]);

        if (center_row == true)
        {
            //echo (center_row=center_row);
            //echo (board_width=board_width);
            //echo (board_center=board_center);
            //echo (number_of_pins=number_of_pins);
            //echo (pin_pitch=pin_pitch);
            //echo (pin_width=pin_width);


            start_x3 = ((((number_of_pins+number_of_pins-2)*pin_pitch)+pin_width+gap)/2)-((((number_of_pins-1)*pin_pitch)+pin_width)/2);

            //echo (start_x3=start_x3);
            for (i = [0 : 1 : number_of_pins-1])
            {
                nx=start_x3+(i*pin_pitch);
                pin_hole (nx, y, board_specs);
            }
          
            translate ([start_x3-.5, y-.5, 0-preview_adjustment])
            cube([12.16, 2, 7.4+preview_adjustment]);

            translate ([start_x3-1.5, y-.5, 0-preview_adjustment])
            cube([14.16, 2, 1.95+preview_adjustment]);
        }
    }
}

// Module: pin_hole()
// Usage:
//   pin_hole(x, y, board_specs);
// Description:
//   Creates an individual pin hole.
// Arguments:
//   x = x position
//   y = y position
//   board_specs = An individual board spec
// Example(3D):
//   pin_hole(2.54, 2.54, board_specs=all_board_specs[0]);
// Used By: pin_row(), power_rail()
module pin_hole(x, y, board_specs)
{
    board_height=board_specs[board_height_pos];
    pin_width=board_specs[pin_width_pos];

    union()
    {
        translate ([x, y, 0-preview_adjustment])
        cube([pin_width,pin_width,board_height+(preview_adjustment*2)]);

        pin_slope_border = 0.1;
        pin_slope_border_per_side = pin_slope_border/2;
        
        translate ([x-(pin_slope_border_per_side/2), y-pin_slope_border_per_side+pin_width, board_height+preview_adjustment])
        rotate([180,0,0])
        trapezoidal_prism(pin_width, pin_width, .15);
    }
}

// Module: roundedcube()
// Usage:
//   roundedcube(xx, yy, height, radius);
// Description:
//   Creates a 3D Cube with rounded corners
// Arguments:
//   xx = x position
//   yy = y position
//   height = height
//   radius = radius of corners
// Example(3D):
//   roundedcube(2.54, 2.54, 8.25, 8);
// Used By: pin_rows()
module roundedcube(xx, yy, height, my_radius) {
    radius = $preview ? 0 : my_radius;

    difference(){

        cube([xx,yy,height]);

        if (radius > 0) {

            difference(){
                translate([-.5,-.5,-.2])
                cube([radius+.5,radius+.5,height+.5]);

                translate([radius,radius,height/2])
                cylinder(height,radius,radius,true);
            }
            translate([xx,0,0])
            rotate(90)
            difference(){
                translate([-.5,-.5,-.2])
                cube([radius+.5,radius+.5,height+.5]);

                translate([radius,radius,height/2])
                cylinder(height,radius,radius,true);
            }

            translate([xx,yy,0])
            rotate(180)
            difference(){
                translate([-.5,-.5,-.2])
                cube([radius+.5,radius+.5,height+.5]);

                translate([radius,radius,height/2])
                cylinder(height,radius,radius,true);
            }

            translate([0,yy,0])
            rotate(270)
            difference(){
                translate([-.5,-.5,-.2])
                cube([radius+.5,radius+.5,height+.5]);

                translate([radius,radius,height/2])
                cylinder(height,radius,radius,true);
            }
            
        }
    }
}

// Module: eee_stud()
// Usage:
//   eee_stud(x,y,sh,off=0,oil=2,maxid=3.2,ted=2.8+0.30,rmwt=0);
// Description:
//   M2 Heat-set insert
// Arguments:
//   xx = x position
//   yy = y position
//   sh = 
//   off = 
//   maxid = 
//   ted = 
//   rmwt = 
// Example(3D):
//   eee_stud(x=0,y=0,sh=6,off=0,oil=2,maxid=3.2,ted=2.8+0.30,rmwt=0);
// Used By: ???(), ???()
module eee_stud(x,y,sh,off=0,oil=2,maxid=3.2,ted=2.8+0.30,rmwt=0) {	

	//maxid = 9.52;       				//Maximum Insert Diameter
	//ted = 8.99;         				//Tapered End Diameter
	//oil = 7.62;         				//Overal Insert Length
	ophs = ted-0.10;        				//Optimum Pilot Hole Size
	oshd = maxid-0.30;        				//Optimum Surface Hole Diameter
	rmwt = rmwt == 0 ? maxid*0.53 : rmwt;   //Recommended Min Wall Thickness
	ahd = 0.76;         				//Added Hole Depth for Blind Holes
	th = 1.07;          				//Height of 8° Taper
	cham = 0.5;							//Chamfer at top of stud
	stud_top = maxid+(rmwt*2); 			//Top of Stud Diameter
	stud_bot = stud_top+(cham*2); 		//Bottom of Stud Diameter
		/*
		The following line assures that the overall stud height is AT LEAST
		the length of the heat-set insert PLUS a clearance for blind holes.
		You can request a height TALLER than the minimum, just not less.	
		*/
	st_h = sh > (oil+ahd) ? sh : oil+ahd;
	st_base = st_h-cham;		//Height of Stud to chamfer
		/*
		The following is a convoluted variable that keeps the hole from going
		unnecessarily deep if using a stud height is taller than the minimum 
		height. "off" is the offset and "st_h" is the total length of
		the stud. Adding those two variables sets that total height above zero.
		Now, we want to know where to set the base of the hole; the hole depth
		should be insert length ("oil") plus the clearance for a blind hole
		insertion ("ahd").
		*/
	hh = (off+st_h)-(oil+ahd);

	//difference() {
		//union() {
			//translate([x,y,off]) cylinder(d=stud_bot,st_base); // Stud - Top Taper
			//translate([x,y,st_base+off]) cylinder(d1=stud_bot,d2=stud_top,cham); // Top Taper
		//}
		
		#union() {
			translate([x,y,hh]) cylinder($fn=$preview ? 32 : 64, d=ophs,oil+ahd); // Inside Hole
			translate([x,y,st_h-th+off]) cylinder($fn=$preview ? 32 : 64, d1=ophs,d2=oshd,th); // Inside Taper
		}			
	//}	
}

// Module: text_render()
// Usage:
//   text_render(x, y, z, th, ts, tf, t);
// Description:
//   Created 3D Text
// Arguments:
//   x = x position
//   y = y position
//   z = z position
//   th = text height
//   ts = text size
//   tf = text font
//   t = text
// Example(3D):
//   text_render(0, 0, 0, 1, 10, "Nimbus Sans L:Bold", "Sample Text");
// Used By: ???(), ???()
module text_render(x, y, z, th, ts, tf, t)
{
    translate([x,y,z])
        linear_extrude($fn=$preview ? 32 : 64, height=th, convexity=4)
            text(t,size=ts,font=tf);
}

// Module: trapezoidal_prism()
// Usage:
//   trapezoidal_prism(xx, yy, height);
// Description:
//   Created 3D Trapezoidal Prism for the top of the pin holes
// Arguments:
//   xx = x position
//   yy = y position
//   height = height
// Example(3D):
//   trapezoidal_prism(0, 0, 0, 1, 10, "Nimbus Sans L:Bold", "Sample Text");
// Used By: pin_hole()
module trapezoidal_prism(xx, yy, height)
{
    // Set the size of the base
    base_size = [xx+height+height, yy+height+height];

    // Set the scaling factor for the top (e.g., 0.5 for half size)
    top_scale = ((yy-height-height)/yy);

    translate([xx/2,yy/2,0]) 
    linear_extrude($fn=$preview ? 32 : 64, height = height, scale=top_scale) {
        square(size = base_size, center = true);
    }
}

function get_count_greater(row_specs, pos, v) = get_count_greater_array(row_specs, pos, v)[len(get_count_greater_array(row_specs, pos, v))-1];

function get_count_greater_array(row_specs, pos, v) = [ for (o = 0, i = 0; i <= len(row_specs); o = o + (row_specs[i][pos] > v ? 1 : 0), i = i + 1) o ];

function get_count_equal(row_specs, pos, v) = get_count_equal_array(row_specs, pos, v)[len(get_count_equal_array(row_specs, pos, v))-1];

function get_count_equal_array(row_specs, pos, v) = [ for (o = 0, i = 0; i <= len(row_specs); o = o + (row_specs[i][pos] == v ? 1 : 0), i = i + 1) o ];

function get_sum(row_specs, pos) = get_sum_array(row_specs, pos)[len(get_sum_array(row_specs, pos))-1];

function get_sum_array(row_specs, pos) = [ for (o = 0, i = 0; i <= len(row_specs); o = o + (row_specs[i][pos] == undef ? 0 : row_specs[i][pos]), i = i + 1) o ];


