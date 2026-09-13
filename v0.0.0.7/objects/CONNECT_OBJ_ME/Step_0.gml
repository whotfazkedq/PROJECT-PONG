if(global.paused) exit;

if (instance_exists(CONNECT_OBJ_PROJECTILE)) {
    if (CONNECT_OBJ_PROJECTILE.y > y) {
        y += global.cpu_speed;
    } else if (CONNECT_OBJ_PROJECTILE.y < y) {
        y -= global.cpu_speed;
    }
}
y = clamp(y, sprite_height/2, room_height - sprite_height/2);