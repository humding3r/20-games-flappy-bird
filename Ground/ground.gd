extends StaticBody2D

@export var spawner: Marker2D
@export var despawner: Marker2D
var has_spawned: bool = false

func _process(delta: float) -> void:
	position.x -= Global.speed * delta
	if position.x < despawner.position.x:
		position.x = spawner.position.x
