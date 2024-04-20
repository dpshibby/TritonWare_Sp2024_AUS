extends CharacterBody2D

var h_speed = 200

var jump_force = 300
var gravity = 20
const max_fall_speed = 300

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
		if velocity.y > max_fall_speed:
			velocity.y = max_fall_speed
	else:
		if Input.is_action_pressed("jump"):
			# negative jump force because y is inverted
			velocity.y = -jump_force


	print(velocity.x)
	velocity.x = h_speed * h_dir
	move_and_slide()
