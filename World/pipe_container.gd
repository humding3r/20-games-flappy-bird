extends Node

@onready var pipe: PackedScene = preload("res://Pipe/pipe.tscn")
@export var cooldown: Timer
@export var spawner: Marker2D
@export var despawner: Marker2D
@export var difficulty: int = 5

func _ready() -> void:
	Global.connect("update_score", _on_update_score)
	Global.connect("start_game", _on_start_game)

func _on_pipe_cooldown_timeout() -> void:
	var pipe_instance: Node2D = pipe.instantiate()
	add_child(pipe_instance)
	pipe_instance.pipe_top.position.y += difficulty
	pipe_instance.pipe_bottom.position.y -= difficulty
	pipe_instance.despawner = despawner
	pipe_instance.position.x = spawner.position.x

func _on_update_score() -> void:
	if Global.score > 0 and Global.score % 50 == 0:
		difficulty += 1

func _on_start_game() -> void:
	cooldown.start()
