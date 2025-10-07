extends CanvasLayer

signal level_selected
signal clear_balls
signal clear_level


@onready var new_game_button: Button = %NewGameButton
@onready var go_back_button: Button = %GoBackButton
@onready var level_buttons: Array[Node] = $LevelMenu/ButtonsGridContainer.get_children()
@onready var ball_container: Node2D = $"../BallContainer"
@onready var ball_left_label: Label = $hub/MarginBallLeftLabel/BallLeftLabel
@onready var score_label: Label = $hub/MarginScoreLabel/ScoreLabel
@onready var game_over_screen: VBoxContainer = $hub/GameOverVBoxContainer
@onready var launch_button: Button = $hub/LaunchButton
@onready var pause_menu: VBoxContainer = $hub/PauseMenuVBoxContainer

const ball_scene = preload("uid://bp84fqywftj08")


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	for i in level_buttons.size():
		var button: Button = level_buttons[i]
		button.pressed.connect(selectLevel.bind(button))
	get_tree().paused = true

func _process(_delta: float) -> void:
	ball_left_label.text = "Balls x%d" % Globals.player_balls
	score_label.text = "SCORE: %d" % Globals.current_score

func selectLevel(button: Button):
	if button.text == "Level 1":
		var level = "res://scenes/levels/level_1.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 2":
		var level = "res://scenes/levels/level_2.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 3":
		var level = "res://scenes/levels/level_3.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 4":
		var level = "res://scenes/levels/level_4.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 5":
		var level = "res://scenes/levels/level_5.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 6":
		var level = "res://scenes/levels/level_6.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 7":
		var level = "res://scenes/levels/level_7.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 8":
		var level = "res://scenes/levels/level_8.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 9":
		var level = "res://scenes/levels/level_9.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 10":
		var level = "res://scenes/levels/level_10.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 11":
		var level = "res://scenes/levels/level_11.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	elif button.text == "Level 12":
		var level = "res://scenes/levels/level_12.tscn"
		level_selected.emit(level)
		$LevelMenu.hide()
	else:
		print("Nivel no disponible")

func _on_launch_button_pressed() -> void:
	launch_button.hide()
	get_tree().paused = false
	Globals.player_balls -= 1
	var ball = ball_scene.instantiate()
	ball_container.add_child(ball)
	ball.position = Vector2(360, 1080)

func _on_new_game_button_pressed() -> void:
	$MainMenu.hide()

func _on_go_back_button_pressed() -> void:
	$MainMenu.show()

func show_launch_button() -> void:
	$hub/LaunchButton.show()

func show_game_over() -> void:
	$hub/GameOverVBoxContainer/Label.text = "Game Over"
	game_over_screen.show()
	
func show_you_win() -> void:
	$hub/GameOverVBoxContainer/Label.text = "Level completed!"
	game_over_screen.show()

func _on_main_menu_button_pressed() -> void:
	Globals.current_score = 0
	Globals.player_balls = 3
	$MainMenu.show()
	$LevelMenu.show()
	show_launch_button()
	game_over_screen.hide()
	clear_balls.emit()
	clear_level.emit()

func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	pause_menu.show()

func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	pause_menu.hide()

func _on_exit_level_button_pressed() -> void:
	_on_main_menu_button_pressed()
	pause_menu.hide()
