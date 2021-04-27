extends Node

class_name State_machine

var state = null
var previous_state = null

onready var parent = get_parent()

func _state_logic(delta):
	pass
	
