extends Card

class_name Card_kill

func _ready():
	pass # Replace with function body.
	
func _init(title, description).(title, description):
	self.title = title
	self.description = description
	self.picture = load("res://Assets/Cards/Pictures/Characters/card-" + title + ".png")
	set_normal_texture(picture)

func _pressed():
	var bonhomme = get_tree().get_current_scene().get_node("Map/Town_folk_man")
#	var bonhomme = get_node(current_scene)
#	print(current_scene)
	if bonhomme != null:
		bonhomme.queue_free()
