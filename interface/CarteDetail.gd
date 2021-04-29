extends NinePatchRect

func _ready():
	for i in GameManager.hand_player_new:
		var new_card = load("res://Classes/Cards/Card_"+i+".gd")
		get_node("GridCart").add_child(new_card.new())
#		else:
#			get_node("GridCart").add_child(Card.new(i))
