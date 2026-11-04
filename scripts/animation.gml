// animation is a script that runs every frame and can override sprite_index / image_index.

// Successful Parry: override to Mad Pink animation in the direction she was facing
if (state == PS_PARRY && successful_parry) {
    sprite_index = sprite_get("parry_success");
    image_index = (parry_success_timer div 6) % 2;
    parry_success_timer++;
}

if ((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) && attack == AT_TAUNT) {
    if (is_down_taunt) {
        sprite_index = sprite_get("Pink_overworld_toungue");
        image_index = 0;
    }
}
