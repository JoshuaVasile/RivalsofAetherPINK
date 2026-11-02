// death is a script that is called when your character reaches a blastzone and is knocked out.
sound_play(sound_get("pink_trip"));

// Ultimate reset on death: refresh Battle Box cooldown so she gets it back to use again
bb_cooldown = 0;
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
