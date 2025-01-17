ysp += 0.1; // Gravity
xsp = 0;


// creating the boundary for the player to make it does not go out
if (x < 0) x = 0;
if (x > room_width - sprite_width) x = room_width - sprite_width;
if (y < 0) y = 0;
if (y > room_height - sprite_height) y = room_height - sprite_height;

// Horizontal movement using left and right arrow keys
if keyboard_check(vk_left) {
    xsp = -1;
} else if keyboard_check(vk_right) {
    xsp = 1;
}

// Ground collision and jump logic
if place_meeting(x, y + 1, oBlock) {
    ysp = 0; // Reset vertical speed when on the ground
    if keyboard_check(vk_up or vk_space) { // making the jump for both up arrow and space 
        ysp = -2; // Jump force
    }
}

// Update position with collision check
if !place_meeting(x + xsp, y, oBlock) {
    x += xsp; // Horizontal movement
}

if !place_meeting(x, y + ysp, oBlock) {
    y += ysp; // Vertical movement
} else {
    ysp = 0; // Stop vertical movement if colliding
}

if place_meeting(x, y, oSpike){
	room_restart() // this is to make the player lose, if it touches the spike
}

if place_meeting(x, y, oMountain){ // to know when the player reaches the final stage
	flag = true
}else {
	flag = false
}
if place_meeting(x, y, oStone){
	var stone = instance_place(x, y, oStone);
    // Destroy the specific instance
    if (stone != noone) {
		 stoneCollected = true
        instance_destroy(stone); // destroying the stone to visually make it look like the player pciked up the stone
		 show_debug_message("Stone collected!", stoneCollected);
    }
	else {
		show_debug_message("No sTone",stoneCollected);
	}
}