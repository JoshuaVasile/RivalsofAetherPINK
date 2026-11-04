// hitbox_update is a script called every frame for each of your character's hitboxes. Always from the perspective of the hitbox.

// Ground Left/Right Smash Lane Bullet (AT_FSTRONG): Short-ranged projectile that dissipates with a sparkle
if (attack == AT_FSTRONG && hbox_num == 1) {
    if (hitbox_timer >= length - 1) {
        spawn_hit_fx(x, y, 301); // small sparkle effect when expiring
    }
}

// X Kitty (AT_NSPECIAL): Bounces cleanly across the stage, no premature vanishing
if (attack == AT_NSPECIAL) {
    if (hitbox_timer >= length - 1) {
        spawn_hit_fx(x, y - 16, 144); // small puff effect when expiring at max range
    }
}

// Down A Kitty (AT_DAIR): Thrown downward toward the ground, then bounces strongly upward!
if (attack == AT_DAIR) {
    if ("dair_bounced" not in self) {
        dair_bounced = false;
    }
    // Detect when the downward-thrown kitty bounces off the ground (vsp flips or touches floor)
    if (!dair_bounced && hitbox_timer > 1 && (vsp <= 0 || !free || position_meeting(x, y + 6, asset_get("par_block")))) {
        dair_bounced = true;
        vsp = -9.5; // Bounce high up into the air!
        hsp = 2 * spr_dir;
        sound_play(sound_get("snd_bump"));
    }
}
