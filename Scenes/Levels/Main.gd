extends Node2D
var currentlevel
export (PackedScene) var LevelSelect
export (PackedScene) var Level1
export (PackedScene) var Level2
export (PackedScene) var Level3
export (PackedScene) var P1Win
export (PackedScene) var P2Win
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
	currentlevel = level
	$LevelSelect.queue_free()
	var L1 = Level1.instance()
	var L2 = Level2.instance()
	var L3 = Level3.instance()
	if level == 1:
		add_child(L1)
		L2.queue_free()
		L3.queue_free()
	elif level == 2:
		add_child(L2)
		L3.queue_free()
		L1.queue_free()
	elif level == 3:
		add_child(L3)
		L1.queue_free()
		L2.queue_free()

func clear_children():
	var children = get_children()
	for i in children:
		i.queue_free()
	

func _p1win():
	clear_children()
	var Win = P1Win.instance()
	add_child(Win)
	

func _p2win():
	clear_children()
	var Win = P2Win.instance()
	add_child(Win)


func _restart():
	clear_children()
	var LSelect = LevelSelect.instance()
	add_child(LSelect)
	$binderino.queue_free()
	$LevelSelect.connect('levelpicked',self,'_on_LevelSelect_Selected')