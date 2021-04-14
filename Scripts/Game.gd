extends Control


func _ready():
	for i in GameManager.deck:
		get_node("Grid").add_child(Card.new(i, "tata"))
	
	
