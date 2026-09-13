var _username = [];
for (var i = 0; i < array_length(global.devs); i++){
	array_push(_username, global.devs[i].user);
}

kb_init("ENTER YOUR NAME", 
    _username, 
    false, CONNECT_RM_PASSWORD, CONNECT_RM_THIRD_ROOM, CONNECT_RM_MAIN, true);