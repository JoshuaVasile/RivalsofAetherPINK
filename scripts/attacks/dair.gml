// Aerial Down Smash / Down Air: Throws the bomb down just like grounded Down Smash while hovering in the air
set_attack_value(AT_DAIR, AG_CATEGORY, 1);
set_attack_value(AT_DAIR, AG_SPRITE, sprite_get("dstrong"));
set_attack_value(AT_DAIR, AG_AIR_SPRITE, sprite_get("dstrong"));
set_attack_value(AT_DAIR, AG_NUM_WINDOWS, 5);
set_attack_value(AT_DAIR, AG_HAS_LANDING_LAG, 0);
set_attack_value(AT_DAIR, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_DAIR, AG_HURTBOX_SPRITE, sprite_get("dstrong_hurt"));
set_attack_value(AT_DAIR, AG_HURTBOX_AIR_SPRITE, sprite_get("dstrong_hurt"));
set_attack_value(AT_DAIR, AG_USES_CUSTOM_GRAVITY, 1);

set_window_value(AT_DAIR, 1, AG_WINDOW_LENGTH, 21);
set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_DAIR, 1, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_DAIR, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DAIR, 1, AG_WINDOW_SFX, sound_get("snd_bombfall"));

set_window_value(AT_DAIR, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(AT_DAIR, 2, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_DAIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DAIR, 2, AG_WINDOW_SFX, sound_get("snd_bomb"));

set_window_value(AT_DAIR, 3, AG_WINDOW_LENGTH, 6);
set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAME_START, 13);
set_window_value(AT_DAIR, 3, AG_WINDOW_CUSTOM_GRAVITY, 0);

set_window_value(AT_DAIR, 4, AG_WINDOW_LENGTH, 10);
set_window_value(AT_DAIR, 4, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_DAIR, 4, AG_WINDOW_ANIM_FRAME_START, 15);
set_window_value(AT_DAIR, 4, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_DAIR, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

set_window_value(AT_DAIR, 5, AG_WINDOW_LENGTH, 2);
set_window_value(AT_DAIR, 5, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DAIR, 5, AG_WINDOW_ANIM_FRAME_START, 19);
set_window_value(AT_DAIR, 5, AG_WINDOW_CUSTOM_GRAVITY, 0);

set_num_hitboxes(AT_DAIR, 1);

set_hitbox_value(AT_DAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DAIR, 1, HG_WINDOW, 3);
set_hitbox_value(AT_DAIR, 1, HG_LIFETIME, 6);
set_hitbox_value(AT_DAIR, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_DAIR, 1, HG_HITBOX_Y, -14);
set_hitbox_value(AT_DAIR, 1, HG_WIDTH, 198);
set_hitbox_value(AT_DAIR, 1, HG_HEIGHT, 48);
set_hitbox_value(AT_DAIR, 1, HG_SHAPE, 1);
set_hitbox_value(AT_DAIR, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_DAIR, 1, HG_DAMAGE, 24);
set_hitbox_value(AT_DAIR, 1, HG_ANGLE, 45);
set_hitbox_value(AT_DAIR, 1, HG_BASE_KNOCKBACK, 10);
set_hitbox_value(AT_DAIR, 1, HG_KNOCKBACK_SCALING, 1.6);
set_hitbox_value(AT_DAIR, 1, HG_BASE_HITPAUSE, 14);
set_hitbox_value(AT_DAIR, 1, HG_HITPAUSE_SCALING, 1.1);
set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT, 13);
set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT_X_OFFSET, 10);
set_hitbox_value(AT_DAIR, 1, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_DAIR, 1, HG_ANGLE_FLIPPER, 6);
set_hitbox_value(AT_DAIR, 1, HG_HITSTUN_MULTIPLIER, 1.0);
