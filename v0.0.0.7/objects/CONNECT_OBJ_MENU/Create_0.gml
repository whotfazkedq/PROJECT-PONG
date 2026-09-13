selected = 0;
watch_timer = 0;
wait_active = false;

if (global.weird_num[1] = false) {
keys = [
    { text: "PLAY",    x1: 300, y1: 180, x2: 500, y2: 230, hidden: false, up: 2, down: 1, left: -1, right: -1 },//0
    { text: "OPTIONS", x1: 300, y1: 260, x2: 500, y2: 310, hidden: false, up: 0, down: 2, left: 3, right: -1 },//1
    { text: "EXIT",    x1: 300, y1: 340, x2: 500, y2: 390, hidden: false, up: 1, down: 0, left: -1, right: -1 },//2
];


if (global.dm = false) {
    array_push(keys,
        { text: "	^	", x1: -300, y1: 260, x2: -500, y2: 310, hidden: true, up: 4, down: 2, left: 1, right: 1 },//3
        { text: "	<	", x1: -300, y1: 180, x2: -500, y2: 230, hidden: true, up: 0, down: 1, left: 5, right: 0 },//4
        { text: "	v	", x1: -530, y1: 180, x2: -730, y2: 230, hidden: true, up: 0, down: 6, left: 0, right: 0 },//5
        { text: "	>	", x1: -530, y1: 410, x2: -730, y2: 460, hidden: true, up: 1, down: 2, left: 2, right: 7 },//6
        { text: "	^	", x1: 1100, y1: 410, x2: 1200, y2: 460, hidden: true, up: 8, down: 2, left: 2, right: 2 },//7
        { text: "	>	", x1: 1100, y1: 260, x2: 1200, y2: 310, hidden: true, up: 0, down: 2, left: 1, right: 9 },//8
        { text: "???",    x1: 1230, y1: 260, x2: 1430, y2: 310, hidden: true, up: 0, down: 2, left: 1, right: 1 },//9
    );
} else {
    array_push(keys,
        { text: "???", x1: -300, y1: 260, x2: -500, y2: 310, hidden: true, up: 0, down: 2, left: 1, right: 1 },//3
    );
}
}

if (global.weird_num[1] = true) {
	keys = [
		{ text: "PLAY",    x1: 300, y1: 180, x2: 500, y2: 230, hidden: false, up: 2, down: 1, left: -1, right: -1 },//0
		{ text: "OPTIONS", x1: 300, y1: 260, x2: 500, y2: 310, hidden: false, up: 0, down: 2, left: -1, right: -1 },//1
		{ text: "EXIT",    x1: 300, y1: 340, x2: 500, y2: 390, hidden: false, up: 1, down: 0, left: -1, right: -1 },//2
];}