extends Button

export var start_focused = false
export var reference_path = ""


func _ready():
	if start_focused:
		grab_focus()



func _on_Button_pressed():
	if reference_path != "":
		get_tree().change_scene(reference_path)
	else:
		get_tree().quit()
