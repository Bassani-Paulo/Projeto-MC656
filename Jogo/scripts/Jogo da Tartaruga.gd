extends Node2D

const max_hp: int = 3
var player_hp: int = max_hp

signal life_changed(player_hearts)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect( "life_changed", Callable(get_node("HP/Life"),"on_player_life_changed") )
	emit_signal("life_changed", max_hp)
	player_hp = max_hp
	pass

# Function to handle taking damage
func take_damage(damage = 1):
	player_hp -= damage
	emit_signal("life_changed", player_hp)
	if player_hp <= 0:
		player_hp = 0
		game_over()

# Function to handle the game over condition
func game_over():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
