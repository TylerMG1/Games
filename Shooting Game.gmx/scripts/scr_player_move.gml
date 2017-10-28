///scr_player_move()

//Initalize Varibles
var left = keyboard_check(ord('A'));
var right = keyboard_check(ord('D'));
var up = keyboard_check(ord('W'))
//Check for Ground
if (place_meeting(x, y+1, obj_solid)) {
    vspd = 0;
    
    //Jumping
    if (up) {
        vspd = -jspd;
    }
} else {
    vspd += grav;
}

//Moving Right
if (right) {
    hspd = spd;
}

//Moving Left
if (left) {
    hspd = -spd;
}

//Not Moving
if ((!left && !right) || (left && right)) {
    hspd = 0;
}

//Horizontal Collisions
if (place_meeting(x+hspd, y, obj_solid)) {
    while (!place_meeting(x+sign(hspd), y, obj_solid)) {
        x += sign(hspd);
    }
    hspd = 0;
}

//Move Horizontally
x += hspd;

//Vertical Collisions
if (place_meeting(x, y+vspd, obj_solid)) {
    while (!place_meeting(x, y+sign(vspd), obj_solid)) {
        y += sign(vspd);
    }
    vspd = 0;
}

//Move Vertically
y += vspd;  
