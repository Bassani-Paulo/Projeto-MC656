extends Node2D

@export var speed = 100 # How fast the seaweed will fall (pixels/sec).
var alga_height
var alga_width
var visible_rect
var scale_x
var scale_y

# Called when the player enters the scene for the first time.
func _ready() -> void:
	inicializar_dimensões()
	set_posiçãoAleatoria()
	get_parent().get_node("Timer_Alga").update_wait_time(self)

# Function to initialize the dimensions of the seaweed
func inicializar_dimensões() -> void:
	scale_x = get_node("Sprite2D").scale.x
	scale_y = get_node("Sprite2D").scale.y
	alga_height = get_node("Sprite2D").texture.get_height() * scale_y
	alga_width = get_node("Sprite2D").texture.get_width() * scale_x
	visible_rect = get_viewport().get_visible_rect()

# Function to set the seaweed's random position
func set_posiçãoAleatoria() -> void:
	position.x = randf_range(alga_width / 2, visible_rect.size.x - alga_width / 2)
	position.y = -alga_height

# Called every frame. 'delta' is the time elapsed since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # Vetor de movimento da alga.
	
	# Seaweed movement
	velocity.y += speed
	position += velocity * delta

	# If the seaweed goes off-screen, it will be removed
	if position.y >= visible_rect.size.y + alga_height / 2:
		queue_free()
