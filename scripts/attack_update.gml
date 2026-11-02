// attack_update is a script called when you're doing an attack. It runs for every in-game frame.
//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

// Up Special: Ghost Form Flight Recovery (steered with directional inputs)
if (attack == AT_USPECIAL) {
    if (window == 1) {
        hsp = 0;
        vsp = -2;
    }
    if (window == 2) {
        var dx = (right_down - left_down);
        var dy = (down_down - up_down);
        if (dx == 0 && dy == 0) {
            // No direction held: fly straight up
            hsp = 0;
            vsp = -6.5;
        } else {
            var fly_dir = point_direction(0, 0, dx, dy);
            hsp = lengthdir_x(7.5, fly_dir);
            vsp = lengthdir_y(7.5, fly_dir);
            if (dx != 0) {
                spr_dir = dx;
            }
        }
    }
    if (window == 3 && window_timer == 1) {
        hsp *= 0.5;
        vsp *= 0.5;
        move_cooldown[AT_USPECIAL] = 30;
    }
}

if (attack == AT_DSPECIAL) {
if (attack == AT_DSPECIAL && window == 2 && !dummy_spawned)
    {
        dummy_spawned = true;
        fan_cooldown = 120;

        var dummy = instance_create(x, y, "obj_article1");
    dummy.player_id = id;      // Thats you
    dummy.team = team;          // Thats your friends
    dummy.lifetime = 300;
    dummy.hsp = 5 * spr_dir;
    dummy.vsp = -2;
    dummy.homing = true;
    dummy.homing_speed = 6;
    dummy.return_timer = 30;
    dummy.enemy = noone;
    move_cooldown[AT_DSPECIAL] = 120;
    } else {
        move_cooldown[AT_DSPECIAL] = 120;
        fan_cooldown = 120;
    }
}

if (attack == AT_FSPECIAL) {
if (attack == AT_FSPECIAL && window == 2 && !ghost_spawned)
    {
        ghost_spawned = true;
        ghost_cooldown = 180;

        var ghost = instance_create(x, y, "obj_article2");
    ghost.player_id = id;      // Thats you
    ghost.team = team;          // Thats your friends
    ghost.lifetime = 300;
    ghost.hsp = 5 * spr_dir;
    ghost.vsp = -2;
    ghost.homing = true;
    ghost.homing_speed = 6;
    ghost.return_timer = 30;
    ghost.enemy = noone;
    move_cooldown[AT_FSPECIAL] = 180;
    } else {
        move_cooldown[AT_FSPECIAL] = 180;
        ghost_cooldown = 180;
    }
}

if (attack == AT_NSPECIAL) {
    // Projectile sprite (cat) is set in attacks/nspecial.gml
    move_cooldown[AT_NSPECIAL] = 10;
}

//animation is too big :/
if (attack == AT_DSTRONG) {
    if (window <= 4) {
        char_height = 120;
    } else {
        char_height = 52;
    }
}

//animation is too big here 2 :/
if (attack == AT_FSTRONG) {
    if (window <= 2) {
        char_height = 120;
    } else {
        char_height = 52;
    }
}
