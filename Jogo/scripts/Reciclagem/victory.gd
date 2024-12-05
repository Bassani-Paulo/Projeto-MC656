extends Control
@export var elapsed_time = 0

var path_main_menu = "res://scenes/ui/Main menu.tscn"
var Singleton = Global.get_instance()
var r : float
var g : float
var b : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Winn.play()
	change_color()
	display_label()
	pass
	
func change_color() -> void:
	var min_color: float = 64.0/255.0
	var max_color: float = 192.0/255.0
	r = randf_range(min_color, max_color)
	g = randf_range(min_color, max_color)
	b = randf_range(min_color, max_color)
	
	$ColorRect.color = Color(r, g, b, 1)

func _on_jogar_novamente_pressed() -> void:
	Singleton.go_back()
	pass

func _on_voltar_ao_menu_pressed() -> void:
	Singleton.change_scene(path_main_menu)
	pass
	
func display_label() -> void:
	get_node("ColorRect/VBoxContainer/YouWin").text = "Parabéns! Você conseguiu reciclar todo o lixo
Max Score: " + str(Global.max_score_reciclagem)
	
"""
func _process(delta: float) -> void:
	elapsed_time += delta
	if elapsed_time > .25:
		elapsed_time -= .25
		change_color()
"""
