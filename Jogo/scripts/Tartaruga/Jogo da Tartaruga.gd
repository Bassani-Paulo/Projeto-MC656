extends Node2D

var scene_canudo = load("res://scenes/Tartaruga/Lixo.tscn")

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
	reduce_health(damage)
	update_ui()

# Reduce the player's health
func reduce_health(damage: int) -> void:
	player_hp -= damage
	emit_signal("life_changed", player_hp)
	check_game_over()
	if player_hp < 0:
		player_hp = 0

# Check if the game is over
func check_game_over() -> void:
	if player_hp == 0:
		game_over()

# Update UI elements
func update_ui() -> void:
	update_hp_label()

# Function to handle the game over condition
func game_over():
	SceneManager.go_back()
	pass

# Utility function to update the HP Label (use signal or direct reference to HUD)
func update_hp_label():
	$Hp_label.text = "HP: " + str(player_hp) + "/" + str(max_hp)

func spawn_canudo() -> void:
	var instance_canudo = scene_canudo.instantiate()
	add_child(instance_canudo)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
