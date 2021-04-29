extends Button

export var start_focused = false


func _ready():
	if start_focused:
		grab_focus()


func _on_Button_pressed():
	var ip = get_node("../Address").text
	var port = int(get_node("../Port").text)
	var nick = get_node("../NickName").text
	print(ip + " " + str(port) + " " + nick)
	Server.SetInfo(ip, port, nick)
	Server.ConnectToServer()
	pass # Replace with function body.
