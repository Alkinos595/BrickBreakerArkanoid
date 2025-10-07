extends Node2D

@onready var ui: CanvasLayer = $UI
@onready var level_container: Node2D = $LevelContainer
@onready var ball_container: Node2D = $BallContainer
var current_level: Node2D

func _on_ui_level_selected(level) -> void:
	if current_level and is_instance_valid(current_level):
		current_level.queue_free()
		await current_level.tree_exited
	var level_to_load: PackedScene = load(level)
	current_level = level_to_load.instantiate()
	level_container.add_child(current_level)
	connect_LevelSignals(current_level)

func connect_LevelSignals(level: Node) -> void:
	if level.has_signal("lost_one_ball"):
		level.lost_one_ball.connect(signalManager.bind("lost_one_ball"))
	if level.has_signal("you_lose_signal"):
		level.you_lose_signal.connect(signalManager.bind("you_lose_signal"))
	if level.has_signal("you_win_signal"):
		level.you_win_signal.connect(signalManager.bind("you_win_signal"))

func signalManager(signal_name: String) -> void:
	match signal_name:
		"lost_one_ball":
			get_tree().paused = true
			ui.show_launch_button()
		"you_lose_signal":
			get_tree().paused = true
			ui.show_game_over()
		"you_win_signal":
			get_tree().paused = true
			ui.show_you_win()

func _on_ui_clear_balls() -> void:
	for child in ball_container.get_children():
		child.queue_free()

func _on_ui_clear_level() -> void:
	for child in level_container.get_children():
		child.queue_free()
