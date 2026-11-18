// hitbox_update is a script called every frame for each of your character's hitboxes. Always from the perspective of the hitbox.

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
    if ("kitty_bounce_cd" not in self) {
        kitty_bounce_cd = 0;
    }
    // Detect actual floor/platform bounce (avoid misfiring on midair kitty-to-kitty bounces)
    if (!dair_bounced && hitbox_timer > 1 && kitty_bounce_cd <= 0 && (!free || position_meeting(x, y + 8, asset_get("par_block")) || (vsp <= 0 && position_meeting(x, y + 14, asset_get("par_jumpthrough"))))) {
        dair_bounced = true;
        vsp = -9.5; // Bounce high up into the air!
        hsp = 2 * spr_dir;
        sound_play(sound_get("snd_bump"));
    }
}

// Air Up Smash Kitty (AT_USTRONG cat projectile): Keep floor/platform bounces lively!
if (attack == AT_USTRONG && sprite_index == sprite_get("cat")) {
    if ("kitty_bounce_cd" not in self) {
        kitty_bounce_cd = 0;
    }
    if (hitbox_timer > 4 && kitty_bounce_cd <= 0 && vsp <= 0 && vsp > -6.5 && (!free || position_meeting(x, y + 10, asset_get("par_block")) || position_meeting(x, y + 10, asset_get("par_jumpthrough")))) {
        vsp = -8.2;
        kitty_bounce_cd = 5;
        sound_play(sound_get("snd_bump"));
    }
}

// Kitty-to-Kitty bouncing: thrown kitties (NSpecial, DAir, & Air UStrong) bounce off each other!
if (attack == AT_NSPECIAL || attack == AT_DAIR || (attack == AT_USTRONG && sprite_index == sprite_get("cat"))) {
    if ("kitty_bounce_cd" not in self) {
        kitty_bounce_cd = 0;
    }
    if (kitty_bounce_cd > 0) {
        kitty_bounce_cd--;
    }

    if (hitbox_timer >= 2 && kitty_bounce_cd <= 0) {
        var k_spr1 = sprite_index;
        var cy1 = y - ((k_spr1 == sprite_get("cat_tiny")) ? 9 : ((k_spr1 == sprite_get("cat_small")) ? 14 : 19));
        var r1 = (k_spr1 == sprite_get("cat_tiny")) ? 10 : ((k_spr1 == sprite_get("cat_small")) ? 14 : 18);
        _bounced_kitty = false;

        with (pHitBox) {
            if (!other._bounced_kitty && id > other.id && (attack == AT_NSPECIAL || attack == AT_DAIR || (attack == AT_USTRONG && sprite_index == sprite_get("cat"))) && hitbox_timer >= 2) {
                if ("kitty_bounce_cd" not in self) {
                    kitty_bounce_cd = 0;
                }
                if (kitty_bounce_cd <= 0) {
                    var k_spr2 = sprite_index;
                    var cy2 = y - ((k_spr2 == sprite_get("cat_tiny")) ? 9 : ((k_spr2 == sprite_get("cat_small")) ? 14 : 19));
                    var r2 = (k_spr2 == sprite_get("cat_tiny")) ? 10 : ((k_spr2 == sprite_get("cat_small")) ? 14 : 18);

                    var dx = other.x - x;
                    var dy = cy1 - cy2;
                    var dist = point_distance(0, 0, dx, dy);
                    if (dist < (r1 + r2)) {
                        var nx = (dist > 0.01) ? (dx / dist) : 1;
                        var ny = (dist > 0.01) ? (dy / dist) : -1;

                        var rvx = other.hsp - hsp;
                        var rvy = other.vsp - vsp;
                        var rel_vn = rvx * nx + rvy * ny;

                        if (rel_vn < 0) {
                            var imp = rel_vn * 1.1;
                            other.hsp -= imp * nx;
                            other.vsp -= imp * ny;
                            hsp += imp * nx;
                            vsp += imp * ny;
                        } else {
                            other.hsp += nx * 2.5;
                            other.vsp += ny * 2.5 - 1.5;
                            hsp -= nx * 2.5;
                            vsp -= ny * 2.5 - 1.5;
                        }

                        if (abs(other.vsp) < 3.0) other.vsp = -4.5;
                        if (abs(vsp) < 3.0) vsp = -4.5;

                        other.hsp = clamp(other.hsp, -9, 9);
                        other.vsp = clamp(other.vsp, -11, 11);
                        hsp = clamp(hsp, -9, 9);
                        vsp = clamp(vsp, -11, 11);

                        other.x += nx * 3;
                        other.y += ny * 3;
                        x -= nx * 3;
                        y -= ny * 3;

                        other.kitty_bounce_cd = 7;
                        kitty_bounce_cd = 7;
                        other._bounced_kitty = true;
                        sound_play(sound_get("snd_bump"));
                        spawn_hit_fx((other.x + x) * 0.5, (cy1 + cy2) * 0.5, 301);
                    }
                }
            }
        }
    }
}
