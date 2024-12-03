extends Button

func _ready():
	$TextureRect.hide()  # Garante que a imagem esteja oculta no início.

func _on_mouse_entered():
	$TextureRect.show()  # Mostra a imagem ao passar o mouse.

func _on_mouse_exited():
	$TextureRect.hide()  # Esconde a imagem ao sair do botão.
