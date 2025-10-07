extends level_base

func _ready() -> void:
	background.texture = preload("uid://b8alostx2lhek")
	walls_sprite.modulate = Color.LIGHT_GREEN
	level_design = [
		"X","2","3","2","X",
		"2","3","4","3","2",
		"3","4","5","4","3",
		"2","4","6","4","2",
		"3","5","4","5","3",
		"X","3","4","3","X",
		"X","2","3","2","X",
		"1","X","2","X","1",
		"1","1","X","1","1",
		"X","2","3","2","X",
		"2","X","4","X","2",
		"3","4","5","4","3",
		"X","3","4","3","X",
		"2","X","3","X","2",
		"1","1","2","1","1",
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
