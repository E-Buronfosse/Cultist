extends KinematicBody2D

const SPEED = 40
var velocity = Vector2()
var path = []
var rng = RandomNumberGenerator.new()
onready var level_navigation = get_parent()
onready var close_position = null
var i = 0


func _ready():
	rng.randomize()
	close_position = Vector2(global_position.x +  rng.randf_range(-100.0, 100.0), global_position.y + rng.randf_range(-100.0, 100.0))
	
func navigate():
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * SPEED
		if global_position == path [0]:
			path.remove(0)

func generate_path():
	path = level_navigation.get_simple_path(global_position, close_position, false)
	
func _physics_process(delta):
	print("global_position : " + String(global_position.floor()))
	print("close_position : " + String(close_position.floor()))
	if global_position.floor() == close_position.floor():
		i += 1
		print(i)
		print("toto")
		close_position = Vector2(global_position.x +  rng.randf_range(-100.0, 100.0), global_position.y + rng.randf_range(-100.0, 100.0))
	generate_path()
	navigate()
	move()
	
func move():
	velocity = move_and_slide(velocity)


