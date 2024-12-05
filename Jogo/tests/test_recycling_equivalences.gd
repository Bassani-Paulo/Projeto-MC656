extends GutTest

var visible_rect 
var jogo
var lixo

func before_each():
	visible_rect = get_viewport().get_visible_rect().size
	jogo = double(load("res://scenes/Reciclagem/Jogo.tscn")).instantiate()
	lixo = load("res://scenes/Reciclagem/Lixo.tscn")
	
	add_child(jogo)
	
func test_paper_blue_equivalence():
	var answer = true
	var inicial = Global.streak
	
	var instance5 = lixo.instantiate()
	jogo.add_child(instance5)
	instance5.tipo = 0
	instance5.get_node("Area2D").emit_signal("area_entered", jogo.get_node("blue").get_node("Area2D_blue"))
	if Global.streak - inicial != 1:
		answer = false
	assert_eq(answer, true)

func test_glass_green_equivalence():
	var answer = true
	var inicial = Global.streak
	
	var instance6 = lixo.instantiate()
	jogo.add_child(instance6)
	instance6.tipo = 1
	instance6.get_node("Area2D").emit_signal("area_entered", jogo.get_node("green").get_node("Area2D_green"))
	if Global.streak - inicial != 1:
		answer = false
	assert_eq(answer, true)
	
func test_red_plastic_equivalence():
	var answer = true
	var inicial = Global.streak
	
	var instance7 = lixo.instantiate()
	jogo.add_child(instance7)
	instance7.tipo = 3
	instance7.get_node("Area2D").emit_signal("area_entered", jogo.get_node("red").get_node("Area2D_red"))
	if Global.streak - inicial != 1:
		answer = false
	assert_eq(answer, true)
	
func test_metal_yellow_equivalence():
	var answer = true
	var inicial = Global.streak
	
	var instance8 = lixo.instantiate()
	jogo.add_child(instance8)
	instance8.tipo = 2
	instance8.get_node("Area2D").emit_signal("area_entered", jogo.get_node("yellow").get_node("Area2D_yellow"))
	if Global.streak - inicial != 1:
		answer = false
	assert_eq(answer, true)
