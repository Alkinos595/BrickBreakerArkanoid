extends level_base

func _ready() -> void:
	background.texture = preload("uid://c5xxkg68f712s")
	walls_sprite.modulate = Color.SANDY_BROWN
	level_design = [
		"X","6","6","6","X",
		"6","6","6","6","6",
		"6","X","6","X","6",
		"6","X","6","X","6",
		"6","6","X","6","6",
		"6","6","X","6","6",
		"6","6","6","6","6",
		"X","6","X","6","X",
		"6","X","6","X","6",
		"6","6","6","6","6",
		"X","6","6","6","X",
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
		"X","X","X","X","X"
	]
	generate_level(level_design)
