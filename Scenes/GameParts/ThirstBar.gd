extends Control
var currentbar = 5
var drainspeed
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	level = get_node('/root/Level')
	level.drainspeed =  drainspeed

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
