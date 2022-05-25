extends "res://utils/Gravity.gd"

func _physics_process(delta):
	._physics_process(delta)
	
	velocity = move_and_slide(velocity, Vector3.UP)
