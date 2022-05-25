extends "res://utils/Moving.gd"

signal hit

# How fast the player moves in meters per second.
export var speed = 14

func _physics_process(delta):
	
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.z += 1
	if Input.is_action_pressed("move_up"):
		direction.z -= 1

	# Ground velocity
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	._physics_process(delta)

