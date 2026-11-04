//Alt switcher
switch_alts();

#define switch_alts();
if (alt_modifier){
    switch(get_player_color(player)){
        case 0:
            set_color_profile_slot( 0, 0, 88, 89, 88 ); //Fridge
            set_color_profile_slot( 0, 1, 38, 38, 38 ); //Handle
        break;
        case 1:
            set_color_profile_slot( 1, 0, 230, 181, 113 ); //Fridge
            set_color_profile_slot( 1, 1, 148, 100, 44 ); //Handle
        break;
        case 2:
            set_color_profile_slot( 2, 0, 255, 168, 207 ); //Fridge
            set_color_profile_slot( 2, 1, 156, 82, 121 ); //Handle
        break;
        case 3:
            set_color_profile_slot( 3, 0, 123, 129, 199 ); //Fridge
            set_color_profile_slot( 3, 1, 38, 39, 115 ); //Handle
        break;
        case 4:
            set_color_profile_slot( 4, 0, 152, 242, 170 ); //Fridge
            set_color_profile_slot( 4, 1, 53, 135, 53 ); //Handle
        break;
        case 5:
            set_color_profile_slot( 5, 0, 251, 255, 176 ); //Fridge
            set_color_profile_slot( 5, 1, 135, 121, 66 ); //Handle
        break;
        case 6:
            set_color_profile_slot( 6, 0, 154, 63, 179 ); //Fridge
            set_color_profile_slot( 6, 1, 83, 34, 97 ); //Handle
        break;
        case 7:
            set_color_profile_slot( 7, 0, 71, 71, 71 ); //Fridge
            set_color_profile_slot( 7, 1, 184, 160, 26 ); //Handle
        break;
    }
}
else{
    switch(get_player_color(player)){
        case 0:
            set_color_profile_slot( 0, 0, 242, 242, 228 ); //Fridge
            set_color_profile_slot( 0, 1, 116, 121, 125 ); //Handle
        break;
        case 1:
            set_color_profile_slot( 1, 0, 230, 218, 224 ); //Fridge
            set_color_profile_slot( 1, 1, 117, 100, 110 ); //Handle
        break;
        case 2:
            set_color_profile_slot( 2, 0, 218, 234, 242 ); //Fridge
            set_color_profile_slot( 2, 1, 92, 111, 125 ); //Handle
        break;
        case 3:
            set_color_profile_slot( 3, 0, 224, 196, 230 ); //Fridge
            set_color_profile_slot( 3, 1, 110, 79, 125 ); //Handle
        break;
        case 4:
            set_color_profile_slot( 4, 0, 255, 252, 255 ); //Fridge
            set_color_profile_slot( 4, 1, 173, 128, 168 ); //Handle
        break;
        case 5:
            set_color_profile_slot( 5, 0, 196, 150, 217 ); //Fridge
            set_color_profile_slot( 5, 1, 98, 47, 117 ); //Handle
        break;
        case 6:
            set_color_profile_slot( 6, 0, 127, 126, 128 ); //Fridge
            set_color_profile_slot( 6, 1, 59, 59, 59 ); //Handle
        break;
        case 7:
            set_color_profile_slot( 7, 0, 140, 115, 87 ); //Fridge
            set_color_profile_slot( 7, 1, 84, 67, 51 ); //Handle
        break;
    }
}
//init_shader();