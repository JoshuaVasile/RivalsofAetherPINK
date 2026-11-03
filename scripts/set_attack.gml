// set_attack runs frame 0 of any attack.

// Optional Forward Tilt to Kiss redirection:
// If kiss_on_forward_tilt is enabled, holding Left/Right + Attack will perform the Kiss (Jab)
if (attack == AT_FTILT && kiss_on_forward_tilt) {
    attack = AT_JAB;
}

// Neutral A (Kiss with Heart): Roll for Crit and apply corresponding hitbox stats
if (attack == AT_JAB) {
    var crit_roll = random_func((get_gameplay_time() + player * 7) % 25, 100, true);
    jab_is_crit = (crit_roll < jab_crit_chance);

    if (jab_is_crit) {
        set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 11);
        set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_JAB, 1, HG_KNOCKBACK_SCALING, 0.5);
        set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 10);
        set_hitbox_value(AT_JAB, 1, HG_HITPAUSE_SCALING, 0.6);
        set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, sound_get("heart_electric"));
        set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 304);
    } else {
        set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 4); // Halved base damage on non-crit (was 8)
        set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 4);
        set_hitbox_value(AT_JAB, 1, HG_KNOCKBACK_SCALING, 0);
        set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 6);
        set_hitbox_value(AT_JAB, 1, HG_HITPAUSE_SCALING, 0);
        set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, sound_get("snd_hurt1"));
        set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 0);
    }
}

// Taunts:
// Down Taunt (holding Down on stick/c-stick, or crouching) = tongue out with snd_pink_gasp.
// Up, Left, Right, and Neutral taunts = laughing taunt.
if (attack == AT_TAUNT || attack == AT_TAUNT_2) {
    var has_down = (attack == AT_TAUNT_2 || down_down || down_pressed || down_stick_down || down_hard_pressed || state == PS_CROUCH || is_down_taunt);
    if (up_down || (!down_down && !down_pressed && !down_stick_down && state != PS_CROUCH && !is_down_taunt)) {
        has_down = false;
    }
    is_down_taunt = has_down;
    attack = AT_TAUNT;
}

user_event(13);
