// post-draw is a script that draws things in front of the player

user_event(12);

// =========================================================================
// 1. Air Down Smash (AT_DSTRONG in air): Growing Bomb & Scaled Explosion
// =========================================================================
if ((state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && attack == AT_DSTRONG && get_attack_value(AT_DSTRONG, AG_CATEGORY) == 2 && overcharge_hurt_timer <= 0) {
    var bomb_spr = sprite_get("dstrong_bomb");
    shader_start();
    if (window == 1 && (image_index >= 5 || air_charge_timer > 0)) {
        var b_bob = sin(air_charge_timer * 0.35) * 2;
        var b_sc = dstrong_bomb_scale;
        draw_sprite_ext(bomb_spr, dstrong_bomb_stage, x - 4 * spr_dir, y - 114 + b_bob, b_sc * spr_dir, b_sc, 0, c_white, 1);
        if (overcharge_warning && (get_gameplay_time() % 4 < 2)) {
            gpu_set_fog(true, make_color_rgb(255, 120, 150), 0, 1);
            draw_sprite_ext(bomb_spr, dstrong_bomb_stage, x - 4 * spr_dir, y - 114 + b_bob, b_sc * spr_dir, b_sc, 0, c_white, 0.85);
            gpu_set_fog(false, c_white, 0, 0);
        }
    } else if (window == 2) {
        var throw_prog = clamp(window_timer / max(1, get_window_value(AT_DSTRONG, 2, AG_WINDOW_LENGTH)), 0, 1);
        var drop_y = lerp(y - 96, y - 6, throw_prog);
        var b_sc = dstrong_bomb_scale;
        draw_sprite_ext(bomb_spr, dstrong_bomb_stage, x - 2 * spr_dir, drop_y, b_sc * spr_dir, b_sc, 0, c_white, 1);
    } else if (window == 3 && dstrong_bomb_stage >= 1) {
        var exp_sc = 1.0 + dstrong_bomb_stage * 0.14;
        draw_sprite_ext(sprite_get("dstrong_air"), image_index, x, y, exp_sc * spr_dir, exp_sc, 0, c_white, 1);
    }
    shader_end();
}

// =========================================================================
// 2. Ground Up Smash (AT_USTRONG): Progressive 1..4 Cats Load & Shoot Upward
// =========================================================================
if ((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) && attack == AT_USTRONG && get_attack_value(AT_USTRONG, AG_CATEGORY) == 0 && overcharge_hurt_timer <= 0) {
    if (window == 1 || window == 2) {
        var ucat_spr = sprite_get("ustrong_cat");
        for (var c = 1; c <= ustrong_cat_count; c++) {
            var c_frame = (c == 1 && window == 1 && pink_charge_timer < 4) ? 0 : 1;
            draw_sprite_ext(ucat_spr, c_frame, x + (c - 1) * 19 * spr_dir, y, spr_dir, 1, 0, c_white, 1);
        }
    } else if (window >= 3 && image_index >= 4 && image_index < 10) {
        var s_frame = clamp(floor(image_index) - 4, 0, 5);
        var shoot_spr = sprite_get("ustrong_shoot");
        var frame_h = (s_frame == 0) ? 76 : ((s_frame == 1) ? 131 : ((s_frame == 2) ? 172 : ((s_frame == 3) ? 190 : ((s_frame == 4) ? 185 : 175))));
        var cat_scales = [1.20, 0.96, 0.74, 0.54];
        for (var c = 1; c <= ustrong_cat_count; c++) {
            var off_x = (c - 1) * 19 * spr_dir;
            var dy_cur = round(frame_h * (1.0 - cat_scales[c - 1]));
            if (dy_cur <= 0) {
                draw_sprite_ext(shoot_spr, s_frame, x + off_x, y + dy_cur, spr_dir, 1, 0, c_white, 1);
            } else {
                var draw_h = max(1, 190 - dy_cur);
                var draw_dx = (spr_dir == 1) ? (x + off_x - 96) : (x + off_x + 96);
                draw_sprite_part_ext(shoot_spr, s_frame, 0, 0, 192, draw_h, draw_dx, y - 190 + dy_cur, spr_dir, 1, c_white, 1);
            }
        }
    }
}

// =========================================================================
// 3. Overcharge Warning Flash Indicator (Flashes before Pink takes self-damage!)
// =========================================================================
if ((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR) && overcharge_warning && overcharge_hurt_timer <= 0) {
    var gt = get_gameplay_time();
    if ((gt % 4) < 2) {
        // Flash bright warning silhouette / tint so players clearly see she's about to get hurt!
        gpu_set_fog(true, make_color_rgb(255, 90, 130), 0, 1);
        draw_sprite_ext(sprite_index, image_index, x, y, spr_dir, 1, 0, c_white, 0.85);
        gpu_set_fog(false, c_white, 0, 0);
    } else if ((gt % 6) == 0) {
        draw_sprite_ext(sprite_get("overcharge_hurt"), 1, x, y, spr_dir, 1, 0, c_white, 0.75);
    }
}

// =========================================================================
// 4. Lockout Body Electricity: Very faint cyan sparks around Pink when NSpecial or Ground FStrong is locked out
// =========================================================================
if ((nspecial_lockout > 0 || fstrong_lockout > 0) && state != PS_DEAD && state != PS_RESPAWN && !bb_active) {
    var gt = get_gameplay_time();
    var tick = floor(gt / 3);
    var nudge_active = (nspecial_hud_nudge > 0 || fstrong_hud_nudge > 0);
    var e_alpha = nudge_active ? 0.56 : (0.26 + 0.08 * sin(gt * 0.25));
    var arc_count = (nspecial_lockout > 0 && fstrong_lockout > 0) ? 3 : 2;
    var col_outer = make_color_rgb(100, 210, 255);
    var col_inner = make_color_rgb(215, 245, 255);

    for (var a = 0; a < arc_count; a++) {
        var base_ang = tick * 1.15 + a * 2.094;
        var prev_px = 0;
        var prev_py = 0;
        for (var s = 0; s <= 3; s++) {
            var seg_ang = base_ang + (s / 3) * 0.95;
            var jx = sin(tick * 2.3 + s * 3.7 + a * 5.1) * 3.2;
            var jy = cos(tick * 1.9 + s * 4.3 + a * 2.7) * 3.2;
            var px = x + cos(seg_ang) * 16 + jx;
            var py = (y - 30) + sin(seg_ang) * 22 + jy;
            if (s > 0) {
                draw_set_alpha(e_alpha);
                draw_line_width_color(prev_px, prev_py, px, py, 2, col_outer, col_outer);
                draw_set_alpha(e_alpha * 0.75);
                draw_line_width_color(prev_px, prev_py, px, py, 1, col_inner, col_inner);
            }
            prev_px = px;
            prev_py = py;
        }
    }
    draw_set_alpha(1);
}

// Tier 2 (Purple) Heart Aura & Tier 3 MAX Radiant Pulse
if (doki_tier == 2 && state != PS_DEAD && state != PS_RESPAWN) {
    var gt = get_gameplay_time();
    var aura_alpha = 0.5 + sin(gt * 0.15) * 0.2;
    var mark_spr = sprite_get("bb_mark");
    var bob1 = sin(gt * 0.15) * 4;
    var bob2 = cos(gt * 0.15) * 4;
    draw_sprite_ext(mark_spr, 0, x - 18, y - 36 + bob1, 0.45, 0.45, gt * 2, c_white, aura_alpha * 0.7);
    draw_sprite_ext(mark_spr, 0, x + 18, y - 36 - bob1, 0.45, 0.45, -gt * 2, c_white, aura_alpha * 0.7);
    draw_sprite_ext(mark_spr, 0, x + bob2, y - 56, 0.5, 0.5, 0, c_white, aura_alpha * 0.85);
} else if (doki_meter >= 100 && state != PS_DEAD && state != PS_RESPAWN) {
    var gt = get_gameplay_time();
    var max_alpha = 0.55 + sin(gt * 0.3) * 0.25;
    var mark_spr = sprite_get("bb_mark");
    draw_sprite_ext(mark_spr, 1, x, y - char_height - 18, 0.75 + sin(gt * 0.2) * 0.1, 0.75 + sin(gt * 0.2) * 0.1, 0, c_white, max_alpha);
}

// Draw the two Doki hearts above any opponent currently marked with 1 of the 2 hits (Dummy or Kitty)
if (!bb_active && bb_unlocked && bb_cooldown <= 0) {
    var mark_spr = sprite_get("bb_mark");
    var gt = get_gameplay_time();
    with (oPlayer) {
        if (id != other.id && player >= 1 && player <= 4) {
            if (other.bb_dummy_hit_timer[player] > 0 || other.bb_kitty_hit_timer[player] > 0) {
                var bob = sin(gt * 0.2) * 3;
                var swap = (gt div 10) % 2;
                draw_sprite_ext(mark_spr, swap, x - 16, y - char_height - 26 + bob, 0.75, 0.75, 0, c_white, 0.85);
                draw_sprite_ext(mark_spr, 1 - swap, x + 16, y - char_height - 26 - bob, 0.75, 0.75, 0, c_white, 0.85);
            }
        }
    }
}

// Draw the Deltarune Battle Box when active (1.25x longer horizontally)
if (bb_active) {
    var box_spr = sprite_get("bb_box");
    var soul_spr = sprite_get("bb_soul");
    var note_spr = sprite_get("bb_catnote");
    var bfall_spr = sprite_get("bb_bomb_fall");
    var bexp_spr = sprite_get("bb_bomb_exp");

    var box_scale = min(bb_timer / 40, 1);
    var box_ang = (1 - box_scale) * 180;
    var box_frame = (bb_timer < 40) ? 0 : ((bb_mode == 2) ? 2 : 1);

    // 1. Draw the Battle Box (slightly longer horizontally: 1.25x width)
    draw_sprite_ext(box_spr, box_frame, bb_box_x, bb_box_y, box_scale * 1.25, box_scale, box_ang, c_white, 1);

    if (bb_timer >= 40) {
        // 2. If in Strings mode and the Purple Heart just jumped between strings, draw the fading purple trail
        if (bb_mode == 1 && bb_soul_trail_timer > 0) {
            var t_alpha = (bb_soul_trail_timer / 10) * 0.55;
            var mid_y = lerp(bb_soul_y, bb_soul_prev_y, 0.5);
            draw_sprite_ext(soul_spr, 0, bb_box_x + bb_soul_x, bb_box_y + bb_soul_prev_y, 1, 1, 0, c_white, t_alpha * 0.6);
            draw_sprite_ext(soul_spr, 0, bb_box_x + bb_soul_x, bb_box_y + mid_y, 1, 1, 0, c_white, t_alpha);
        }

        // 3. Draw active obstacles before/around the Soul Heart
        for (var i = 0; i < array_length(bb_objects); i++) {
            var obj = bb_objects[i];
            if (obj.active) {
                if (obj.type == 1) {
                    // Cat Musical Note gliding along the string
                    var note_bob = sin(obj.timer * 0.25) * 3;
                    draw_sprite_ext(note_spr, 0, bb_box_x + obj.x, bb_box_y + obj.y + note_bob, 1, 1, 0, c_white, 1);
                } else if (obj.type == 2) {
                    // Grid Bomb
                    var gx_pos = bb_box_x + obj.x;
                    var gy_pos = bb_box_y + obj.y;
                    if (obj.timer < 31) {
                        // Warning flash on target dot & row/column + falling bomb sprite
                        if ((obj.timer % 6) < 3) {
                            draw_set_alpha(0.4);
                            draw_line_width_color(bb_box_x - 138, gy_pos, bb_box_x + 138, gy_pos, 4, c_fuchsia, c_fuchsia);
                            draw_line_width_color(gx_pos, bb_box_y - 110, gx_pos, bb_box_y + 110, 4, c_fuchsia, c_fuchsia);
                            draw_set_alpha(1);
                        }
                        var fall_prog = obj.timer / 30;
                        var drop_y = lerp(bb_box_y - 108, gy_pos, fall_prog);
                        var fall_frame = clamp(floor(fall_prog * 5), 0, 4);
                        draw_sprite_ext(bfall_spr, fall_frame, gx_pos, drop_y, 1, 1, 0, c_white, 1);
                    } else {
                        // Cross (+) Explosion destroying the entire row and column of the dot it landed on!
                        var exp_prog = (obj.timer - 31) / 23;
                        var exp_frame = clamp(floor(exp_prog * 8), 0, 7);
                        var beam_w = max(2, round(18 * (1 - exp_prog * 0.6)));

                        // Draw full-row & full-column white/black blast beams inside the wider box
                        draw_rectangle_color(bb_box_x - 139, gy_pos - beam_w - 2, bb_box_x + 139, gy_pos + beam_w + 2, c_black, c_black, c_black, c_black, false);
                        draw_rectangle_color(gx_pos - beam_w - 2, bb_box_y - 111, gx_pos + beam_w + 2, bb_box_y + 111, c_black, c_black, c_black, c_black, false);
                        draw_rectangle_color(bb_box_x - 139, gy_pos - beam_w, bb_box_x + 139, gy_pos + beam_w, c_white, c_white, c_white, c_white, false);
                        draw_rectangle_color(gx_pos - beam_w, bb_box_y - 111, gx_pos + beam_w, bb_box_y + 111, c_white, c_white, c_white, c_white, false);

                        // Draw the Deltarune bomb cross explosion sprite along the row and column intersections
                        for (var k = 0; k < 4; k++) {
                            var dpos_x = (k == 0) ? -118 : ((k == 1) ? -39 : ((k == 2) ? 39 : 118));
                            var dpos_y = (k == 0) ? -94 : ((k == 1) ? -31 : ((k == 2) ? 31 : 94));
                            draw_sprite_ext(bexp_spr, exp_frame, bb_box_x + dpos_x, gy_pos, 1, 1, 0, c_white, 1);
                            if (bb_box_y + dpos_y != gy_pos) {
                                draw_sprite_ext(bexp_spr, exp_frame, gx_pos, bb_box_y + dpos_y, 1, 1, 0, c_white, 1);
                            }
                        }
                    }
                }
            }
        }

        // 4. Draw the Purple Soul Heart inside the Battle Box (flashes during hit invulnerability)
        var soul_alpha = (bb_soul_invuln > 0 && (bb_timer % 4 < 2)) ? 0.45 : 1;
        draw_sprite_ext(soul_spr, 0, bb_box_x + bb_soul_x, bb_box_y + bb_soul_y, 1, 1, 0, c_white, soul_alpha);
    }
}

// Floating Heal popup (+10 CRIT!) above Pink
if (heal_popup_timer > 0) {
    var p_alpha = min(1, heal_popup_timer / 15);
    var mark_spr = sprite_get("bb_mark");
    var p_str = "";
    if (heal_popup_is_crit) {
        if (heal_popup_amount > 0) p_str = "+" + string(heal_popup_amount) + " CRIT!";
        else p_str = "CRIT!";
    } else {
        p_str = "+" + string(heal_popup_amount);
    }
    var p_col = heal_popup_is_crit ? make_color_rgb(255, 230, 80) : make_color_rgb(100, 255, 120);

    // Draw little floating heart
    draw_sprite_ext(mark_spr, 0, heal_popup_x - 14, heal_popup_y, 0.65, 0.65, 0, c_white, p_alpha);

    // Draw heal text with drop shadow
    draw_set_font(asset_get("fName"));
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_text_ext_transformed_color(heal_popup_x - 2, heal_popup_y + 1, p_str, 10, 200, 1, 1, 0, c_black, c_black, c_black, c_black, p_alpha);
    draw_text_ext_transformed_color(heal_popup_x - 3, heal_popup_y, p_str, 10, 200, 1, 1, 0, p_col, p_col, p_col, p_col, p_alpha);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
