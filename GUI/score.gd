extends Label

func _ready() -> void:
	Global.connect("update_score", _on_update_score)
	text = str(Global.score)

func _on_update_score() -> void:
	text = str(Global.score)
