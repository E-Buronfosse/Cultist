extends Node2D

var ip_text_field
var port_text_field
var nick_text_field
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ip_text_field = get_node("Address")
	port_text_field = get_node("Port")
	nick_text_field = get_node("NickName")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
