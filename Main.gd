extends Node

func _process(delta: float) -> void:
	$CameraPivot.translation = $CameraPivot.translation.move_toward($Player.translation, 1)
