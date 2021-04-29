extends Card

class_name Card_Intimidation

func _init().("Intimidation"):
	pass

func _ready():
	pass 
	
func _pressed():
	change_cursor()
	clicked()
	print("intimidé")
