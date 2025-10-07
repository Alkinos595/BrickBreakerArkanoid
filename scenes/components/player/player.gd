extends CharacterBody2D

const SPEED = 700.0
const Y_ANCHOR = 1150

@onready var audio_player: AudioStreamPlayer2D = $HitSound

func _physics_process(_delta: float) -> void:
	
	# --- Teclado ---
	#Creo una variable en la que voy a guardar el vector de dirección
	#para el movimiento dependiendo de la tecla presionada
	var direction: Vector2
	if Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	#Asigno velocity para que al presionar una tecla la funcion move_and_slide
	#que se llama constantemente en process, actualice la posicion del player
	#con los nuevos valores (Esto solo aplica al precionar teclas, no click/touch)
	velocity = direction * SPEED
	# --- Teclado END ---

	# --- (Mouse/Touch) ---
	#Si por el contrario se esta usando mouse/touch, detecto el click
	#Al hacerlo muevo en X al player en una posicion entre (50) y el (ancho - 50) pixeles
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mouse_position = get_viewport().get_mouse_position()
		if mouse_position.y > 800:
			global_position.x = clamp(get_viewport().get_mouse_position().x , 50 ,get_viewport_rect().size.x - 50)
	# --- (Mouse/Touch)  END ---
	
	#Aplico move_and_slide 
	move_and_slide()
	#Fijo el valor del player en Y con Y_ANCHOR
	global_position.y = Y_ANCHOR

func _on_top_pallet_area_body_entered(body: Node2D) -> void:
	if body.has_method("bounce"):
		audio_player.play()
		body.bounce()
