// results_post_draw.gml
// Fallback results screen drawer: ensures Pink is drawn once in the middle if results_draw_portrait was not called

var timer_val = ("results_timer" in self) ? results_timer : 0;

if ("results_timer" in self) {
    if (!("pink_last_drawn_frame" in self) || pink_last_drawn_frame != results_timer) {
        pink_last_drawn_frame = results_timer;
        pink_victory_drawn = false;
    }
}

if ("pink_victory_drawn" in self && pink_victory_drawn) {
    exit;
}

var scr_w = 960;
var scr_h = 540;
if ("room_width" in self && room_width > 0) {
    scr_w = room_width;
    scr_h = room_height;
}

var draw_scale = (scr_w < 600) ? 0.5 : 1.0;
var draw_w = 350 * draw_scale;
var draw_h = 350 * draw_scale;

var draw_x = round((scr_w - draw_w) / 2);
var draw_y = round((scr_h - draw_h) / 2);

var anim_frame = (timer_val div 10) % 2;

draw_sprite_ext(sprite_get("victory_portrait"), anim_frame, draw_x, draw_y, draw_scale, draw_scale, 0, c_white, 1);
pink_victory_drawn = true;
