extends Node2D

@export var speed = 100 # How fast the canudo will fall (pixels/sec).
var canudo_height
var canudo_width
var visible_rect
var scale_x
var scale_y

# Called when the player enters the scene for the first time.
func _ready() -> void:
	Global.spawn_rate += 1
	get_parent().get_node("Timer").update_wait_time(self)

	inicializar_dimensões()
	set_posiçãoAleatoria()

# Function to initialize the dimensions of the straw
func inicializar_dimensões() -> void:
	scale_x = get_node("Sprite2D").scale.x
	scale_y = get_node("Sprite2D").scale.y
	canudo_height = get_node("Sprite2D").texture.get_height() * scale_y
	canudo_width = get_node("Sprite2D").texture.get_width() * scale_x
	print(canudo_height)
	print(canudo_width)
	visible_rect = get_viewport().get_visible_rect()

# Function to set the straw's random position
func set_posiçãoAleatoria() -> void:
	position.x = randf_range(canudo_width / 2, visible_rect.size.x - canudo_width / 2)
	position.y = -canudo_height

# Called every frame. 'delta' is the time elapsed since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # Vetor de movimento do canudo.
	
	# Straw movement
	velocity.y += speed
	position += velocity * delta

	# If the straw goes off-screen, it will be removed
	if position.y >= visible_rect.size.y + canudo_height / 2:
		queue_free()
