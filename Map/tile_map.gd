extends Node2D
var next_flip = true
@onready var sprite = get_node("Player/Area2D/AnimatedSprite2D/MovementPanel")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if(next_flip):
		sprite.visible = true
	else:	
		sprite.visible = false
	next_flip = !next_flip	
	
