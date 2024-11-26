extends Node2D

@export var speed = 100 # Como rápido o canudo irá cair (pixels/seg).
var canudo_height
var canudo_width
var visible_rect
var scale_x
var scale_y

# Chamado quando o jogador entra na cena pela primeira vez.
func _ready() -> void:
	Global.spawn_rate += 1
	get_parent().get_node("Timer").update_wait_time(self)

	inicializar_dimensões()
	set_posiçãoAleatoria()

# Função para inicializar as dimensões do canudo
func inicializar_dimensões() -> void:
	scale_x = get_node("Sprite2D").scale.x
	scale_y = get_node("Sprite2D").scale.y
	canudo_height = get_node("Sprite2D").texture.get_height() * scale_y
	canudo_width = get_node("Sprite2D").texture.get_width() * scale_x
	print(canudo_height)
	print(canudo_width)
	visible_rect = get_viewport().get_visible_rect()

# Função para definir a posição aleatória do canudo
func set_posiçãoAleatoria() -> void:
	position.x = randf_range(canudo_width / 2, visible_rect.size.x - canudo_width / 2)
	position.y = -canudo_height

# Chamado a cada quadro. 'delta' é o tempo decorrido desde o quadro anterior.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # Vetor de movimento do canudo.
	
	# Movimento do canudo
	velocity.y += speed
	position += velocity * delta

	# Se o canudo sair da tela, será removido
	if position.y >= visible_rect.size.y + canudo_height / 2:
		queue_free()
