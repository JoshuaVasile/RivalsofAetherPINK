set_attack_value(AT_BAIR, AG_CATEGORY, 1);
set_attack_value(AT_BAIR, AG_SPRITE, sprite_get("bair"));
set_attack_value(AT_BAIR, AG_NUM_WINDOWS, 3);
set_attack_value(AT_BAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_BAIR, AG_LANDING_LAG, 4);
set_attack_value(AT_BAIR, AG_HURTBOX_SPRITE, sprite_get("bair_hurt"));

set_window_value(AT_BAIR, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_BAIR, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_BAIR, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_BAIR, 1, AG_WINDOW_SFX, sound_get("snd_smallswing"));
set_window_value(AT_BAIR, 1, AG_WINDOW_SFX_FRAME, 4);

set_window_value(AT_BAIR, 2, AG_WINDOW_LENGTH, 8);
set_window_value(AT_BAIR, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_BAIR, 2, AG_WINDOW_ANIM_FRAME_START, 3);

set_window_value(AT_BAIR, 3, AG_WINDOW_LENGTH, 7);
set_window_value(AT_BAIR, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_BAIR, 3, AG_WINDOW_ANIM_FRAME_START, 6);
set_window_value(AT_BAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_BAIR, 3);

// Tipper Back Air: damage & knockback scale based on closeness to the end of the staff (11 tipper -> 7 mid -> 4 base)
// Hitbox 1: Staff Tipper (Sweetspot at the cat head end of the staff)
set_hitbox_value(AT_BAIR, 1, HG_MUNO_HITBOX_NAME, "Staff Tipper");
set_hitbox_value(AT_BAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_BAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_BAIR, 1, HG_LIFETIME, 8);
set_hitbox_value(AT_BAIR, 1, HG_HITBOX_X, -86);
set_hitbox_value(AT_BAIR, 1, HG_HITBOX_Y, -44);
set_hitbox_value(AT_BAIR, 1, HG_WIDTH, 30);
set_hitbox_value(AT_BAIR, 1, HG_HEIGHT, 50);
set_hitbox_value(AT_BAIR, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_BAIR, 1, HG_DAMAGE, 11);
set_hitbox_value(AT_BAIR, 1, HG_ANGLE, 140);
set_hitbox_value(AT_BAIR, 1, HG_BASE_KNOCKBACK, 7.2);
set_hitbox_value(AT_BAIR, 1, HG_KNOCKBACK_SCALING, 0.92);
set_hitbox_value(AT_BAIR, 1, HG_BASE_HITPAUSE, 10);
set_hitbox_value(AT_BAIR, 1, HG_HITPAUSE_SCALING, .60);
set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT_X_OFFSET, -76);
set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT_Y_OFFSET, -18);
set_hitbox_value(AT_BAIR, 1, HG_HIT_SFX, sound_get("snd_damage"));
set_hitbox_value(AT_BAIR, 1, HG_ANGLE_FLIPPER, 0);
set_hitbox_value(AT_BAIR, 1, HG_HITBOX_GROUP, 1);

// Hitbox 2: Mid-Staff
set_hitbox_value(AT_BAIR, 2, HG_MUNO_HITBOX_NAME, "Mid Staff");
set_hitbox_value(AT_BAIR, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_BAIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_BAIR, 2, HG_LIFETIME, 8);
set_hitbox_value(AT_BAIR, 2, HG_HITBOX_X, -56);
set_hitbox_value(AT_BAIR, 2, HG_HITBOX_Y, -44);
set_hitbox_value(AT_BAIR, 2, HG_WIDTH, 38);
set_hitbox_value(AT_BAIR, 2, HG_HEIGHT, 54);
set_hitbox_value(AT_BAIR, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_BAIR, 2, HG_DAMAGE, 7);
set_hitbox_value(AT_BAIR, 2, HG_ANGLE, 140);
set_hitbox_value(AT_BAIR, 2, HG_BASE_KNOCKBACK, 5.6);
set_hitbox_value(AT_BAIR, 2, HG_KNOCKBACK_SCALING, 0.65);
set_hitbox_value(AT_BAIR, 2, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_BAIR, 2, HG_HITPAUSE_SCALING, .40);
set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT, 0);
set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT_X_OFFSET, -48);
set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT_Y_OFFSET, -16);
set_hitbox_value(AT_BAIR, 2, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_BAIR, 2, HG_ANGLE_FLIPPER, 0);
set_hitbox_value(AT_BAIR, 2, HG_HITBOX_GROUP, 1);

// Hitbox 3: Inner Staff / Handle (Sourspot close to Pink)
set_hitbox_value(AT_BAIR, 3, HG_MUNO_HITBOX_NAME, "Inner Staff");
set_hitbox_value(AT_BAIR, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_BAIR, 3, HG_WINDOW, 2);
set_hitbox_value(AT_BAIR, 3, HG_LIFETIME, 8);
set_hitbox_value(AT_BAIR, 3, HG_HITBOX_X, -24);
set_hitbox_value(AT_BAIR, 3, HG_HITBOX_Y, -42);
set_hitbox_value(AT_BAIR, 3, HG_WIDTH, 36);
set_hitbox_value(AT_BAIR, 3, HG_HEIGHT, 52);
set_hitbox_value(AT_BAIR, 3, HG_PRIORITY, 1);
set_hitbox_value(AT_BAIR, 3, HG_DAMAGE, 4);
set_hitbox_value(AT_BAIR, 3, HG_ANGLE, 140);
set_hitbox_value(AT_BAIR, 3, HG_BASE_KNOCKBACK, 4.2);
set_hitbox_value(AT_BAIR, 3, HG_KNOCKBACK_SCALING, 0.40);
set_hitbox_value(AT_BAIR, 3, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_BAIR, 3, HG_HITPAUSE_SCALING, .25);
set_hitbox_value(AT_BAIR, 3, HG_VISUAL_EFFECT, 0);
set_hitbox_value(AT_BAIR, 3, HG_VISUAL_EFFECT_X_OFFSET, -20);
set_hitbox_value(AT_BAIR, 3, HG_VISUAL_EFFECT_Y_OFFSET, -14);
set_hitbox_value(AT_BAIR, 3, HG_HIT_SFX, sound_get("snd_hurt1"));
set_hitbox_value(AT_BAIR, 3, HG_ANGLE_FLIPPER, 0);
set_hitbox_value(AT_BAIR, 3, HG_HITBOX_GROUP, 1);
