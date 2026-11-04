set_attack_value(49, AG_SPRITE, sprite_get("finalsmash"));
set_attack_value(49, AG_NUM_WINDOWS, 3);
set_attack_value(49, AG_CATEGORY, 2);
set_attack_value(49, AG_HURTBOX_SPRITE, sprite_get("buphurtbox"));

set_window_value(49, 1, AG_WINDOW_TYPE, 1);
set_window_value(49, 1, AG_WINDOW_INVINCIBILITY, 1);
set_window_value(49, 1, AG_WINDOW_LENGTH, 90);
set_window_value(49, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(49, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(49, 1, AG_WINDOW_SFX, sound_get("gf-boing"));
set_window_value(49, 1, AG_WINDOW_SFX_FRAME, 3);
set_window_value(49, 1, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(49, 1, AG_WINDOW_VSPEED_TYPE, 1);

set_window_value(49, 2, AG_WINDOW_TYPE, 1);
set_window_value(49, 2, AG_WINDOW_INVINCIBILITY, 1);
set_window_value(49, 2, AG_WINDOW_LENGTH, 320);
set_window_value(49, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(49, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(49, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(49, 2, AG_WINDOW_SFX, sound_get("gf-uspecial"));
set_window_value(49, 2, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(49, 2, AG_WINDOW_VSPEED_TYPE, 1);

set_window_value(49, 3, AG_WINDOW_TYPE, 1);
set_window_value(49, 3, AG_WINDOW_LENGTH, 12);
set_window_value(49, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(49, 3, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(49, 3, AG_WINDOW_VSPEED_TYPE, 1);

set_num_hitboxes(49, 1);

set_hitbox_value(49, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(49, 1, HG_WINDOW, 4);
set_hitbox_value(49, 1, HG_LIFETIME, 45);
set_hitbox_value(49, 1, HG_HITBOX_X, 20);
set_hitbox_value(49, 1, HG_HITBOX_Y, -22);
set_hitbox_value(49, 1, HG_SHAPE, 2);
set_hitbox_value(49, 1, HG_WIDTH, 32);
set_hitbox_value(49, 1, HG_HEIGHT, 32);
set_hitbox_value(49, 1, HG_PRIORITY, 3);
set_hitbox_value(49, 1, HG_DAMAGE, 1);
set_hitbox_value(49, 1, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(49, 1, HG_BASE_HITPAUSE, 4);
set_hitbox_value(49, 1, HG_ANGLE, 30);
set_hitbox_value(49, 1, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));
set_hitbox_value(49, 1, HG_PROJECTILE_SPRITE, sprite_get("apple"));
set_hitbox_value(49, 1, HG_PROJECTILE_DESTROY_EFFECT, 21);
set_hitbox_value(49, 1, HG_VISUAL_EFFECT, 21);
set_hitbox_value(49, 1, HG_PROJECTILE_MASK, -1);
set_hitbox_value(49, 1, HG_PROJECTILE_HSPEED, 7);
set_hitbox_value(49, 1, HG_PROJECTILE_VSPEED, -6);
set_hitbox_value(49, 1, HG_PROJECTILE_GRAVITY, 0.5);
set_hitbox_value(49, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(49, 1, HG_PROJECTILE_WALL_BEHAVIOR, 2);
set_hitbox_value(49, 1, HG_HIT_LOCKOUT, 1);
set_hitbox_value(49, 1, HG_PROJECTILE_PLASMA_SAFE, true);