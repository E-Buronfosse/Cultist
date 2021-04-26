extends Node2D

func _ready():
	for i in GameManager.deck:
		get_node("Footer_interface/ColorRect/Grid").add_child(Card.new(i, "kill"))

#func _input(event):
#	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
#		print("lol it works")
