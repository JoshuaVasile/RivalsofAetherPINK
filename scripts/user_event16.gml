if (bomb_active)
{
    bomb_timer--;

    if (bomb_timer <= 0)
    {
        bomb_active = false;

        // trigger explosion here
    }
}