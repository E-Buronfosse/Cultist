extends Node

var network = NetworkedMultiplayerENet.new()
var ip = "192.168.56.1" #Server IP ADDRESS of connecion
#var ip = "192.168.56.1" = Anthony's IP
var port = 25565 #port default to 1909

func _ready():
	ConnectToServer()

func ConnectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	#Events
	network.connect("connection_failed", self, "_OnConnectionFailed")
	network.connect("connection_succeeded", self, "_OnConnectionSucceeded")


func _OnConnectionFailed():
	print("Failed to connect")

func _OnConnectionSucceeded():
	print("Successfully connected")

func FetchCardEffect(card_id, requester):
	rpc_id(1, "FetchCardEffect", card_id, requester)

remote func ReturnEffect(s_effect, requester):
	instance_from_id(requester).SetEffect(s_effect)
