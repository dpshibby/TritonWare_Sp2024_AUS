extends CharacterBody2D

var h_speed = 200

var gravity = 20
const max_fall_speed = 100

func _physics_process(delta):

	var h_dir = 0
	if Input.is_action_pressed("left_arrow"):
		h_dir -= 1
	if Input.is_action_pressed("right_arrow"):
		h_dir += 1

	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > max_fall_speed:
			velocity.y = max_fall_speed

	velocity.x = h_speed * h_dir
	move_and_slide()
