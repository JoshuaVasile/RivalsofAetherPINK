set_attack_value(AT_TAUNT, AG_SPRITE, sprite_get("taunt"));
set_attack_value(AT_TAUNT, AG_NUM_WINDOWS, 3);
set_attack_value(AT_TAUNT, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_TAUNT, AG_OFF_LEDGE, 1);
set_attack_value(AT_TAUNT, AG_HURTBOX_SPRITE, asset_get("ex_guy_hurt_box"));

set_window_value(AT_TAUNT, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_TAUNT, 1, AG_WINDOW_LENGTH, 21);
set_window_value(AT_TAUNT, 1, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_TAUNT, 1, AG_WINDOW_HAS_SFX, 1);

set_window_value(AT_TAUNT, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_TAUNT, 2, AG_WINDOW_LENGTH, 24);
set_window_value(AT_TAUNT, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_TAUNT, 2, AG_WINDOW_ANIM_FRAME_START, 7);

set_window_value(AT_TAUNT, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_TAUNT, 3, AG_WINDOW_LENGTH, 21);
set_window_value(AT_TAUNT, 3, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_TAUNT, 3, AG_WINDOW_ANIM_FRAME_START, 9);

set_num_hitboxes(AT_TAUNT, 1);

set_hitbox_value(AT_TAUNT, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_TAUNT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_TAUNT, 1, HG_WINDOW, 4);
set_hitbox_value(AT_TAUNT, 1, HG_SHAPE, 2);
set_hitbox_value(AT_TAUNT, 1, HG_LIFETIME, 4);
set_hitbox_value(AT_TAUNT, 1, HG_HITBOX_Y, -10);
set_hitbox_value(AT_TAUNT, 1, HG_WIDTH, 96);
set_hitbox_value(AT_TAUNT, 1, HG_HEIGHT, 24);
set_hitbox_value(AT_TAUNT, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_TAUNT, 1, HG_DAMAGE, 8);
set_hitbox_value(AT_TAUNT, 1, HG_ANGLE, 60);
set_hitbox_value(AT_TAUNT, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_TAUNT, 1, HG_KNOCKBACK_SCALING, 0.5);
set_hitbox_value(AT_TAUNT, 1, HG_BASE_HITPAUSE, 8);
set_hitbox_value(AT_TAUNT, 1, HG_HITPAUSE_SCALING, 0.5);
set_hitbox_value(AT_TAUNT, 1, HG_VISUAL_EFFECT, rainSmall);
set_hitbox_value(AT_TAUNT, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy2"));
set_hitbox_value(AT_TAUNT, 1, HG_ANGLE_FLIPPER, 6);

set_hitbox_value(AT_TAUNT, 2, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_TAUNT, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_TAUNT, 2, HG_WINDOW, 4);
set_hitbox_value(AT_TAUNT, 2, HG_SHAPE, 2);
set_hitbox_value(AT_TAUNT, 2, HG_LIFETIME, 120);
set_hitbox_value(AT_TAUNT, 2, HG_HITBOX_Y, -10);
set_hitbox_value(AT_TAUNT, 2, HG_WIDTH, 44);
set_hitbox_value(AT_TAUNT, 2, HG_HEIGHT, 32);
set_hitbox_value(AT_TAUNT, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_TAUNT, 2, HG_DAMAGE, 6);
set_hitbox_value(AT_TAUNT, 2, HG_ANGLE, 270);
set_hitbox_value(AT_TAUNT, 2, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_TAUNT, 2, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_TAUNT, 2, HG_VISUAL_EFFECT, rainSmall);
set_hitbox_value(AT_TAUNT, 2, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
set_hitbox_value(AT_TAUNT, 2, HG_ANGLE_FLIPPER, 6);

