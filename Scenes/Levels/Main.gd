extends Node2D
var playercount
export (PackedScene) var Keybinding
export (PackedScene) var Level
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	pass

func _on_Menu_done():
	playercount = $Menu.playercount
	var binderino = Keybinding.instance()
	binderino.playercount = playercount
	add_child(binderino)
	$Menu.queue_free()