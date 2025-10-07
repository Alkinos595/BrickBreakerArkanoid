extends level_base

func _ready() -> void:
	background.texture = preload("uid://b8alostx2lhek")
	walls_sprite.modulate = Color.LIGHT_GREEN
	level_design = [
		"X", "X", "2", "X", "X",
		"X", "2", "2", "2", "X",
		"2", "2", "3", "2", "2",
		"X", "2", "2", "2", "X",
		"X", "X", "2", "X", "X",
		"X", "X", "X", "X", "X",
		"1", "1", "1", "1", "1",
		"X", "0", "X", "0", "X",
		"1", "X", "2", "X", "1",
		"X", "2", "3", "2", "X",
		"1", "X", "2", "X", "1",
		"X", "0", "X", "0", "X",
		"1", "1", "1", "1", "1",
		"X", "X", "X", "X", "X",
		"X", "4", "X", "4", "X",
		"X", "X", "5", "X", "X",
		"X", "4", "X", "4", "X",
		"X", "X", "X", "X", "X",
		"2", "X", "X", "X", "2",
		"X", "2", "X", "2", "X",
		"X", "X", "3", "X", "X",
		"X", "3", "X", "3", "X",
		"X", "X", "X", "X", "X"
	]
	generate_level(level_design)
