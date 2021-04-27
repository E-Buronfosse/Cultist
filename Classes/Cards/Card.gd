extends TextureButton

class_name Card

var title
var description
var picture

func _ready():
	set_expand(true)
	set_stretch_mode(self.STRETCH_KEEP_ASPECT)
	set_h_size_flags(3)
	set_v_size_flags(3)
	
	
func _init(title, description):
	self.title = title
	self.description = description
	self.picture = load("res://Assets/Cards/Pictures/Characters/card-" + title + ".png")
	set_normal_texture(picture)
	
func _pressed():
	print(self.title)
