
draw_self();
if(flag){ //checking if the player touched the final stage
	if(stoneCollected){ // checking if the player collected the stone
	draw_set_color(c_white); 
    draw_text(x - 80, y  -35, "You are Oredigger");
	}
	else  { // message to tell the player to pick the stone
	draw_set_color(c_white); 
    draw_text(x - 80, y  -35, "Stone missing");
	}
}