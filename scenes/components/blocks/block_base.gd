extends StaticBody2D

signal broken_block
signal hit_block

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var label_counter: Label = $LabelCounter
var colors: Array = [
	Color.GRAY,
	Color.BLUE,
	Color.REBECCA_PURPLE, 
	Color.DEEP_PINK,
	Color.ORANGE,
	Color.YELLOW,
	Color.RED,
	Color.GREEN]
	
var block_level: Array = [0, 1, 2, 3, 4, 5, 6]

@export var selected_level: int = 0

var life_points: int

func _ready() -> void:
	if selected_level == 0:
		life_points = 1
		label_counter.text = "Break it!"
		sprite_2d.modulate = colors[0]
	elif selected_level == 1:
		life_points = 2
		label_counter.text = "2"
		sprite_2d.modulate = colors[1]
	elif selected_level == 2:
		life_points = 3
		label_counter.text = "3"
		sprite_2d.modulate = colors[2]
	elif selected_level == 3:
		life_points = 4
		label_counter.text = "4"
		sprite_2d.modulate = colors[3]
	elif selected_level == 4:
		life_points = 5
		label_counter.text = "5"
		sprite_2d.modulate = colors[4]
	elif selected_level == 5:
		life_points = 6
		label_counter.text = "6"
		sprite_2d.modulate = colors[5]
	elif selected_level == 6:
		life_points = 7
		label_counter.text = "7"
		sprite_2d.modulate = colors[6]
	elif selected_level < 0 or selected_level > 6:
		life_points = 1
		label_counter.text = "XD"
		sprite_2d.modulate = colors[7]

func _on_impact_surface_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("bounce"):
		break_block()

func break_block() -> void:
	life_points -= 1
	if life_points <= 0:
		queue_free()
		hit_block.emit()
		broken_block.emit()
	elif life_points > 0:
		if life_points == 1:
			label_counter.text = "Break it!"
			sprite_2d.modulate = colors[life_points - 1]
		else:
			label_counter.text = str(life_points)
			sprite_2d.modulate = colors[life_points - 1]
		hit_block.emit()
