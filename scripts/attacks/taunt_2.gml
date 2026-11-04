set_attack_value(AT_TAUNT_2, AG_MUNO_ATTACK_NAME, "Tongue");

set_attack_value(AT_TAUNT_2, AG_SPRITE, sprite_get("Pink_overworld_toungue"));
set_attack_value(AT_TAUNT_2, AG_NUM_WINDOWS, 3);
set_attack_value(AT_TAUNT_2, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_TAUNT_2, AG_OFF_LEDGE, 1);
set_attack_value(AT_TAUNT_2, AG_HURTBOX_SPRITE, sprite_get("ex_hurt_box"));

set_window_value(AT_TAUNT_2, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_TAUNT_2, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_TAUNT_2, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_TAUNT_2, 1, AG_WINDOW_SFX, sound_get("snd_pink_gasp"));
set_window_value(AT_TAUNT_2, 1, AG_WINDOW_SFX_FRAME, 1);

set_window_value(AT_TAUNT_2, 2, AG_WINDOW_LENGTH, 30);
set_window_value(AT_TAUNT_2, 2, AG_WINDOW_ANIM_FRAMES, 1);

set_window_value(AT_TAUNT_2, 3, AG_WINDOW_LENGTH, 12);
set_window_value(AT_TAUNT_2, 3, AG_WINDOW_ANIM_FRAMES, 1);

set_attack_value(AT_TAUNT_2, AG_MUNO_ATTACK_MISC, "Bleh!");