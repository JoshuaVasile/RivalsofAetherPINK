// post-draw is a script that draws things in front of the player

user_event(12);

// Draw the two Doki hearts above any opponent currently marked with 1 of the 2 hits (Dummy or Kitty)
if (!bb_active && bb_cooldown <= 0) {
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

// Draw the Deltarune Battle Box when active
if (bb_active) {
    var box_spr = sprite_get("bb_box");
    var soul_spr = sprite_get("bb_soul");
    var note_spr = sprite_get("bb_catnote");
    var bfall_spr = sprite_get("bb_bomb_fall");
    var bexp_spr = sprite_get("bb_bomb_exp");

    var box_scale = min(bb_timer / 40, 1);
    var box_ang = (1 - box_scale) * 180;
    var box_frame = (bb_timer < 40) ? 0 : ((bb_mode == 2) ? 2 : 1);

    // 1. Draw the Battle Box (Frame 0 during spin-in, Frame 1 for Cat Note Strings, Frame 2 for 4x4 Bomb Grid)
    draw_sprite_ext(box_spr, box_frame, bb_box_x, bb_box_y, box_scale, box_scale, box_ang, c_white, 1);

    if (bb_timer >= 40) {
        // 2. If in Strings mode and the Purple Heart just jumped between strings, draw the fading purple trail (like Boss Battle.png)
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
                            draw_line_width_color(bb_box_x - 110, gy_pos, bb_box_x + 110, gy_pos, 4, c_fuchsia, c_fuchsia);
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

                        // Draw full-row & full-column white/black blast beams inside the 234x234 box
                        draw_rectangle_color(bb_box_x - 111, gy_pos - beam_w - 2, bb_box_x + 111, gy_pos + beam_w + 2, c_black, c_black, c_black, c_black, false);
                        draw_rectangle_color(gx_pos - beam_w - 2, bb_box_y - 111, gx_pos + beam_w + 2, bb_box_y + 111, c_black, c_black, c_black, c_black, false);
                        draw_rectangle_color(bb_box_x - 111, gy_pos - beam_w, bb_box_x + 111, gy_pos + beam_w, c_white, c_white, c_white, c_white, false);
                        draw_rectangle_color(gx_pos - beam_w, bb_box_y - 111, gx_pos + beam_w, bb_box_y + 111, c_white, c_white, c_white, c_white, false);

                        // Draw the Deltarune bomb cross explosion sprite along the row and column intersections
                        for (var k = 0; k < 4; k++) {
                            var dpos = (k == 0) ? -94 : ((k == 1) ? -31 : ((k == 2) ? 31 : 94));
                            draw_sprite_ext(bexp_spr, exp_frame, bb_box_x + dpos, gy_pos, 1, 1, 0, c_white, 1);
                            if (bb_box_y + dpos != gy_pos) {
                                draw_sprite_ext(bexp_spr, exp_frame, gx_pos, bb_box_y + dpos, 1, 1, 0, c_white, 1);
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


