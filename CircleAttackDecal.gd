extends Spatial

export var charge_time = 1

onready var attack_timer = $AttackTimer
onready var charge = $Charge

var charge_progress = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attack_timer.wait_time = charge_time
	attack_timer.start()



func _process(delta: float) -> void:
	charge_progress += delta
	var scale = charge_progress / charge_time
	charge.scale.z = scale
	charge.scale.x = scale
	

func _on_AttackTimer_timeout() -> void:
	for body in $HitBox.get_overlapping_bodies():
		if body.is_in_group("players") and body.has_method("hit"):
			body.hit()
	queue_free()
