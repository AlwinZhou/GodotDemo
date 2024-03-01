extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var zoom_min = Vector2(0.2,0.2)
var zoom_max = Vector2(3,3)
var zoom_speed = Vector2(0.2,0.2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_up"):
		if zoom>zoom_min:
			zoom -= zoom_speed
	if Input.is_action_just_released("ui_down"):
		if zoom<zoom_max:
			zoom += zoom_speed


func camera_input(event):
	pass
