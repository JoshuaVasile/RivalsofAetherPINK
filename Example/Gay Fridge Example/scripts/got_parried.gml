var moveparried = my_hitboxID.attack;

switch(moveparried){
    case AT_JAB:
        state = PS_IDLE;
        break;
}

if (my_hitboxID.attack == AT_NSPECIAL && my_hitboxID.type == 2 && my_hitboxID.orig_player == player) {
  switch(my_hitboxID.hbox_num) {
    case 1:
        my_hitboxID.hitbox_timer = 0;
        break;
    case 3:
        my_hitboxID.hitbox_timer = 0;
        break;
    case 7:
        my_hitboxID.destroyed = true;
        break;
    case 8:
        my_hitboxID.destroyed = true;
        break;
    case 9:
        my_hitboxID.destroyed = true;
        break;
    case 13:
        my_hitboxID.destroyed = true;
        break;
    case 15:
        my_hitboxID.hitbox_timer = 0;
        my_hitboxID.hsp = 10*spr_dir;
        break;
    default:
      break;
  }
}

if (my_hitboxID.attack == AT_NSPECIAL && my_hitboxID.hbox_num == 2){
    var p_hsp = my_hitboxID.hsp;
    var p_vsp = my_hitboxID.vsp;
    with pHitBox {

        if (attack == AT_NSPECIAL && hbox_num == 2 && player_id == other)
        {
            //vsp *= 1.5;
            //hsp *= 1.5;
        
            if (self != other.my_hitboxID)
            {
                player = other.hit_player;
                vsp = -p_vsp;
                hsp = -p_hsp;
                hitbox_timer = 0
            }
        }
    }
}     

if (enemy_hitboxID.orig_player == player) invince_time = 0;