extends KinematicBody2D

const SPEED = 40
var velocity = Vector2()
var path = []
var rng = RandomNumberGenerator.new()
onready var level_navigation = get_parent()
onready var close_position = null
onready var screen_size = get_viewport().size
var a = 0
var b = 0


func _ready():
	rng.randomize()
	close_position = Vector2(global_position.x +  rng.randf_range(-100.0, 100.0), global_position.y + rng.randf_range(-100.0, 100.0))
	generate_path()
	
func navigate():
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * SPEED
		if global_position == path[0].floor():
			path.remove(0)

func generate_path():
	path = level_navigation.get_simple_path(global_position, close_position, true)
	
func _physics_process(delta):
	if global_position.distance_to(close_position) < 5:
		a = rng.randf_range(-100.0, 100.0)
		b = rng.randf_range(-100.0, 100.0)
		while global_position.x + a > screen_size.x || global_position.x + a < 0:
			a = rng.randf_range(-100.0, 100.0)
		while global_position.y + b > screen_size.y || global_position.y + b < 0:
			b = rng.randf_range(-100.0, 100.0)
		close_position = Vector2(global_position.x +  a, global_position.y + b)
	generate_path()
	navigate()
	move()
	
func move():
	velocity = move_and_slide(velocity)


func _on_Town_folk_man_input_event(viewport, event, shape_idx):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		if GameManager.clicked == true:
			queue_free()
