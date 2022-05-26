extends "res://utils/Moving.gd"

var health = 100
# var speed = 14

func hit(damage):
	health = max(0, health - damage)
	if (health == 0):
		queue_free()

func _physics_process(delta):
	velocity.x = 0
	velocity.z = 0
	
	._physics_process(delta)
