extends Node
class_name Scene_Manager # Cria a classe do Singleton

var current_scene : String # Armazena o path da cena atual
var previous_scene : String # Armazena o path da cena anterior (para poder voltar, se necessário)
var instanced_scene
var initialized = 0

var path_main_menu = "res://scenes/ui/Main menu.tscn"

var instance: Scene_Manager = self # Singleton: A única instância da classe

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _process(_delta: float) -> void:
	if get_tree() and initialized == 0:
		initialized = 1
		call_deferred("change_scene_deferred", path_main_menu)
	pass

func change_scene(scene_path: String):
	if is_inside_tree(): 
		call_deferred("change_scene_deferred", scene_path)

# Método para mudar de cena
func change_scene_deferred(scene_path: String):
	if is_inside_tree():
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
		call_deferred("add_scene_deferred", scene_path, background_scene)

func add_scene_deferred(scene_path: String, background_scene: Node):
	instanced_scene = load(scene_path).instantiate()
	background_scene.add_child(instanced_scene)
	
# Método para instanciar outra cena sobre uma cena existente, settando sua posição já
func add_scene_custom(scene_path: String, background_scene: Node, position: Vector2, speed: int):
	# Se existe a cena de "background"
	if background_scene:
		call_deferred("add_scene_deferred_custom", scene_path, background_scene, position, speed)

func add_scene_deferred_custom(scene_path: String, background_scene: Node, position: Vector2, speed: int):
	if scene_path:
		instanced_scene = load(scene_path).instantiate()
		if instanced_scene.get("position"):
			instanced_scene.position = position
		if instanced_scene.get("speed_modifier"):
			instanced_scene.speed_modifier = speed
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
