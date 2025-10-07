extends level_base

func _ready() -> void:
	background.texture = preload("uid://dogh7v5rmyymr")
	walls_sprite.modulate = Color.CADET_BLUE
	level_design = [
		"X","6","X","6","X",
		"6","5","6","5","6",
		"6","5","6","5","6",
		"6","6","6","6","6",
		"X","6","6","6","X",
		"X","5","6","5","X",
		"X","5","5","5","X",
		"X","4","5","4","X",
		"X","4","4","4","X",
		"X","3","4","3","X",
		"X","3","3","3","X",
		"X","2","3","2","X",
		"X","2","X","2","X",
		"X","1","2","1","X",
		"X","X","1","X","X",
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
