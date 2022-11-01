extends KinematicBody2D

var velocity = Vector2()
var direction = -1
const SPEED = 400
#const GRAVITY = 22 all#is to make the fireball bounce on the ground
#const BOUNCE = -300


func _ready():
	if direction ==1:
		$Sprite.flip_h = false
		velocity.x = SPEED * direction
	elif direction == -1:
		$Sprite.flip_h = true
		velocity.x = SPEED * direction	
func _physics_process(delta):
	#velocity.y += GRAVITY
	
	if is_on_wall():
		queue_free()
#	if is_on_floor():
#		velocity.y = BOUNCE
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Timer_timeout():
	$AudioStreamPlayer.play()

