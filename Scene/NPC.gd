extends KinematicBody2D


var speed = 20
var NPC_name = "Habitant"
var life = round(rand_range(80, 150))
var allegiance = "Ancien"
var charisma = round(rand_range(1, 100))
var credulity = round(rand_range(1, 100))
var fear_of_New = 50
var fear_of_Old = 50

var state = 0

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	"""var toto = int(rand_range(0, 3))
	velocity.x = directions[toto] * speed
	print(directions[toto])
	toto = int(rand_range(0, 3))
	velocity.y = directions[toto] * speed
	print(directions[toto])"""
	"""if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0"""
		
	
	if state == 0:
		velocity.x = 0
	elif state == 1:
		velocity.x = 100
	elif state == 2:
		velocity.x = -100
	
		
		
	move_and_slide(velocity, Vector2(0, -1))


func _on_Timer_timeout():
	state = floor(rand_range(0,3))
	print(state)
	pass 
