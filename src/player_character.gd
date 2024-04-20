extends CharacterBody2D

var h_accel = 25
const MAX_H_SPEED = 200

var jump_force = 300
var gravity = 20
const MAX_FALL_SPEED = 300

func _physics_process(delta):

	var h_dir = 0
	if Input.is_action_pressed("left_arrow"):
		h_dir -= 1
		scale.x = scale.y * 1
	if Input.is_action_pressed("right_arrow"):
		h_dir += 1
		scale.x = scale.y * -1

	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > MAX_FALL_SPEED:
			velocity.y = MAX_FALL_SPEED
	else:
		if Input.is_action_pressed("jump"):
			# negative jump force because y is inverted
			velocity.y = -jump_force


	if h_dir != 0:
		velocity.x += h_accel * h_dir
		if abs(velocity.x) > MAX_H_SPEED:
			velocity.x = MAX_H_SPEED * h_dir
	else:
		if velocity.x > 0:
			velocity.x -= h_accel
		elif velocity.x < 0:
			velocity.x += h_accel
	print(velocity.x)
	move_and_slide()
