extends Area2D

var can_interact = false
const DIALOG = preload("res://Control1.tscn")

func _physics_process(delta):
	pass
	
		
func _input(event):
	if Input.is_key_pressed(KEY_E) and can_interact == true:
		$Label.visible = false
		var dialog = DIALOG.instance()
		get_parent().add_child(dialog)



func _on_NPC1_body_entered(body):
	if body.name == "Dag":
		$Label.visible = true
		can_interact = true


func _on_NPC1_body_exited(body):
	if body.name == "Dag":
		$Label.visible = false
		can_interact = false
