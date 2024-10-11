extends Node2D

@export var speed = 400 # How fast the player will move (pixels/sec).
static var test_pressed_right
static var test_pressed_left

# Called when the player enters the scene for the first time.
func _ready() -> void:
	var tartaruga_height = get_node("Sprite2D").texture.get_height()
	position.x = get_viewport().get_visible_rect().size.x / 2
	position.y = get_viewport().get_visible_rect().size.y - tartaruga_height / 3
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	
	##Player Movement change
	if Input.is_action_pressed("move_right") or test_pressed_right: 
		velocity.x += 1
	if Input.is_action_pressed("move_left") or test_pressed_left:
		velocity.x -= 1
	
	if velocity.length() > 0 :
		velocity *= speed

	var tartaruga_height = get_node("Sprite2D").texture.get_height()
	var tartaruga_width = get_node("Sprite2D").texture.get_width()
	var visible_rect = get_viewport().get_visible_rect()
	
	position += velocity * delta
	position.x = clamp(position.x, tartaruga_width/2,visible_rect.size.x-tartaruga_width/2)
	position.y = clamp(position.y, tartaruga_height/3, visible_rect.size.y-tartaruga_height/3)
	
	pass
