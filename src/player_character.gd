extends CharacterBody2D

@export var h_accel = 25
const MAX_H_SPEED = 125

@export var jump_force = 200
@export var gravity = 14
const MAX_FALL_SPEED = 250

func _physics_process(delta):

	var h_dir = 0
	h_accel = 25
	if Input.is_action_pressed("left_arrow"):
		h_dir = -1
		$Sprite2D.set_flip_h(false)
	if Input.is_action_pressed("right_arrow"):
		h_dir = 1
		$Sprite2D.set_flip_h(true)

	if !is_on_floor():
		h_accel = 5
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
		if abs(velocity.x) <= h_accel:
			velocity.x = 0
		if velocity.x > 0:
			velocity.x -= h_accel
		elif velocity.x < 0:
			velocity.x += h_accel

	print(velocity.x)
	move_and_slide()
