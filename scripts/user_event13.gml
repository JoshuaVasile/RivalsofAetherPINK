// Muno template - [CORE] set_attack
// Phone popup on Taunt has been disabled so Taunt always performs Pink's Laugh.

if get_attack_value(attack, AG_MUNO_ATTACK_COOLDOWN) != 0 switch (get_attack_value(attack, AG_MUNO_ATTACK_CD_SPECIAL)){
	case 1:
		move_cooldown[attack] = phone_arrow_cooldown;
		break;
	case 2:
		move_cooldown[attack] = phone_invis_cooldown;
		break;
}
