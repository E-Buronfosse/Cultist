extends Card

class_name Card_Reaper_Time

func _init().("Reaper_Time"):
	pass

func _ready():
	pass 
	
func _pressed():
	change_cursor()
	clicked()
	print(self.title)
	print(GameManager.clicked_card_name)
	print(GameManager.clicked)
