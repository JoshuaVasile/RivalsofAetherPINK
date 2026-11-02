closest = 999999;

// Find closest enemy
with (oPlayer)
{
    if (id != other.player_id)
    {
        var dist = point_distance(other.x, other.y, x, y);

        if (dist < other.closest)
        {
            other.closest = dist;
            other.enemy = id;
        }
    }
}

if (enemy == noone && return_timer <= 0)
{
    returning = true; // Go Home
    enemy = player_id; // Player = Home
}

if (enemy != noone && instance_exists(enemy))
{
    var aim = point_direction(x, y, enemy.x, enemy.y);

    hsp = lengthdir_x(homing_speed, aim);
    vsp = lengthdir_y(homing_speed, aim); // Go that way
}

x += hsp; // MOVE!!
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
        player_id.ghost_spawned = false; // Die (again cause its a ghost)
        instance_destroy();
        exit;
    }
}

if (instance_exists(player_id) && point_distance(x, y, player_id.x, player_id.y) < 16 && returning)
{
    player_id.ghost_spawned = false;
    instance_destroy();
    exit;
}
