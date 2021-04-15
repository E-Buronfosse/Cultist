extends KinematicBody2D


var motion = Vector2()
var state = 0
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func _physics_process(delta):
	
	
	
	if state == 0:
		motion.x =  0
	elif state == 1:
			motion.x = 100
	elif state == 2:
			motion.x = -100
	elif state == 3:
			motion.y = 100
	elif state == 4:
			motion.y = -100
			
	move_and_slide(motion, Vector2(0,-1)) 
			




func _on_Timer_timeout():
#state = floor(rand_range(0,4) + 1)
	state = rng.randi_range(0, 4) 
	print(state)
	pass # Replace with function body.
