extends Node

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func play_sound(stream: AudioStream) -> void:
	var instance: AudioStreamPlayer = AudioStreamPlayer.new()
	instance.stream = stream
	instance.finished.connect(remove_sound.bind(instance))
	add_child(instance)
	instance.play()

func remove_sound(instance: AudioStreamPlayer) -> void:
	instance.queue_free()
