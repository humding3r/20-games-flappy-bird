extends LineEdit

signal update_scores

var submitted: bool = false

func _on_text_changed(new_text: String) -> void:
	var caret_pos: int = caret_column
	text = new_text.to_upper()
	caret_column = caret_pos

func _on_text_submitted(new_text: String) -> void:
	if not submitted:
		editable = false
		submitted = true
		#var save_request: Node = SilentWolf.Scores.save_score(new_text, Global.score, "highest")
		#var _sw_result: Dictionary = await save_request.sw_save_score_complete
		update_scores.emit()
		release_focus()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed and event.button_index == 1:
		var event_local: InputEvent = make_input_local(event)
		if not Rect2(Vector2(0, 0), size).has_point(event_local.position):
			release_focus()

func _on_focus_entered() -> void:
	Global.focus_text()

func _on_focus_exited() -> void:
	Global.unfocus_text()

