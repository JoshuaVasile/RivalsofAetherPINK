/*if (isCool){
    outline_color = [ 50, 150, 200 ];
}*/

if (alt_modifier){
    switch(get_player_color(player)){
        case 0:
            set_character_color_slot( 0, 88, 89, 88 ); //Fridge
            set_character_color_slot( 1, 38, 38, 38 ); //Handle
        break;
        case 1:
            set_color_profile_slot( get_player_color(player), 0, 230, 181, 113 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 148, 100, 44 ); //Handle
        break;
        case 2:
            set_color_profile_slot( get_player_color(player), 0, 255, 168, 207 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 156, 82, 121 ); //Handle
        break;
        case 3:
            set_color_profile_slot( get_player_color(player), 0, 123, 129, 199 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 38, 39, 115 ); //Handle
        break;
        case 4:
            set_color_profile_slot( get_player_color(player), 0, 152, 242, 170 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 53, 135, 53 ); //Handle
        break;
        case 5:
            set_color_profile_slot( get_player_color(player), 0, 251, 255, 176 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 135, 121, 66 ); //Handle
        break;
        case 6:
            set_color_profile_slot( get_player_color(player), 0, 154, 63, 179 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 83, 34, 97 ); //Handle
        break;
        case 7:
            set_color_profile_slot( get_player_color(player), 0, 71, 71, 71 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 184, 160, 26 ); //Handle
        break;
        case 8:
            set_color_profile_slot( get_player_color(player), 0, 226, 130, 255 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 205, 224, 247 ); //Handle
        break;
        case 9:
            set_color_profile_slot( get_player_color(player), 0, 233, 255, 227 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 66, 150, 71 ); //Handle
        break;
        case 10:
            set_color_profile_slot( get_player_color(player), 0, 182, 230, 182 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 143, 139, 156 ); //Handle
        break;
        case 11:
            set_color_profile_slot( get_player_color(player), 0, 237, 154, 186 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 143, 70, 114 ); //Handle
        break;
        case 12:
            set_color_profile_slot( get_player_color(player), 0, 72, 77, 120 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 37, 32, 66 ); //Handle
        break;
        case 13:
            set_color_profile_slot( get_player_color(player), 0, 222, 224, 222 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 158, 158, 158 ); //Handle
        break;
        case 14:
            set_color_profile_slot( get_player_color(player), 0, 63, 176, 245 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 63, 94, 181 ); //Handle
        break;
        case 15:
            set_color_profile_slot( get_player_color(player), 0, 67, 9, 79 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 189, 189, 189 ); //Handle
        break;
        case 16:
            set_color_profile_slot( get_player_color(player), 0, 197, 161, 247 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 130, 70, 140 ); //Handle
        break;
        case 17:
            set_color_profile_slot( get_player_color(player), 0, 250, 252, 255 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 43, 43, 43 ); //Handle
        break;
        case 18:
            set_color_profile_slot( get_player_color(player), 0, 247, 232, 27 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 191, 162, 51 ); //Handle
        break;
        case 19:
            set_color_profile_slot( get_player_color(player), 0, 191, 143, 164 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 99, 62, 85 ); //Handle
            set_color_profile_slot( get_player_color(player), 3, 255, 171, 218 ); //Flag2
            set_color_profile_slot( get_player_color(player), 6, 255, 171, 218 ); //Flag2
        break;
        case 20:
            set_color_profile_slot( get_player_color(player), 0, 185, 173, 222 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 110, 93, 161 ); //Handle
        break;
        case 21:
            set_color_profile_slot( get_player_color(player), 0, 255, 216, 216 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 171, 5, 5 ); //Handle
        break;
        case 22:
            set_color_profile_slot( get_player_color(player), 0, 255, 217, 87 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 235, 180, 80 ); //Handle
        break;
        case 23:
            set_color_profile_slot( get_player_color(player), 0, 99, 49, 18 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 54, 15, 12 ); //Handle
        break;
        case 24:
            set_color_profile_slot( get_player_color(player), 0, 247, 235, 235 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 128, 14, 14 ); //Handle
        break;
        case 25:
            //set_color_profile_slot( get_player_color(player), 0, 83, 122, 62 ); //Fridge
            //set_color_profile_slot( get_player_color(player), 1, 211, 226, 154 ); //Handle
        break;
        case 26:
            set_color_profile_slot( get_player_color(player), 0, 83, 122, 62 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 211, 226, 154 ); //Handle
        break;
        case 27:
            set_color_profile_slot( get_player_color(player), 0, 240, 232, 204 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 240, 232, 204 ); //Handle
        break;
        case 28:
            set_color_profile_slot( get_player_color(player), 0, 252, 255, 255 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 252, 255, 255 ); //Handle
        break;
        case 29:
            set_color_profile_slot( get_player_color(player), 0, 35, 35, 36 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 96, 38, 166 ); //Handle
        break;
        case 30:
            set_color_profile_slot( get_player_color(player), 0, 255, 163, 206 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 182, 88, 199 ); //Handle
        break;
        case 31:
            set_color_profile_slot( get_player_color(player), 0, 50, 28, 217 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 50, 28, 217 ); //Handle
        break;
    }
}
else{
    switch(get_player_color(player)){
        case 0:
            set_character_color_slot( 0, 242, 242, 228 ); //Fridge
            set_character_color_slot( 1, 116, 121, 125 ); //Handle
        break;
        case 1:
            set_color_profile_slot( get_player_color(player), 0, 230, 218, 224 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 117, 100, 110 ); //Handle
        break;
        case 2:
            set_color_profile_slot( get_player_color(player), 0, 218, 234, 242 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 92, 111, 125 ); //Handle
        break;
        case 3:
            set_color_profile_slot( get_player_color(player), 0, 224, 196, 230 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 110, 79, 125 ); //Handle
        break;
        case 4:
            set_color_profile_slot( get_player_color(player), 0, 255, 252, 255 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 173, 128, 168 ); //Handle
        break;
        case 5:
            set_color_profile_slot( get_player_color(player), 0, 196, 150, 217 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 98, 47, 117 ); //Handle
        break;
        case 6:
            set_color_profile_slot( get_player_color(player), 0, 127, 126, 128 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 59, 59, 59 ); //Handle
        break;
        case 7:
            set_color_profile_slot( get_player_color(player), 0, 140, 115, 87 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 84, 67, 51 ); //Handle
        break;
        case 8:
            set_color_profile_slot( get_player_color(player), 0, 222, 239, 255 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 59, 95, 133 ); //Handle
        break;
        case 9:
            set_color_profile_slot( get_player_color(player), 0, 144, 242, 119 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 102, 102, 102 ); //Handle
        break;
        case 10:
            set_color_profile_slot( get_player_color(player), 0, 127, 95, 158 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 96, 59, 102 ); //Handle
        break;
        case 11:
            set_color_profile_slot( get_player_color(player), 0, 154, 237, 218 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 70, 143, 111 ); //Handle
        break;
        case 12:
            set_color_profile_slot( get_player_color(player), 0, 120, 175, 227 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 36, 128, 93 ); //Handle
        break;
        case 13:
            set_color_profile_slot( get_player_color(player), 0, 32, 166, 90 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 10, 102, 85 ); //Handle
        break;
        case 14:
            set_color_profile_slot( get_player_color(player), 0, 255, 208, 56 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 194, 91, 35 ); //Handle
        break;
        case 15:
            set_color_profile_slot( get_player_color(player), 0, 217, 179, 227 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 117, 103, 116 ); //Handle
        break;
        case 16:
            set_color_profile_slot( get_player_color(player), 0, 247, 237, 183 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 130, 70, 140 ); //Handle
        break;
        case 17:
            set_color_profile_slot( get_player_color(player), 0, 61, 62, 64 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 219, 219, 219 ); //Handle
        break;
        case 18:
            set_color_profile_slot( get_player_color(player), 0, 247, 245, 239 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 232, 192, 33 ); //Handle
        break;
        case 19:
            set_color_profile_slot( 19, 0, 143, 167, 191 ); //Fridge
            set_color_profile_slot( 19, 1, 62, 71, 99 ); //Handle
            set_color_profile_slot( get_player_color(player), 3, 116, 221, 247 ); //Flag2
            set_color_profile_slot( get_player_color(player), 6, 116, 221, 247 ); //Flag5
        break;
        case 20:
            set_color_profile_slot( 20, 0, 247, 252, 255 ); //Fridge
            set_color_profile_slot( 20, 1, 185, 173, 222 ); //Handle
        break;
        case 21:
            set_color_profile_slot( 21, 0, 168, 13, 13 ); //Fridge
            set_color_profile_slot( 21, 1, 61, 61, 61 ); //Handle
        break;
        case 22:
            set_color_profile_slot( get_player_color(player), 0, 255, 71, 142 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 255, 189, 229 ); //Handle
        break;
        case 23:
            set_color_profile_slot( get_player_color(player), 0, 242, 163, 148 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 161, 71, 64 ); //Handle
        break;
        case 24:
            set_color_profile_slot( get_player_color(player), 0, 179, 35, 35 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 128, 128, 128 ); //Handle
        break;
        case 25:
            //set_color_profile_slot( get_player_color(player), 0, 26, 26, 26 ); //Fridge
            //set_color_profile_slot( get_player_color(player), 1, 97, 97, 97 ); //Handle
        break;
        case 26:
            set_color_profile_slot( get_player_color(player), 0, 211, 226, 154 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 83, 122, 62 ); //Handle
        break;
        case 27:
            set_color_profile_slot( get_player_color(player), 0, 122, 86, 43 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 122, 86, 43 ); //Handle
        break;
        case 28:
            set_color_profile_slot( get_player_color(player), 0, 255, 252, 254 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 0, 0, 0 ); //Handle
        break;
        case 29:
            set_color_profile_slot( get_player_color(player), 0, 89, 171, 61 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 40, 77, 28 ); //Handle
        break;
        case 30:
            set_color_profile_slot( get_player_color(player), 0, 249, 255, 84 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 132, 156, 41 ); //Handle
        break;
        case 31:
            set_color_profile_slot( get_player_color(player), 0, 235, 60, 60 ); //Fridge
            set_color_profile_slot( get_player_color(player), 1, 235, 60, 60 ); //Handle
        break;
    }
}