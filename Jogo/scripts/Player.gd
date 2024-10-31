extends Node2D

@export var speed = 300 # How fast the player will move (pixels/sec).
var tartaruga_height
var tartaruga_width
var visible_rect
var escala = 0.156

# Called when the player enters the scene for the first time.
func _ready() -> void:
	tartaruga_height = get_node("Area2D/Sprite2D").texture.get_height() * escala
	tartaruga_width = get_node("Area2D/Sprite2D").texture.get_width() * escala
	visible_rect = get_viewport().get_visible_rect()
	
	position.x = visible_rect.size.x/2
	position.y = visible_rect.size.y - tartaruga_height/2
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(get_parent().get_parent().get_child(3).name)
	var velocity = Vector2.ZERO # The player's movement vector.
	
	##Player Movement change
	if Input.is_action_pressed("move_right"): 
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if velocity.length() > 0 :
		velocity *= speed
	
	position += velocity * delta
	position.x = clamp(position.x, tartaruga_width/2 ,visible_rect.size.x-tartaruga_width/2)
	
	pass
