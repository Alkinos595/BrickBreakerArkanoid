extends level_base

func _ready() -> void:
	background.texture = preload("uid://d1366c5u01lgp")
	walls_sprite.modulate = Color.LIGHT_BLUE
	level_design = [
		"X","X","5","X","X",
		"X","5","6","5","X",
		"X","5","6","5","X",
		"5","6","5","6","5",
		"X","6","5","6","X",
		"X","X","5","X","X",
		"X","X","4","X","X",
		"X","4","5","4","X",
		"4","5","6","5","4",
		"X","4","5","4","X",
		"X","X","4","X","X",
		"X","X","3","X","X",
		"X","3","4","3","X",
		"X","X","3","X","X",
		"X","X","2","X","X",
		"X","X","1","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X"
	]
	generate_level(level_design)
