extends Node2D

var path_game_over = "res://scenes/Tartaruga/GameOver.tscn"
var path_canudo = "res://scenes/Tartaruga/Lixo.tscn"
var path_alga = "res://scenes/Tartaruga/alga.tscn"

const max_hp: int = 7
var player_hp: int = 3
var time: int = 0

signal life_changed(player_hearts)

var Singleton = Global.get_instance()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.spawn_rate = 1
	Global.spawn_rate_alga = 0.5
	
	player_hp = 3
	connect( "life_changed", Callable(get_node("HP/Life"),"on_player_life_changed") )
	emit_signal("life_changed", player_hp)
	pass

# Function to handle taking damage
func take_damage(damage = 1):
	reduce_health(damage)
	time -= 600
	time = max(time, 0)
	
# Function to handle receiving health
func receive_health(damage = -1):
	reduce_health(damage)

# Reduce the player's health
func reduce_health(damage: int) -> void:
	player_hp -= damage
	player_hp = min(max_hp, player_hp) # Max player hp is 7
	emit_signal("life_changed", player_hp)
	check_game_over()
	if player_hp < 0:
		player_hp = 0

# Check if the game is over
func check_game_over() -> void:
	if player_hp <= 0:
		game_over()

# Update UI elements
func update_ui() -> void:
	update_score_label()

# Function to handle the game over condition
func game_over():
	if(time > Global.max_score):
		Global.max_score = time
	if not Global.testing:
		Singleton.change_scene(path_game_over)
	pass

# Utility function to update the HP Label (use signal or direct reference to HUD)
func update_score_label():
	time = time + 1
	$Score_label.text = "Score: " + str(time)

func spawn_canudo() -> void:
	Singleton.add_scene(path_canudo, self)
	pass
	
func spawn_alga() -> void:
	Singleton.add_scene(path_alga, self)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$"Barra especial".value = get_node("Player").shell_charge
	update_ui()
	pass
