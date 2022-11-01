extends Node2D


onready var Tiles = get_parent().get_node("TileInvisible")
onready var BlockTimer = get_parent().get_node("BlockTimer")
onready var Blocks = get_children()
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_body_entered(body):
	if BlockTimer.is_stopped():
		BlockTimer.start() # Replace with function body.


func _on_BlockTimer_timeout():
	for Block in  Blocks:
		if Block.is_visible():
			var BlockPosition = Block.get_transform().origin/Vector2(32,32)
			Block.set_visible(false)
			Tiles.set_cell(BlockPosition.x, BlockPosition.y,0)
			Tiles.update_bitmask_area(BlockPosition)
			break # Replace with function body.
