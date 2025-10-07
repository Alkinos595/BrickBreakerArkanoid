extends level_base

func _ready() -> void:
	background.texture = preload("uid://cdu8dm20gau2")
	walls_sprite.modulate = Color.LIME_GREEN
	level_design = [
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"X","X","0","X","X",
		"2","X","0","X","2",
		"2","2","5","2","2",
		"X","2","5","2","X",
		"X","X","1","X","X",
		"X","X","2","X","X",
		"X","X","1","X","X",
		"X","X","2","X","X",
		"X","X","1","X","X",
		"X","X","2","X","X",
		"X","2","1","2","X",
		"X","X","2","X","X"
	]
	generate_level(level_design)
