extends Node

onready var Game = get_node("/root/Game")
onready var cursor_target = load("res://Assets/Cursor/cursor_target.png")
onready var clicked = false
onready var clicked_card_name = null

var deck = []
var rng = RandomNumberGenerator.new()
var f_number
var s_number
var both

func _ready():
	rng.randomize()
	fill_deck()
#	place_cards()
	
func fill_deck():
	deck.append(0)
	deck.append(10)
	deck.append(50)
	
#func place_cards():
#	for i in deck:
#		get_node("/root/Game/Grid").add_child(Card.new(i, "tata"))
