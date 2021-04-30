extends Card

class_name Card_Conversion

func _init().("Conversion"):
	pass

func _ready():
	pass 
	
func _pressed():
	change_cursor()
	clicked()
	print("je convertis gaiement")
	print(GameManager.clicked_card_name)
	print(GameManager.clicked)
