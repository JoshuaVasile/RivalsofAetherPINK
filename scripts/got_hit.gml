// got_hit is a script that is called when you get hit.

// Doki Meter drains by 0.5% per point of damage taken
if (instance_exists(enemy_hitboxID)) {
    var dmg_taken = enemy_hitboxID.damage;
    doki_meter = max(0, doki_meter - dmg_taken * 0.5);
    if (doki_meter < 100) {
        bb_unlocked = false;
    }
}