extends Area2D

func _ready():
	pass


func _on_Poissonerie_body_entered(body):
#	var char_entered = get_node(body)
#	body.path[1] = [(423, 222)]
	body.close_position = Vector2(424, 222)
	print(body.path[0])
	print(body.path[1])
