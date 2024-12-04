extends Node2D
@export var speed = 75
@export var player_speed = 150
@export var tipo : int = 0

var collision_shape

var image_storage
var visible_rect

var lixo_height
var lixo_width

var initial_speed = 75

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape = $Area2D/CollisionShape2D
	visible_rect = get_viewport().get_visible_rect().size
	image_storage = get_node("Storage")
	select_random()
	
	lixo_height = get_node("Sprite2D").texture.get_height()
	lixo_width = get_node("Sprite2D").texture.get_width()
	
	position.x = visible_rect.x/2 - lixo_width/2
	position.y = -lixo_height
	
	calculate_speed()

	var shape = RectangleShape2D.new()
	shape.extents = Vector2(lixo_width/2, lixo_height/2)
	collision_shape = shape
	pass # Replace with function body.

func calculate_speed() -> void:
	speed = initial_speed + 10 * Global.streak

func select_random() -> void:
	var index = randi_range(0, 11)
	tipo = floor(index / 3)
	get_node("Sprite2D").texture = image_storage.get_child(index).texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	velocity.y += speed
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += initial_speed
	
	if velocity.length() > 0:
		velocity.x *= player_speed
	position += velocity * delta
	
	position.x = clamp(position.x, lixo_width/2, visible_rect.x - lixo_width/2)
	
	if position.y > (visible_rect.y - 2) + lixo_height/2:
		Global.streak = 0
		get_parent().erros += 1
		get_parent().spawn_lixo()
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.name == "Area2D_blue" and tipo == 0) or (area.name == "Area2D_green" and tipo == 1):
		Global.score_rec += 1
		Global.streak += 1
		get_parent().get_node("TimerCloud").update_wait_time()
		get_parent().get_node("VillagerAccept").playing = true
	elif (area.name == "Area2D_red" and tipo == 3) or (area.name == "Area2D_yellow" and tipo == 2):
		Global.score_rec += 1
		Global.streak += 1
		get_parent().get_node("TimerCloud").update_wait_time()
		get_parent().get_node("VillagerAccept").playing = true
	else:
		get_parent().get_node("VillagerDeny").playing = true
		Global.streak = 0
		get_parent().erros += 1

	get_parent().spawn_lixo()
	queue_free()
	pass # Replace with function body.
