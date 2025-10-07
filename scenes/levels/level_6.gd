extends level_base

func _ready() -> void:
	background.texture = preload("uid://dn37fmqbacgm7")
	walls_sprite.modulate = Color.BURLYWOOD
	level_design = [
		"5","X","X","X","X",
		"4","5","X","X","X",
		"X","4","5","X","X",
		"X","X","4","5","X",
		"X","X","X","4","5",
		"X","X","X","5","4",
		"X","X","5","4","X",
		"X","5","4","X","X",
		"5","4","X","X","X",
		"4","5","X","X","X",
		"X","4","5","X","X",
		"X","X","4","5","X",
		"X","X","X","4","5",
		"X","X","X","5","4",
		"X","X","5","4","X",
		"X","5","4","X","X",
		"5","4","X","X","X",
		"4","5","X","X","X",
		"X","4","5","X","X",
		"X","X","4","5","X",
		"X","X","X","4","5",
		"X","X","X","X","4",
		"X","X","X","X","X"
	]
	generate_level(level_design)
