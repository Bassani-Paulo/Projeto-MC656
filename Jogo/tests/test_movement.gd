extends GutTest

# This instantiation allows us to use global variables across different scripts
var Player_Script = load("res://scripts/Tartaruga/Player.gd").new()

var visible_rect_width
var player
var lixo
var double_jogo

func before_each():
	Global.testing = 1

	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	
	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)
	
	visible_rect_width = get_viewport().get_visible_rect().size.x

func test_moves_left():
	# Simulates holding down the left arrow key for a couple of frames
	Input.action_press("move_left")
	player._process(1) # 1 second pressing down the left arrow key 
	Input.action_release("move_left")

	assert_lt(int(player.position.x), int(visible_rect_width/2), "Player should have moved left.")
	
func test_moves_right():
	# Simulates holding down the right arrow key for a couple of frames
	Input.action_press("move_right")
	player._process(1) # 1 second pressing down the right arrow key 
	Input.action_release("move_right")

	assert_gt(int(player.position.x), int(visible_rect_width/2), "Player should have moved right.")

func test_out_of_bounds_left():
	# Simulates holding down the left arrow key for a couple of frames
	Input.action_press("move_left")
	player._process(6) # Enough time for the player to supposedly exceed the bounds of the visible rectangle
	Input.action_release("move_left")

	assert_gt(int(player.position.x), int(0), "Player is out of bounds on the left side.")
	
func test_out_of_bounds_right():
	# Simulates holding down the right arrow key for a couple of frames
	Input.action_press("move_right")
	player._process(6) # Enough time for the player to supposedly exceed the bounds of the visible rectangle
	Input.action_release("move_right")

	assert_lt(int(player.position.x), int(visible_rect_width), "Player is out of bounds on the right side.")
