extends KinematicBody

var fall_acceleration = 75
var velocity = Vector3.ZERO

func _physics_process(delta):
	velocity.y -= fall_acceleration * delta
