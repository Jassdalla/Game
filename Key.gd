extends Node2D

var velocity = Vector2(0,0)
var followingPlayer = false
var pickedUp = false

func _ready():
	if self.name in Global.key_found:
		queue_free()
		#print(Global.key_found)
func _on_Area2D_body_entered(body):
	Global.key_found.append(self.name)
	queue_free()
