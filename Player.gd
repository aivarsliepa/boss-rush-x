extends "res://utils/Moving.gd"

signal hit

# How fast the player moves in meters per second.
export var speed = 14
var hp = 3

func hit():
	hp -= 1
	if (hp == 1):
		print("dead")

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

	direction = direction.normalized()

	# Ground velocity
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	._physics_process(delta)

func attack():
	$AnimationPlayer.play("Basic Attack")
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("basic_attack"):
		attack()
