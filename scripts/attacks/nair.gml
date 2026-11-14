set_attack_value(AT_NAIR, AG_CATEGORY, 1);
set_attack_value(AT_NAIR, AG_SPRITE, sprite_get("nair"));
set_attack_value(AT_NAIR, AG_NUM_WINDOWS, 3);
set_attack_value(AT_NAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_NAIR, AG_LANDING_LAG, 4);
set_attack_value(AT_NAIR, AG_HURTBOX_SPRITE, sprite_get("nair_hurt"));

set_window_value(AT_NAIR, 1, AG_WINDOW_LENGTH, 4);
set_window_value(AT_NAIR, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NAIR, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_NAIR, 1, AG_WINDOW_SFX, sound_get("heart_electric"));
set_window_value(AT_NAIR, 1, AG_WINDOW_SFX_FRAME, 1);

set_window_value(AT_NAIR, 2, AG_WINDOW_LENGTH, 15);
set_window_value(AT_NAIR, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_NAIR, 2, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_NAIR, 3, AG_WINDOW_LENGTH, 7);
set_window_value(AT_NAIR, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NAIR, 3, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_NAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_NAIR, 3);

// Hitbox 1: Pulls opponent inward toward Pink (like Mewtwo / Pikachu Nair)
set_hitbox_value(AT_NAIR, 1, HG_MUNO_HITBOX_NAME, "Multihit 1 (Inward)");
set_hitbox_value(AT_NAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 1, HG_LIFETIME, 4);
set_hitbox_value(AT_NAIR, 1, HG_HITBOX_X, -4);
set_hitbox_value(AT_NAIR, 1, HG_HITBOX_Y, -48);
set_hitbox_value(AT_NAIR, 1, HG_WIDTH, 118);
set_hitbox_value(AT_NAIR, 1, HG_HEIGHT, 114);
set_hitbox_value(AT_NAIR, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_NAIR, 1, HG_DAMAGE, 2);
set_hitbox_value(AT_NAIR, 1, HG_ANGLE, 80);
set_hitbox_value(AT_NAIR, 1, HG_BASE_KNOCKBACK, 4.5);
set_hitbox_value(AT_NAIR, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_NAIR, 1, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_NAIR, 1, HG_VISUAL_EFFECT, 302);
set_hitbox_value(AT_NAIR, 1, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_NAIR, 1, HG_ANGLE_FLIPPER, 9);
set_hitbox_value(AT_NAIR, 1, HG_DRIFT_MULTIPLIER, 0.2);
set_hitbox_value(AT_NAIR, 1, HG_SDI_MULTIPLIER, 0.4);
set_hitbox_value(AT_NAIR, 1, HG_HITBOX_GROUP, 1);

// Hitbox 2: Second inward pull hit keeping opponent trapped inside the electric field
set_hitbox_value(AT_NAIR, 2, HG_MUNO_HITBOX_NAME, "Multihit 2 (Inward)");
set_hitbox_value(AT_NAIR, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 2, HG_WINDOW_CREATION_FRAME, 6);
set_hitbox_value(AT_NAIR, 2, HG_LIFETIME, 4);
set_hitbox_value(AT_NAIR, 2, HG_HITBOX_X, -4);
set_hitbox_value(AT_NAIR, 2, HG_HITBOX_Y, -48);
set_hitbox_value(AT_NAIR, 2, HG_WIDTH, 124);
set_hitbox_value(AT_NAIR, 2, HG_HEIGHT, 118);
set_hitbox_value(AT_NAIR, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_NAIR, 2, HG_DAMAGE, 2);
set_hitbox_value(AT_NAIR, 2, HG_ANGLE, 80);
set_hitbox_value(AT_NAIR, 2, HG_BASE_KNOCKBACK, 4.5);
set_hitbox_value(AT_NAIR, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_NAIR, 2, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_NAIR, 2, HG_VISUAL_EFFECT, 302);
set_hitbox_value(AT_NAIR, 2, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_NAIR, 2, HG_ANGLE_FLIPPER, 9);
set_hitbox_value(AT_NAIR, 2, HG_DRIFT_MULTIPLIER, 0.2);
set_hitbox_value(AT_NAIR, 2, HG_SDI_MULTIPLIER, 0.4);
set_hitbox_value(AT_NAIR, 2, HG_HITBOX_GROUP, 2);

// Hitbox 3: Stronger outward finisher knockback at the end
set_hitbox_value(AT_NAIR, 3, HG_MUNO_HITBOX_NAME, "Outward Finisher");
set_hitbox_value(AT_NAIR, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 3, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 3, HG_WINDOW_CREATION_FRAME, 12);
set_hitbox_value(AT_NAIR, 3, HG_LIFETIME, 3);
set_hitbox_value(AT_NAIR, 3, HG_HITBOX_X, -4);
set_hitbox_value(AT_NAIR, 3, HG_HITBOX_Y, -48);
set_hitbox_value(AT_NAIR, 3, HG_WIDTH, 138);
set_hitbox_value(AT_NAIR, 3, HG_HEIGHT, 128);
set_hitbox_value(AT_NAIR, 3, HG_PRIORITY, 3);
set_hitbox_value(AT_NAIR, 3, HG_DAMAGE, 6);
set_hitbox_value(AT_NAIR, 3, HG_ANGLE, 40);
set_hitbox_value(AT_NAIR, 3, HG_BASE_KNOCKBACK, 7.8);
set_hitbox_value(AT_NAIR, 3, HG_KNOCKBACK_SCALING, .72);
set_hitbox_value(AT_NAIR, 3, HG_BASE_HITPAUSE, 9);
set_hitbox_value(AT_NAIR, 3, HG_HITPAUSE_SCALING, .45);
set_hitbox_value(AT_NAIR, 3, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_NAIR, 3, HG_VISUAL_EFFECT_X_OFFSET, 20);
set_hitbox_value(AT_NAIR, 3, HG_VISUAL_EFFECT_Y_OFFSET, -20);
set_hitbox_value(AT_NAIR, 3, HG_HIT_SFX, sound_get("heart_electric"));
set_hitbox_value(AT_NAIR, 3, HG_ANGLE_FLIPPER, 6);
set_hitbox_value(AT_NAIR, 3, HG_HITBOX_GROUP, 3);
