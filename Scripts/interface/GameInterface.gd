extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemies
var enemyCount

# Called when the node enters the scene tree for the first time.
func _ready():
	enemies = get_tree().get_nodes_in_group("Pnj")
	enemyCount = enemies.size()
	print(enemyCount)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
