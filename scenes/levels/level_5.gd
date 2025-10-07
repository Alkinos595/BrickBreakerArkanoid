extends level_base

func _ready() -> void:
	background.texture = preload("uid://dn37fmqbacgm7")
	walls_sprite.modulate = Color.BURLYWOOD
	level_design = [
		"6","X","6","X","6",
		"5","6","6","6","5",
		"4","5","6","5","4",
		"4","4","5","4","4",
		"3","4","5","4","3",
		"3","3","4","3","3",
		"2","3","4","3","2",
		"2","X","3","X","2",
		"1","2","3","2","1",
		"1","1","2","1","1",
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
		"X","X","X","X","X",
		"X","X","X","X","X",
		"X","X","X","X","X"
	]
	generate_level(level_design)
