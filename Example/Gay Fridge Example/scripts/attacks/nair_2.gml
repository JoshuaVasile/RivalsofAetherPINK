set_attack_value(42, AG_CATEGORY, 1);
set_attack_value(42, AG_SPRITE, sprite_get("nair2"));
set_attack_value(42, AG_NUM_WINDOWS, 3);
set_attack_value(42, AG_HAS_LANDING_LAG, 1);
set_attack_value(42, AG_LANDING_LAG, 4);
set_attack_value(42, AG_HURTBOX_SPRITE, sprite_get("nair_hurt"));

set_window_value(42, 1, AG_WINDOW_TYPE, 1);
set_window_value(42, 1, AG_WINDOW_LENGTH, 6);
set_window_value(42, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(42, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(42, 1, AG_WINDOW_SFX, asset_get("sfx_spin_longer"));
set_window_value(42, 1, AG_WINDOW_SFX_FRAME, 5);
set_window_value(42, 1, AG_WINDOW_VSPEED, -2.5);

set_window_value(42, 2, AG_WINDOW_TYPE, 1);
set_window_value(42, 2, AG_WINDOW_LENGTH, 24);
set_window_value(42, 2, AG_WINDOW_ANIM_FRAMES, 8);
set_window_value(42, 2, AG_WINDOW_ANIM_FRAME_START, 4);

set_window_value(42, 3, AG_WINDOW_TYPE, 1);
set_window_value(42, 3, AG_WINDOW_LENGTH, 8);
set_window_value(42, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(42, 3, AG_WINDOW_ANIM_FRAME_START, 12);
set_window_value(42, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(42,9);

set_hitbox_value(42, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(42, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(42, 1, HG_WINDOW, 2);
set_hitbox_value(42, 1, HG_LIFETIME, 3);
set_hitbox_value(42, 1, HG_HITBOX_Y, -32);
set_hitbox_value(42, 1, HG_WIDTH, 100);
set_hitbox_value(42, 1, HG_HEIGHT, 100);
set_hitbox_value(42, 1, HG_PRIORITY, 2);
set_hitbox_value(42, 1, HG_DAMAGE, 2);
set_hitbox_value(42, 1, HG_ANGLE, 70);
set_hitbox_value(42, 1, HG_ANGLE_FLIPPER, 9);
set_hitbox_value(42, 1, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(42, 1, HG_BASE_HITPAUSE, 3);
set_hitbox_value(42, 1, HG_TECHABLE, 3);
set_hitbox_value(42, 1, HG_HITSTUN_MULTIPLIER, 0.5);
set_hitbox_value(42, 1, HG_VISUAL_EFFECT, rainSmall);
set_hitbox_value(42, 1, HG_EXTRA_CAMERA_SHAKE, -1);
set_hitbox_value(42, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));

set_hitbox_value(42, 2, HG_PARENT_HITBOX, 1);
set_hitbox_value(42, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 2, HG_WINDOW, 2);
set_hitbox_value(42, 2, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(42, 2, HG_LIFETIME, 2);
set_hitbox_value(42, 2, HG_HITBOX_Y, -32);
set_hitbox_value(42, 2, HG_HITBOX_GROUP, -1);

set_hitbox_value(42, 3, HG_PARENT_HITBOX, 1);
set_hitbox_value(42, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 3, HG_WINDOW, 2);
set_hitbox_value(42, 3, HG_WINDOW_CREATION_FRAME, 6);
set_hitbox_value(42, 3, HG_LIFETIME, 2);
set_hitbox_value(42, 3, HG_HITBOX_Y, -32);
set_hitbox_value(42, 3, HG_HITBOX_GROUP, -1);

set_hitbox_value(42, 4, HG_PARENT_HITBOX, 1);
set_hitbox_value(42, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 4, HG_WINDOW, 2);
set_hitbox_value(42, 4, HG_WINDOW_CREATION_FRAME, 9);
set_hitbox_value(42, 4, HG_LIFETIME, 2);
set_hitbox_value(42, 4, HG_HITBOX_Y, -32);
set_hitbox_value(42, 4, HG_HITBOX_GROUP, -1);

set_hitbox_value(42, 5, HG_PARENT_HITBOX, 1);
set_hitbox_value(42, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 5, HG_WINDOW, 2);
set_hitbox_value(42, 5, HG_WINDOW_CREATION_FRAME, 12);
set_hitbox_value(42, 5, HG_LIFETIME, 2);
set_hitbox_value(42, 5, HG_HITBOX_Y, -32);
set_hitbox_value(42, 5, HG_HITBOX_GROUP, -1);

set_hitbox_value(42, 6, HG_PARENT_HITBOX, 1);
set_hitbox_value(42, 6, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 6, HG_WINDOW, 2);
set_hitbox_value(42, 6, HG_WINDOW_CREATION_FRAME, 15);
set_hitbox_value(42, 6, HG_LIFETIME, 2);
set_hitbox_value(42, 6, HG_HITBOX_Y, -32);
set_hitbox_value(42, 6, HG_HITBOX_GROUP, -1);

set_hitbox_value(42, 7, HG_PARENT_HITBOX, 1);
set_hitbox_value(42, 7, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 7, HG_WINDOW, 2);
set_hitbox_value(42, 7, HG_WINDOW_CREATION_FRAME, 18);
set_hitbox_value(42, 7, HG_LIFETIME, 2);
set_hitbox_value(42, 7, HG_HITBOX_Y, -32);
set_hitbox_value(42, 7, HG_HITBOX_GROUP, -1);

set_hitbox_value(42, 8, HG_HITBOX_TYPE, 1);
set_hitbox_value(42, 8, HG_WINDOW, 2);
set_hitbox_value(42, 8, HG_WINDOW_CREATION_FRAME, 21);
set_hitbox_value(42, 8, HG_LIFETIME, 3);
set_hitbox_value(42, 8, HG_HITBOX_Y, -32);
set_hitbox_value(42, 8, HG_WIDTH, 100);
set_hitbox_value(42, 8, HG_HEIGHT, 100);
set_hitbox_value(42, 8, HG_PRIORITY, 1);
set_hitbox_value(42, 8, HG_DAMAGE, 2);
set_hitbox_value(42, 8, HG_ANGLE, 50);
set_hitbox_value(42, 8, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(42, 8, HG_KNOCKBACK_SCALING, 0.8);
set_hitbox_value(42, 8, HG_BASE_HITPAUSE, 10);
set_hitbox_value(42, 8, HG_HITPAUSE_SCALING, 1);
set_hitbox_value(42, 8, HG_VISUAL_EFFECT, rainBig);
set_hitbox_value(42, 8, HG_EXTRA_CAMERA_SHAKE, 1);
set_hitbox_value(42, 8, HG_HIT_SFX, asset_get("sfx_blow_heavy2"));