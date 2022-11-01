extends KinematicBody2D

enum States {AIR = 1, FLOOR, LADDER, WALL}
var state = States.AIR
var pies = 0
var direction = 1
var last_jump_direction = 0
var velocity = Vector2(0,0)
var hurt := 0
const SPEED = 180
const RUNSPEED = 400
const GRAVITY = 30
const JUMP = -800
const FIREBALL = preload("res://Fireball.tscn")




func _physics_process(delta):
	
	match state:
		#----AIR enum state----------------- 
		States.AIR:
			if is_on_floor():
				last_jump_direction = 0
				state = States.FLOOR
				continue
			elif is_near_wall():
				state = States.WALL
				continue
			$Sprite.play("jump")
			if Input.is_action_pressed("right"):
				velocity.x = lerp(velocity.x, SPEED, 0.1) if velocity.x < SPEED else lerp(velocity.x, SPEED, 0.03)
				$Sprite.flip_h = false
			elif Input.is_action_pressed("left"):
				velocity.x = lerp(velocity.x, -SPEED, 0.1) if velocity.x > SPEED else lerp(velocity.x, -SPEED, 0.03)
				$Sprite.flip_h = true
			else: 
				velocity.x = lerp(velocity.x,0,0.5)
			set_direction()
			move_and_fall(false)
			fire()
		#---FLOOR enum state----------------------------------------
		States.FLOOR:
			if not is_on_floor():
				state = States.AIR
			if Input.is_action_pressed("right"):
				if Input. is_action_pressed("sprint"):
					velocity.x = lerp(velocity.x,RUNSPEED,0.1)
					$Sprite.set_speed_scale(1.8)
				else:
					velocity.x = lerp(velocity.x,SPEED,0.1)
					$Sprite.set_speed_scale(1.0)
				$Sprite.play("run")
				$Sprite.flip_h = false
			elif Input.is_action_pressed("left"):
				if Input. is_action_pressed("sprint"):
					velocity.x = lerp(velocity.x,-RUNSPEED,0.1)
					$Sprite.set_speed_scale(1.8)
				else:
					velocity.x = lerp(velocity.x,-SPEED,0.1)
					$Sprite.set_speed_scale(1.0)
				$Sprite.play("run")
				$Sprite.flip_h = true
			else: 
				$Sprite.play("idle")
				velocity.x = lerp(velocity.x,0,0.5)
			if Input.is_action_just_pressed("jump"):
				velocity.y = JUMP
				$SoundJump.play()
				state = States.AIR
			set_direction()
			move_and_fall(false)
			fire()
	#-------state for wall------------------------------------------
		States.WALL:
			if is_on_floor():
				last_jump_direction = 0
				state = States.FLOOR
				continue
			elif not is_near_wall():
				state = States.AIR
				continue
			$Sprite.play("jump")
			if direction != last_jump_direction and Input.is_action_pressed("jump") and ((Input.is_action_pressed("left") and direction == 1) or (Input.is_action_pressed("right") and direction == -1)):
				last_jump_direction = direction
				velocity.x = 400 * -direction
				velocity.y = JUMP * 0.7
				$SoundJump.play()
				state = States.AIR
			move_and_fall(true)
	
func move_and_fall(slow_fall: bool):
	velocity.y = velocity.y + GRAVITY
	if slow_fall:
		velocity.y = clamp(velocity.y, JUMP, 200)
	velocity = move_and_slide(velocity, Vector2.UP)
	
#----to set direction while on the wall for wallchecker ray----
func set_direction():
	direction = 1 if not $Sprite.flip_h  else -1
	$Wallchecker.rotation_degrees = 90 * -direction
#----------------climbing walls------------
func is_near_wall():
	return $Wallchecker.is_colliding()

#---Fire function for fire ball-------------------
func fire():
	if Input.is_action_just_pressed("fire") and not is_near_wall() and hurt ==0:
		$Sprite.play("fire")
		var direction = 1 if not $Sprite.flip_h  else -1
		var firee = FIREBALL.instance() 
		firee.direction = direction
		get_parent().add_child(firee)
		firee.position.y = position.y
		firee.position.x = position.x + 10 * direction




func _on_Area2D_body_entered(body):
	Global.lose_life() # Replace with function body.
	if Global.lives >= 1:
		get_tree().reload_current_scene()
func _on_Area2D2_body_entered(body):
	Global.lose_life()
	
func bounce():
	velocity.y = JUMP * 0.7
	
func ouch(var enemyposx):
	Global.lose_life()
	velocity.y = JUMP * 0.5
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
	Input.action_release("left")
	Input.action_release("right")
	set_modulate(Color(10,10,10,0.9))
	set_collision_layer_bit(0, false)
	hurt = 20
	$Timer.start()

func _on_Timer_timeout():
	hurt -= 1
	if hurt ==0:
		$Timer.stop()
		set_modulate(Color(1,1,1,1))
		set_collision_layer_bit(0, true)
	else:
		set_modulate(Color(10,10,10,0.9) if hurt % 2 == 0 else Color(1,0.3,0.3,0.7) )



func _on_Area2D_area_entered(area):
	if area.is_in_group("Portal"):
		position.x = 80
		position.y = 1400


func _on_floor_body_entered(body):
	pass # Replace with function body.


func _on_RigidBody2D_body_entered(body):
	pass # Replace with function body.


func _on_Area2D3_body_entered(body):
	Global.lose_life() # Replace with function body.
	if Global.lives >= 1:
		get_tree().reload_current_scene()


func _on_Spike2_body_entered(body):
	Global.lose_life() # Replace with function body.
	if Global.lives >= 1:
		get_tree().reload_current_scene()


func _on_Area2D6_body_entered(body):
	Global.lose_life() # Replace with function body.
	if Global.lives >= 1:
		get_tree().reload_current_scene()


func _on_Area2D7_body_entered(body):
	Global.lose_life() # Replace with function body.
	if Global.lives >= 1:
		get_tree().reload_current_scene()

func _on_Area2D8_body_entered(body):
	Global.lose_life() # Replace with function body.
	if Global.lives >= 1:
		get_tree().reload_current_scene()
