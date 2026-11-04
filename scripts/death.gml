// death is a script that is called when your character reaches a blastzone and is knocked out.
sound_play(sound_get("pink_trip"));

// Ultimate & Doki Meter reset on death
bb_cooldown = 0;
bb_unlocked = false;
doki_meter = 0;
prev_player_damage = 0;
heal_popup_timer = 0;
for (var p = 1; p <= 4; p++) {
    bb_dummy_hit_timer[p] = 0;
    bb_kitty_hit_timer[p] = 0;
}
if (bb_active) {
    bb_active = false;
    bb_objects = [];
    if (instance_exists(bb_victim)) {
        bb_victim.hurtboxID.sprite_index = bb_victim.hurtbox_spr;
        bb_victim.hitpause = false;
        bb_victim.hitstop = 0;
        bb_victim.invincible_timer = 20;
    }
    bb_victim = noone;
}
