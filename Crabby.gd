extends "res://utils/Moving.gd"

signal hit(new_health)

var health = 100
# var speed = 14
var circle_attack_decal_scene = preload("res://CircleAttackDecal.tscn")

onready var animation_player = $CrabbyModel/AnimationPlayer

var isAttacking 

func hit(damage):
	health = max(0, health - damage)
	emit_signal("hit", health)

	if (health == 0):
		queue_free()

func _physics_process(delta):
	velocity.x = 0
	velocity.z = 0
	
	._physics_process(delta)

func _process(delta: float) -> void:
	pass


func jump_attack():
	animation_player.play("MonsterArmature|Jump")
	var red_circle = circle_attack_decal_scene.instance()
	
	red_circle.scale.x = 2
	red_circle.scale.z = 2
	
	add_child(red_circle)
	red_circle.global_translate(Vector3(translation.x, translation.y, 0))

func _on_AttackTimer_timeout() -> void:
	jump_attack()
