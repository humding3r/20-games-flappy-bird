extends Node2D

@export var despawner: Marker2D
@export var score_sound: AudioStream

@onready var pipe_top: StaticBody2D = $PipeTop
@onready var pipe_bottom: StaticBody2D = $PipeBottom
@onready var score_area: Area2D = $ScoreArea

func _ready() -> void:
	position.y = randi_range(-40, -140)

func _process(delta: float) -> void:
	position.x -= Global.speed * delta
	if position.x < despawner.position.x:
		queue_free()

func _on_score_area_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		Global.add_score()
		AudioManager.play_sound(score_sound)
