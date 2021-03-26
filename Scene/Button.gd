extends StaticBody2D

func _ready():
	pass 

func _process(delta):
	pass
			
			
func _input(event):
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
		var player_vars = get_node("/root/NPC")
		var root = get_tree().get_root()
		print(root)
		print(player_vars)
	"""elif event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)"""

   # Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport_rect().size)
