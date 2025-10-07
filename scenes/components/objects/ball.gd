extends RigidBody2D

@export var ball_speed: float = 750.0

#BallConfig: friction=0.0;bounce=1.5;gravity_scale=0.0;damp_mode=replace in both(linear/angular)

@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
const BLOCK_HIT_SOUND = preload("uid://bysmw3p62qxnj")

func _ready() -> void:
	
	#En ready seteo los valores que tendra por defecto una pelota al instanciarla
	
	# Sin esto no se pueden detectar colisiones en un RidigBody
	contact_monitor = true
	max_contacts_reported = 4
	
	#Detección continua de colision, para evitar problemas
	#Sin esto a veces la bola se sale de la pantalla con un mal golpe
	continuous_cd = RigidBody2D.CCD_MODE_CAST_RAY
	
	# Creo una direccion aleatorea con generate_ran_dir()
	var ran_dir = generate_ran_dir()
	
	# Guardo y normalizo la direccion, en Y siempre sera arriba por el -1
	var dir = Vector2(ran_dir, -1).normalized()
	
	# Darle impulso inicial hacia arriba con la inclinacion X aleatorea
	linear_velocity = dir * ball_speed

func _physics_process(_delta: float) -> void:
	#El codigo en _physics_process es para que la pelota mantenga su velocidad
	#Y no desacelere en exceso por los rebotes
	
	# Velocidad actual de la pelota
	var vector_velocity: Vector2 = linear_velocity
	
	# .length() aplicado a un vector devuelve su magnitud
	# es decir, su rapidez sin importar la dirección.
	var magnitud_vector: float = vector_velocity.length()

	# Forzar magnitud dentro de rango
	var clamped_speed : float = clamp(magnitud_vector, 700.0, 1000.0)
	
	#Reasigno una nueva velocidad en caso de que al rebotar haya disminuido
	#Y la mantengo dentro del rango de clamped_speed
	linear_velocity = vector_velocity.normalized() * clamped_speed

func generate_ran_dir() -> float:
	#Genero un valor dentro del rango (-0.5, 0.5) que siempre sea mayor a +-0.2
	var value: float = 0.0
	while absf(value) < 0.2:
		value = randf_range(-0.5, 0.5)
	return value

func bounce() -> void:
	#Ajusto un poco la posicion de la bola para evitar problemas de colision
	global_position.y -= 2
	# Declaro y asigno una nueva velocidad a una variable
	var new_speed: float = randf_range(1.1, 3.0) * ball_speed
	#Invertir dirección vertical: Con esto garantizo asignar una dirección
	# negativa(Hacia arriba) en Y al asignar linear_velocity
	var vector_velocity: Vector2 = linear_velocity
	#Si Y es positivo significa que la pelota viene bajando no subiendo
	#por eso debemos invertir la dirección de forma preventiva, solo por si acaso
	vector_velocity.y = -absf(vector_velocity.y)
	
	# Asigno la nueva velocidad
	linear_velocity = vector_velocity.normalized() * new_speed

func _on_body_entered(body: Node) -> void:
	if body.has_method("break_block"):
		audio_player.stream = BLOCK_HIT_SOUND
		audio_player.play()
