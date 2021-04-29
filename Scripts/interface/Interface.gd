extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pnj
var pnjCount
var current_pnj = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# var b = "text"
	pnj = get_tree().get_nodes_in_group("Pnj")
	pnjCount = pnj.size()
	print(pnjCount)
	$"VBoxContainer/PngDetail /CounterPng".text = "0 / " + str(pnjCount)
	# Replace 
	$PnjDetailStatus.visible = false
	pass 
	
	

func _on_Town_folk_man_current_pnj():
	print("toto")
	current_pnj += 1
	$PnjDetailStatus.visible = false
	$"VBoxContainer/PngDetail /CounterPng".text = str(current_pnj) + " / " + str(pnjCount)
	
func _on_Town_folk_man_clickDetailPnj(npc_name, health, max_health, fear_veteran, fear_newcomer, charisma, sect):
	$PnjDetailStatus.visible = true
	$PnjDetailStatus/Npc_name.text ="Name : " + npc_name
	$PnjDetailStatus/Fear_veteran.text ="Fear veteran : " + str(fear_veteran)
	$PnjDetailStatus/Fear_newcomer.text ="Fear newcomer : " + str(fear_newcomer)
	$PnjDetailStatus/Health.text ="Health : " + str(health) + "/" + str(max_health)
	$PnjDetailStatus/Charisma.text ="Charisma : " + str(charisma)
	$PnjDetailStatus/Sect.text ="Sect : " + sect
	pass
