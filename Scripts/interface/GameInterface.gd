extends Node2D


var enemies
var enemyCount

func _ready():
	enemies = get_tree().get_nodes_in_group("Pnj")
	enemyCount = enemies.size()


