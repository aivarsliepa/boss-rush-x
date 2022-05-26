extends Area


var damage = 10

func _on_Sword_body_entered(body: Node) -> void:
	if body.is_in_group("enemies") and body.has_method("hit"):
		body.hit(damage)
