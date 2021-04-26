extends Node2D

func _ready():
	for i in GameManager.deck:
		if i == "1-3":
			get_node("Camera2D/Control/GridContainer").add_child(Card_kill.new(i, "toto"))
		else:
			get_node("Camera2D/Control/GridContainer").add_child(Card.new(i, "tata"))

#func _input(event):
#	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
#		print("lol it works")
