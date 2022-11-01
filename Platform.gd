tool
extends Node2D

export var duration : float = 1
export var move_from : Vector2 = Vector2.ZERO
export var move_to : Vector2 = Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var line : Tween = $Debug_Line
onready var base : Node2D = $Platform_Base
onready var tween : Tween = $Platform_Base/Tween

var direction_forward = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if !Engine.is_editor_hint():
		set_tween(move_from, move_to)
	 # Replace with function body.
func _process(delta):
	if Engine.is_editor_hint():
		update()
		
#func _draw():
#	if Engine.is_editor_hint():
#		if line:
#			draw_line(line.position + move_from, line.position + move_to, Color.lime, 2)
	
	
func set_tween(from, to):
	tween.interpolate_property(base, "position", from, to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	if direction_forward:
		set_tween(move_from, move_to)
	else:
		set_tween(move_to, move_from)
	direction_forward = ! direction_forward# Replace with function body.


func _on_Platform_ready():
	pass # Replace with function body.
