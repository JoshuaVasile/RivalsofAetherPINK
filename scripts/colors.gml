// colors is script that controls your color palettes.
// RoA Color GML Helper: https://cl-9a.github.io/RoAColorsGmlHelper/

// DEFAULT COLOR

// Pink
set_color_profile_slot( 0, 0, 231, 101, 122 );
set_color_profile_slot_range( 0, 1, 1, 1 );

// Skin
set_color_profile_slot( 0, 1, 251, 215, 192 );
set_color_profile_slot_range( 1, 1, 1, 1 );

// Yellow
set_color_profile_slot( 0, 2, 255, 232, 78 );
set_color_profile_slot_range( 2, 1, 1, 1 );

// Bomb
set_color_profile_slot( 0, 3, 110, 134, 255 );
set_color_profile_slot_range( 3, 1, 1, 1 );

// Ghost
set_color_profile_slot( 0, 4, 192, 174, 219 );
set_color_profile_slot_range( 4, 1, 1, 1 );

// Outline
set_color_profile_slot( 0, 5, 23, 27, 50 );
set_color_profile_slot_range( 5, 1, 1, 1 );

// Ghost Alt
set_color_profile_slot( 0, 6, 201, 132, 178 );
set_color_profile_slot_range( 6, 1, 1, 1 );

// White
set_color_profile_slot( 0, 7, 255, 234, 233 );
set_color_profile_slot_range( 7, 1, 1, 1 );


// ALTERNATE COLORS
// Pink ships with ONLY her default palette. No alternate skins can be selected.
set_num_palettes( 1 );


#define rangeSet(sha, col) // Auto-sets ranges to 1. Translates GML's asinine BGR hex colors to RGB.

set_color_profile_slot(0, sha, color_get_blue(col), color_get_green(col), color_get_red(col));
set_color_profile_slot_range(sha, 1, 1, 1);



#define colorSet(alt, sha, col) // Streamlines color setup. Translates BRG --> RGB.

set_color_profile_slot(alt, sha, color_get_blue(col), color_get_green(col), color_get_red(col));
