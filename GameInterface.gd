extends Node2D

func _ready():
	for i in GameManager.deck:
		if i == "1-3":
			get_node("Footer_interface/ColorRect/Grid").add_child(Card_kill.new(i, "toto"))
		elif i == "1-2":
			get_node("Footer_interface/ColorRect/Grid").add_child(Card_increase_fear.new(i, "toto"))
		else:
			get_node("Footer_interface/ColorRect/Grid").add_child(Card.new(i, "tata"))

func _process(delta):
	if GameManager.team.size() <= 0:
		print("La partie est terminée")
