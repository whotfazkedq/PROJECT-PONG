if(global.paused) exit;

if (instance_exists(obj_pong_ball)) {
    if (obj_pong_ball.y > y) {
        y += global.cpu_speed;
    } else if (obj_pong_ball.y < y) {
        y -= global.cpu_speed;
    }
}
y = clamp(y, sprite_height/2, room_height - sprite_height/2);