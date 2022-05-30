extends "res://utils/Moving.gd"

signal hit(new_health)

onready var animation_player = $AnimationPlayer
onready var dash_timer = $DashTimer

var speed = 14
var dash_speed = 75
var health = 3
var is_dashing = false

func hit():
	health -= 1
	emit_signal("hit", health)
	if (health == 0):
		print("dead")

func _physics_process(delta):
	
	if Input.is_action_just_pressed("dash"):
		dash()
	
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
	if is_dashing:
		velocity.x = direction.x * dash_speed
		velocity.z = direction.z * dash_speed
	else:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	
	rotation.y = atan2(-velocity.x, -velocity.z)	
	# smooth rotation, apply maybe later
	#if direction.length() > 0:
		# rotation.y = lerp_angle(rotation.y, atan2(-velocity.x, -velocity.z), 20 * delta)
	
	
	._physics_process(delta)

func attack():
	animation_player.play("Basic Attack")
	
func dash():
	dash_timer.start()
	is_dashing = true
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("basic_attack"):
		attack()


func _on_DashTimer_timeout() -> void:
	is_dashing = false
