extends Node

static var instance : SceneManager = null # Singleton: A instância única da classe

var current_scene : String # Armazena o path da cena atual
var previous_scene : String # Armazena o path da cena anterior (para poder voltar, se necessário)

# Inicialização do Singleton
func _ready():
	if instance == null:
		instance = self
		start_main_menu()
	else:
		queue_free()  # Se já houver uma instância, destrua esta

# Entrando na cena do Menu Principal
func start_main_menu():
	var main_menu_path = "res://scenes/ui/Main menu.tscn"
	get_tree().change_scene_to_file(main_menu_path)
	current_scene = main_menu_path

# Método para mudar de cena
func change_scene(scene_path: String): 
	# Descarrega a cena atual, se existir
	if current_scene:
		previous_scene = current_scene
	
	# Adiciona a nova cena à árvore de cenas
	get_tree().change_scene_to_file(scene_path)
	current_scene = scene_path

# Método para voltar à cena anterior
func go_back():
	if previous_scene:
		get_tree().change_scene_to_file(previous_scene)
	
# Método para sair do jogo	
func exit_game():
	get_tree().quit()