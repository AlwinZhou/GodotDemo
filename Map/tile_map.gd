extends Node2D

@onready var sprite = get_node("Player/Area2D/AnimatedSprite2D/Sprite2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	sprite.visible = true
	
