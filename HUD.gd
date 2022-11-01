extends CanvasLayer

var pies = 0
func _ready():
	$Pies.text = String(pies)
	load_hearts()
	Global.hud = self

#func _physics_process(delta):            #this is to restart the game after collecting 3 pies. remove when progressing
	
func _on_pie_collected():
	pies = pies + 1
	_ready()
	if pies == 10:
		get_tree().change_scene("res://YouWin.tscn")
		
func load_hearts():
	$heartsFull.rect_size.x = Global.lives * 53
	$heartsEmpty.rect_size.x = (Global.max_lives - Global.lives) * 53
	$heartsEmpty.rect_position.x = $heartsFull.rect_position.x + $heartsFull.rect_size.x * $heartsFull.rect_scale.x



