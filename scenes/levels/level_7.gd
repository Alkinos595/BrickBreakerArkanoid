extends level_base

func _ready() -> void:
	background.texture = preload("uid://c5xxkg68f712s")
	walls_sprite.modulate = Color.SANDY_BROWN
	level_design = [
		"6","6","6","6","6",
		"X","6","6","6","X",
		"X","5","6","5","X",
		"X","5","5","5","X",
		"X","4","5","4","X",
		"4","4","4","4","4",
		"X","3","4","3","X",
		"X","3","3","3","X",
		"X","2","3","2","X",
		"2","2","2","2","2",
		"X","1","2","1","X",
		"X","1","1","1","X",
		"X","0","1","0","X",
		"X","X","1","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X"
	]
	generate_level(level_design)
