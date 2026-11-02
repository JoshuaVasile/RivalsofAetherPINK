// article1 = DSpecial dummy

// Gravity
vsp += article_gravity;

// Move
x += hsp;
y += vsp;

if (return_timer > 0)
{
    return_timer--; // Timer goes down
}

if (lifetime > 0)
{
    lifetime--;

    if (lifetime <= 0)
    {
        player_id.dummy_spawned = false; // Die (first time cause its a dummy)
        instance_destroy();
        exit; // stop running code on a destroyed article
    }
}

if (returning && instance_exists(player_id) && point_distance(x, y, player_id.x, player_id.y) < 16)
{
    player_id.dummy_spawned = false;
    instance_destroy();
    exit;
}
