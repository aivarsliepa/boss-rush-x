extends Node

onready var camera_pivot = $CameraPivot
onready var player = $Player
onready var ui_player_hp = $UI/PlayerHealthLabel
onready var ui_boss_hp = $UI/BossHealthLabel
onready var boss = $Crabby

func _process(delta: float) -> void:
	camera_pivot.translation = camera_pivot.translation.move_toward(player.translation, 1)

func _ready() -> void:
	init_ui()

func init_ui():
	ui_player_hp.update_label(player.health)
	ui_boss_hp.update_label(boss.health)
