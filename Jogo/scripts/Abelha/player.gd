extends Node2D

const wing_ajustment = 36
var visible_rect_size = Vector2(800, 600)
var bee_height:float
var bee_width:float
enum Stance {FLY, ATTACK}
var stance = Stance.FLY
var speed_state
const MAXSPEED = 3
var fly_sprite = load("res://assets/sprites/bee.png")
var attack_sprite = load("res://assets/sprites/attack_bee.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bee_height = get_node("Sprite2D").texture.get_height()
	bee_width = get_node("Sprite2D").texture.get_width()
	if get_viewport().get_visible_rect().size != Vector2.ZERO:
		visible_rect_size = get_viewport().get_visible_rect().size
	
	speed_state = 1
	
	position.y = visible_rect_size.y/2
	update_x_position()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = get_viewport().get_mouse_position().y
	position.y = clamp(position.y, bee_height/2 - wing_ajustment, visible_rect_size.y - bee_height/2)
	pass

func update_x_position():
	position.x = (1+2*speed_state)*bee_width/2

func update_sprite():
	if stance == Stance.FLY:
		$Sprite2D.texture = fly_sprite
	if stance == Stance.ATTACK:
		$Sprite2D.texture = attack_sprite

func accelerate():
	if speed_state<MAXSPEED:
		speed_state+=1
		update_x_position()
	
func decelerate():
	if speed_state>0:
		speed_state-=1
		update_x_position()
	else:
		game_over()

func game_over():
	pass
	
func _input(event):
	if event.is_action_pressed("to_attack_stance"):
		stance = Stance.ATTACK
		update_sprite()
	if event.is_action_released("to_attack_stance"):
		stance = Stance.FLY
		update_sprite()
