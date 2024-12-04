extends Control

var path_main_menu = "res://scenes/ui/Main menu.tscn"
var Singleton = Global.get_instance()
var r : float
var g : float
var b : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Winn.play()
	pass
	
func change_color() -> void:
	print("echo")
	var r = randf_range(64/255, 192/255)
	var g = randf_range(64/255, 192/255)
	var b = randf_range(64/255, 192/255)
	print(Vector3(r, g, b))
	$ColorRect.color = Color(r, g, b, 1)

func _on_jogar_novamente_pressed() -> void:
	Singleton.go_back()
	pass

func _on_voltar_ao_menu_pressed() -> void:
	Singleton.change_scene(path_main_menu)
	pass
