extends Node

signal update_score
signal start_game
signal end_game

@export var speed: int = 50
var score: int = 0
var typing: bool = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if not event.is_echo():
		#if event.is_action_pressed("quit"):
			#get_tree().quit()
		if not typing:
			if event.is_action_pressed("restart"):
				score = 0
				get_tree().paused = false
				get_tree().reload_current_scene()

func add_score() -> void:
	score += 1
	update_score.emit()

func focus_text() -> void:
	typing = true

func unfocus_text() -> void:
	typing = false
