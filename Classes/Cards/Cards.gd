extends TextureButton

class_name Card

var id
var title
var desc
var picture
#var back 

func _ready():
	set_expand(true)
	set_stretch_mode(self.STRETCH_KEEP_ASPECT)
	set_h_size_flags(3)
	set_v_size_flags(3)
#	self.set_custom_minimum_size(Vector2(70, 95))
	
	
func _init(id, title):
	self.id = id
	self.title = title
	self.picture = load("res://Assets/Cards/Pictures/Characters/card-" + title + ".png")
	set_normal_texture(picture)
	
func _pressed():
	Server.FetchCardEffect(id, get_instance_id())

func SetEffect(s_effect):
	self.desc = s_effect
	print("Effet " + self.desc)
