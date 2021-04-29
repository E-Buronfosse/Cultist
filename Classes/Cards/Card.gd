extends TextureButton

class_name Card

var title : String
var texture : Resource

func _ready():
	pass
	
	
func _init(title := "Default"):
	self.title = title
	self.texture = load("res://Assets/Graphics/Cards/"+title+".jpg")
	set_normal_texture(texture)
	set_expand(true)
	set_stretch_mode(self.STRETCH_KEEP_ASPECT)
	set_h_size_flags(3)
	set_v_size_flags(3)
	
func change_cursor():
	Input.set_custom_mouse_cursor(GameManager.cursor_target)
	
func clicked():
	GameManager.clicked_card_name = self.title
	GameManager.clicked = true
	
func _pressed():
	print(self.title)
