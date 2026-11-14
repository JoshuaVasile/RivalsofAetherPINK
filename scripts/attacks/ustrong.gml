// Ground Up Smash (AT_USTRONG): Summons 3 Cats (1 -> 2 -> 3) that shoot upward at 100%, 75%, and 50% height!
set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("ustrong"));
set_attack_value(AT_USTRONG, AG_NUM_WINDOWS, 5);
set_attack_value(AT_USTRONG, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_USTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_USTRONG, AG_HURTBOX_SPRITE, sprite_get("ustrong_hurt"));

// Window 1: Charge window (Cats 1, 2, 3 appear side-by-side as she charges; overcharging hurts Pink!)
set_window_value(AT_USTRONG, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, 2);

// Window 2: Rapid 1-2-3 cat formation before launch
set_window_value(AT_USTRONG, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 1);

// Window 3: All 3 cats shoot upward (100%, 75%, 50% height)
set_window_value(AT_USTRONG, 3, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_USTRONG, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_USTRONG, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_USTRONG, 3, AG_WINDOW_SFX, sound_get("snd_smallswing"));
set_window_value(AT_USTRONG, 3, AG_WINDOW_SFX_FRAME, 1);

// Window 4: Peak
set_window_value(AT_USTRONG, 4, AG_WINDOW_LENGTH, 3);
set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 7);

// Window 5: Recovery
set_window_value(AT_USTRONG, 5, AG_WINDOW_LENGTH, 15);
set_window_value(AT_USTRONG, 5, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_USTRONG, 5, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(AT_USTRONG, 5, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_USTRONG, 3);

// Hitbox 1: First Cat (100% height = 195px, base 17 dmg scaling up to 26 dmg on full charge)
set_hitbox_value(AT_USTRONG, 1, HG_MUNO_HITBOX_NAME, "Cat 1 (100% Height)");
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 1, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 1, HG_LIFETIME, 6);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_X, 45);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_Y, -92);
set_hitbox_value(AT_USTRONG, 1, HG_WIDTH, 30);
set_hitbox_value(AT_USTRONG, 1, HG_HEIGHT, 195);
set_hitbox_value(AT_USTRONG, 1, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 17);
set_hitbox_value(AT_USTRONG, 1, HG_ANGLE, 90);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 8.0);
set_hitbox_value(AT_USTRONG, 1, HG_KNOCKBACK_SCALING, .85);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_USTRONG, 1, HG_HITPAUSE_SCALING, .55);
set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, sound_get("snd_damage"));

// Hitbox 2: Second Cat (75% height = 146px)
set_hitbox_value(AT_USTRONG, 2, HG_MUNO_HITBOX_NAME, "Cat 2 (75% Height)");
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 2, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 2, HG_LIFETIME, 6);
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_X, 64);
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y, -68);
set_hitbox_value(AT_USTRONG, 2, HG_WIDTH, 30);
set_hitbox_value(AT_USTRONG, 2, HG_HEIGHT, 146);
set_hitbox_value(AT_USTRONG, 2, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG, 2, HG_DAMAGE, 17);
set_hitbox_value(AT_USTRONG, 2, HG_ANGLE, 88);
set_hitbox_value(AT_USTRONG, 2, HG_BASE_KNOCKBACK, 7.8);
set_hitbox_value(AT_USTRONG, 2, HG_KNOCKBACK_SCALING, .82);
set_hitbox_value(AT_USTRONG, 2, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_USTRONG, 2, HG_HITPAUSE_SCALING, .55);
set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 2, HG_HIT_SFX, sound_get("snd_damage"));

// Hitbox 3: Third Cat (50% height = 98px)
set_hitbox_value(AT_USTRONG, 3, HG_MUNO_HITBOX_NAME, "Cat 3 (50% Height)");
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 3, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 3, HG_LIFETIME, 6);
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_X, 83);
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_Y, -44);
set_hitbox_value(AT_USTRONG, 3, HG_WIDTH, 30);
set_hitbox_value(AT_USTRONG, 3, HG_HEIGHT, 98);
set_hitbox_value(AT_USTRONG, 3, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 3, HG_PRIORITY, 1);
set_hitbox_value(AT_USTRONG, 3, HG_DAMAGE, 17);
set_hitbox_value(AT_USTRONG, 3, HG_ANGLE, 85);
set_hitbox_value(AT_USTRONG, 3, HG_BASE_KNOCKBACK, 7.5);
set_hitbox_value(AT_USTRONG, 3, HG_KNOCKBACK_SCALING, .80);
set_hitbox_value(AT_USTRONG, 3, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_USTRONG, 3, HG_HITPAUSE_SCALING, .55);
set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 3, HG_HIT_SFX, sound_get("snd_damage"));
