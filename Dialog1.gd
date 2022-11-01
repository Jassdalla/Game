extends Control


var dialog = [
	'Mate, you are stuffed!!!',
	'Welcome to the Dangerous Pie-LAND',
	'You are on a mission to collect all the pies on this pie-LAND',
	'Hold on!!! It is not that easy...',
	'You have to destroy all the enemies',
	'and pass all the hurdles to get your boring life back.',
	'Do not forget about the CAVE man...',
	'GOOD LUCK...'
]
var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _physics_process(delta):
	$"Ind".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
