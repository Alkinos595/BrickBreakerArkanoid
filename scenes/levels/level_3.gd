extends level_base

func _ready() -> void:
	background.texture = preload("uid://cdu8dm20gau2")
	walls_sprite.modulate = Color.LIME_GREEN
	level_design = [
		"X","X","5","X","X",
		"X","4","5","4","X",
		"3","4","6","4","3",
		"2","3","5","3","2",
		"1","2","4","2","1",
		"X","1","3","1","X",
		"X","X","2","X","X",
		"1","X","3","X","1",
		"2","X","4","X","2",
		"3","X","5","X","3",
		"X","2","X","2","X",
		"1","3","X","3","1",
		"X","4","X","4","X",
		"1","X","5","X","1",
		"X","X","6","X","X",
		"X","2","X","2","X",
		"1","X","3","X","1",
		"X","X","2","X","X",
		"X","1","X","1","X",
		"X","X","1","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X"
	]
	generate_level(level_design)
