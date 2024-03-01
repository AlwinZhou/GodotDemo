extends Node2D

var playerRound = 0
var NextRound = 1
var moving = false
@export var MoveDistance = 10
var tile_size = 16
var inputs = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
}
@onready var RoundPanel = get_node("Area2D/AnimatedSprite2D/RoundPanel")
@onready var anim = get_node("Area2D/AnimatedSprite2D")
@onready var arrow = get_node("Area2D/AnimatedSprite2D/AnimatedArrow")
# Below is to implement mouce click movement
var click_position = Vector2()
var target_position = Vector2()
var moveSpeed = 5 

#The below will define the character's properties
var character_name : String
var character_health : int
var character_round : int
# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2.
# initialize the character properties
	character_name = "Character"
	character_health = 100
	character_round = 0
# Set character properties
func set_character_name(name: String) -> void:
	character_name = name

func set_character_health(health: int) -> void:
	character_health = health

func set_character_round(round: int) -> void:
	character_round = round
	
func _process(delta):
	if playerRound == NextRound:
		moving = false
	anim.play("Idel")
	if Input.is_action_just_pressed("left_click"):
		click_position = get_global_mouse_position()
		if position.distance_to(click_position)	> 0 and position.distance_to(click_position)<tile_size*MoveDistance:
			arrow.play("point")
	#implement mouce click movement
	if moving:
		if Input.is_action_just_pressed("left_click"):
			click_position = get_global_mouse_position()
		if position.distance_to(click_position)	> 0 and position.distance_to(click_position)<tile_size*MoveDistance:
				position = click_position
				print(click_position)
				print(position)
				playerRound += 1
				RoundPanel.visible = true

#this will make character move by pressing arrows
func _unhandled_input(event):
	if moving == true:
		for dir in inputs.keys():
			if event.is_action_pressed(dir):
				move(dir)
				playerRound += 1
				RoundPanel.visible = true

				

func move(dir):
	position += inputs[dir] * tile_size*MoveDistance

#func move_ray(dir):
	#ray.target_position = inputs[dir] * tile_size
	#ray.force_raycast_update()
	#if !ray.is_colliding():
		#position += inputs[dir] * tile_size



func _on_move_button_button_down():
	moving = true

func _on_stay_button_pressed():
	var panel = get_node("Area2D/AnimatedSprite2D/MovementPanel")
	panel.visible = false

func _on_finish_round_button_pressed():
	RoundPanel.visible = false
	NextRound += 1
	var RoundLabel = $RoundLabel
	RoundLabel.text = "Current Round:" + str(NextRound)
	
# manage player's panel
@onready var movementPanel = get_node("Area2D/AnimatedSprite2D/MovementPanel")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			movementPanel.visible = true


func _on_cancel_button_button_down():
	movementPanel.visible = false



