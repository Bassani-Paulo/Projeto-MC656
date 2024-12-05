extends GutTest

var visible_rect 
var jogo
var lixo

func before_each():
	visible_rect = get_viewport().get_visible_rect().size
	jogo = double(load("res://scenes/Reciclagem/Jogo.tscn")).instantiate()
	lixo = load("res://scenes/Reciclagem/Lixo.tscn")
	
	add_child(jogo)

func test_move_left():
	var instance1 = lixo.instantiate()
	jogo.add_child(instance1)
	# Simulates holding down the left arrow key for a couple of frames
	Input.action_press("move_left")
	instance1._process(5)
	Input.action_release("move_left")
	
	assert_lt(instance1.position.x, visible_rect.x/2, "Player should have moved left.")
	
func test_move_right():
	var instance2 = lixo.instantiate()
	jogo.add_child(instance2)
	# Simulates holding down the right arrow key for a couple of frames
	Input.action_press("move_right")
	instance2._process(5)
	Input.action_release("move_right")
	
	assert_gt(instance2.position.x, visible_rect.x/2, "Player should have moved right.")
	
func test_move_down():
	var instance3 = lixo.instantiate()
	jogo.add_child(instance3)
	
	var x1 = instance3.position.y
	instance3._process(0.5)
	var x2 = instance3.position.y
	# Simulates holding down the left arrow key for a couple of frames
	Input.action_press("move_down")
	instance3._process(0.5)
	var x3 = instance3.position.y
	Input.action_release("move_down")
	
	assert_gt(x3-x2, x2-x1, "Player should have accelerated downward.")
	
func test_removed_on_collision():
	var instance4 = lixo.instantiate()
	jogo.add_child(instance4)
	# Simulates the recycling material colliding with a trash can
	instance4.get_node("Area2D").emit_signal("area_entered", jogo.get_node("blue").get_node("Area2D_blue"))
	await wait_frames(2)
	assert_eq(is_instance_valid(instance4), false)
