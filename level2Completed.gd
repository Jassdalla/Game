extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Dag":
			get_tree().change_scene("res://YouWin.tscn")
