extends Label

func update_label(health):
	text = "HP: %s" % health



func _on_Crabby_hit(new_health) -> void:
	update_label(new_health)
