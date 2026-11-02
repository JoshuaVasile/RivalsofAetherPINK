image_index += article_anim_speed;
if (free) vsp = min(vsp + article_gravity, article_max_fall_speed);
if (hsp != 0) hsp = sign(hsp) * max(0, abs(hsp) - article_friction);

lifetime++;
if (lifetime >= 200) {
instance_destroy();
exit;
}