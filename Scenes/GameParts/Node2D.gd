extends Node2D
signal restart

func _ready():
	connect('restart',get_node('/root/camera'),'_restart')
	
func _process(delta):
	if Input.is_action_just_pressed('ui_accept'):
		emit_signal('retart')