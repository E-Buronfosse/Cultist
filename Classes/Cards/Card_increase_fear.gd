extends Card

class_name Card_increase_fear

func _ready():
	pass
	
func _init(title, description).(title, description):
	self.title = title
	self.description = description
	self.picture = load("res://Assets/Cards/Pictures/Characters/card-" + title + ".png")
	set_normal_texture(picture)

func _pressed():
	GameManager.clicked_increase_fear = true
	GameManager.clicked_card_name = self.title
	Input.set_custom_mouse_cursor(GameManager.cursor_target)
#	var bonhomme = get_tree().get_current_scene().get_node("Map/Level_navigation/Town_folk_man")
#	if bonhomme != null:
#		bonhomme.queue_free()
