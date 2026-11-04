set_attack_value(39, AG_CATEGORY, 1);
set_attack_value(39, AG_SPRITE, sprite_get("fair2"));
set_attack_value(39, AG_NUM_WINDOWS, 3);
set_attack_value(39, AG_HAS_LANDING_LAG, 1);
set_attack_value(39, AG_LANDING_LAG, 4);
set_attack_value(39, AG_HURTBOX_SPRITE, sprite_get("fair2_hurt"));

set_window_value(39, 1, AG_WINDOW_TYPE, 1);
set_window_value(39, 1, AG_WINDOW_LENGTH, 4);
set_window_value(39, 1, AG_WINDOW_ANIM_FRAMES, 2);
//set_window_value(39, 1, AG_WINDOW_HSPEED, 1);
set_window_value(39, 1, AG_WINDOW_VSPEED, -1);
set_window_value(39, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(39, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
set_window_value(39, 1, AG_WINDOW_SFX_FRAME, 2);

set_window_value(39, 2, AG_WINDOW_TYPE, 1);
set_window_value(39, 2, AG_WINDOW_LENGTH, 2);
set_window_value(39, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(39, 2, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(39, 3, AG_WINDOW_TYPE, 1);
set_window_value(39, 3, AG_WINDOW_LENGTH, 8);
set_window_value(39, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(39, 3, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(39, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(39,1);

set_hitbox_value(39, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(39, 1, HG_WINDOW, 2);
set_hitbox_value(39, 1, HG_LIFETIME, 2);
set_hitbox_value(39, 1, HG_HITBOX_X, 28);
set_hitbox_value(39, 1, HG_HITBOX_Y, -32);
set_hitbox_value(39, 1, HG_WIDTH, 48);
set_hitbox_value(39, 1, HG_HEIGHT, 68);
set_hitbox_value(39, 1, HG_SHAPE, 2);
set_hitbox_value(39, 1, HG_PRIORITY, 1);
set_hitbox_value(39, 1, HG_DAMAGE, 5);
set_hitbox_value(39, 1, HG_ANGLE, 45);
set_hitbox_value(39, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(39, 1, HG_KNOCKBACK_SCALING, 0.1);
set_hitbox_value(39, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(39, 1, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(39, 1, HG_VISUAL_EFFECT_Y_OFFSET, -2);
set_hitbox_value(39, 1, HG_HIT_SFX, asset_get("sfx_blow_medium3"));