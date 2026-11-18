// Ground Up Smash (AT_USTRONG): Flick spawns 1 cat (8 dmg); charging loads up to 4 cats side-by-side (up to 26 dmg right before overcharge)!
set_attack_value(AT_USTRONG, AG_CATEGORY, 0);
set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("ustrong"));
set_attack_value(AT_USTRONG, AG_AIR_SPRITE, sprite_get("dstrong_air"));
set_attack_value(AT_USTRONG, AG_NUM_WINDOWS, 5);
set_attack_value(AT_USTRONG, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_USTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_USTRONG, AG_HURTBOX_SPRITE, sprite_get("ustrong_hurt"));
set_attack_value(AT_USTRONG, AG_HURTBOX_AIR_SPRITE, sprite_get("dstrong_hurt"));

// Window 1: Charge window (Cats 1..4 load visually as she charges; overcharging hurts Pink!)
set_window_value(AT_USTRONG, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);

// Window 2: Rapid cat formation before launch
set_window_value(AT_USTRONG, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 1);

// Window 3: Loaded cats shoot upward (higher reach!)
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

set_num_hitboxes(AT_USTRONG, 1);

// Hitbox 1: First Cat (120% height = 230px, 8 dmg uncharged flick -> up to 26 dmg at max charge)
set_hitbox_value(AT_USTRONG, 1, HG_MUNO_HITBOX_NAME, "Cat 1 (Nearest)");
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 1, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 1, HG_LIFETIME, 6);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_X, 45);
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_Y, -112);
set_hitbox_value(AT_USTRONG, 1, HG_WIDTH, 30);
set_hitbox_value(AT_USTRONG, 1, HG_HEIGHT, 230);
set_hitbox_value(AT_USTRONG, 1, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 1, HG_PRIORITY, 4);
set_hitbox_value(AT_USTRONG, 1, HG_DAMAGE, 8);
set_hitbox_value(AT_USTRONG, 1, HG_ANGLE, 90);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_KNOCKBACK, 6.8);
set_hitbox_value(AT_USTRONG, 1, HG_KNOCKBACK_SCALING, .72);
set_hitbox_value(AT_USTRONG, 1, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_USTRONG, 1, HG_HITPAUSE_SCALING, .50);
set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_GROUP, 1);

// Hitbox 2: Second Cat (height = 184px)
set_hitbox_value(AT_USTRONG, 2, HG_MUNO_HITBOX_NAME, "Cat 2");
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 2, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 2, HG_LIFETIME, 6);
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_X, 64);
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y, -89);
set_hitbox_value(AT_USTRONG, 2, HG_WIDTH, 30);
set_hitbox_value(AT_USTRONG, 2, HG_HEIGHT, 184);
set_hitbox_value(AT_USTRONG, 2, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 2, HG_PRIORITY, 3);
set_hitbox_value(AT_USTRONG, 2, HG_DAMAGE, 8);
set_hitbox_value(AT_USTRONG, 2, HG_ANGLE, 88);
set_hitbox_value(AT_USTRONG, 2, HG_BASE_KNOCKBACK, 6.8);
set_hitbox_value(AT_USTRONG, 2, HG_KNOCKBACK_SCALING, .72);
set_hitbox_value(AT_USTRONG, 2, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_USTRONG, 2, HG_HITPAUSE_SCALING, .50);
set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 2, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_GROUP, 1);

// Hitbox 3: Third Cat (height = 142px)
set_hitbox_value(AT_USTRONG, 3, HG_MUNO_HITBOX_NAME, "Cat 3");
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 3, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 3, HG_LIFETIME, 6);
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_X, 83);
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_Y, -68);
set_hitbox_value(AT_USTRONG, 3, HG_WIDTH, 30);
set_hitbox_value(AT_USTRONG, 3, HG_HEIGHT, 142);
set_hitbox_value(AT_USTRONG, 3, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_USTRONG, 3, HG_DAMAGE, 8);
set_hitbox_value(AT_USTRONG, 3, HG_ANGLE, 85);
set_hitbox_value(AT_USTRONG, 3, HG_BASE_KNOCKBACK, 6.8);
set_hitbox_value(AT_USTRONG, 3, HG_KNOCKBACK_SCALING, .72);
set_hitbox_value(AT_USTRONG, 3, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_USTRONG, 3, HG_HITPAUSE_SCALING, .50);
set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 3, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 3, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_USTRONG, 3, HG_HITBOX_GROUP, 1);

// Hitbox 4: Fourth Cat (height = 104px, unlocked at max charge tier)
set_hitbox_value(AT_USTRONG, 4, HG_MUNO_HITBOX_NAME, "Cat 4");
set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_USTRONG, 4, HG_WINDOW, 3);
set_hitbox_value(AT_USTRONG, 4, HG_LIFETIME, 6);
set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_X, 102);
set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_Y, -49);
set_hitbox_value(AT_USTRONG, 4, HG_WIDTH, 30);
set_hitbox_value(AT_USTRONG, 4, HG_HEIGHT, 104);
set_hitbox_value(AT_USTRONG, 4, HG_SHAPE, 1);
set_hitbox_value(AT_USTRONG, 4, HG_PRIORITY, 1);
set_hitbox_value(AT_USTRONG, 4, HG_DAMAGE, 8);
set_hitbox_value(AT_USTRONG, 4, HG_ANGLE, 82);
set_hitbox_value(AT_USTRONG, 4, HG_BASE_KNOCKBACK, 6.8);
set_hitbox_value(AT_USTRONG, 4, HG_KNOCKBACK_SCALING, .72);
set_hitbox_value(AT_USTRONG, 4, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_USTRONG, 4, HG_HITPAUSE_SCALING, .50);
set_hitbox_value(AT_USTRONG, 4, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_USTRONG, 4, HG_VISUAL_EFFECT_Y_OFFSET, -10);
set_hitbox_value(AT_USTRONG, 4, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_USTRONG, 4, HG_HITBOX_GROUP, 1);
