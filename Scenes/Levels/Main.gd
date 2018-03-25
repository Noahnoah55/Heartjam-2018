extends Node2D
var playercount
export (PackedScene) var Keybinding
export (PackedScene) var Level
var projectResolution=Vector2(Globals.get("display/width"),Globals.get("display/height"))
var d
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	projectResolution.x / 1280

func _on_binderino_done():
	var level = Level.instance()
	add_child(level)
	$binderino.queue_free() # replace with function body
