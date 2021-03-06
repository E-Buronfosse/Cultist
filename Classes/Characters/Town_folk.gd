extends KinematicBody2D

const SPEED = 40
var collision = Vector2()
var path = []
var rng = RandomNumberGenerator.new()
onready var level_navigation = get_parent()
onready var close_position = null
onready var screen_size = get_viewport().size
onready var animated_sprite = get_child(0)
onready var in_discussion = false
var a = null
var b = null
enum {
	IDLE,
	WALK,
	DISCUSSING
}
var state = WALK
var chance = null
var fear = 0


func _ready():
	rng.randomize()
	close_position = Vector2(global_position.x +  rng.randf_range(-100.0, 100.0), global_position.y + rng.randf_range(-100.0, 100.0))
	GameManager.team.append(self)

func generate_path():
	path = level_navigation.get_simple_path(global_position, close_position, true)
	
func navigate():
	if path.size() > 0:
		collision = global_position.direction_to(path[1]) * SPEED
		if global_position == path[0].floor():
			path.remove(0)
	
func move(delta):
	collision = move_and_collide(collision * delta)
	
func check_global_pos(close_position):
	if global_position.distance_to(close_position) < 5:
		chance = rng.randi_range(0, 1)
		if chance:
			a = rng.randf_range(-100.0, 100.0)
			b = rng.randf_range(-100.0, 100.0)
			while global_position.x + a > screen_size.x || global_position.x + a < 0:
				a = rng.randf_range(-100.0, 100.0)
			while global_position.y + b > screen_size.y || global_position.y + b < 0:
				b = rng.randf_range(-100.0, 100.0)
			self.close_position = Vector2(global_position.x +  a, global_position.y + b)
		else:
			state = IDLE
	elif collision:
		if "Town_folk_man" in collision.collider.name:
			print(collision.collider.in_discussion)
			self.in_discussion = true
			print(self.in_discussion)
		a = rng.randf_range(-100.0, 100.0)
		b = rng.randf_range(-100.0, 100.0)
		while global_position.x + a > screen_size.x || global_position.x + a < 0:
			a = rng.randf_range(-100.0, 100.0)
		while global_position.y + b > screen_size.y || global_position.y + b < 0:
			b = rng.randf_range(-100.0, 100.0)
		self.close_position = Vector2(global_position.x +  a, global_position.y + b)
	
	
func _physics_process(delta):
	match state:
		IDLE:
			animated_sprite.animation = "idle"
			yield(get_tree().create_timer(rng.randi_range(1, 5)), "timeout")
			state = WALK
		WALK:
			check_global_pos(close_position)
			generate_path()
			navigate()
			move(delta)
			if global_position.x > close_position.x:
				animated_sprite.flip_h = true
			else:
				animated_sprite.flip_h = false
			animated_sprite.animation = "walk"


func _on_Town_folk_man_input_event(viewport, event, shape_idx):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		if GameManager.clicked_kill == true:
			queue_free()
			GameManager.team.erase(self)
		elif GameManager.clicked_increase_fear == true:
			self.fear += 50
			print(fear)
			

