extends Node2D

var characters = []
var character1
var character2
var character3
# Called when the node enters the scene tree for the first time.
func _ready():
	var character1_scene = preload("res://Player/player.tscn")
	var character2_scene = preload("res://Player/player.tscn")
	var character3_scene = preload("res://Player/player.tscn")
	character1 = character1_scene.instance()
	character2 = character2_scene.instance()
	character3 = character3_scene.instance()
	characters.append(character1)
	characters.append(character2)
	characters.append(character3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
