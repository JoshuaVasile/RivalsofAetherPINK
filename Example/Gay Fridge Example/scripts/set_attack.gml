
if(attack == AT_FAIR)
    attack = 39;

if(attack == AT_DAIR)
    attack = 40;

if(attack == AT_FSTRONG || attack == AT_USTRONG || attack == AT_DSTRONG || attack == 39 || attack == 40 || attack == AT_BAIR || attack == AT_NAIR || attack == AT_UAIR)
{
    attack_end();
	with(obj_article1)
	{
        if(other.url == player_id.url)
        {
            if(collision_circle(x+(12*spr_dir),y-40,40,other,true,false) && state < 2)
            {
                sound_play(sound_get("gf-pickup"));
                state = 2;
                state_timer = 0;
                other.hasFlag = true;
                
                if (other.attack == 39)
                	other.attack = AT_FAIR;
                	
                if (other.attack == AT_BAIR){
                	other.attack = 41;
                }
                if (other.attack == 40)
                	other.attack = AT_DAIR;
                	
                if (other.attack == AT_NAIR)
                	other.attack = 42;
                	
                if (other.attack == AT_UAIR)
                	other.attack = 43;
            }
        }
	}
}

//If they have the L rune and don't have flag down, their aerials are replaced with their enhanced variants
if (has_rune("L") && hasFlag){
	if (attack == 39)
    	attack = AT_FAIR;
    	
    if (attack == AT_BAIR){
    	attack = 41
    }
    if (attack == 40)
    	attack = AT_DAIR;
    	
    if (attack == AT_NAIR)
    	attack = 42;
    	
    if (attack == AT_UAIR && !uairUsed){
    	attack = 43;
    	uairUsed = true;
    }
}

//Gay Fridge cannot use FStrong and UStrong when the flag is out
if(!hasFlag){
    if(attack == AT_FSTRONG){
        attack = AT_FTILT;
    }
    if(attack == AT_USTRONG){
        attack = AT_UTILT;
    }
    if(attack == AT_DSTRONG){
        attack = AT_DTILT;
    }
}

if (attack == AT_TAUNT && get_player_color(player) == 24)
	attack = AT_TAUNT_2;

afterImageTimer = 0;