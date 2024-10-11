extends GutTest

# This instantiation allows us to use global variables across different scripts
var Player_Script = load("res://scripts/Player.gd").new()
var elapsed_time = 2.88

var width
var player
var lixo
var double_jogo

func before_each():
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	
	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)
	
	width = get_viewport().get_visible_rect().size.x

func test_moves_left():
	# Simulates holding down the left arrow key for a couple of frames
	Player_Script.test_pressed_left = 1
	player._process(elapsed_time) 
	Player_Script.test_pressed_left = 0

	assert_lt(int(player.position.x), int(width/2), "Player should have moved left.")
	
func test_moves_right():
	# Simulates holding down the right arrow key for a couple of frames
	Player_Script.test_pressed_right = 1
	player._process(elapsed_time) 
	Player_Script.test_pressed_right = 0

	assert_gt(int(player.position.x), int(width/2), "Player should have moved right.")

func test_out_of_bounds_left():
	# Simulates holding down the left arrow key for a couple of frames
	Player_Script.test_pressed_left = 1
	player._process(2 * elapsed_time) # Enough time for the player to supposedly exceed the bounds of the visible rectangle
	Player_Script.test_pressed_left = 0

	assert_lt(int(player.position.x), int(width), "Player is out of bounds on the left side.")
	
func test_out_of_bounds_right():
	# Simulates holding down the right arrow key for a couple of frames
	Player_Script.test_pressed_right = 1
	player._process(2 * elapsed_time) # Enough time for the player to supposedly exceed the bounds of the visible rectangle
	Player_Script.test_pressed_right = 0

	assert_gt(int(player.position.x), int(0), "Player is out of bounds on the right side.")
