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

// Allow pressing X on Xbox controller (Strong button) in the air to trigger Ghost Flight Up Special
if (free && move_cooldown[AT_USPECIAL] == 0 && (state == PS_FIRST_JUMP || state == PS_DOUBLE_JUMP || state == PS_IDLE_AIR || state == PS_WALL_JUMP)) {
    if (up_strong_pressed || strong_down) {
        set_attack(AT_USPECIAL);
    }
}
