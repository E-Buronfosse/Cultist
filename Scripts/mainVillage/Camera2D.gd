extends Camera2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		self.position.x += 10
	if Input.is_action_pressed("ui_left"):
		self.position.x -= 10
	if Input.is_action_pressed("ui_up"):
		self.position.y -= 10
	if Input.is_action_pressed("ui_down"):
		self.position.y += 10

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			self.zoom.x -= 0.01
			self.zoom.y -= 0.01
		if event.button_index == BUTTON_WHEEL_DOWN:
			self.zoom.x += 0.01
			self.zoom.y += 0.01



