extends Node2D

var moving = true
var MoveSpeed = 10
var tile_size = 16
var inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN,
	"w": Vector2.UP,  
	"a": Vector2.LEFT,   
	"s": Vector2.DOWN,  
	"d": Vector2.RIGHT   
}

@onready var ray = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	if moving == true:
		for dir in inputs.keys():
			if event.is_action_pressed(dir):
				move(dir)
				#move_ray(dir)

func move(dir):
	position += inputs[dir] * tile_size

func move_ray(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size

func _on_button_3_pressed():
	var sprite = get_node("Area2D/AnimatedSprite2D/Sprite2D")
	sprite.visible = false
