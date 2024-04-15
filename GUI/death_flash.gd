extends ColorRect

@export var animation_player: AnimationPlayer

func _ready() -> void:
	Global.connect("end_game", _on_end_game)

func _on_end_game() -> void:
	animation_player.play("death_flash")
