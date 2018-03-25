extends Node
var playercount = 2
signal done
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func drawplayer():
	if playercount == 2:
		$Player3.play('disabled')
		$Player4.play('disabled')
	elif playercount == 3:
		$Player3.play('default')
		$Player4.play('disabled')
	elif playercount == 4:
		$Player3.play('default')
		$Player4.play('default')

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if Input.is_action_just_pressed('menu_up') or Input.is_action_just_pressed('menu_right'):
		if playercount < 4:
			playercount += 1
	if Input.is_action_just_pressed('menu_down') or Input.is_action_just_pressed('menu_left'):
		if playercount >2:
			playercount -= 1
	drawplayer()
	if Input.is_action_just_pressed('ui_accept'):
		emit_signal('done')
	
	