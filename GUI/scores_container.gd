extends VBoxContainer

@onready var score_entry: PackedScene = preload("res://GUI/score_entry.tscn")
var sw_result: Dictionary

func _ready() -> void:
	Global.connect("end_game", _on_end_game)

func _on_end_game() -> void:
	update_leaderboard()

func _on_line_edit_update_scores() -> void:
	update_leaderboard()

func update_leaderboard() -> void:
	for entry: HBoxContainer in get_children():
		entry.queue_free()
	#sw_result = await SilentWolf.Scores.get_scores(10, "highest").sw_get_scores_complete
	#for score: Dictionary in sw_result.scores:
		#add_score_entry(score)

func add_score_entry(score: Dictionary) -> void:
	#var instance: HBoxContainer = score_entry.instantiate()
	#instance.entry_name.text = score.player_name
	#instance.entry_score.text = str(int(score.score))
	#add_child(instance)
	pass
