extends KinematicBody2D

#var is_moving_right = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = 100
const FLOOR = Vector2(0, 1)
const GRAVITY = 10
var velocity = Vector2(0,0)
export var direction = 1
var is_dead = false
export(int) var hp = 1
 
func _physics_process(delta):
	#if is_dead == false:
	velocity.x = SPEED * direction
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("walk")
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	
	#if is_on_wall():
	#	direction = direction * -1
	#	$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
#func dead():
#	is_dead = true
#	velocity = Vector2(0,0)
#	$AnimatedSprite.play("dead")
## Called when the node enters the scene tree for the first time.
#func _ready():
#	$AnimatedSprite.play("walk")
#func _process(delta):
#	if $AnimatedSprite.play ("attack"):
#		return
#	move_character()
#	detect_turn_around()
#func move_character():
#	velocity.x = speed if is_moving_right else -speed
#	velocity.y += gravity
#	velocity = move_and_slide(velocity, Vector2.UP)
#
#func detect_turn_around():
#	if not $RayCast2D.is_colliding() and is_on_floor():
#		is_moving_right = !is_moving_right
#		scale.x = -scale.x
#func hit():
#	$AttackDetector.monitoring = true
#func end_of_hit():
#	$AttackDetector.monitoring = false
#func start_walk():
#	$AnimatedSprite.play("walk")
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass
#
#
#func _on_PlayerDetector_body_entered(body):
#	$AnimatedSprite.play("attack")
#
#
#func _on_AttackDetector_body_entered(body):
#	get_tree().change_scene("res://GameOver.tscn")


func _on_SideChecker_body_entered(body):
	#$AnimatedSprite.play("dead")
	if body.get_collision_layer() == 1:
		body.ouch(position.x)
	if body.get_collision_layer() == 32:
		hp -= 1
		if hp <= 0:
			body.queue_free()
			queue_free()


func _on_Timer_timeout():
	queue_free()
