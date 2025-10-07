extends Node2D

class_name level_base

signal you_win_signal
signal you_lose_signal
signal lost_one_ball

@onready var background: Sprite2D = $background
@onready var walls_sprite: Sprite2D = $Walls/Sprite2D

var remaining_blocks: int = 0

var cell_size: Vector2 = Vector2(110, 35) #Tamaño del bloque
var pos_origin: Vector2 = Vector2(85, 80) #(x=85, y=80)
var block_base_scene: PackedScene = preload("res://scenes/components/blocks/block_base.tscn")

#Creo un array con el diseño que tendra el nivel
#El array es de 110 porque es lo que estime que entraria para este tamaño de bloque
var level_design: Array = [
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
	"X", "X", "X", "X", "X",
]

func _on_death_zone_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("bounce") and Globals.player_balls >= 1:
		body.queue_free()
		lost_one_ball.emit()
	elif body.has_method("bounce") and Globals.player_balls <= 0:
		body.queue_free()
		you_lose_signal.emit()

func create_block(pos: Vector2, block_level: int ):
	var block = block_base_scene.instantiate()
	block.position = pos
	block.selected_level = block_level
	add_child(block)
	remaining_blocks += 1
	block.hit_block.connect(increase_score.bind(block_level))
	block.broken_block.connect(check_win)

func check_win() -> void:
	remaining_blocks -= 1
	if remaining_blocks <= 0:
		you_win_signal.emit()

func increase_score(block_level: int) -> void:
	if block_level <= 0 or block_level > 6:
		block_level = 1
	#Int redondea hacia abajo, rango entre 5 y 15 entre 5 da entre 1 y 3
	#Por 5, da valores entre 5, 10, 15 y 20 de bonus aleatorio
	Globals.current_score += 100 * block_level + int(randf_range(5, 20) / 5.0) * 5

func generate_level(design: Array) -> void:
	var next_pos: Vector2 = pos_origin
	var counter = 1 
	for i in design.size():
		#Solo creo bloque si en el diseño, la casilla no esta vacia
		if design[i] == "X":
			pass
		else:
			create_block(next_pos, int(design[i]))
		#Luego de crear o no el bloque, salto a la siguiente casilla del array
		if counter == 5:
			counter = 1
			next_pos.x = pos_origin.x
			next_pos.y += cell_size.y
		else:
			next_pos.x += cell_size.x
			counter += 1
