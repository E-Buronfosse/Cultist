extends Node

onready var Game = get_node("/root/Game")
onready var cursor_target = load("res://Assets/Cursor/cursor_target.png")
onready var clicked_kill = false
onready var clicked_increase_fear = false
onready var clicked_card_name = null
onready var team = []

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
	while deck.size() < 3:
		f_number = 1
		s_number = rng.randi_range(1, 3)
		both = String(f_number) + "-" + String(s_number)
		if deck.has(both) == false:
			deck.append(both)
	
#func place_cards():
#	for i in deck:
#		get_node("/root/Game/Grid").add_child(Card.new(i, "tata"))
