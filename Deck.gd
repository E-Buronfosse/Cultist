extends Node

class_name Deck

var deck = []

func _ready():
	pass 
	
	
func get_from_deck():
	var deck_data_file = File.new()
	deck_data_file.open("res://Data/deck.json", File.READ)
	var deck_data_json = JSON.parse(deck_data_file.get_as_text())
	deck_data_file.close()
	var deck_data = deck_data_json.result
	var cards = deck_data["cards"][0]
	return cards

