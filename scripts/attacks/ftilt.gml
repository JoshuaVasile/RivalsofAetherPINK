set_attack_value(AT_FTILT, AG_SPRITE, sprite_get("ftilt"));
set_attack_value(AT_FTILT, AG_NUM_WINDOWS, 5);
set_attack_value(AT_FTILT, AG_HURTBOX_SPRITE, sprite_get("ftilt_hurt"));

set_window_value(AT_FTILT, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FTILT, 1, AG_WINDOW_ANIM_FRAMES, 1);

set_window_value(AT_FTILT, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_FTILT, 2, AG_WINDOW_HSPEED, 0);
set_window_value(AT_FTILT, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FTILT, 2, AG_WINDOW_SFX, sound_get("snd_smallswing"));
set_window_value(AT_FTILT, 2, AG_WINDOW_SFX_FRAME, 2);

set_window_value(AT_FTILT, 3, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_FTILT, 4, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FTILT, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FTILT, 4, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_FTILT, 4, AG_WINDOW_HSPEED, 0);
set_window_value(AT_FTILT, 4, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FTILT, 4, AG_WINDOW_SFX, sound_get("snd_smallswing"));
set_window_value(AT_FTILT, 4, AG_WINDOW_SFX_FRAME, 2);

set_window_value(AT_FTILT, 5, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FTILT, 5, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FTILT, 5, AG_WINDOW_ANIM_FRAME_START, 0);

set_num_hitboxes(AT_FTILT, 2);

set_hitbox_value(AT_FTILT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FTILT, 1, HG_LIFETIME, 6);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_X, 40);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_Y, -35);
set_hitbox_value(AT_FTILT, 1, HG_WIDTH, 74);
set_hitbox_value(AT_FTILT, 1, HG_HEIGHT, 32);
set_hitbox_value(AT_FTILT, 1, HG_SHAPE, 1);
set_hitbox_value(AT_FTILT, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_FTILT, 1, HG_DAMAGE, 3);
set_hitbox_value(AT_FTILT, 1, HG_ANGLE, 361);
set_hitbox_value(AT_FTILT, 1, HG_BASE_KNOCKBACK, 3);
set_hitbox_value(AT_FTILT, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_FTILT, 1, HG_HIT_SFX, sound_get("snd_damage"));

set_hitbox_value(AT_FTILT, 2, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 2, HG_WINDOW, 4);
set_hitbox_value(AT_FTILT, 2, HG_LIFETIME, 6);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_X, 40);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_Y, -35);
set_hitbox_value(AT_FTILT, 2, HG_WIDTH, 74);
set_hitbox_value(AT_FTILT, 2, HG_HEIGHT, 32);
set_hitbox_value(AT_FTILT, 2, HG_SHAPE, 1);
set_hitbox_value(AT_FTILT, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_FTILT, 2, HG_DAMAGE, 4);
set_hitbox_value(AT_FTILT, 2, HG_ANGLE, 361);
set_hitbox_value(AT_FTILT, 2, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_FTILT, 2, HG_KNOCKBACK_SCALING, 0.65);
set_hitbox_value(AT_FTILT, 2, HG_BASE_HITPAUSE, 8);
set_hitbox_value(AT_FTILT, 2, HG_HITPAUSE_SCALING, 0.5);
set_hitbox_value(AT_FTILT, 2, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_GROUP, 1);
