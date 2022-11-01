extends StaticBody2D


func _on_Area2D_body_entered(body):
	if self.name in Global.key_found:
		$AnimatedPlayer.play("Open")
		yield($AnimatedPlayer, "animation_finished")
		queue_free()
	if not self.name in Global.key_found:
		$AnimationPlayer.play("Close")
