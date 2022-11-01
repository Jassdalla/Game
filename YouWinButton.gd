extends Button


func _ready():
	pass


func _on_YouWinButton_pressed():
	get_tree().change_scene("res://TitleMenu.tscn")
