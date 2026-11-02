// Phone taunt replaced with Pink's Laugh taunt (no phone menu popup)
set_attack_value(AT_PHONE, AG_SPRITE, sprite_get("taunt"));
set_attack_value(AT_PHONE, AG_NUM_WINDOWS, 3);
set_attack_value(AT_PHONE, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_PHONE, AG_OFF_LEDGE, 1);
set_attack_value(AT_PHONE, AG_HURTBOX_SPRITE, sprite_get("ex_hurt_box"));
set_attack_value(AT_PHONE, AG_MUNO_ATTACK_EXCLUDE, 1);

set_window_value(AT_PHONE, 1, AG_WINDOW_LENGTH, 24);
set_window_value(AT_PHONE, 1, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_PHONE, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_PHONE, 1, AG_WINDOW_SFX, sound_get("pink_laugh1"));
set_window_value(AT_PHONE, 1, AG_WINDOW_SFX_FRAME, 1);

set_window_value(AT_PHONE, 2, AG_WINDOW_LENGTH, 24);
set_window_value(AT_PHONE, 2, AG_WINDOW_ANIM_FRAMES, 4);

set_window_value(AT_PHONE, 3, AG_WINDOW_LENGTH, 24);
set_window_value(AT_PHONE, 3, AG_WINDOW_ANIM_FRAMES, 2);
