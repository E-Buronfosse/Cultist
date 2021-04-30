extends Node

onready var cursor_target = load("res://Assets/Cursor/cursor_target.png")
onready var clicked = false
onready var clicked_card_name = null

var deck = []
var hand_player_new = []
var list_cards = {}
var rng = RandomNumberGenerator.new()
var f_number
var s_number
var both

func _ready():
	list_cards = Deck.new().get_from_deck()
	rng.randomize()
	fill_deck()

	
func fill_deck():
	for title in list_cards:
		if deck.has(title) == false:
			var i = 0
			while i < list_cards[title]["amount"]:
				deck.append(title)
				i = i + 1
	randomize()
	deck.shuffle()
	create_hand(deck)
	
func create_hand(deck):
	for card in range(5):
		hand_player_new.append(deck[card])
