extends Node2D
var currentlevel
export (PackedScene) var LevelSelect
export (PackedScene) var Level1
export (PackedScene) var Level2
export (PackedScene) var Level3
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
	var LSelect = LevelSelect.instance()
	add_child(LSelect)
	$binderino.queue_free()
	$LevelSelect.connect('levelpicked',self,'_on_LevelSelect_Selected')

func _on_LevelSelect_Selected(level):
	$Label.text = String(level)
	$LevelSelect.queue_free()
	if level == 1:
		var LoadLevel = Level1
	elif level == 2:
		var LoadLevel = Level2
	elif level == 3:
		var LoadLevel = Level3