extends RichTextLabel

func _ready():
	self.bbcode_enabled = true
	self.bbcode_text = "Conheça o Projeto Tamar: [url=https://www.tamar.org.br/index.php]tamar.org.br[/url]"

func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(meta)
