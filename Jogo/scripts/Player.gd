extends Node2D

const speed = 400
var tartaruga_height
var tartaruga_width
var visible_rect_size = Vector2(800, 600)

# Called when the player enters the scene for the first time.
func _ready() -> void:
	tartaruga_height = get_node("Sprite2D").texture.get_height()
	tartaruga_width = get_node("Sprite2D").texture.get_width()
	if get_viewport().get_visible_rect().size != Vector2.ZERO:
		visible_rect_size = get_viewport().get_visible_rect().size
	
	position.x = visible_rect_size.x/2
	position.y = visible_rect_size.y - tartaruga_height/2
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"): 
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	
	position += velocity * delta
	position.x = clamp(position.x, tartaruga_width/2, visible_rect_size.x-tartaruga_width/2)
	
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "Lixo":
		get_parent().take_damage()
		area.get_parent().queue_free()
	pass
