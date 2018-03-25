extends Node2D
var playercount
export (PackedScene) var Keybinding
export (PackedScene) var Level
var projectResolution = 0
var d
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	projectResolution = get_viewport().get_visible_rect().size
	scale = Vector2(projectResolution.x / 1280,projectResolution.y / 720)
func _process(delta):
	projectResolution.x / 1280

func _on_binderino_done():
	var level = Level.instance()
	add_child(level)
	$binderino.queue_free() # replace with function body
