set_attack_value(40, AG_CATEGORY, 1);
set_attack_value(40, AG_SPRITE, sprite_get("dair2"));
set_attack_value(40, AG_NUM_WINDOWS, 3);
set_attack_value(40, AG_HAS_LANDING_LAG, 1);
set_attack_value(40, AG_LANDING_LAG, 8);
set_attack_value(40, AG_HURTBOX_SPRITE, sprite_get("dair2_hurt"));

set_window_value(40, 1, AG_WINDOW_TYPE, 1);
set_window_value(40, 1, AG_WINDOW_LENGTH, 8);
set_window_value(40, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(40, 1, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(40, 1, AG_WINDOW_VSPEED, -2);
set_window_value(40, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(40, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_heavy2"));
set_window_value(40, 1, AG_WINDOW_SFX_FRAME, 4);

set_window_value(40, 2, AG_WINDOW_TYPE, 1);
set_window_value(40, 2, AG_WINDOW_LENGTH, 3);
set_window_value(40, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(40, 2, AG_WINDOW_ANIM_FRAME_START, 4);

set_window_value(40, 3, AG_WINDOW_TYPE, 1);
set_window_value(40, 3, AG_WINDOW_LENGTH, 14);
set_window_value(40, 3, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(40, 3, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(40, 3, AG_WINDOW_HAS_WHIFFLAG, 1);


set_num_hitboxes(40, 2);

set_hitbox_value(40, 1, HG_HITBOX_GROUP, 1);
set_hitbox_value(40, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(40, 1, HG_WINDOW, 2);
set_hitbox_value(40, 1, HG_SHAPE, 2);
set_hitbox_value(40, 1, HG_LIFETIME, 3);
set_hitbox_value(40, 1, HG_HITBOX_Y, 4);
set_hitbox_value(40, 1, HG_WIDTH, 44);
set_hitbox_value(40, 1, HG_HEIGHT, 60);
set_hitbox_value(40, 1, HG_SHAPE, 2);
set_hitbox_value(40, 1, HG_PRIORITY, 2);
set_hitbox_value(40, 1, HG_DAMAGE, 10);
set_hitbox_value(40, 1, HG_ANGLE, 90);
set_hitbox_value(40, 1, HG_BASE_KNOCKBACK, 7.5);
set_hitbox_value(40, 1, HG_KNOCKBACK_SCALING, 0.65);
set_hitbox_value(40, 1, HG_BASE_HITPAUSE, 8);
set_hitbox_value(40, 1, HG_HITPAUSE_SCALING, 1);
//set_hitbox_value(40, 1, HG_HIT_LOCKOUT, 10);
set_hitbox_value(40, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));
set_hitbox_value(40, 1, HG_ANGLE_FLIPPER, 6);

set_hitbox_value(40, 2, HG_HITBOX_GROUP, 1);
set_hitbox_value(40, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(40, 2, HG_WINDOW, 2);
set_hitbox_value(40, 2, HG_SHAPE, 2);
set_hitbox_value(40, 2, HG_LIFETIME, 3);
set_hitbox_value(40, 2, HG_HITBOX_Y, 24);
set_hitbox_value(40, 2, HG_WIDTH, 32);
set_hitbox_value(40, 2, HG_HEIGHT, 20);
set_hitbox_value(40, 2, HG_PRIORITY, 3);
set_hitbox_value(40, 2, HG_DAMAGE, 12);
set_hitbox_value(40, 2, HG_ANGLE, 270);
set_hitbox_value(40, 2, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(40, 2, HG_KNOCKBACK_SCALING, 0.75);
set_hitbox_value(40, 2, HG_BASE_HITPAUSE, 12);
set_hitbox_value(40, 2, HG_HITPAUSE_SCALING, 0.7);
//set_hitbox_value(40, 2, HG_HITSTUN_MULTIPLIER, 0.8);
set_hitbox_value(40, 2, HG_HIT_LOCKOUT, 10);
set_hitbox_value(40, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(40, 2, HG_VISUAL_EFFECT_Y_OFFSET, -2);
set_hitbox_value(40, 2, HG_HIT_SFX, asset_get("sfx_blow_heavy2"));