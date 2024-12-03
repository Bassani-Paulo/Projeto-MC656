extends Control

var Singleton = Global.get_instance()

func _on_return_pressed() -> void:
	Singleton.go_back()

# Referências para os Sliders e o AudioStreamPlayer do menu
@export var menu_music_player: AudioStreamPlayer
@export var master_bus: String = "Master"

const CONFIG_FILE = "user://settings.cfg" # Caminho para o arquivo de configurações

func _ready():
	# Conecta os sinais de alteração de valor dos sliders
	$CenterContainer/VBoxContainer/MasterVolumeSlider.value_changed.connect(_on_master_volume_changed)
	
	# Carregar volumes iniciais do arquivo de configuração
	_load_initial_volumes()

func _load_initial_volumes():
	# Carrega os valores salvos (ou padrões) e aplica aos sliders e barramentos
	var master_volume = _load_setting("master_volume", 0.5) # Valor padrão: 0.5 (50%)
	
	# Atualiza os sliders
	$CenterContainer/VBoxContainer/MasterVolumeSlider.value = master_volume * 100
	
	# Atualiza os barramentos de áudio
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(master_bus), linear_to_db(master_volume))

# Callback para o Master Volume
func _on_master_volume_changed(value):
	var linear_value = value / 100 # Converter de 0-100 para 0.0-1.0
	var db_value = linear_to_db(linear_value) # Converter para decibéis
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(master_bus), db_value)
	_save_setting("master_volume", linear_value) # Salvar configuração

# Função para salvar configurações
func _save_setting(key: String, value):
	var config = ConfigFile.new()
	if config.load(CONFIG_FILE) != OK:
		print("Configuração padrão criada.")
	config.set_value("audio", key, value)
	config.save(CONFIG_FILE)

# Função para carregar configurações
func _load_setting(key: String, default_value):
	var config = ConfigFile.new()
	if config.load(CONFIG_FILE) != OK:
		return default_value
	return config.get_value("audio", key, default_value)
