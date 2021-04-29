extends Node

var network = NetworkedMultiplayerENet.new()
var nick = "Player"
var is_veteran

var ip = "127.0.0.1" #Server IP ADDRESS of connecion
#var ip = "192.168.56.1" = Anthony's IP
var port = 25565 #port default to 1909

func _ready():
	pass

func SetInfo(ip, port, nick, is_veteran):
	self.ip = ip
	self.port = port
	self.nick = nick
	self.is_veteran = is_veteran

func ConnectToServer():
	print("toast")
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	#Events
	network.connect("connection_failed", self, "_OnConnectionFailed")
	network.connect("connection_succeeded", self, "_OnConnectionSucceeded")


func _OnConnectionFailed():
	print("Failed to connect")

func _OnConnectionSucceeded():
	print("Successfully connected")

	FetchCreatePlayer(get_instance_id())

func FetchCardEffect(card_id, requester):
	rpc_id(1, "FetchCardEffect", card_id, requester)

func FetchCreatePlayer(requester):
	print("Fetching")
	rpc_unreliable_id(1, "FetchCreatePlayer", nick, is_veteran, requester)

remote func ReturnEffect(s_effect, requester):
	instance_from_id(requester).SetEffect(s_effect)
