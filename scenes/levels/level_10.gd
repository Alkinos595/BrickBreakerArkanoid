extends level_base

func _ready() -> void:
	background.texture = preload("uid://d1366c5u01lgp")
	walls_sprite.modulate = Color.LIGHT_BLUE
	level_design = [
		"X","4","4","4","X",
		"4","5","5","5","4",
		"4","5","6","5","4",
		"4","5","5","5","4",
		"X","4","4","4","X",
		"X","X","4","X","X",
		"X","4","X","4","X",
		"X","X","4","X","X",
		"2","X","3","X","2",
		"X","2","X","2","X",
		"X","X","2","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
	]
	generate_level(level_design)
