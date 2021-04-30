extends KinematicBody2D

class_name Villager

signal clickDetailPnj(npc_name,health,max_health,fear_veteran,fear_newcomer,charisma,sect)
signal current_pnj
signal change_cult

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
	
func check_global_pos(close_position):
	if global_position.distance_to(close_position) < 5:
		chance = rng.randi_range(0, 1)
		if chance:
			a = rng.randf_range(-100.0, 100.0)
			b = rng.randf_range(-100.0, 100.0)
			self.close_position = Vector2(global_position.x +  a, global_position.y + b)
		else:
			state = IDLE
	
	
func _physics_process(delta):
	check_collision()
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


func _on_Town_folk_man_input_event(viewport, event, shape_idx):
	if (event.is_pressed() and event.button_index == BUTTON_LEFT):
		if GameManager.clicked == true and GameManager.clicked_card_name == "Reaper_Time":
			queue_free()
			emit_signal("current_pnj")
		if GameManager.clicked == true and GameManager.clicked_card_name == "Intimidation":
			fear_newcomer += 50
		if GameManager.clicked == true and GameManager.clicked_card_name == "Conversion":
			sect = "ancient"
			emit_signal("change_cult")
		else:
			on_click()
		GameManager.clicked = false
		Input.set_custom_mouse_cursor(null)

