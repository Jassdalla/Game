extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tween = $Tween
var closed : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	closed = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tween.is_active() == true:
		$Button1/CollisionShape2D.disabled = true
		$Button2/CollisionShape2D.disabled = true
		$Button3/CollisionShape2D.disabled = true
		$Button4/CollisionShape2D.disabled = true
	else: 
		$Button1/CollisionShape2D.disabled = false
		$Button2/CollisionShape2D.disabled = false
		$Button3/CollisionShape2D.disabled = false
		$Button4/CollisionShape2D.disabled = false
func _on_Button1_body_entered(body):
	if closed == true:
		tween.interpolate_property($Up_Door, "rotation_degrees", 0, -90, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = false 
	elif closed == false:
		tween.interpolate_property($Up_Door, "rotation_degrees", -90, 0, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = true


func _on_Button2_body_entered(body):
	if closed == true:
		tween.interpolate_property($Up_Door2, "rotation_degrees", 0, -90, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = false 
	elif closed == false:
		tween.interpolate_property($Up_Door2, "rotation_degrees", -90, 0, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = true


func _on_Button3_body_entered(body):
	if closed == true:
		tween.interpolate_property($Up_Door3, "rotation_degrees", 0, 90, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = false 
	elif closed == false:
		tween.interpolate_property($Up_Door3, "rotation_degrees", 90, 0, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = true


func _on_Button4_body_entered(body):
	if closed == true:
		tween.interpolate_property($Up_Door4, "rotation_degrees", 0, -90, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = false 
	elif closed == false:
		tween.interpolate_property($Up_Door4, "rotation_degrees", -90, 0, 2, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
		tween.start()
		closed = true
