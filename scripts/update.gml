// update is a script that runs whatever code is in here every in-game frame.
user_event(14);
if (fan_cooldown > 0)
{
    fan_cooldown--;
    if (fan_cooldown == 0) {
        dummy_spawned = false;
    }
}

if (ghost_cooldown > 0)
{
    ghost_cooldown--;
    if (ghost_cooldown == 0) {
        ghost_spawned = false;
    }
}

// Aerial Strong inputs: Down + Strong does Aerial Down Smash (bomb throw), Strong/Up+Strong does Ghost Flight
if (free && (state == PS_FIRST_JUMP || state == PS_DOUBLE_JUMP || state == PS_IDLE_AIR || state == PS_WALL_JUMP)) {
    if (down_strong_pressed || (down_down && strong_down)) {
        set_attack(AT_DAIR);
    } else if (move_cooldown[AT_USPECIAL] == 0 && (up_strong_pressed || strong_down)) {
        set_attack(AT_USPECIAL);
    }
}
