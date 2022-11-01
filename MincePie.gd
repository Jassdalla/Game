extends Area2D


signal pie_collected

func _on_MincePie_body_entered(body):
	$AnimationPlayer.play("bounce") # Replace with function body. # Replace with function body.
	emit_signal("pie_collected")
	set_collision_mask_bit(0, false)
	$SoundPieCollect.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free() # Replace with function body.
