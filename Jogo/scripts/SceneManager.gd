extends Node
class_name Scene_Manager # Cria a classe do Singleton

var current_scene : String # Armazena o path da cena atual
var previous_scene : String # Armazena o path da cena anterior (para poder voltar, se necessário)
var instanced_scene

var path_main_menu = "res://scenes/ui/Main menu.tscn"

var instance : Scene_Manager = self # Singleton: A única instância da classe

func _ready() -> void:
	get_tree().change_scene_to_file(path_main_menu)
	current_scene = path_main_menu
	pass

# Método para mudar de cena
func change_scene(scene_path: String): 
	# Descarrega a cena atual, se existir
	if current_scene:
		previous_scene = current_scene
	
	# Adiciona a nova cena à árvore de cenas
	get_tree().change_scene_to_file(scene_path)
	current_scene = scene_path

# Método para instanciar outra cena sobre uma cena existente
func add_scene(scene_path: String, background_scene: Node):
	# Se existe a cena de "background"
	if background_scene:
		instanced_scene = load(scene_path).instantiate()
		background_scene.add_child(instanced_scene)

# Método para voltar à cena anterior
func go_back():
	if previous_scene:
		get_tree().change_scene_to_file(previous_scene)
		
		var temp = current_scene
		current_scene = previous_scene
		previous_scene = temp
	
#Método para recarregar a cena atual
func refresh():
	if current_scene:
		change_scene(current_scene)
	pass
	
# Método para sair do jogo	
func exit_game():
	get_tree().quit()
