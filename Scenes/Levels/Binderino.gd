extends Node2D
var keys = {1:'ui_up',2:'ui_down',3:'ui_left',4:'ui_right',5:'ui_jump',6:'ui_fire'}
var currentplayer = 1
var playercount 
var currentkey = 1

func _ready():
	set_process_input(true)

func _input(event):
	if currentplayer <= playercount:
		bindkey(currentplayer, event, keys[currentkey])
		currentkey += 1
		if currentkey == 7:
			currentkey = 1
			currentplayer += 1

func bindkey(playernumber, key, event):
	if playernumber == 1:
		InputMap.action_add_event(event,key)
	else:
		InputMap.add_action(event + String(currentplayer))
		InputMap.action_add_event(event + String(currentplayer), key)

func _process(delta):
	$AnimatedSprite.play(keys[currentkey])
	$P1.play('P'+String(currentplayer))