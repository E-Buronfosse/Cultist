extends KinematicBody2D

class_name Villager

signal clickDetailPnj(npc_name,health,max_health,fear_veteran,fear_newcomer,charisma,sect)
signal current_pnj

const SPEED = 80
var collision = Vector2()
var path = []
var rng = RandomNumberGenerator.new()
onready var level_navigation = get_parent()
onready var close_position = null
onready var screen_size = get_viewport().size
onready var animated_sprite = $AnimatedSprite
onready var timer = $Timer
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

#var home
#var npc_name
#var max_health
#var health
#var fear_veteran
#var fear_newcomer = 0
#var charisma
#var sect

var id = 1
var npc_name = "toto"
var max_health = 20
var health = 2
var fear_veteran = 2
var fear_newcomer = 10
var charisma = 1
var sect = "new"



func _ready():
	rng.randomize()
	timer.set_wait_time( 5.75 )
	close_position = Vector2(global_position.x +  rng.randf_range(-100.0, 100.0), global_position.y + rng.randf_range(-100.0, 100.0))

#func gnrt(dict):
#	self.home = ServerData.homes[dict["home"]]
#	self.npc_name = dict["name"]
#	self.health = dict["health"]
#	self.max_health = self.health
#	self.fear_veteran = dict["default_fear_veteran"]
#	self.fear_newcomer = dict["default_fear_newcomer"]
#	self.charisma = dict["charisma"]
#	self.sect = dict["sect"]
#	print(self.npc_name + " : " + self.sect)

func generate_path():
	path = level_navigation.get_simple_path(global_position, close_position, true)
	
func navigate():
	if path.size() > 0:
		collision = global_position.direction_to(path[1]) * SPEED
		if global_position == path[0].floor():
			path.remove(0)
			
func check_collision():
	if collision:
		if "Villager" in collision.collider.name and timer.time_left == 0 and get_node("../"+collision.collider.name).timer.time_left == 0:
			state = DISCUSSING
		else:
			a = rng.randf_range(-100.0, 100.0)
			b = rng.randf_range(-100.0, 100.0)
			self.close_position = Vector2(global_position.x +  a, global_position.y + b)
			
	
func move(delta):
	collision = move_and_collide(collision * delta)
#	if collision:
#		a = rng.randf_range(-100.0, 100.0)
#		b = rng.randf_range(-100.0, 100.0)
#		self.close_position = Vector2(global_position.x +  a, global_position.y + b)
#		if "Villager" in collision.collider.name:
#			print("ceci est une collision")
			
#			var colliding_vil = get_node("../"+collision.collider.name)
#			if colliding_vil.state != DISCUSSING:
#				self.state = DISCUSSING
#				colliding_vil.state = DISCUSSING
#			else:
#				a = rng.randf_range(-100.0, 100.0)
#				b = rng.randf_range(-100.0, 100.0)
#				self.close_position = Vector2(global_position.x +  a, global_position.y + b)
#		else:
#			a = rng.randf_range(-100.0, 100.0)
#			b = rng.randf_range(-100.0, 100.0)
#			self.close_position = Vector2(global_position.x +  a, global_position.y + b)
#		while global_position.x + a > screen_size.x || global_position.x + a < 0:
#			a = rng.randf_range(-100.0, 100.0)
#		while global_position.y + b > screen_size.y || global_position.y + b < 0:
#			b = rng.randf_range(-100.0, 100.0)
	
func check_global_pos(close_position):
	if global_position.distance_to(close_position) < 5:
		chance = rng.randi_range(0, 1)
		if chance:
			a = rng.randf_range(-100.0, 100.0)
			b = rng.randf_range(-100.0, 100.0)
			self.close_position = Vector2(global_position.x +  a, global_position.y + b)
		else:
			state = IDLE
#	elif collision:
#		if "Villager" in collision.collider.name:
#			print("collision of "+ String(collision.collider.name))
#			var colliding_vil = get_node("../"+collision.collider.name)
#			if colliding_vil.state != DISCUSSING:
#				state = DISCUSSING
#		a = rng.randf_range(-100.0, 100.0)
#		b = rng.randf_range(-100.0, 100.0)
#		self.close_position = Vector2(global_position.x +  a, global_position.y + b)
	
	
func _physics_process(delta):
	check_collision()
	print(timer.time_left)
	match state:
		IDLE:
			animated_sprite.animation = "idle"
			yield(get_tree().create_timer(1.0), "timeout")
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
		DISCUSSING:
			animated_sprite.animation = "idle"
			$Sprite.show()
			yield(get_tree().create_timer(10.0), "timeout")
			$Sprite.hide()
			timer.start()
			state = WALK
			
func on_click():
	emit_signal("clickDetailPnj",npc_name,health,max_health,fear_veteran,fear_newcomer,charisma,sect)
	print("enemies")


func _on_Town_folk_man_input_event(viewport, event, shape_idx):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		if GameManager.clicked == true and GameManager.clicked_card_name == "Reaper_Time":
			queue_free()
			emit_signal("current_pnj")
		if GameManager.clicked == true and GameManager.clicked_card_name == "Intimidation":
			fear_newcomer += 50
			print(fear_newcomer)
		else:
			on_click()
		GameManager.clicked = false
		Input.set_custom_mouse_cursor(null)
#		if GameManager.clicked_kill == true:
#			queue_free()
#			GameManager.team.erase(self)
#		elif GameManager.clicked_increase_fear == true:
#			self.fear += 50
#			print(fear)

