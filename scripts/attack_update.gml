// attack_update is a script called when you're doing an attack. It runs for every in-game frame.
//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}

// Up Special: Ghost Form Flight Recovery (steered with directional inputs)
if (attack == AT_USPECIAL) {
    if (window == 1) {
        hsp = 0;
        vsp = 0;
    }
    if (window == 2) {
        var dx = (right_down - left_down);
        var dy = (down_down - up_down);
        if (dx == 0 && dy == 0) {
            // No direction held: catch herself and float in place
            hsp = 0;
            vsp = 0;
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

    // On-hit aerial cancel: After hitting someone with Up Special, Pink can cancel into any aerial attack (except DAir)!
    if (has_hit) {
        can_fast_fall = true;
        var do_cancel = false;
        var target_atk = noone;

        if (up_down || up_stick_pressed) {
            if (attack_pressed || up_stick_pressed) {
                target_atk = AT_UAIR;
                do_cancel = true;
            }
        } else if (down_down || down_stick_pressed) {
            // DAir cancel is disallowed as requested
            do_cancel = false;
        } else if ((spr_dir == 1 && (right_down || right_stick_pressed)) || (spr_dir == -1 && (left_down || left_stick_pressed))) {
            if (attack_pressed || right_stick_pressed || left_stick_pressed) {
                target_atk = AT_FAIR;
                do_cancel = true;
            }
        } else if ((spr_dir == 1 && (left_down || left_stick_pressed)) || (spr_dir == -1 && (right_down || right_stick_pressed))) {
            if (attack_pressed || right_stick_pressed || left_stick_pressed) {
                target_atk = AT_FAIR;
                spr_dir *= -1;
                do_cancel = true;
            }
        } else if (attack_pressed) {
            target_atk = AT_NAIR;
            do_cancel = true;
        }

        if (do_cancel && target_atk != noone) {
            attack_end();
            destroy_hitboxes();
            set_attack(target_atk);
        }
    }
}

if (attack == AT_DSPECIAL) {
// Only spawn the (non-damaging) dummy article on the ground. In the air it just fell out of
// her model as a visual bug; the real damaging dummy is the DSpecial projectile hitbox.
if (attack == AT_DSPECIAL && window == 2 && !dummy_spawned && !free)
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
    // Allows throwing 2-3 kitties while they bounce across the stage
    move_cooldown[AT_NSPECIAL] = 16;
}

// Aerial Bomb Smashes: Air Down Smash (AT_DSTRONG when free) & Air Left/Right Smash (AT_FAIR / AT_BAIR)
// She slowly falls as she charges and drops them, then goes into free fall (PS_PRATFALL)!
if (((attack == AT_DSTRONG && free) || attack == AT_FAIR || attack == AT_BAIR) && free) {
    hsp = 0;
    vsp = 0.8; // Very slow fall while charging and dropping the bomb
    can_fast_fall = false;
    can_move = false;

    // Fortify Pink during aerial windup: soft armor against pokes, super armor while actively charging!
    if (window == 1) {
        if (air_charge_timer > 0) {
            super_armor = true;
        } else {
            soft_armor = 12;
        }
    } else {
        super_armor = false;
        soft_armor = 0;
    }

    var w_len = get_window_value(attack, 1, AG_WINDOW_LENGTH);
    if (window == 1 && window_timer == w_len - 1) {
        var holding_charge = (strong_down || down_strong_down || left_strong_down || right_strong_down || attack_down || down_stick_down || left_stick_down || right_stick_down);
        if (holding_charge && air_charge_timer < 50) {
            air_charge_timer++;
            strong_charge = min(60, air_charge_timer);
            window_timer = w_len - 2;
        }
    }
    if (window <= 3) {
        char_height = 120;
    } else {
        char_height = 52;
    }
    // After the bomb goes off, go into free fall (pratfall) until she lands or grabs a wall!
    if (window == get_attack_value(attack, AG_NUM_WINDOWS)
        && window_timer >= get_window_value(attack, window, AG_WINDOW_LENGTH) - 1) {
        char_height = 52;
        super_armor = false;
        soft_armor = 0;
        set_state(PS_PRATFALL);
    }
}

// Her Down A in the air (AT_DAIR): Downward bouncing Kitty throw, then goes helpless (PS_PRATFALL)!
if (attack == AT_DAIR && free) {
    hsp = 0;
    vsp = 0.8; // Very slow fall while charging
    can_fast_fall = false;
    can_move = false;

    // Fortify Pink during aerial Kitty charge:
    if (window == 1) {
        if (air_charge_timer > 0) {
            super_armor = true;
        } else {
            soft_armor = 12;
        }
    } else {
        super_armor = false;
        soft_armor = 0;
    }

    var dair_w1_len = get_window_value(AT_DAIR, 1, AG_WINDOW_LENGTH);
    if (window == 1 && window_timer == dair_w1_len - 1) {
        if ((attack_down || strong_down || down_strong_down || down_stick_down) && air_charge_timer < 45) {
            air_charge_timer++;
            strong_charge = min(60, air_charge_timer);
            window_timer = dair_w1_len - 2;
        }
    }
    // Scale Down A Kitty damage with charge (base 5 dmg = 30% more than X Kitty's 4 dmg, up to 7 dmg)
    if (window == 2 && window_timer == 1) {
        var bonus_dmg = floor(air_charge_timer / 20);
        set_hitbox_value(AT_DAIR, 1, HG_DAMAGE, 5 + bonus_dmg);
    }
    if (window == get_attack_value(AT_DAIR, AG_NUM_WINDOWS)
        && window_timer >= get_window_value(AT_DAIR, window, AG_WINDOW_LENGTH) - 1) {
        super_armor = false;
        soft_armor = 0;
        set_state(PS_PRATFALL);
    }
}

// Taunt handling: Down Taunt (AT_TAUNT_2 or Down + AT_TAUNT) uses tongue expression with snd_pink_gasp; Neutral, Up, Left, Right laugh (AT_TAUNT)
if (attack == AT_TAUNT_2 || (attack == AT_TAUNT && is_down_taunt)) {
    sprite_index = sprite_get("Pink_overworld_toungue");
    image_index = 0;
    can_jump = (window >= 2);
    can_shield = (window >= 2);
    if (window == 1 && window_timer == 1) {
        sound_stop(sound_get("pink_laugh1"));
        sound_play(sound_get("snd_pink_gasp"));
    }
    if (window == 2 && (down_down || down_stick_down || taunt_down)) {
        if (window_timer >= get_window_value(attack, window, AG_WINDOW_LENGTH) - 1) {
            window_timer = 0;
        }
    }
    if (window == 3 && window_timer >= get_window_value(attack, window, AG_WINDOW_LENGTH) - 1) {
        is_down_taunt = false;
    }
} else if (attack == AT_TAUNT) {
    sprite_index = sprite_get("taunt");
    if (window == 1 && window_timer == 1) {
        sound_stop(sound_get("snd_pink_gasp"));
        sound_play(sound_get("pink_laugh1"));
    }
}
