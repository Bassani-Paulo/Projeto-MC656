extends Node2D

@export var speed = 300 # How fast the player will move (pixels/sec).
var tartaruga_height
var tartaruga_width
var visible_rect
var escala = 0.156
var casco_texture: Texture2D
var turtle_texture: Texture2D
enum CONDITION {Normal, Invicible}
var state

@onready var sprite: Sprite2D = $Area2D/Sprite2D

# Called when the player enters the scene for the first time.
func _ready() -> void:
	
	turtle_texture = preload("res://assets/sprites/tartaruga.png")
	casco_texture = preload("res://assets/sprites/casco.png")
	
	sprite.texture = turtle_texture
	
	state = CONDITION.Normal
	tartaruga_height = get_node("Area2D/Sprite2D").texture.get_height() * escala
	tartaruga_width = get_node("Area2D/Sprite2D").texture.get_width() * escala
	visible_rect = get_viewport().get_visible_rect()
	position.x = visible_rect.size.x/2
	position.y = visible_rect.size.y - tartaruga_height/2
	pass

func invicible_state() -> void:
	if (Input.is_action_pressed("special")):
		if( Global.special_bar > 0):
			sprite.texture = casco_texture
			state = CONDITION.Invicible
			Global.special_bar = Global.special_bar - 1
	else:
		state = CONDITION.Normal
		Global.special_bar = Global.special_bar + 0.01
		sprite.texture = turtle_texture
	

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
	invicible_state()
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Area_Lixo" and state == CONDITION.Normal:
		$Eat_canudo.play()
		Global.spawn_rate = 1
		get_parent().get_node("Timer").update_wait_time(area.get_parent())
		get_parent().take_damage()
		area.get_parent().queue_free()
	if area.name == "Area_alga" and state == CONDITION.Normal:
		$Eat_canudo.play()
		Global.spawn_rate = 1
		get_parent().get_node("Timer").update_wait_time_alga(area.get_parent())
		get_parent().recive_health()
		area.get_parent().queue_free()
	pass
