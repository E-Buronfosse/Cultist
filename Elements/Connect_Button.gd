extends Button

export var start_focused = false


func _ready():
	if start_focused:
		grab_focus()


func _on_Button_pressed():
	var ip = get_node("../Address").text
	var port = int(get_node("../Port").text)
	var nick = get_node("../NickName").text
	var is_veteran = get_node("../VetNewButton").is_pressed()
	print(ip + " " + str(port) + " " + nick + " " + str(is_veteran))
	Server.SetInfo(ip, port, nick, is_veteran)
	Server.ConnectToServer()
	pass # Replace with function body.
