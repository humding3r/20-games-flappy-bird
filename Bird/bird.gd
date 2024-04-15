extends CharacterBody2D

@export var jump_velocity: float = -200.0
@export var collision_shape: CollisionShape2D
@export var jump_sound: AudioStream
@export var hit_sound: AudioStream
@export var death_sound: AudioStream
@export var animation_player: AnimationPlayer
@export var animated_sprite: AnimatedSprite2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

enum {BASE, START, OVER}
var game_state: int = BASE:
	get:
		return game_state
	set(value):
		if value == START:
			Global.start_game.emit()
		elif value == OVER:
			Global.end_game.emit()
		game_state = value

func _ready() -> void:
	animation_player.play("base")

func _physics_process(delta: float) -> void:
	var collision_info: bool = move_and_slide()
	
	if collision_info:
		get_tree().paused = true
		collision_shape.set_deferred("disabled", true)
		velocity = Vector2(randf_range(-50, 50), -150)
		animation_player.pause()
		game_state = OVER
		AudioManager.play_sound(hit_sound)

	if game_state == BASE:
		velocity.y = 0
	else:
		velocity.y += gravity * delta

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and not event.is_echo() and not game_state == OVER:
		if game_state != START: 
			game_state = START
		animation_player.stop()
		animation_player.play("fly")
		velocity.y = jump_velocity
		AudioManager.play_sound(jump_sound)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
