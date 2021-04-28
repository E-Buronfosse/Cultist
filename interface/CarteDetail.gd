extends NinePatchRect

func _ready():
	for i in GameManager.deck:
		if i == "1-3":
			get_node("GridCart").add_child(Card_kill.new(i, "toto"))
		else:
			get_node("GridCart").add_child(Card.new(i, "tata"))
