extends Node2D
@export var erros = 0

var Singleton = Global.get_instance()
var dy = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Erros_label.position.y = 0
	$Score_label.position.y = 20
	
	ajusta_posicao(get_node("Papel"), get_node("blue"))
	ajusta_posicao(get_node("Vidro"), get_node("green"))
	ajusta_posicao(get_node("Metal"), get_node("yellow"))
	ajusta_posicao(get_node("Plástico"), get_node("red"))
	pass # Replace with function body.

func ajusta_posicao(label : Label, reference : Node2D) -> void:
	var scale_ref = reference.scale.x
	
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.position.x = reference.position.x + (reference.texture.get_width()*scale_ref - label.size.x)/2
	label.position.y = reference.position.y + reference.texture.get_height()*scale_ref - label.size.y + dy
	pass

func spawn_lixo() -> void:
	Singleton.add_scene("res://scenes/Reciclagem/Lixo.tscn", self)
	pass
	
func spawn_cloud() -> void:
	Singleton.add_scene("res://scenes/Reciclagem/Cloud.tscn", self)
	pass

func check_game_over() -> void:
	if erros >= 10:
		Global.max_score_reciclagem = max(Global.max_score_reciclagem, Global.score_rec)
		Global.score_rec = 0
		Singleton.change_scene("res://scenes/Reciclagem/GameOver2.tscn")
	if Global.score_rec >= 50:
		Global.max_score_reciclagem = Global.score_rec
		Global.score_rec = 0
		Singleton.change_scene("res://scenes/Reciclagem/Vitoria.tscn")

# Utility function to update the HP Label (use signal or direct reference to HUD)
func update_labels():
	$Erros_label.text = "Erros: " + str(erros) + " / 10"
	$Score_label.text = "Score: " + str(Global.score_rec)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	check_game_over()
	update_labels()
	pass
