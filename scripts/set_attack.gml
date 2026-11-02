// set_attack runs frame 0 of any attack.

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
